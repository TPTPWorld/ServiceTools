#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <signal.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "Tokenizer.h"
#include "Parsing.h"
#include "Signature.h"
#include "Examine.h"
#include "Modify.h"
#include "List.h"
#include "Tree.h"
#include "ListStatistics.h"
#include "PrintTSTP.h"
#include "AGInTRater.h"
//-----------------------------------------------------------------------------
void GlobalInterruptHandler(int TheSignal) {

    extern int GlobalInterrupted;

    printf("\nAGInTRater has been interrupted\n");
    GlobalInterrupted = 1;
}
//-----------------------------------------------------------------------------
int ProcessCommandLine(int argc,char * argv[],OptionsType * OptionValues) {

    int OptionChar;

    OptionValues->Quietness = DEFAULT_QUIETNESS;
    strcpy(OptionValues->DerivationFileName,"--");
    strcpy(OptionValues->ProblemFileName,"");
    OptionValues->Format = DEFAULT_FORMAT;
    OptionValues->Pretty = DEFAULT_PRETTY;
    OptionValues->KeepInterestingnessComponents = DEFAULT_KEEP_COMPONENTS;
    OptionValues->MinimalRating = DEFAULT_MINIMAL_RATING;

    while ((OptionChar = getopt(argc,argv,"q:p:f:u:m:ch")) != -1) {
        switch (OptionChar) {
            case 'q':
                OptionValues->Quietness = atoi(optarg);
                break;
            case 'p':
                strcpy(OptionValues->ProblemFileName,optarg);
                break;
            case 'f':
                OptionValues->Format = StringToPrintFormat(optarg);
                break;
            case 'u':
                if (!strcmp("machine",optarg)) {
                    OptionValues->Pretty = 0;
                }
                if (!strcmp("human",optarg)) {
                    OptionValues->Pretty = 1;
                }
                break;
            case 'm':
                OptionValues->MinimalRating = atof(optarg);
                break;
            case 'c':
                OptionValues->KeepInterestingnessComponents = 1;
                break;
            case 'h':
            case '?':
                printf("Usage: %s <options> <derivation file>\n",argv[0]);
                printf("<options> are ...\n");
                printf("-q<quietness>   - control amount of output (%d)\n",
OptionValues->Quietness);
                printf("-f<format>      - output format (%s)\n",
PrintFormatToString(OptionValues->Format));
                printf("-u<user>        - output pretty (%d)\n",
OptionValues->Pretty);
                printf("-c              - keep components (%d)\n",
OptionValues->KeepInterestingnessComponents);
                printf("-p<problem file>- problem file name (%s)\n",
OptionValues->ProblemFileName);
                printf("-h              - print this help\n");
                printf("<derivation file> is ...\n");
                printf("  Any normal file name\n");
                printf("  -- for stdin\n");
                exit(EXIT_FAILURE);
                break;
            default:
                printf("ERROR: Something wrong in getopt\n");
                fflush(stdout);
                exit(EXIT_FAILURE);
                break;
        }
    }

//----Check for problem file name
    if (argv[optind] != NULL) {
        strcpy(OptionValues->DerivationFileName,argv[optind]);
    }

//----Echo if in verbose mode
    if (OptionValues->Quietness == 0) {
        printf("Command line options:\n");
        printf("    Quietness %d\n",OptionValues->Quietness);
        printf("    DerivationFileName %s\n",OptionValues->DerivationFileName);
        printf("    ProblemFileName %s\n",OptionValues->ProblemFileName);
        printf("    Format %s\n",PrintFormatToString(OptionValues->Format));
        printf("    Pretty %d\n",OptionValues->Pretty);
        printf("    KeepInterestingnessComponents %d\n",
OptionValues->KeepInterestingnessComponents);
        printf("    MinimalRating %.2f\n",OptionValues->MinimalRating);
    }

    return(1);
}
//-----------------------------------------------------------------------------
void RemoveBoringOnes(LISTNODE * RatedDerivation,double MinimalRating) {

    String Interestingness;
    double Rating;

    while (*RatedDerivation != NULL) {
        if (GetUsefulInfoTerm((*RatedDerivation)->AnnotatedFormula,
"interesting",1,Interestingness) == NULL || !ExtractTermArguments(
Interestingness)) {
            CodingError("Missing interestingness for boredom extraction");
        }
        Rating = atof(Interestingness);
        if (Rating < MinimalRating) {
            FreeAListNode(RatedDerivation);
        } else {
            RatedDerivation = &((*RatedDerivation)->Next);
        }
    }
}
//-----------------------------------------------------------------------------
void AddInterestingnessRecord(SIGNATURE Signature,LISTNODE Head) {

    while (Head != NULL) {
        UpdateUsefulInformationInAnnotatedFormula(Head->AnnotatedFormula,
Signature,"interesting(0.00)");
        Head = Head->Next;
    }
}
//-----------------------------------------------------------------------------
int ReadDerivation(char * DerivationFileName,SIGNATURE Signature,
LISTNODE * RawDerivation,LISTNODE * Derivation,
LISTNODE * FOFInDerivation,LISTNODE * CNFInDerivation,
LISTNODE * Leaves,LISTNODE * FOFLeaves,LISTNODE * CNFLeaves,
LISTNODE * AxiomLeaves,LISTNODE * FOFAxiomLeaves,LISTNODE * CNFAxiomLeaves,
LISTNODE * Theory,LISTNODE * FOFTheory,LISTNODE * CNFTheory) {

    ROOTLIST RootList;
    LISTNODE ExpandedDerivation;

    if ((*RawDerivation = ParseFileOfFormulae(DerivationFileName,NULL,Signature,
1,NULL)) == NULL) {
        printf("ERROR: Could not read derivation file %s\n",DerivationFileName);
        fflush(stdout);
        return(0);
    }
//DEBUG printf("---- Raw Derivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RawDerivation,tptp,1);
    AddInterestingnessRecord(Signature,*RawDerivation);
//----Make copy so original does not get expanded assumptions
    ExpandedDerivation = DuplicateListOfAnnotatedFormulae(*RawDerivation,
Signature);
//----Expand assumptions
    ExpandListAssumptions(ExpandedDerivation,Signature);
//DEBUG printf("---- DerivationToRate after Expanding Assumptions ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,ExpandedDerivation,tptp,1);

    if ((RootList = BuildRootList(ExpandedDerivation)) == NULL) {
        printf("ERROR: Cannot build derivation forest\n");
        fflush(stdout);
        FreeListOfAnnotatedFormulae(&ExpandedDerivation);
        FreeListOfAnnotatedFormulae(Derivation);
        return(0);
    }
//DEBUG printf("---- Built root list ----\n");
    *Derivation = ListRootListAnnotatedNodesInPostOrder(RootList);
    FreeListOfAnnotatedFormulae(&ExpandedDerivation);
//DEBUG printf("---- Ordered Derivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*Derivation,tptp,1);

    *FOFInDerivation = GetListWithSyntaxType(*Derivation,tptp_fof);
//DEBUG printf("---- FOFInDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*FOFInDerivation,tptp,1);
    *CNFInDerivation = GetListWithSyntaxType(*Derivation,tptp_cnf);
//DEBUG printf("---- CNFInDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*CNFInDerivation,tptp,1);
    *Leaves = GetLeafList(RootList,1);
//DEBUG printf("---- Leaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*Leaves,tptp,1);
    *FOFLeaves = GetSyntaxLeafList(RootList,1,tptp_fof);
//DEBUG printf("---- FOFLeaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*FOFLeaves,tptp,1);
    *CNFLeaves = GetSyntaxLeafList(RootList,1,tptp_cnf);
//DEBUG printf("---- CNFLeaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*CNFLeaves,tptp,1);
    *AxiomLeaves = SelectListOfAnnotatedFormulaeWithType(Leaves,axiom_like,0);
//DEBUG printf("---- AxiomLeaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*AxiomLeaves,tptp,1);
    *FOFAxiomLeaves = SelectListOfAnnotatedFormulaeWithType(FOFLeaves,
axiom_like,0);
//DEBUG printf("---- FOFAxiomLeaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*FOFAxiomLeaves,tptp,1);
    *CNFAxiomLeaves = SelectListOfAnnotatedFormulaeWithType(CNFLeaves,
not_conjecture,0);
//DEBUG printf("---- CNFAxiomLeaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*CNFAxiomLeaves,tptp,1);
    *Theory = GetListWithAxiomAncestorLeaves(RootList,1);
//DEBUG printf("---- Theory ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*Theory,tptp,1);
    *FOFTheory = GetListWithSyntaxType(*Theory,tptp_fof);
//DEBUG printf("---- FOFTheory ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*FOFTheory,tptp,1);
    *CNFTheory = GetListWithSyntaxType(*Theory,tptp_cnf);
//DEBUG printf("---- CNFTheory ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*CNFTheory,tptp,1);

    FreeRootList(&RootList,1);
    return(1);
}
//-----------------------------------------------------------------------------
void ReadProblem(char * DerivationFileName,SIGNATURE Signature,
LISTNODE * Problem,LISTNODE * FOFInProblem,LISTNODE * CNFInProblem,
LISTNODE * AxiomsInProblem,LISTNODE * FOFAxiomsInProblem,
LISTNODE * CNFAxiomsInProblem) {

    if ((*Problem = ParseFileOfFormulae(DerivationFileName,NULL,Signature,1,
NULL)) == NULL) {
        printf("ERROR: Could not read problem file %s\n",DerivationFileName);
        fflush(stdout);
        exit(EXIT_FAILURE);
    }
    *FOFInProblem = GetListWithSyntaxType(*Problem,tptp_fof);
    *CNFInProblem = GetListWithSyntaxType(*Problem,tptp_cnf);
    *AxiomsInProblem = SelectListOfAnnotatedFormulaeWithType(Problem,
axiom_like,0);
    *FOFAxiomsInProblem = SelectListOfAnnotatedFormulaeWithType(FOFInProblem,
axiom_like,0);
    *CNFAxiomsInProblem = SelectListOfAnnotatedFormulaeWithType(CNFInProblem,
axiom_like,0);

}
//-----------------------------------------------------------------------------
void MakeTemporaryFile(char * Basename,String FileName) {

    int FileDescriptor;

    strcpy(FileName,"/tmp/");
    strcat(FileName,Basename);
    strcat(FileName,"_XXXXXX");
    if ((FileDescriptor = mkstemp(FileName)) == -1) {
        printf("ERROR: Could not make temporary file\n");
        fflush(stdout);
        exit(EXIT_FAILURE);
    }
    close(FileDescriptor);
}
//-----------------------------------------------------------------------------
//----For each node with a missing parent, remove the inference term
void RemoveLeafInferenceInfo(SIGNATURE Signature,LISTNODE Head) {

    LISTNODE Target;
    BTREENODE BTreeRoot;
    char * AllParentNames;
    StringParts ParentNames;
    int NumberOfParents;
    int ParentIndex;

    BTreeRoot = ListToBTree(Head);
    Target = Head;
    while (Target != NULL) {
        AllParentNames = GetNodeParentNames(Target->AnnotatedFormula,NULL);
        NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
        for (ParentIndex=0;ParentIndex<NumberOfParents;ParentIndex++) {
//----Check if parent is missing
            if (GetNodeFromBTreeByAnnotatedFormulaName(&BTreeRoot,
ParentNames[ParentIndex]) == NULL) {
//----Change to short form and bailout - only one missing parent does it
                EnsureShortForm(Target->AnnotatedFormula);
                break;
            }
        }
        Free((void **)&AllParentNames);
        Target = Target->Next;
    }
    FreeBTreeOfAnnotatedFormulae(&BTreeRoot);
}
//-----------------------------------------------------------------------------
void RemoveAllInterestingness(LISTNODE Head,SIGNATURE Signature) {

    char * FieldNames[] = {
        "obviousness",
        "complexity",
        "intensity",
        "surprisingness",
        "adaptivity",
        "focus",
        "weight",
        "usefulness",
        "interesting"
    };
    int FieldIndex;

    while (Head != NULL) {
        for (FieldIndex = 0; FieldIndex < sizeof(FieldNames)/sizeof(char *); 
FieldIndex++) {
            RemoveUsefulInformationFromAnnotatedFormula(Head->AnnotatedFormula,
Signature,FieldNames[FieldIndex]);
        }
        Head = Head->Next;
    }
}
//-----------------------------------------------------------------------------
void LowerScaleInterestingness(SIGNATURE Signature,LISTNODE Head) {

    String Interestingness;
    double InterestingnessValue;

    while (Head != NULL) {
        if (GetUsefulInfoTerm(Head->AnnotatedFormula,"interesting",1,
Interestingness) == NULL || !ExtractTermArguments(Interestingness)) {
            CodingError("Cannot scale without interestingness");
        }
        InterestingnessValue = atof(Interestingness) - 1.0;
//----Lower scale must be negative
        if (InterestingnessValue == 0.0) {
            InterestingnessValue = -0.01;
        }
        sprintf(Interestingness,"interesting(%4.2f)",InterestingnessValue);
        UpdateUsefulInformationInAnnotatedFormula(Head->AnnotatedFormula,
Signature,Interestingness);
        Head = Head->Next;
    }
}
//-----------------------------------------------------------------------------
LISTNODE RateDerivedWRTThese(SIGNATURE Signature,LISTNODE Derived,
LISTNODE Basis) {

    String BasisFileName;
    String FilteredFileName;
    LISTNODE CopyOfDerived;
    String Command;
    FILE * FileHandle;
    LISTNODE RatedDerived;

    MakeTemporaryFile("AGInTRater_BasisFile",BasisFileName);
    MakeTemporaryFile("AGInTRater_FilteredFile",FilteredFileName);

//----Make copy of derived 
    CopyOfDerived = DuplicateListOfAnnotatedFormulae(Derived,Signature);
//----Set all leaves to have no parents
    RemoveLeafInferenceInfo(Signature,CopyOfDerived);
//----Remove previous interesting information
    RemoveAllInterestingness(CopyOfDerived,Signature);
//DEBUG printf("Copy of derived prepared\n");

    if ((FileHandle = OpenFileInMode(BasisFileName,"w")) == NULL) {
        printf("ERROR: Could not open basis file %s for writing\n",
BasisFileName);
        fflush(stdout);
        exit(EXIT_FAILURE);
    }
    PrintListOfAnnotatedTSTPNodesWithStatus(FileHandle,NULL,Basis,tptp,0,axiom);
    fclose(FileHandle);
//DEBUG printf("---- Basis (written to %s) ----\n",BasisFileName);
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Basis,tptp,1);
//DEBUG printf("---- Derived ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Derived,tptp,1);

    strcpy(Command,RATER);
    strcat(Command," ");
    strcat(Command,BasisFileName);
    strcat(Command," 15 > ");
    strcat(Command,FilteredFileName);
//DEBUG printf("About to execute ==%s==\n",Command);
    if ((FileHandle = popen(Command,"w")) == NULL) {
        printf("ERROR: Could not run command\n    %s\n",Command);
        fflush(stdout);
        exit(EXIT_FAILURE);
    }
//DEBUG printf("discover has been started\n");
    PrintListOfAnnotatedTSTPNodesWithStatus(FileHandle,Signature,
CopyOfDerived,tptp,0,plain);
//DEBUG printf("derived formulae sent to discover\n");
    pclose(FileHandle);
    FreeListOfAnnotatedFormulae(&CopyOfDerived);

//DEBUG printf("about to read from discover results\n");
    RatedDerived = ParseFileOfFormulae(FilteredFileName,NULL,Signature,1,NULL);
//DEBUG printf("---- RatedDerived ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,RatedDerived,tptp,1);

    unlink(BasisFileName);
    unlink(FilteredFileName);

//NOT NEEDED? SlowSortByUsefulInfoField(&RatedDerived,"interesting",'f',1);
//DEBUG printf("---- Sorted RatedDerived ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,RatedDerived,tptp,1);

    return(RatedDerived);
}
//-----------------------------------------------------------------------------
//----Take interestingness values from NewRated and supercede values in
//----PreRated
void Supercede(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * PreRated,LISTNODE NewRated) {

    String NewInterestingnessRecord;
    ANNOTATEDFORMULA ExistingAnnotatedFormula;
    String FormulaName;
    char * FieldNames[] = {
        "obviousness",
        "complexity",
        "intensity",
        "surprisingness",
        "adaptivity",
        "focus",
        "weight",
        "usefulness"
    };
    int FieldIndex;

    while (NewRated != NULL) {
//DEBUG printf("superceding in\n");
//DEBUG PrintAnnotatedTSTPNode(stdout,NewRated->AnnotatedFormula,tptp,1);
        GetName(NewRated->AnnotatedFormula,FormulaName);
//----Extract the new rating - all the component info is ignored
        if (GetUsefulInfoTerm(NewRated->AnnotatedFormula,"interesting",1,
NewInterestingnessRecord) == NULL) {
            CodingError("Missing interesting rating in a rated list");
        }

//----If node is already there, remove any old rating and insert new rating
        if ((ExistingAnnotatedFormula = GetAnnotatedFormulaFromListByName(
*PreRated,FormulaName)) != NULL) {
            UpdateUsefulInformationInAnnotatedFormula(ExistingAnnotatedFormula,
Signature,NewInterestingnessRecord);
//----Copy across details if required
            if (OptionValues.KeepInterestingnessComponents) {
                for (FieldIndex = 0; FieldIndex < 
sizeof(FieldNames)/sizeof(char *); FieldIndex++) {
                    if (GetUsefulInfoTerm(NewRated->AnnotatedFormula,
FieldNames[FieldIndex],1,NewInterestingnessRecord) != NULL) {
                        UpdateUsefulInformationInAnnotatedFormula(
ExistingAnnotatedFormula,Signature,NewInterestingnessRecord);
                    }
                }
            }
        } else {
            AddListNode(PreRated,(*PreRated),NewRated->AnnotatedFormula);
        }
        NewRated = NewRated->Next;
    }
}
//-----------------------------------------------------------------------------
void RateCNFWithoutConjecture(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RatedDerivation,LISTNODE CNFAxiomLeaves,LISTNODE CNFTheory) {

    LISTNODE Rated;
    LISTNODE DerivedRated;

//----CNF part of derivation from CNF "axioms", to get CNF theory
    Rated = RateDerivedWRTThese(Signature,CNFTheory,CNFAxiomLeaves);
    DerivedRated = SelectListOfAnnotatedFormulaeWithParents(&Rated,0);
//DEBUG printf("---- Rated DerivedCNFTheory ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,DerivedRated,tptp,1);
    Supercede(OptionValues,Signature,RatedDerivation,DerivedRated);
//DEBUG printf("---- RatedDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);
    FreeListOfAnnotatedFormulae(&Rated);
    FreeListOfAnnotatedFormulae(&DerivedRated);
}
//-----------------------------------------------------------------------------
void RateCNFWithConjecture(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RatedDerivation,LISTNODE CNFInDerivation,LISTNODE CNFLeaves,
LISTNODE CNFAxiomLeaves,LISTNODE CNFTheory) {

    LISTNODE Rated;
    LISTNODE DerivedRated;

//----CNF part of derivation, to get CNF from conjecture
//DEBUG printf("about to rate CNFInDerivation ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,CNFInDerivation,tptp,1);
//DEBUG printf("... wrt CNFLeaves ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,CNFLeaves,tptp,1);
    Rated = RateDerivedWRTThese(Signature,CNFInDerivation,CNFLeaves);
    DerivedRated = SelectListOfAnnotatedFormulaeWithParents(&Rated,0);
//DEBUG printf("---- Rated DerivedCNF ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,DerivedRated,tptp,1);
    Supercede(OptionValues,Signature,RatedDerivation,DerivedRated);
//DEBUG printf("---- RatedDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);
    FreeListOfAnnotatedFormulae(&Rated);
    FreeListOfAnnotatedFormulae(&DerivedRated);

//----Non-conjecture part
    RateCNFWithoutConjecture(OptionValues,Signature,RatedDerivation,
CNFAxiomLeaves,CNFTheory);
}
//-----------------------------------------------------------------------------
void RateFOFWithoutConjecture(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RatedDerivation,LISTNODE FOFAxiomLeaves,LISTNODE Theory) {

    LISTNODE Rated;

//DEBUG printf("about to rate Theory ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Theory,tptp,1);
//DEBUG printf("... wrt FOFAxiomLeaves ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,FOFAxiomLeaves,tptp,1);
    Rated = RateDerivedWRTThese(Signature,Theory,FOFAxiomLeaves);
//DEBUG printf("---- Rated Theory ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Rated,tptp,1);
    Supercede(OptionValues,Signature,RatedDerivation,Rated);
//DEBUG printf("---- RatedDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);
    FreeListOfAnnotatedFormulae(&Rated);
}
//-----------------------------------------------------------------------------
void RateFOFWithConjecture(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RatedDerivation,LISTNODE FOFInDerivation,LISTNODE FOFLeaves,
LISTNODE FOFAxiomLeaves,LISTNODE FOFTheory) {

    LISTNODE Rated;

//----FOF part of derivation, to get FOF from conjecture
//DEBUG printf("about to rate FOFInDerivation ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,FOFInDerivation,tptp,1);
//DEBUG printf("... wrt FOFLeaves ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,FOFLeaves,tptp,1);
    Rated = RateDerivedWRTThese(Signature,FOFInDerivation,FOFLeaves);
    Supercede(OptionValues,Signature,RatedDerivation,Rated);
//DEBUG printf("---- RatedDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);
    FreeListOfAnnotatedFormulae(&Rated);

//----Non-conjecture part
    RateFOFWithoutConjecture(OptionValues,Signature,RatedDerivation,
FOFAxiomLeaves,FOFTheory);

}
//-----------------------------------------------------------------------------
void RateFOFCNFWithoutConjecture(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RatedDerivation,LISTNODE FOFAxiomLeaves, LISTNODE CNFAxiomLeaves,
LISTNODE Theory,LISTNODE CNFTheory) {

//----Whole derivation from axioms, to get FOF theory
    RateFOFWithoutConjecture(OptionValues,Signature,RatedDerivation,
FOFAxiomLeaves,Theory);

//----CNF part
    RateCNFWithoutConjecture(OptionValues,Signature,RatedDerivation,
CNFAxiomLeaves,CNFTheory);
}
//-----------------------------------------------------------------------------
void RateFOFCNFWithConjecture(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RatedDerivation,LISTNODE Derivation,LISTNODE CNFInDerivation,
LISTNODE FOFLeaves,LISTNODE CNFLeaves,LISTNODE FOFAxiomLeaves,
LISTNODE CNFAxiomLeaves,LISTNODE Theory,LISTNODE CNFTheory) {

    LISTNODE Rated;

//----Whole derivation, to get FOF from conjecture
    Rated = RateDerivedWRTThese(Signature,Derivation,FOFLeaves);
    Supercede(OptionValues,Signature,RatedDerivation,Rated);
//DEBUG printf("---- Rated whole wrt leaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);
    FreeListOfAnnotatedFormulae(&Rated);

//----FOF part without conjecture (does all, only use FOF part)
    RateFOFWithoutConjecture(OptionValues,Signature,RatedDerivation,
FOFAxiomLeaves,Theory);
//DEBUG printf("---- Rated theor wrt FOF axiom leaves ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);

//----CNF part
    RateCNFWithConjecture(OptionValues,Signature,RatedDerivation,
CNFInDerivation,CNFLeaves,CNFAxiomLeaves,CNFTheory);
//DEBUG printf("---- Rated CNF part ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RatedDerivation,tptp,1);
}
//-----------------------------------------------------------------------------
void RateDerivation(OptionsType OptionValues,SIGNATURE Signature,
LISTNODE * RawDerivation,LISTNODE Derivation,LISTNODE FOFInDerivation,
LISTNODE CNFInDerivation,LISTNODE Leaves,LISTNODE FOFLeaves,LISTNODE CNFLeaves,
LISTNODE AxiomLeaves,LISTNODE FOFAxiomLeaves,LISTNODE CNFAxiomLeaves,
LISTNODE Theory,LISTNODE FOFTheory,LISTNODE CNFTheory,int HasConjecture,
LISTNODE Problem,LISTNODE FOFInProblem,LISTNODE CNFInProblem,
LISTNODE AxiomsInProblem,LISTNODE FOFAxiomsInProblem,
LISTNODE CNFAxiomsInProblem) {

    LISTNODE RatedDerivation;

    RatedDerivation = DuplicateListOfNodes(Derivation,0);
//DEBUG printf("---- InitialDerivation ----\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,RatedDerivation,tptp,1);

//----Derivation only, from FOF leaves, with CNF part, with conjecture
    if (Problem == NULL && FOFLeaves != NULL && CNFLeaves != NULL &&
HasConjecture) {
        RateFOFCNFWithConjecture(OptionValues,Signature,&RatedDerivation,
Derivation,CNFInDerivation,FOFLeaves,CNFLeaves,FOFAxiomLeaves,CNFAxiomLeaves,
Theory,CNFTheory);

//----Derivation only, from FOF leaves, with CNF part, without conjecture
    } else if (Problem == NULL && FOFLeaves != NULL && CNFLeaves != NULL &&
!HasConjecture) {
        RateFOFCNFWithoutConjecture(OptionValues,Signature,&RatedDerivation,
FOFAxiomLeaves,CNFAxiomLeaves,Theory,CNFTheory);

//----Derivation and problem, from FOF leaves, with CNF part, with conjecture
    } else if (Problem != NULL && FOFLeaves != NULL && CNFLeaves != NULL &&
HasConjecture) {
        RateFOFCNFWithConjecture(OptionValues,Signature,&RatedDerivation,
Derivation,CNFInDerivation,FOFInProblem,CNFLeaves,FOFAxiomsInProblem,
CNFAxiomLeaves,Theory,CNFTheory);

//----Derivation and problem, from FOF leaves, with CNF part, without conjecture
    } else if (Problem != NULL && FOFLeaves != NULL && CNFLeaves != NULL &&
!HasConjecture) {
        RateFOFCNFWithoutConjecture(OptionValues,Signature,&RatedDerivation,
FOFInProblem,CNFAxiomLeaves,Theory,CNFTheory);

//----Derivation only, CNF leaves, with (negated) conjecture
    } else if (Problem == NULL && FOFInDerivation == NULL && CNFLeaves != NULL 
&& HasConjecture) {
        RateCNFWithConjecture(OptionValues,Signature,&RatedDerivation,
CNFInDerivation,CNFLeaves,CNFAxiomLeaves,CNFTheory);

//----Derivation only, CNF leaves, without (negated) conjecture
    } else if (Problem == NULL && FOFInDerivation == NULL && CNFLeaves != NULL 
&& !HasConjecture) {
        RateCNFWithoutConjecture(OptionValues,Signature,&RatedDerivation,
CNFAxiomLeaves,CNFTheory);

//----Derivation and problem, CNF leaves, with (negated) conjecture
    } else if (Problem != NULL && FOFInDerivation == NULL && CNFLeaves != NULL 
&& HasConjecture) {
        RateCNFWithConjecture(OptionValues,Signature,&RatedDerivation,
CNFInDerivation,CNFInProblem,CNFAxiomsInProblem,CNFTheory);

//----Derivation and problem, CNF leaves, without (negated) conjecture
    } else if (Problem != NULL && FOFInDerivation == NULL && CNFLeaves != NULL 
&& !HasConjecture) {
        RateCNFWithoutConjecture(OptionValues,Signature,&RatedDerivation,
CNFInProblem,CNFTheory);

//----Derivation only, from FOF leaves, no CNF, with conjecture
    } else if (Problem == NULL && FOFLeaves != NULL && CNFInDerivation == NULL
&& HasConjecture) {
        RateFOFWithConjecture(OptionValues,Signature,&RatedDerivation,
FOFInDerivation,FOFLeaves,FOFAxiomLeaves,FOFTheory);

//----Derivation only, from FOF leaves, no CNF, without conjecture
    } else if (Problem == NULL && FOFLeaves != NULL && CNFInDerivation == NULL
&& !HasConjecture) {
        RateFOFWithoutConjecture(OptionValues,Signature,&RatedDerivation,
FOFAxiomLeaves,FOFTheory);
    
//----Derivation and problem, from FOF leaves, no CNF, with conjecture
    } else if (Problem != NULL && FOFLeaves != NULL && CNFInDerivation == NULL
&& HasConjecture) {
        RateFOFWithConjecture(OptionValues,Signature,&RatedDerivation,
FOFInDerivation,FOFInProblem,FOFAxiomsInProblem,FOFTheory);
    
//----Derivation and problem, from FOF leaves, no CNF, without conjecture
    } else if (Problem != NULL && FOFLeaves != NULL && CNFInDerivation == NULL
&& !HasConjecture) {
        RateFOFWithoutConjecture(OptionValues,Signature,&RatedDerivation,
FOFAxiomsInProblem,FOFTheory);
    }

//----If FOF and CNF, FOF is less interesting
    if (CNFInDerivation != NULL) {
        LowerScaleInterestingness(Signature,FOFInDerivation);
        LowerScaleInterestingness(Signature,CNFLeaves);
    }

//----Put the interestingness values into the RawDerivation
    Supercede(OptionValues,Signature,RawDerivation,RatedDerivation);
    FreeListOfAnnotatedFormulae(&RatedDerivation);

//----Printout nicely
    SortByUsefulInfoField(RawDerivation,"interesting",'f',1);
    RemoveBoringOnes(RawDerivation,OptionValues.MinimalRating);
    printf("%% SUCCESS: Rated\n");
    printf("%% AGInTRater output start\n");
    PrintListOfAnnotatedTSTPNodes(stdout,Signature,*RawDerivation,
OptionValues.Format,OptionValues.Pretty);
    printf("%% AGInTRater output end\n");
    fflush(stdout);
}
//-----------------------------------------------------------------------------
int main(int argc, char *argv[]) {

    extern int GlobalInterrupted;
    OptionsType OptionValues;
    SIGNATURE Signature;
    LISTNODE RawDerivation;
    LISTNODE Derivation;
    LISTNODE FOFInDerivation;
    LISTNODE CNFInDerivation;
    LISTNODE Leaves;
    LISTNODE FOFLeaves;
    LISTNODE CNFLeaves;
    LISTNODE AxiomLeaves;
    LISTNODE FOFAxiomLeaves;
    LISTNODE CNFAxiomLeaves;
    LISTNODE Theory;
    LISTNODE FOFTheory;
    LISTNODE CNFTheory;
    int HasConjecture;
    LISTNODE Problem;
    LISTNODE FOFInProblem;
    LISTNODE CNFInProblem;
    LISTNODE AxiomsInProblem;
    LISTNODE FOFAxiomsInProblem;
    LISTNODE CNFAxiomsInProblem;

    GlobalInterrupted = 0;
    if (signal(SIGQUIT,GlobalInterruptHandler) == SIG_ERR ||
signal(SIGQUIT,GlobalInterruptHandler) == SIG_ERR) {
        perror("Setting interrupt handler");
        exit(EXIT_FAILURE);
    }

    if (!ProcessCommandLine(argc,argv,&OptionValues)) {
        QPRINTF(OptionValues,4)("ERROR: Invalid command line arguments\n");
        exit(EXIT_FAILURE);
    }

    Signature = NewSignature();
    SetNeedForNonLogicTokens(0);

//----Read in derivation
    if (!ReadDerivation(OptionValues.DerivationFileName,Signature,
&RawDerivation,&Derivation,&FOFInDerivation,&CNFInDerivation,
&Leaves,&FOFLeaves,&CNFLeaves,&AxiomLeaves,&FOFAxiomLeaves,&CNFAxiomLeaves,
&Theory,&FOFTheory,&CNFTheory)) {
        printf("ERROR: Cannot read derivation\n");
        fflush(stdout);
        exit(EXIT_FAILURE);
    }
//DEBUG printf("Completed reading derivation\n");

    HasConjecture = ThereIsAConjecture(Leaves);
//DEBUG printf("Has conjecture is %d\n",HasConjecture);

//----Read in problem file if specified
    if (strcmp(OptionValues.ProblemFileName,"")) {
        ReadProblem(OptionValues.ProblemFileName,Signature,&Problem,
&FOFInProblem,&CNFInProblem,&AxiomsInProblem,&FOFAxiomsInProblem,
&CNFAxiomsInProblem);
    } else {
        Problem = NULL;
        FOFInProblem = NULL;
        CNFInProblem = NULL;
        AxiomsInProblem = NULL;
        FOFAxiomsInProblem = NULL;
        CNFAxiomsInProblem = NULL;
    }
//DEBUG printf("Completed reading problem\n");

    RateDerivation(OptionValues,Signature,&RawDerivation,Derivation,
FOFInDerivation,CNFInDerivation,Leaves,FOFLeaves,CNFLeaves,AxiomLeaves,
FOFAxiomLeaves,CNFAxiomLeaves,Theory,FOFTheory,CNFTheory,HasConjecture,
Problem,FOFInProblem,CNFInProblem,AxiomsInProblem,FOFAxiomsInProblem,
CNFAxiomsInProblem);

    FreeListOfAnnotatedFormulae(&RawDerivation);
    FreeListOfAnnotatedFormulae(&Derivation);
    FreeListOfAnnotatedFormulae(&FOFInDerivation);
    FreeListOfAnnotatedFormulae(&CNFInDerivation);
    FreeListOfAnnotatedFormulae(&Leaves);
    FreeListOfAnnotatedFormulae(&FOFLeaves);
    FreeListOfAnnotatedFormulae(&CNFLeaves);
    FreeListOfAnnotatedFormulae(&AxiomLeaves);
    FreeListOfAnnotatedFormulae(&FOFAxiomLeaves);
    FreeListOfAnnotatedFormulae(&CNFAxiomLeaves);
    FreeListOfAnnotatedFormulae(&Theory);
    FreeListOfAnnotatedFormulae(&FOFTheory);
    FreeListOfAnnotatedFormulae(&CNFTheory);
    FreeListOfAnnotatedFormulae(&Problem);
    FreeListOfAnnotatedFormulae(&FOFInProblem);
    FreeListOfAnnotatedFormulae(&CNFInProblem);
    FreeListOfAnnotatedFormulae(&AxiomsInProblem);
    FreeListOfAnnotatedFormulae(&FOFAxiomsInProblem);
    FreeListOfAnnotatedFormulae(&CNFAxiomsInProblem);
//DEBUG printf("------------\n");
//DEBUG PrintSignature(Signature);
    FreeSignature(&Signature);

    return(EXIT_SUCCESS);
}
//-----------------------------------------------------------------------------
