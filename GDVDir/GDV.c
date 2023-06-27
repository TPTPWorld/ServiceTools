//-------------------------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <stdarg.h>

#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "Tokenizer.h"
#include "Parsing.h"
#include "Signature.h"
#include "Examine.h"
#include "List.h"
#include "Tree.h"
#include "Compare.h"
#include "Modify.h"
#include "Interpret.h"
#include "PrintTSTP.h"
#include "SystemOnTPTP.h"

#include "GDV.h"
#include "LambdaPi.h"
//-------------------------------------------------------------------------------------------------
void GlobalInterruptHandler(int TheSignal) {

    extern int GlobalInterrupted;

    printf("GDV has been interrupted\n");
    GlobalInterrupted = 1;
}
//-------------------------------------------------------------------------------------------------
int ProcessCommandLine(int argc,char * argv[],OptionsType * OptionValues) {

    int OptionChar;

//----Options for processing
    OptionValues->Quietness = 1;
    OptionValues->AutoMode = 0;
    OptionValues->ForceContinue = 0;
    OptionValues->NoExpensiveChecks = 0;
    OptionValues->TimeLimit = DEFAULT_TIME_LIMIT;
    OptionValues->KeepFiles = 0;
    strcpy(OptionValues->KeepFilesDirectory,DEFAULT_KEEP_FILES_DIRECTORY);
//----What to do
    strcpy(OptionValues->DerivationFileName,"--");
    strcpy(OptionValues->ProblemFileName,"");
    OptionValues->VerifyLeaves = 0;
    OptionValues->VerifyUserSemantics = 1;
    OptionValues->VerifyDAGInferences = 1;
    OptionValues->GenerateObligations = 0;
    OptionValues->GenerateDefinitions = 0;
    OptionValues->GenerateLambdaPiFiles = 0;
    strcpy(OptionValues->LambdaPiDirectory,"");
    OptionValues->LambdaPiProofHandle = NULL;
    OptionValues->DerivationExtract = 0;
    OptionValues->CheckParentRelevance = 0;
    OptionValues->CheckRefutation = 0;
//----ATP systems
    strcpy(OptionValues->TheoremProver,DEFAULT_THEOREM_PROVER);
    strcpy(OptionValues->CounterSatisfiableProver,DEFAULT_COUNTERSATISFIABLE_PROVER);
    strcpy(OptionValues->ModelFinder,DEFAULT_MODEL_FINDER);
    strcpy(OptionValues->UnsatisfiabilityChecker,DEFAULT_UNSATISFIABILITY_CHECKER);
    strcpy(OptionValues->Saturator,DEFAULT_SATURATOR);
    strcpy(OptionValues->TFFTheoremProver,DEFAULT_TFF_THEOREM_PROVER);
    strcpy(OptionValues->TFFCounterSatisfiableProver,DEFAULT_TFF_COUNTERSATISFIABLE_PROVER);
    strcpy(OptionValues->TFFModelFinder,DEFAULT_TFF_MODEL_FINDER);
    strcpy(OptionValues->TFFUnsatisfiabilityChecker,DEFAULT_TFF_UNSATISFIABILITY_CHECKER);
    strcpy(OptionValues->THFTheoremProver,DEFAULT_THF_THEOREM_PROVER);
    strcpy(OptionValues->THFCounterSatisfiableProver,DEFAULT_THF_COUNTERSATISFIABLE_PROVER);
    strcpy(OptionValues->THFModelFinder,DEFAULT_THF_MODEL_FINDER);
    strcpy(OptionValues->THFUnsatisfiabilityChecker,DEFAULT_THF_UNSATISFIABILITY_CHECKER);
    
    while ((OptionChar = getopt(argc,argv,"q:afxt:K:k:i:lUdgnevrp:c:m:u:s:z:w:y:o:h")) 
!= -1) {
        switch (OptionChar) {
//----Options for processing
            case 'q':
                OptionValues->Quietness = atoi(optarg);
                break;
            case 'a':
                OptionValues->AutoMode = 1;
                break;
            case 'f':
                OptionValues->ForceContinue = 1;
                break;
            case 'x':
                OptionValues->NoExpensiveChecks = 1;
                break;
            case 't':
                OptionValues->TimeLimit = atoi(optarg);
                break;
            case 'K':     //----Note fall throughs K implies k
                OptionValues->GenerateLambdaPiFiles = 1;
            case 'k':
                OptionValues->KeepFiles = 1;
                strcpy(OptionValues->KeepFilesDirectory,optarg);
                break;
//----What to do
//----Help is done down below
//----DerivationFileName is a separate parameter
            case 'i':
                strcpy(OptionValues->ProblemFileName,optarg);
                break;
            case 'l':
                OptionValues->VerifyLeaves = 1;
                break;
            case 'U':
                OptionValues->VerifyUserSemantics = 0;
                break;
            case 'd':
                OptionValues->VerifyDAGInferences = 0;
                break;
            case 'g':
                OptionValues->GenerateObligations = 1;
                break;
            case 'n':
                OptionValues->GenerateDefinitions = 1;
                break;
//----GenerateLambdaPiFiles is done above with KeepFiles
            case 'e':
                OptionValues->DerivationExtract = 1;
                break;
            case 'v':
                OptionValues->CheckParentRelevance = 1;
                break;
            case 'r':
                OptionValues->CheckRefutation = 1;
                break;
//----ATP systems to be used
            case 'p':
                strcpy(OptionValues->TheoremProver,optarg);
                break;
            case 'c':
                strcpy(OptionValues->CounterSatisfiableProver,optarg);
                break;
            case 'm':
                strcpy(OptionValues->ModelFinder,optarg);
                break;
            case 'u':
                strcpy(OptionValues->UnsatisfiabilityChecker,optarg);
                break;
            case 's':
                strcpy(OptionValues->Saturator,optarg);
                break;
            case 'z':
                strcpy(OptionValues->TFFTheoremProver,optarg);
                strcpy(OptionValues->TFFUnsatisfiabilityChecker,optarg);
                break;
            case 'w':
                strcpy(OptionValues->TFFCounterSatisfiableProver,optarg);
                strcpy(OptionValues->TFFModelFinder,optarg);
                break;
            case 'y':
                strcpy(OptionValues->THFTheoremProver,optarg);
                strcpy(OptionValues->THFUnsatisfiabilityChecker,optarg);
                break;
            case 'o':
                strcpy(OptionValues->THFCounterSatisfiableProver,optarg);
                strcpy(OptionValues->THFModelFinder,optarg);
                break;
//----Help!!
            case 'h':
            case '?':
                printf("Usage: %s <options> <derivation file>\n",argv[0]);
                printf("<options> for processing are ...\n");
                printf("-q <quietness>  - control amount of output (1)\n");
                printf("-a              - automode (no)\n");
                printf("-f              - force continue on failure (no)\n");
                printf("-x              - suppress expensive checks (no)\n");
                printf("-t <time limit> - CPU limit for discharge attempts (%ds)\n",DEFAULT_TIME_LIMIT);
                printf("-k<directory>   - keep obligation and discharge files in the directory (none)\n");
                printf("<options> for what to do are ...\n");
                printf("-h              - print this help\n");
                printf("-i <input file> - specify problem file (none)\n");
                printf("-l              - verify leaves (no)\n");
                printf("-U              - (don't) verify user leaf semantics (yes)\n");
                printf("-d              - (don't) verify derivation (yes)\n");
                printf("-g              - only generate obligations, don't call ATP\n");
                printf("-n              - generate definitions (no)\n");
                printf("-K <directory>  - 'k', and generate LambdaPi header files (no)\n");
                printf("-e              - derivation extract (no)\n");
                printf("-v              - check relevance of parents of inference (no)\n");
                printf("-r              - derivation should be a refutation (no)\n");
                printf("<options> for ATP systems to use are ...\n");
                printf("-p              - FOF theorem prover System---Version (%s)\n",DEFAULT_THEOREM_PROVER);
                printf("-c              - FOF countersatisfiability prover System---Version (%s)\n",DEFAULT_COUNTERSATISFIABLE_PROVER);
                printf("-m              - FOF model finder System---Version (%s)\n",DEFAULT_MODEL_FINDER);
                printf("-u              - FOF unsatifiability checker System---Version (%s)\n",DEFAULT_UNSATISFIABILITY_CHECKER);
                printf("-s              - FOF saturator System---Version (%s)\n",DEFAULT_SATURATOR);
                printf("-z              - TFF theorem prover and unsatisfiability checker System---Version (%s)\n",DEFAULT_TFF_THEOREM_PROVER);
                printf("-w              - TFF model finder and countertheorem prover System---Version (%s)\n",DEFAULT_TFF_MODEL_FINDER);
                printf("-y              - THF theorem prover and unsatisfiability checker System---Version (%s)\n",DEFAULT_THF_THEOREM_PROVER);
                printf("-o              - THF model finder and countertheorem prover System---Version (%s)\n",DEFAULT_THF_MODEL_FINDER);
                printf("<derivation file> is ... (--)\n");
                printf("  Any normal file name\n");
                printf("  -- for stdin\n");
                exit(EXIT_SUCCESS);
                break;
            default:
                printf("ERROR: Something wrong in getopt\n");
                exit(EXIT_FAILURE);
                break;
        }
    }
    if (OptionValues->GenerateObligations) {
        OptionValues->TimeLimit = 0;
    }

//----Check for problem file name
    if (argv[optind] != NULL) {
        strcpy(OptionValues->DerivationFileName,argv[optind]);
    }

//----Echo if in verbose mode
    if (OptionValues->Quietness == 0) {
        printf("Command line options:\n");
//----Options for processing
        printf("    Quietness %d\n",OptionValues->Quietness);
        printf("    AutoMode %d\n",OptionValues->AutoMode);
        printf("    ForceContinue %d\n",OptionValues->ForceContinue);
        printf("    NoExpensiveChecks %d\n",OptionValues->NoExpensiveChecks);
        printf("    TimeLimit %d\n",OptionValues->TimeLimit);
        printf("    KeepFiles %s\n",OptionValues->KeepFiles? OptionValues->KeepFilesDirectory:"0");
        printf("    GenerateLambdaPiFiles %d\n",OptionValues->GenerateLambdaPiFiles);
//----What to do
        printf("    DerivationFileName %s\n",OptionValues->DerivationFileName);
        printf("    VerifyLeaves %s\n",OptionValues->VerifyLeaves?
(!strcmp(OptionValues->ProblemFileName,"")?"from derivation": OptionValues->ProblemFileName):"0");
        printf("    Verify user leaf semantics %d\n",OptionValues->VerifyUserSemantics);
        printf("    Verify DAG inferences %d\n",OptionValues->VerifyDAGInferences);
        printf("    GenerateDefinitions %d\n",OptionValues->GenerateDefinitions);
        printf("    DerivationExtract %d\n",OptionValues->DerivationExtract);
        printf("    CheckParentRelevance %d\n",OptionValues->CheckParentRelevance);
        printf("    CheckRefutation %d\n",OptionValues->CheckRefutation);
//----ATP systems
        printf("    TheoremProver %s\n",OptionValues->TheoremProver);
        printf("    CounterSatisfiableProver %s\n",OptionValues->CounterSatisfiableProver);
        printf("    ModelFinder %s\n",OptionValues->ModelFinder);
        printf("    UnsatisfiabilityChecker %s\n",OptionValues->UnsatisfiabilityChecker);
        printf("    Saturator %s\n",OptionValues->Saturator);
        printf("    TFFTheoremProver %s\n",OptionValues->TFFTheoremProver);
        printf("    TFFCounterSatisfiableProver %s\n",OptionValues->TFFCounterSatisfiableProver);
        printf("    TFFModelFinder %s\n",OptionValues->TFFModelFinder);
        printf("    TFFUnsatisfiabilityChecker %s\n",OptionValues->TFFUnsatisfiabilityChecker);
        printf("    THFTheoremProver %s\n",OptionValues->THFTheoremProver);
        printf("    THFCounterSatisfiableProver %s\n",OptionValues->THFCounterSatisfiableProver);
        printf("    THFModelFinder %s\n",OptionValues->THFModelFinder);
        printf("    THFUnsatisfiabilityChecker %s\n",OptionValues->THFUnsatisfiabilityChecker);
    }

    return(1);
}
//-------------------------------------------------------------------------------------------------
double GetTotalCPUTime(void) {

    struct rusage MyTime;
    struct rusage ChildTime;

    if (getrusage(RUSAGE_SELF,&MyTime) == 0 && getrusage(RUSAGE_CHILDREN,
&ChildTime) == 0) {
        return(
MyTime.ru_utime.tv_sec + MyTime.ru_utime.tv_usec/1000000.0 + 
ChildTime.ru_utime.tv_sec + ChildTime.ru_utime.tv_usec/1000000.0 +
MyTime.ru_stime.tv_sec + MyTime.ru_stime.tv_usec/1000000.0 + 
ChildTime.ru_stime.tv_sec + ChildTime.ru_stime.tv_usec/1000000.0
);
    } else {
        return(-1.0);
    }
}
//-------------------------------------------------------------------------------------------------
char * MakePrintableList(StringParts Names,int NumberOfNames,
char * ListNames) {

    int NameNumber;
    char * Buffer;
    int BufferSize;

//----Build in malloced memory
    MakeBuffer(&Buffer,&BufferSize);

    for (NameNumber = 0;NameNumber < NumberOfNames;NameNumber++) {
        ExtendString(&Buffer,Names[NameNumber],&BufferSize);
        ExtendString(&Buffer," ",&BufferSize);
    }

    return(BufferReturn(&Buffer,ListNames));
}
//-------------------------------------------------------------------------------------------------
char * MakePrintableListFromList(LISTNODE Head,char * ListNames) {

    char * Buffer;
    int BufferSize;
    String OneName;

//----Build in malloced memory
    MakeBuffer(&Buffer,&BufferSize);

    while (Head != NULL) {
        ExtendString(&Buffer,GetName(Head->AnnotatedFormula,OneName),
&BufferSize);
        ExtendString(&Buffer," ",&BufferSize);
        Head = Head->Next;
    }

    return(BufferReturn(&Buffer,ListNames));
}
//-------------------------------------------------------------------------------------------------
int IsNewSymbol(OptionsType OptionValues,char * Symbol) {

    static char * AllNewSymbols = NULL;
    static int LengthNewSymbols = 0;
    String PrincipleSymbol;

//----NULL symbol mean reset
    if (Symbol == NULL) {
        if (AllNewSymbols != NULL) {
            Free((void **)&AllNewSymbols);
        }
        return(1);
    }

//----First time Malloc the memory
    if (AllNewSymbols == NULL) {
        AllNewSymbols = (char *)Malloc(sizeof(String));
        LengthNewSymbols = STRINGLENGTH;
    }

    if (NameInList(Symbol,AllNewSymbols)) {
        QPRINTF(OptionValues,2)("FAILURE: %s is not a new symbol\n",Symbol);
        return(0);
    } else {
//----Need local in String to ensure it can be extended
//DEBUG printf("adding new symbol %s\n",Symbol);
        strcpy(PrincipleSymbol,Symbol);
        strcat(PrincipleSymbol,"\n");
        ExtendString(&AllNewSymbols,PrincipleSymbol,&LengthNewSymbols);
        return(1);
    }
}
//-------------------------------------------------------------------------------------------------
void InitializeNewSymbols(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature) {

    LISTNODE NonIntroducedLeaves;
    LISTNODE * Target;
    TERM SourceTerm;
    char * AllSymbols;
    char * Functors;
    char * Variables;
    char * Types;
    char * Symbol;
    char * SearchFrom;

//----Get non-introduced leaves
    NonIntroducedLeaves = DuplicateListOfNodes(Head,0);
    Target = &NonIntroducedLeaves;
    while (*Target != NULL) {
        if (DerivedAnnotatedFormula((*Target)->AnnotatedFormula) ||
((SourceTerm = GetSourceTERM((*Target)->AnnotatedFormula,NULL)) != NULL && 
!strcmp(GetSymbol(SourceTerm),"introduced") && GetArity(SourceTerm) > 0)) {
//----Remove this one
//DEBUG printf("don't use %s\n",GetName((*Target)->AnnotatedFormula,NULL));
            FreeAListNode(Target,Signature);
        } else {
//DEBUG printf("do use %s\n",GetName((*Target)->AnnotatedFormula,NULL));
            Target = &((*Target)->Next);
        }
    }

//----Get all the symbols in those formulae. They are stored in a static place in IsNewSymbol
    AllSymbols = NULL;
    GetListOfAnnotatedFormulaSymbolUsage(NonIntroducedLeaves,&AllSymbols,&Functors,&Variables,
&Types);
    Symbol = strtok(AllSymbols,"\n");
    while (Symbol != NULL) {
//----If a ''ed symbol, leap past the ''s in case there's a / in there
        if (Symbol[0] == '\'') {
            SearchFrom = Symbol+1;
            SearchFrom = strchr(SearchFrom,'\'');
        } else {
            SearchFrom = Symbol;
        }
        *strchr(SearchFrom,'/') = '\0';
        if (!IsNewSymbol(OptionValues,Symbol)) {
            CodingError("Duplicate symbol in all symbols list");
        }
        Symbol = strtok(NULL,"\n");
    }
    Free((void **)&AllSymbols);
    FreeListOfAnnotatedFormulae(&NonIntroducedLeaves,Signature);
}
//-------------------------------------------------------------------------------------------------
void EmptyAndDeleteDirectory(String Directory) {

    String UNIXCommand;

    sprintf(UNIXCommand,"rm -rf %s",Directory);
    system(UNIXCommand);
}
//-------------------------------------------------------------------------------------------------
int CreateDirectory(String Directory,String DerivationFileName) {

    String DerivationFileBasename;

    if (!strcmp(DerivationFileName,"--")) {
        sprintf(DerivationFileBasename,"GDV%06d",getpid());
    } else {
        PathBasename(DerivationFileName,DerivationFileBasename,NULL);
    }

    strcat(Directory,"/");
    strcat(Directory,DerivationFileBasename);
    strcat(Directory,"_gdv");

//----Delete any previous version
    EmptyAndDeleteDirectory(Directory);
//----And make the new one
    if (mkdir(Directory,0755) != 0) {
        perror("Creating working directory");
        return(0);
    } else {
        return(1);
    }
}
//-------------------------------------------------------------------------------------------------
void AddVerifiedTag(ANNOTATEDFORMULA AnnotatedFormula,SIGNATURE Signature,char * TagValue) {

    String VerifiedTag;

    sprintf(VerifiedTag,"verified(%s)",TagValue);
    AddUsefulInformationToAnnotatedFormula(AnnotatedFormula,Signature,VerifiedTag);
}
//-------------------------------------------------------------------------------------------------
char * OutputPrefixForQuietness(OptionsType OptionValues) {

    if (OptionValues.Quietness <= 1) {
        return(" ");
    } else {
        return(NULL);
    }
}
//-------------------------------------------------------------------------------------------------
int GDVCheckTheorem(OptionsType OptionValues,SIGNATURE Signature,LISTNODE Axioms,
ANNOTATEDFORMULA Conjecture,char * FileBaseName,char * Extension,int TestCounterTheorem) {

    String OutputFileName;
    SyntaxType Syntax;
    char * TheoremProver;

    strcpy(OutputFileName,FileBaseName);
    strcat(OutputFileName,".");
    strcat(OutputFileName,Extension);
    strcat(OutputFileName,".dis");

    Syntax = GetListSyntax(Axioms);
    switch (Syntax) {
        case tptp_cnf:
            Syntax = tptp_fof;
        case tptp_fof:
            if (GetSyntax(Conjecture) == tptp_fof || GetSyntax(Conjecture) == tptp_cnf) {
                TheoremProver = OptionValues.TheoremProver;
            } else if (GetSyntax(Conjecture) == tptp_tff) {
                TheoremProver = OptionValues.TFFTheoremProver;
            } else if (GetSyntax(Conjecture) == tptp_thf) {
                TheoremProver = OptionValues.THFTheoremProver;
            } else {
                CodingError("Mixed FOF/CNF with some weird conjecture");
            }
            return(SystemOnTPTP(Axioms,Conjecture,TheoremProver,"Theorem",TestCounterTheorem,
OptionValues.CounterSatisfiableProver,"CounterSatisfiable",OptionValues.TimeLimit,
OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName));
            break;
        case tptp_tcf:
        case tptp_tff:
            if (GetSyntax(Conjecture) == tptp_tff || GetSyntax(Conjecture) == tptp_tcf ||
GetSyntax(Conjecture) == tptp_fof || GetSyntax(Conjecture) == tptp_cnf) {
                TheoremProver = OptionValues.TFFTheoremProver;
            } else {
                CodingError("Mixed TFF with something");
            }
            return(SystemOnTPTP(Axioms,Conjecture,TheoremProver,"Theorem",TestCounterTheorem,
OptionValues.THFCounterSatisfiableProver,"CounterSatisfiable",OptionValues.TimeLimit,
OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName));
            break;
        case tptp_mixed:
            QPRINTF(OptionValues,1)(
"WARNING: %s.%s has mixed language parents+conjecture, using THF tools for THM check\n",
FileBaseName,Extension);
        case tptp_thf:
            if (GetSyntax(Conjecture) == tptp_thf || GetSyntax(Conjecture) == tptp_tcf ||
GetSyntax(Conjecture) == tptp_fof || GetSyntax(Conjecture) == tptp_cnf) {
                TheoremProver = OptionValues.THFTheoremProver;
            } else {
                CodingError("Mixed THF with something");
            }
            return(SystemOnTPTP(Axioms,Conjecture,TheoremProver,"Theorem",TestCounterTheorem,
OptionValues.THFCounterSatisfiableProver,"CounterSatisfiable",OptionValues.TimeLimit,
OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName));
            break;
        default:
            CodingError("Unknown syntax for GDVCheckTheorem");
            return(0);
            break;
    }
}
//-------------------------------------------------------------------------------------------------
int GDVCheckSatisfiable(OptionsType OptionValues,LISTNODE Formulae,char * FileBaseName,
char * Extension,int TestUnsatisfiability) {

    String OutputFileName;
    int CheckResult;
    FILE * Handle;
    SyntaxType Syntax;

    Syntax = GetListSyntax(Formulae);
    switch (Syntax) {
        case tptp_cnf:
            Syntax = tptp_fof;
        case tptp_fof:
            if (ListOfAnnotatedFormulaTrueInInterpretation(Formulae,positive)) {
                if (OptionValues.KeepFiles && OptionValues.TimeLimit != 0) {
                    strcpy(OutputFileName,FileBaseName);
                    strcat(OutputFileName,".");
                    strcat(OutputFileName,Extension);
                    strcat(OutputFileName,"_positive.dis");
                    SystemOnTPTPFileName(OptionValues.KeepFilesDirectory,
OutputFileName,NULL,OutputFileName);
                    if ((Handle = OpenFileInMode(OutputFileName,"w")) != NULL) {
                        fclose(Handle);
                    }
                }
                return(1);
            } else if (ListOfAnnotatedFormulaTrueInInterpretation(Formulae,negative)) {
                if (OptionValues.KeepFiles && OptionValues.TimeLimit != 0) {
                    strcpy(OutputFileName,FileBaseName);
                    strcat(OutputFileName,".");
                    strcat(OutputFileName,Extension);
                    strcat(OutputFileName,"_negative.dis");
                    SystemOnTPTPFileName(OptionValues.KeepFilesDirectory,
OutputFileName,NULL,OutputFileName);
                    if ((Handle = OpenFileInMode(OutputFileName,"w")) != NULL) {
                        fclose(Handle);
                    }
                }
                return(1);
//----Try finite model finder
            } else {
//----First the finite model finder
                strcpy(OutputFileName,FileBaseName);
                strcat(OutputFileName,".");
                strcat(OutputFileName,Extension);
                strcat(OutputFileName,"_model.dis");
                if ((CheckResult = SystemOnTPTP(Formulae,NULL,OptionValues.ModelFinder,
"Satisfiable",TestUnsatisfiability,OptionValues.UnsatisfiabilityChecker,"Unsatisfiable",
OptionValues.TimeLimit,OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName)) != 0) {
                    return(CheckResult);
                } else {
//----The saturator
                    strcpy(OutputFileName,FileBaseName);
                    strcat(OutputFileName,".");
                    strcat(OutputFileName,Extension);
                    strcat(OutputFileName,"_saturate.dis");
                    return(SystemOnTPTP(Formulae,NULL,OptionValues.Saturator,"Satisfiable",0,NULL,
NULL,OptionValues.TimeLimit,OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName));
                }
            }    
            break;
        case tptp_mixed:
            QPRINTF(OptionValues,1)(
"WARNING: %s.%s has mixed language formulae, using THF tools for SAT check\n",
FileBaseName,Extension);
        case tptp_thf:
            strcpy(OutputFileName,FileBaseName);
            strcat(OutputFileName,".");
            strcat(OutputFileName,Extension);
            strcat(OutputFileName,"_model.dis");
            return(SystemOnTPTP(Formulae,NULL,OptionValues.THFModelFinder,"Satisfiable",
TestUnsatisfiability,OptionValues.THFUnsatisfiabilityChecker,"Unsatisfiable",
OptionValues.TimeLimit,OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName));
            break;
        case tptp_tff:
            strcpy(OutputFileName,FileBaseName);
            strcat(OutputFileName,".");
            strcat(OutputFileName,Extension);
            strcat(OutputFileName,"_model.dis");
            return(SystemOnTPTP(Formulae,NULL,OptionValues.TFFModelFinder,"Satisfiable",
TestUnsatisfiability,OptionValues.TFFUnsatisfiabilityChecker,"Unsatisfiable",
OptionValues.TimeLimit,OutputPrefixForQuietness(OptionValues),"-force",OptionValues.KeepFiles,
OptionValues.KeepFilesDirectory,OutputFileName,OutputFileName));
            break;
        default:
            CodingError("Unknown syntax for GDVCheckSatisfiable");
            return(0);
            break;
    }
}
//-------------------------------------------------------------------------------------------------
int CorrectlyInferred(OptionsType OptionValues,SIGNATURE Signature,ANNOTATEDFORMULA Target,
char * FormulaName,LISTNODE ParentAnnotatedFormulae,char * ParentNames,char * SZSStatus,
char * FileBaseName,int OutcomeQuietness,char * Comment) {

    OptionsType OutcomeOptionValues;
    int Correct;
    int ESACorrect;
    ANNOTATEDFORMULA NewTarget;
    LISTNODE ESAParentNode;
    int CheckResult;
    String ESAFileBaseName;

//----Suppress output as required
    OutcomeOptionValues = OptionValues;
    if (OutcomeQuietness >= 0) {
        OutcomeOptionValues.Quietness = OutcomeQuietness;
    }

    if (!strcmp(SZSStatus,"thm")) {
        if (OptionValues.CheckParentRelevance) {
            if ((CheckResult = GDVCheckSatisfiable(OptionValues,ParentAnnotatedFormulae,
FileBaseName,"parents.sat",1)) == 1) {
                Correct = 1;
                QPRINTF(OutcomeOptionValues,2)(
"SUCCESS: %s has sat parents %s %s\n",FormulaName,ParentNames,Comment != NULL?Comment:"");
//----Looked for unsat and didn't find it, so that's also OK
            } else if (CheckResult == 0) {
                Correct = 1;
                QPRINTF(OutcomeOptionValues,2)(
"SUCCESS: %s does not have unsat parents %s %s\n",FormulaName,ParentNames,
Comment != NULL?Comment:"");
//----If single parent of the negated conjecture then can be unsatisfiable 
            } else if (OptionValues.CheckRefutation && ParentAnnotatedFormulae->Next == NULL && 
GetRole(ParentAnnotatedFormulae->AnnotatedFormula,NULL) == negated_conjecture) {
                Correct = 1;
                QPRINTF(OutcomeOptionValues,1)(
"WARNING: %s does not have sat parents %s, tolerated because one is a negated_conjecture %s\n",
FormulaName,ParentNames,Comment != NULL?Comment:"");
//----Parents of false formulae can be satisfiable
            } else if (OptionValues.CheckRefutation && FalseAnnotatedFormula(Target)) {
                Correct = 1;
                QPRINTF(OutcomeOptionValues,1)(
"WARNING: %s does not have sat parents %s, tolerated because it's $false %s\n",
FormulaName,ParentNames,Comment != NULL?Comment:"");
            } else {
                Correct = 0;
                QPRINTF(OutcomeOptionValues,2)(
"FAILURE: %s does not have sat parents %s %s\n",FormulaName,ParentNames,Comment != NULL?Comment:"");
            }
        } else {
            Correct = 1;
        }

        if (!GlobalInterrupted && (Correct || OptionValues.ForceContinue)) {
            if ((CheckResult = GDVCheckTheorem(OptionValues,Signature,
ParentAnnotatedFormulae,Target,FileBaseName,"thm",1)) == 1) {
                Correct = 1;
                if (OptionValues.TimeLimit == 0) {
                    QPRINTF(OutcomeOptionValues,2)("CREATED: Obligation to show that %s is a %s",
FormulaName,SZSStatus);
                } else {
                    QPRINTF(OutcomeOptionValues,2)("SUCCESS: %s is a %s", FormulaName,SZSStatus);
                }
            } else {
                Correct = 0;
                if (CheckResult == 0) {
                    QPRINTF(OutcomeOptionValues,2)("FAILURE: %s fails to be a %s",FormulaName,
SZSStatus);
                } else {
                    QPRINTF(OutcomeOptionValues,2)("FAILURE: %s is not a %s",FormulaName,SZSStatus);
                }
            }
            if (ParentAnnotatedFormulae != NULL) {
                QPRINTF(OutcomeOptionValues,2)(" of %s",ParentNames);
            }
            if (Comment != NULL) {
                QPRINTF(OutcomeOptionValues,2)(" %s",Comment);
            }
            QPRINTF(OutcomeOptionValues,2)("\n");
        }
        return(Correct);

    } else if (!strcmp(SZSStatus,"cth")) {
        Negate(Target,0);
        Correct = CorrectlyInferred(OptionValues,Signature,Target,FormulaName,
ParentAnnotatedFormulae,ParentNames,"thm",FileBaseName,-1,"(Negated cth)");
        Negate(Target,1);
        return(Correct);

    } else if (!strcmp(SZSStatus,"esa")) {
//----First try a THM check and also try the weak reverse check.
        Correct = CorrectlyInferred(OptionValues,Signature,Target,FormulaName,
ParentAnnotatedFormulae,ParentNames,"thm",FileBaseName,4,"(Theorem esa)");
//----This is the weak reverse check. Assume ESA nodes have a single real
//----parent - the rest are THF types and definitions. That parent becomes 
//----the new target, and the old target becomes the parent. Scan down to 
//----the last parent node to find that real parent.
        ESAParentNode = ParentAnnotatedFormulae;
        while (ESAParentNode->Next != NULL) {
            ESAParentNode = ESAParentNode->Next;
        }
        NewTarget = ESAParentNode->AnnotatedFormula;
        ESAParentNode->AnnotatedFormula = Target;
        strcpy(ESAFileBaseName,FileBaseName);
        strcat(ESAFileBaseName,".esa");
        ESACorrect = CorrectlyInferred(OptionValues,Signature,NewTarget,
GetName(NewTarget,NULL),ParentAnnotatedFormulae,GetName(Target,NULL),"thm",
ESAFileBaseName,4,"(Inverted esa)");
        ESAParentNode->AnnotatedFormula = NewTarget;
        if (OptionValues.TimeLimit == 0) {
            QPRINTF(OptionValues,2)(
"CREATED: Obligations to show %s is a %s of %s\n", FormulaName,SZSStatus,ParentNames);
            return(1);
        } else {
//----Accept either, but if only one, then it's incomplete
            if (Correct || ESACorrect) {
                if (!Correct || !ESACorrect) {
                    QPRINTF(OptionValues,2)("WARNING: Incomplete check of SZS status esa\n");
                }
                QPRINTF(OptionValues,2)(
"SUCCESS: %s is a %s of %s\n", FormulaName,SZSStatus,ParentNames);
                return(1);
            } else {
                QPRINTF(OptionValues,2)(
"FAILURE: %s fails to be a %s of %s\n", FormulaName,SZSStatus,ParentNames);
                return(0);
            }
        }
    } else if (!strcmp(SZSStatus,"ecs")) {
//----First try a CTH check and also try the weak reverse check.
        Correct = CorrectlyInferred(OptionValues,Signature,Target,FormulaName,
ParentAnnotatedFormulae,ParentNames,"cth",FileBaseName,4,
"(CounterTheorem ecs)");
//----This is the weak reverse check. Assume ESA nodes have a single real
//----parent - the rest are THF types and definitions. That parent becomes 
//----the new target, and the old target becomes the parent. Scan down to 
//----the last parent node to find that real parent.
        ESAParentNode = ParentAnnotatedFormulae;
        while (ESAParentNode->Next != NULL) {
            ESAParentNode = ESAParentNode->Next;
        }
        NewTarget = ESAParentNode->AnnotatedFormula;
        ESAParentNode->AnnotatedFormula = Target;
        strcpy(ESAFileBaseName,FileBaseName);
        strcat(ESAFileBaseName,".esa");
        ESACorrect = CorrectlyInferred(OptionValues,Signature,NewTarget,
GetName(NewTarget,NULL),ParentAnnotatedFormulae,GetName(Target,NULL),"cth",
ESAFileBaseName,4,"(Inverted ecs)");
        ESAParentNode->AnnotatedFormula = NewTarget;
//----Accept either, but if only one, then it's incomplete
        if (Correct || ESACorrect) {
            if (!Correct || !ESACorrect) {
                QPRINTF(OptionValues,2)(
"WARNING: Incomplete check of SZS status ecs\n");
            }
            QPRINTF(OptionValues,2)(
"SUCCESS: %s is a %s of %s\n", FormulaName,SZSStatus,ParentNames);
            return(1);
        } else {
            QPRINTF(OptionValues,2)(
"FAILURE: %s fails to be a %s of %s\n", FormulaName,SZSStatus,ParentNames);
            return(0);
        }
    } else {
        QPRINTF(OptionValues,1)(
"WARNING: Cannot cope with SZS status %s\n",SZSStatus);
        return(0);
    }
}
//-------------------------------------------------------------------------------------------------
ANNOTATEDFORMULA MakeSplitDefinitionFor(ANNOTATEDFORMULA SplitChild,
SIGNATURE Signature) {

    String FormulaName;
    ANNOTATEDFORMULA SplitDefinition;
    FORMULA Formula;
    String CreatorString;

//----Check it is a disjunction
    Formula = SplitChild->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables->Formula;
    if (Formula->Type != binary || 
Formula->FormulaUnion.BinaryFormula.Connective != disjunction || 
Formula->FormulaUnion.BinaryFormula.LHS->Type != atom ||
GetArity(Formula->FormulaUnion.BinaryFormula.LHS->FormulaUnion.Atom) != 0) {
        return(NULL);
    }

    strcpy(FormulaName,GetSymbol(Formula->FormulaUnion.BinaryFormula.LHS->
FormulaUnion.Atom));
    strcat(FormulaName,"_defn");
    SplitDefinition = DuplicateAnnotatedFormula(SplitChild,Signature);
    Formula = SplitDefinition->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables->Formula;
    SetSyntax(SplitDefinition,tptp_fof);
    SetName(SplitDefinition,FormulaName);
    SetStatus(SplitDefinition,definition,NULL);
    Formula->FormulaUnion.BinaryFormula.Connective = equivalence;
    QuantifyFormula(&(Formula->FormulaUnion.BinaryFormula.RHS),universal,
SplitDefinition->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables->Variables);
    NegateFormula(&(Formula->FormulaUnion.BinaryFormula.RHS));
    EnsureShortForm(SplitDefinition,Signature);
    sprintf(CreatorString,"introduced(definition,[esplit_defn(%s)])",
GetName(SplitChild,NULL));
    SetSourceFromString(SplitDefinition,Signature,CreatorString);

    return(SplitDefinition);
}
//-------------------------------------------------------------------------------------------------
int MakeESplitDefinitions(OptionsType OptionValues,LISTNODE Head,SIGNATURE
Signature,LISTNODE * SplitDefinitions) {

    LISTNODE Target;
    LISTNODE Sibling;
    LISTNODE SplitSiblings;
    int OKSoFar;
    String InferenceRule;
    String InferenceInfo;
    String ProcessedTag;
    String AllParentNames;
    String ParentName;
    String SiblingName;
    String AllSiblingParentNames;
    ANNOTATEDFORMULA SplitDefinition;
    String SplitSiblingsNames;

    *SplitDefinitions = NULL;
    OKSoFar = 1;
    Target = Head;
    while (OKSoFar && Target != NULL) {
        GetName(Target->AnnotatedFormula,SiblingName);
//----Check if derived by an esplit and not already processed
        GetInferenceRule(Target->AnnotatedFormula,InferenceRule);
        if (GetInferenceInfoTerm(Target->AnnotatedFormula,InferenceRule,
InferenceInfo) != NULL && ExtractTermArguments(InferenceInfo) &&
strstr(InferenceInfo,"esplit,") == InferenceInfo && 
GetUsefulInfoTerm(Target->AnnotatedFormula,"psuedo_split_from",1,ProcessedTag) == NULL) {
//----Get the split parent
            GetNodeParentNames(Target->AnnotatedFormula,AllParentNames);
//----Crude check that there's just one parent
            if (strchr(AllParentNames,'\n') != strrchr(AllParentNames,'\n')) {
                QPRINTF(OptionValues,2)(
"FAILURE: %s has been esplit without defns from more than one parent\n",SiblingName);
                OKSoFar = 0;
            } else {
                SplitSiblings = NULL;
                AddListNode(&SplitSiblings,SplitSiblings,Target->AnnotatedFormula);

                strcpy(ParentName,AllParentNames);
                *strchr(ParentName,'\n') = '\0';
                sprintf(ProcessedTag,"psuedo_split_from(%s)",ParentName);
                AddUsefulInformationToAnnotatedFormula(Target->AnnotatedFormula,Signature,
ProcessedTag);

                strcpy(SplitSiblingsNames,"psuedo_split_to(");
                strcat(SplitSiblingsNames,SiblingName);

//----Go through and look for split siblings (with same parent)
                Sibling = Target->Next;
                while (OKSoFar && Sibling != NULL) {
                    if (GetInferenceInfoTerm(Sibling->AnnotatedFormula,
InferenceRule,InferenceInfo) != NULL && ExtractTermArguments(InferenceInfo) &&
strstr(InferenceInfo,"esplit,") == InferenceInfo && 
GetUsefulInfoTerm(Sibling->AnnotatedFormula,"psuedo_split_from",1,ProcessedTag) == NULL) {
                        GetName(Sibling->AnnotatedFormula,SiblingName);
                        GetNodeParentNames(Sibling->AnnotatedFormula,AllSiblingParentNames);
//----Another sibling
                        if (!strcmp(AllParentNames,AllSiblingParentNames)) {
                            AddListNode(&SplitSiblings,SplitSiblings,Sibling->AnnotatedFormula);
                            AddUsefulInformationToAnnotatedFormula(Sibling->AnnotatedFormula,
Signature,ProcessedTag);
                            strcat(SplitSiblingsNames,",");
                            strcat(SplitSiblingsNames,SiblingName);
                        }
                    }
                    Sibling = Sibling->Next;
                }
                strcat(SplitSiblingsNames,")");
                AddUsefulInformationToAnnotatedFormula(
GetAnnotatedFormulaFromListByName(Head,ParentName),Signature,SplitSiblingsNames);

//----Make the definitions for all except the first in the list (which was
//----the last found and I assume to be the link clause)
                Sibling = SplitSiblings->Next;
                while (OKSoFar && Sibling != NULL) {
                    GetName(Sibling->AnnotatedFormula,SiblingName);
                    if ((SplitDefinition = MakeSplitDefinitionFor(Sibling->AnnotatedFormula,
Signature)) == NULL) {
                        QPRINTF(OptionValues,2)(
"FAILURE: %s cannot be converted to a split definition\n",SiblingName);
                    } else {
                        AddListNode(SplitDefinitions,*SplitDefinitions,SplitDefinition);
                        sprintf(ProcessedTag,"esplit_defn(%s)",GetName(SplitDefinition,NULL));
                        AddUsefulInformationToAnnotatedFormula(Sibling->AnnotatedFormula,Signature,
ProcessedTag);
                    }
                    Sibling = Sibling->Next;
                }
                FreeListOfAnnotatedFormulae(&SplitSiblings,Signature);
            }
        }
    Target = Target->Next;
    }

    if (!OKSoFar) {
        FreeListOfAnnotatedFormulae(SplitDefinitions,Signature);
    }

//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,*SplitDefinitions,tptp,1);

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int InsertExplicitSplitInfo(OptionsType OptionValues,LISTNODE Head,
SIGNATURE Signature,int * NumberOfExplicitSplits) {

    int OKSoFar;
    LISTNODE Target;
    LISTNODE Sibling;
    String InferenceRule;
    String InferenceInfo;
    String ProcessedTag;
    String AllParentNames;
    StringParts ParentNames;
    String SiblingName;
    String AllSiblingParentNames;
    String SplitSiblingsNames;
    StringParts SiblingParentNames;
    int NumberOfSiblingParents;
    int NumberOfSplitChildren;
    int NextChildFound;
    int NumberOfParents;

    OKSoFar = 1;
    *NumberOfExplicitSplits = 0;
    Target = Head;
    while (OKSoFar && Target != NULL) {
        GetName(Target->AnnotatedFormula,SiblingName);
//----Check if derived by a split and not already processed
        GetInferenceRule(Target->AnnotatedFormula,InferenceRule);
        if (GetInferenceInfoTerm(Target->AnnotatedFormula,InferenceRule,
InferenceInfo) != NULL && ExtractTermArguments(InferenceInfo) &&
strstr(InferenceInfo,"split,") == InferenceInfo && GetUsefulInfoTerm(
Target->AnnotatedFormula,"explicit_split_from",1,ProcessedTag) == NULL) {
            GetNodeParentNames(Target->AnnotatedFormula,AllParentNames);
            NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
//----Check that there's just one parent
            if (NumberOfParents > 2 ||
(NumberOfParents == 2 && !FalseAnnotatedFormula(
GetAnnotatedFormulaFromListByName(Head,ParentNames[0])) && 
!FalseAnnotatedFormula(
GetAnnotatedFormulaFromListByName(Head,ParentNames[1])))) {
                QPRINTF(OptionValues,2)(
"FAILURE: %s has been split from more than one parent\n",SiblingName);
                OKSoFar = 0;
            }
            if (NumberOfParents == 1 && OKSoFar) {
                (*NumberOfExplicitSplits)++;
                sprintf(ProcessedTag,"explicit_split_from(%s)",ParentNames[0]);
                AddUsefulInformationToAnnotatedFormula(
Target->AnnotatedFormula,Signature,ProcessedTag);
                strcpy(SplitSiblingsNames,"explicit_split_to(");
                strcat(SplitSiblingsNames,SiblingName);

//----Look for the other children next
                NumberOfSplitChildren = 1;
//----Go through and look for split siblings (with same parent)
                Sibling = Target->Next;
                do {
                    NextChildFound = 0;
                    while (OKSoFar && !NextChildFound && Sibling != NULL) {
                        if (GetInferenceInfoTerm(Sibling->AnnotatedFormula,
InferenceRule,InferenceInfo) != NULL && ExtractTermArguments(InferenceInfo) &&
strstr(InferenceInfo,"split,") == InferenceInfo && GetUsefulInfoTerm(
Sibling->AnnotatedFormula,"psuedo_split_from",1,ProcessedTag) == NULL) {
//----Check it's split from the same parent
                            GetName(Sibling->AnnotatedFormula,SiblingName);
                            GetNodeParentNames(Sibling->AnnotatedFormula,
AllSiblingParentNames);
                            NumberOfSiblingParents = Tokenize(
AllSiblingParentNames,SiblingParentNames,"\n");
                            if (NumberOfSiblingParents == 1 &&
!strcmp(ParentNames[0],SiblingParentNames[0])) {
                                AddUsefulInformationToAnnotatedFormula(
Sibling->AnnotatedFormula,Signature,ProcessedTag);
                                strcat(SplitSiblingsNames,",");
                                strcat(SplitSiblingsNames,SiblingName);
                                NumberOfSplitChildren++;
                                NextChildFound = 1;
                            }
                        }
                        Sibling = Sibling->Next;
                    }
                } while (NextChildFound);
                strcat(SplitSiblingsNames,")");
                if (NumberOfSplitChildren == 1) {
                    QPRINTF(OptionValues,2)(
"FAILURE: %s has only one split child\n",ParentNames[0]);
                    OKSoFar = 0;
                } else {
                    AddUsefulInformationToAnnotatedFormula(
GetAnnotatedFormulaFromListByName(Head,ParentNames[0]),Signature,
SplitSiblingsNames);
                }
            }
        }
        Target = Target->Next;
    }
    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
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
            if (GetNodeFromBTreeByAnnotatedFormulaName(&BTreeRoot,ParentNames[ParentIndex]) == 
NULL) {
//----Change to introduced form and bailout - only one missing parent does it
//----Free the parents
                FreeTerm(&(Target->AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source->Arguments[2]),Signature,NULL);
//----Reduce count of use of inference
                Target->AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source->
TheSymbol.NonVariable->NumberOfUses--;
//----Set the principle symbol to introduced, arity 2
                Target->AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source->
TheSymbol.NonVariable = InsertIntoSignature(Signature,non_logical_data,"introduced",2,-1,0,NULL);
                break;
            }
        }
        Free((void **)&AllParentNames);
        Target = Target->Next;
    }
    FreeBTreeOfAnnotatedFormulae(&BTreeRoot,Signature);
}
//-------------------------------------------------------------------------------------------------
int StructuralCompletion(OptionsType OptionValues,LISTNODE * Head,SIGNATURE Signature) {

    int OKSoFar;
    LISTNODE SplitDefinitions;
    LISTNODE TargetDefinition;
    int NumberOfInstances;

    OKSoFar = 1;

//----Add definitions for E's psuedo splitting if not expected
//----Hopefully this will be unnecessary in the future 
    if (!GlobalInterrupted && OKSoFar && OptionValues.GenerateDefinitions) {
        if (MakeESplitDefinitions(OptionValues,*Head,Signature,&SplitDefinitions)) {
//----Report only if there are some
            if (SplitDefinitions != NULL) {
                TargetDefinition = SplitDefinitions;
                while (TargetDefinition != NULL) {
                    AddListNode(Head,*Head,TargetDefinition->AnnotatedFormula);
                    TargetDefinition = TargetDefinition->Next;
                }
                QPRINTF(OptionValues,2)("SUCCESS: All esplits have had definitions added\n");
                FreeListOfAnnotatedFormulae(&SplitDefinitions,Signature);
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Tag explicit splits
    if (!GlobalInterrupted && OKSoFar) {
        if (InsertExplicitSplitInfo(OptionValues,*Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF(OptionValues,2)("SUCCESS: All splits have all children in place\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----If a derivation extract, then remove leaf inference info 
    if (!GlobalInterrupted && OKSoFar && OptionValues.DerivationExtract) {
        RemoveLeafInferenceInfo(Signature,*Head);
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int AllParentsExist(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature) {

    LISTNODE Target;
    int OKSoFar;
    char * AllParentNames;
    StringParts ParentNames;
    int NumberOfParents;
    String FormulaName;
    LISTNODE ParentList;

    OKSoFar = 1;

    Target = Head;
    while (OKSoFar && Target != NULL) {
        if (DerivedAnnotatedFormula(Target->AnnotatedFormula)) {
            GetName(Target->AnnotatedFormula,FormulaName);
            AllParentNames = GetNodeParentNames(Target->AnnotatedFormula,NULL);
            if ((NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n")) == 0) {
                QPRINTF(OptionValues,1)(
"WARNING: %s is derived from no parents\n",FormulaName);
            }
            if (GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentList,Signature)) {
                FreeListOfAnnotatedFormulae(&ParentList,Signature);
            } else {
                QPRINTF(OptionValues,2)("FAILURE: %s has a non-existent parent\n",FormulaName);
                OKSoFar = 0;
            }
            Free((void **)&AllParentNames);
        }
        Target = Target->Next;
    }
    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int CyclicTree(TREENODE TreeRoot) {

    int ParentIndex;

//DEBUG printf("check cycle at %s\n",GetName(TreeRoot->AnnotatedFormula,NULL));
//----If listnode already marked, we're done
    if (TreeRoot->Visited == 2) {
//DEBUG printf("already removed %s\n",FormulaName);
        return(0);
    }

//----If list node previous in chain, error
    if (TreeRoot->Visited == 1) {
//DEBUG printf("in a loop at %s\n",FormulaName);
        return(1);
    }

    TreeRoot->Visited = 1;
    for (ParentIndex = 0;ParentIndex < TreeRoot->NumberOfParents;ParentIndex++) {
        if (CyclicTree(TreeRoot->Parents[ParentIndex])) {
//DEBUG printf("more of loop at %s\n",FormulaName);
            return(1);
        }
    }

//----Mark the subtree as clear
//DEBUG printf("subtree clear at %s\n",FormulaName);
    TreeRoot->Visited = 2;
    return(0);
}
//-------------------------------------------------------------------------------------------------
int CyclicRootList(ROOTLIST RootListHead) {

    ResetRootListVisited(RootListHead);
    while (RootListHead != NULL) {
        if (CyclicTree(RootListHead->TheTree)) {
            return(1);
        }
        RootListHead = RootListHead->Next;
    }
    ResetRootListVisited(RootListHead);
    return(0);
}
//-------------------------------------------------------------------------------------------------
TREENODE CheckFalseRootNode(OptionsType OptionValues,ROOTLIST RootListHead) {

    TREENODE FalseRoot;

    if ((FalseRoot = GetFalseRootNode(RootListHead)) == NULL) {
        QPRINTF(OptionValues,2)("FAILURE: Derivation has no false roots\n");
    }

    return(FalseRoot);
}
//-------------------------------------------------------------------------------------------------
int NoRootWithAssumptions(OptionsType OptionValues,ROOTLIST RootListHead) {

    TERM AssumptionsTerm;

    while (RootListHead != NULL) {
        if ((AssumptionsTerm = GetInferenceInfoTERM(RootListHead->TheTree->
AnnotatedFormula,"assumptions")) != NULL && GetArity(AssumptionsTerm) == 1 &&
LooksLikeAList(AssumptionsTerm->Arguments[0],1,-1)) {
            QPRINTF((OptionValues),2)("FAILURE: Assumptions in root %s\n",
GetName(RootListHead->TheTree->AnnotatedFormula,NULL));
            return(0);
        }
        RootListHead = RootListHead->Next;
    }
    return(1);
}
//-------------------------------------------------------------------------------------------------
char * GetParentsAssumptions(OptionsType OptionValues,ANNOTATEDFORMULA AnnotatedFormula,
LISTNODE Head,SIGNATURE Signature) {

    LISTNODE Parents;
    LISTNODE Target;
    char * Assumptions;
    int AssumptionsLength;
    TERM TargetAssumptionsTerm;
    char * TargetAssumptions;

    GetNodeParentList(AnnotatedFormula,Head,&Parents,Signature);
    MakeBuffer(&Assumptions,&AssumptionsLength);
    ExtendString(&Assumptions,",",&AssumptionsLength);
    Target = Parents;
    while (Target != NULL) {
//DEBUG printf("Looking at parent ...\n");
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);
        if (GetRole(Target->AnnotatedFormula,NULL) == assumption) {
//DEBUG printf("This parent is an assumption\n");
            ExtendString(&Assumptions,GetName(Target->AnnotatedFormula,
NULL),&AssumptionsLength);
            ExtendString(&Assumptions,",",&AssumptionsLength);
        } else {
//DEBUG printf("This parent is not an assumption\n");
            if ((TargetAssumptionsTerm = GetInferenceInfoTERM(Target->
AnnotatedFormula,"assumptions")) != NULL) {
                if ((TargetAssumptions = ExtractAssumptionsList(
TargetAssumptionsTerm)) != NULL) {
//DEBUG printf("The TargetAssumptions are %s\n",TargetAssumptions);
                    ExtendString(&Assumptions,TargetAssumptions,
&AssumptionsLength);
                    Free((void **)&TargetAssumptions);
                } else {
//DEBUG printf("Empty TargetAssumptions\n");
                }
            } else {
//DEBUG printf("No assumptions term\n");
            }
        }
        Target = Target->Next;
    } 
    FreeListOfAnnotatedFormulae(&Parents,Signature);

//----Check if any assumptions found
    if (strlen(Assumptions) == 1) {
        Free((void **)&Assumptions);
    }
    return(Assumptions);
}
//-------------------------------------------------------------------------------------------------
int FormulaAssumptionsPropagated(OptionsType OptionValues,ANNOTATEDFORMULA AnnotatedFormula,
LISTNODE Head,SIGNATURE Signature) {

    char * ParentsAssumptions;
    char * DischargedNames;
    TERM DischargeList;
    StringParts RemoveNames;
    int NumberOfNamesToRemove;
    int Index;
    String FindThis;
    char * RemovePosition;
    char * NextComma;
    TERM FormulaAssumptionsTerm;
    char * FormulaAssumptions;
    int OKSoFar;

//----Get parents assumptions
//DEBUG printf("----------- Looking at ...\n");
//DEBUG PrintAnnotatedTSTPNode(stdout,AnnotatedFormula,tptp,1);
    ParentsAssumptions = GetParentsAssumptions(OptionValues,AnnotatedFormula,Head,Signature);
//DEBUG printf("All parents' assumptions are ==%s==\n",ParentsAssumptions);

    if ((FormulaAssumptionsTerm = GetInferenceInfoTERM(AnnotatedFormula,
"assumptions")) != NULL) {
        FormulaAssumptions = ExtractAssumptionsList(FormulaAssumptionsTerm);
//DEBUG printf("FormulaAssumptions are %s\n",FormulaAssumptions);
    } else {
//DEBUG printf("The formula has no assumptions\n");
        FormulaAssumptions = NULL;
    }

//----Remove discharged and remaining assumptions from parents list. Must
//----be empty when done. This means duplicate assumptions are all discharged
//----by one discharge. If you meant to leave some in then the remaining
//----ones in the formula are equivalent to newly (unnecessarily) added
//----assumptions.
    if (ParentsAssumptions == NULL) {
        DischargedNames = NULL;
        if (FormulaAssumptions != NULL) {
            QPRINTF(OptionValues,1)(
"WARNING: %s may have extra introduced assumptions\n",
GetName(AnnotatedFormula,NULL));
        }
        OKSoFar = 1;
    } else {
//----Remove discharged assumptions 
        DischargedNames = GetDischargedNames(AnnotatedFormula,&DischargeList);
//DEBUG printf("DischargedNames is %s\n",DischargedNames);
        NumberOfNamesToRemove = Tokenize(DischargedNames,RemoveNames,",");
//DEBUG printf("there are %d discharge names\n",NumberOfNamesToRemove);
        for (Index = 0;Index < NumberOfNamesToRemove;Index++) {
            strcpy(FindThis,",");
            strcat(FindThis,RemoveNames[Index]);
            strcat(FindThis,",");
//----Remove all instances
            while ((RemovePosition = strstr(ParentsAssumptions,FindThis)) !=
NULL) {
                NextComma = strchr(RemovePosition+1,',');
                strcpy(RemovePosition,NextComma);
            }
        }
//DEBUG printf("after removing discharged assumptions %s\n",ParentsAssumptions);

//----Remove formula assumptions
        NumberOfNamesToRemove = Tokenize(FormulaAssumptions,RemoveNames,",");
        for (Index = 0;Index < NumberOfNamesToRemove;Index++) {
            strcpy(FindThis,",");
            strcat(FindThis,RemoveNames[Index]);
            strcat(FindThis,",");
//----Remove all instances
            while ((RemovePosition = strstr(ParentsAssumptions,FindThis)) !=
NULL) {
                NextComma = strchr(RemovePosition+1,',');
                strcpy(RemovePosition,NextComma);
            }
        }
//DEBUG printf("after removing formula assumptions %s\n",ParentsAssumptions);
//----Should be only a comma left
        OKSoFar = !strcmp(ParentsAssumptions,",");
    }

    if (DischargedNames != NULL) {
        Free((void **)&DischargedNames);
    }
    if (FormulaAssumptions != NULL) {
        Free((void **)&FormulaAssumptions);
    }
    if (ParentsAssumptions != NULL) {
        Free((void **)&ParentsAssumptions);
    }
    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int AssumptionsPropagated(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
int * NumberOfInstances) {

    LISTNODE Target;

    Target = Head;
    *NumberOfInstances = 0;
    while (Target != NULL) {
        if (!FormulaAssumptionsPropagated(OptionValues,Target->AnnotatedFormula,Head,Signature)) {
            QPRINTF((OptionValues),2)("FAILURE: Assumptions not propagated in %s\n",
GetName(Target->AnnotatedFormula,NULL));
            return(0);
        }
        (*NumberOfInstances)++;
        Target = Target->Next;
    }
    return(1);
}
//-------------------------------------------------------------------------------------------------
//----Must replace this by stuff from Tree.c
int IsAncestor(LISTNODE Head,ANNOTATEDFORMULA Ancestor,ANNOTATEDFORMULA Descendant,
int THMNodesOnly) {

    String AncestorName;
    char * AllParentNames;
    int NumberOfParents;
    StringParts ParentNames;
    int ParentNumber;
    ANNOTATEDFORMULA Parent;
    String DescendantName;
    String ParentStatus;

    GetName(Ancestor,AncestorName);
    GetName(Descendant,DescendantName);
    AllParentNames = GetNodeParentNames(Descendant,NULL);
    NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
    for (ParentNumber=0;ParentNumber < NumberOfParents;ParentNumber++) {
        if (!strcmp(AncestorName,ParentNames[ParentNumber])) {
            Free((void **)&AllParentNames);
            return(1);
        } else {
            Parent = GetAnnotatedFormulaFromListByName(Head,
ParentNames[ParentNumber]);
            if ((!THMNodesOnly || 
(GetInferenceInfoTerm(Parent,"status",ParentStatus) != NULL && 
!strcmp(ParentStatus,"status(thm)"))) &&
IsAncestor(Head,Ancestor,Parent,THMNodesOnly)) {
                Free((void **)&AllParentNames);
                return(1);
            }
        }
    }
    Free((void **)&AllParentNames);
    return(0);
}
//-------------------------------------------------------------------------------------------------
TREENODE DoAnnotatedFormulaInTreeTHM(TREENODE ATree,ANNOTATEDFORMULA
LookingForThis,int THMNodesOnly) {

    int ParentIndex;
    TREENODE AncestorNode;
    String ParentStatus;

    if (ATree != NULL) {
        if (!ATree->Visited) {
//----Must mark visited here because of the return in the middle, which
//----might leave it unmarked, and therefore the reset does not go up.
            ATree->Visited = 1;
//----Is this the one?
            if (ATree->AnnotatedFormula == LookingForThis) {
                return(ATree);
            } else {
//----Look in subtrees subject to THM veto
                if (!THMNodesOnly || (GetInferenceInfoTerm(ATree->
AnnotatedFormula,"status",ParentStatus) != NULL && !strcmp(ParentStatus,
"status(thm)"))) {
                    for (ParentIndex = 0; ParentIndex < ATree->NumberOfParents;
ParentIndex++) {
                        if ((AncestorNode = DoAnnotatedFormulaInTreeTHM(ATree->
Parents[ParentIndex],LookingForThis,THMNodesOnly)) != NULL) {
                            return(AncestorNode);
                        }
                    }
                }
            }
        } else {
            return(NULL);
        }
    }

    return(NULL);
}
//-------------------------------------------------------------------------------------------------
TREENODE AnnotatedFormulaInTreeTHM(TREENODE ATree,ANNOTATEDFORMULA
LookingForThis,int THMNodesOnly) {

    TREENODE TreeNodeFound;

    ResetTreeVisited(ATree);
    TreeNodeFound = DoAnnotatedFormulaInTreeTHM(ATree,LookingForThis,
THMNodesOnly);
    ResetTreeVisited(ATree);
    return(TreeNodeFound);
}
//-------------------------------------------------------------------------------------------------
TREENODE AnnotatedFormulaInTreesTHM(ROOTLIST RootListHead,ANNOTATEDFORMULA
LookingForThis,int THMNodesOnly) {

    TREENODE TreeNode;

    while (RootListHead != NULL) {
        if ((TreeNode = AnnotatedFormulaInTreeTHM(RootListHead->TheTree,
LookingForThis,THMNodesOnly)) != NULL) {
            return(TreeNode);
        } else {
            RootListHead = RootListHead->Next;
        }
    }
    return(NULL);
}
//-------------------------------------------------------------------------------------------------
int UsesFormulae(OptionsType OptionValues,LISTNODE Head,ROOTLIST RootListHead) {

    LISTNODE Target;
    StatusType Status;
    int FoundAConjecture;
    int OKSoFar;

    FoundAConjecture = 0;
    OKSoFar = 1;
    Target = Head;
    while (Target != NULL) {
        if (!DerivedAnnotatedFormula(Target->AnnotatedFormula)) {
            if ((Status = GetRole(Target->AnnotatedFormula,NULL)) == 
conjecture || Status == negated_conjecture) {
                FoundAConjecture = 1;
            }
            if (AnnotatedFormulaInTreesTHM(RootListHead,Target->
AnnotatedFormula,0) == NULL) {
                QPRINTF(OptionValues,2)("WARNING: Leaf %s is not used\n",
GetName(Target->AnnotatedFormula,NULL));
                OKSoFar = 0;
            }
        }
        Target = Target->Next;
    } 

    if (!FoundAConjecture) {
        QPRINTF(OptionValues,2)(
"WARNING: (Negated) leaf conjecture not found\n");
        OKSoFar = 0;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int WellFormedProofsByContradiction(OptionsType OptionValues,LISTNODE Head,
SIGNATURE Signature,int * NumberOfProofsByContradiction) {

    LISTNODE Target;
    int OKSoFar;
    String FormulaName;
    char * AllParentNames;
    int NumberOfParents;
    StringParts ParentNames;
    ANNOTATEDFORMULA FalseParent;
    ANNOTATEDFORMULA AncestorParent;
    ANNOTATEDFORMULA SwapParent;
    char * AncestorName;
    String ProcessedTag;

    OKSoFar = 1;
    *NumberOfProofsByContradiction = 0;
    Target = Head;
    while (OKSoFar && Target != NULL) {
        GetName(Target->AnnotatedFormula,FormulaName);
        AllParentNames = GetNodeParentNames(Target->AnnotatedFormula,NULL);
        NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
        if (NumberOfParents == 2) {
            FalseParent = GetAnnotatedFormulaFromListByName(Head,
ParentNames[0]);
            AncestorParent = GetAnnotatedFormulaFromListByName(Head,
ParentNames[1]);
            if (FalseAnnotatedFormula(FalseParent)) {
                AncestorName = ParentNames[1];
            } else if (FalseAnnotatedFormula(AncestorParent)) {
                SwapParent = FalseParent;
                FalseParent = AncestorParent;
                AncestorParent = SwapParent;
                AncestorName = ParentNames[0];
            } else {
                FalseParent = NULL;
            }
            if (FalseParent != NULL) {
//----Shit, must allow non thm inferences in this trail due to splits.
//----This PbC is still unclear of course.
                if (!IsAncestor(Head,AncestorParent,FalseParent,0)) {
                    QPRINTF(OptionValues,2)(
"FAILURE: %s has a badly formed proof by contradiction\n",FormulaName);
                    OKSoFar = 0;
                } else {
                    (*NumberOfProofsByContradiction)++;
                    sprintf(ProcessedTag,"proved_by_contradiction(%s)",
AncestorName);
                    AddUsefulInformationToAnnotatedFormula(
Target->AnnotatedFormula,Signature,ProcessedTag);
                }
            }
        }
        Free((void **)&AllParentNames);
        Target = Target->Next;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int ExplicitSplitsIndependent(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
ROOTLIST RootListHead,int * NumberOfExplicitSplits) {

    int OKSoFar;
    LISTNODE Target;
    ROOTLIST InnerTarget;
    String FormulaName;
    int OccurenceNumber;
    String UsefulInfo;
    StringParts SplitChildrenNames;
    ANNOTATEDFORMULA SplitChild1;
    ANNOTATEDFORMULA SplitChild2;
    int NumberOfSplitChildren;
    int SplitIndex1;
    int SplitIndex2;
    String InnerName;
    TREENODE RefutationRoot;
    ROOTLIST FalseList;
    TERM JoinRecord;

    RefutationRoot = GetFalseRootNode(RootListHead);
    FalseList = GetFalseNodes(RootListHead,Head);
    OKSoFar = 1;
    *NumberOfExplicitSplits = 0;
    Target = Head;
    while (OKSoFar && Target != NULL) {
        OccurenceNumber = 1;
//----Look for explicitly split formulae. A formula may be split multiple times.
        while (GetUsefulInfoTerm(Target->AnnotatedFormula,"explicit_split_to",
OccurenceNumber,UsefulInfo) != NULL) {
            OccurenceNumber++;
            GetName(Target->AnnotatedFormula,FormulaName);
            (*NumberOfExplicitSplits)++;
            ExtractTermArguments(UsefulInfo);
            if ((NumberOfSplitChildren = Tokenize(UsefulInfo,
SplitChildrenNames,",")) < 2) {
                CodingError("Wrong number of split children");
            }
            
            for (SplitIndex1=0;SplitIndex1<NumberOfSplitChildren-1;
SplitIndex1++) {
                SplitChild1 = GetAnnotatedFormulaFromListByName(Head,
SplitChildrenNames[SplitIndex1]);
                for (SplitIndex2=SplitIndex1+1;
SplitIndex2<NumberOfSplitChildren;SplitIndex2++) {
                    SplitChild2 = GetAnnotatedFormulaFromListByName(Head,
SplitChildrenNames[SplitIndex2]);
//----No formula may have both split children as an ancestor. Check all roots.
                    InnerTarget = RootListHead;
                    while (OKSoFar && InnerTarget != NULL) {
//----Joined splis are OK
                        if (((JoinRecord = GetInferenceInfoTERM(
InnerTarget->TheTree->AnnotatedFormula,"__inference_rule__")) == NULL ||
GetArity(JoinRecord) != 2 ||
strcmp(GetSymbol(JoinRecord->Arguments[0]),"join")) &&
//----But otherwise check for this pair of split children 
AnnotatedFormulaInTreeTHM(InnerTarget->TheTree,SplitChild1,0) != NULL && 
AnnotatedFormulaInTreeTHM(InnerTarget->TheTree,SplitChild2,0) != NULL) {
                            OKSoFar = 0;
                            QPRINTF(OptionValues,2)(
"FAILURE: %s has both split siblings %s and %s as ancestors\n",
GetName(InnerTarget->TheTree->AnnotatedFormula,InnerName),
SplitChildrenNames[SplitIndex1],SplitChildrenNames[SplitIndex2]);
                        }
                        InnerTarget = InnerTarget->Next;
                    }
//----If child is an ancestor of the refutation node, not going through non-thm
//----Both sides must have a false descendant
                    if (OKSoFar && OptionValues.CheckRefutation &&
((AnnotatedFormulaInTreeTHM(RefutationRoot,SplitChild1,1) != NULL &&
AnnotatedFormulaInTreesTHM(FalseList,SplitChild2,1) == NULL) ||
(AnnotatedFormulaInTreeTHM(RefutationRoot,SplitChild2,1) != NULL && 
AnnotatedFormulaInTreesTHM(FalseList,SplitChild1,1) == NULL))) {
                        OKSoFar = 0;
                        QPRINTF(OptionValues,2)(
"FAILURE: One of the split siblings %s and %s is not refuted\n",
SplitChildrenNames[0],SplitChildrenNames[1]);
                    }
                }
            }
        }
        Target = Target->Next;
    }

    FreeRootList(&FalseList,0,Signature);
    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int IsSpecifiedDefinition(OptionsType OptionValues,ANNOTATEDFORMULA PossibleDefinition,
char ** SymbolDefined) {

    TERM NewSymbolTerm;

    if ((NewSymbolTerm = GetSourceInfoTERM(PossibleDefinition,"introduced","new_symbol")) != 
NULL && GetArity(NewSymbolTerm) == 1 &&
IsNewSymbol(OptionValues,GetSymbol(NewSymbolTerm->Arguments[0]))) {
        *SymbolDefined = GetSymbol(NewSymbolTerm->Arguments[0]);
        return(1);
    } else {
        return(0);
    }
}
//-------------------------------------------------------------------------------------------------
int IsPredicateDefinition(OptionsType OptionValues,
ANNOTATEDFORMULA PossibleAnnotatedDefn,char ** PredicateDefined) {

    FORMULA PossibleDefn;

    PossibleDefn = PossibleAnnotatedDefn->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.FormulaWithVariables->Formula;

    if (PossibleDefn->Type == binary && 
PossibleDefn->FormulaUnion.BinaryFormula.Connective == equivalence &&
PossibleDefn->FormulaUnion.BinaryFormula.LHS->Type == atom &&
IsNewSymbol(OptionValues,GetSymbol(PossibleDefn->FormulaUnion.BinaryFormula.
LHS->FormulaUnion.Atom))) {
        *PredicateDefined = GetSymbol(PossibleDefn->FormulaUnion.
BinaryFormula.LHS->FormulaUnion.Atom);
        return(1);
    } else {
        return(0);
    }
}
//-------------------------------------------------------------------------------------------------
int StructuralVerification(OptionsType * OptionValues,LISTNODE Head,SIGNATURE Signature) {

    int OKSoFar;
    int NumberOfInstances;
    ROOTLIST RootListHead;

    OKSoFar = 1;

//----Check formulae are uniquely named
    if (!GlobalInterrupted && OKSoFar) {
        if (UniquelyNamed(Head)) {
            QPRINTF((*OptionValues),2)("SUCCESS: Derivation has unique formula names\n");
        } else {
            QPRINTF((*OptionValues),2)("FAILURE: Derivation has duplicate formula names\n");
            OKSoFar = 0;
        }
    }
    fflush(stdout);

//----Check that all parents of all inferred formulae exist
    if (!GlobalInterrupted && OKSoFar) {
        if (AllParentsExist(*OptionValues,Head,Signature)) {
            QPRINTF((*OptionValues),2)(
"SUCCESS: All derived formulae have parents and inference information\n");
        } else {
            OKSoFar = 0;
        }
    }
    fflush(stdout);

//----Build the derivation tree
    if ((RootListHead = BuildRootList(Head,Signature)) == NULL) {
        QPRINTF((*OptionValues),2)("FAILURE: Cannot build explicit proof tree\n");
        OKSoFar = 0;
    }
    fflush(stdout);

//----Check that the derivation is acyclic
    if (!GlobalInterrupted && OKSoFar) {
        if (!CyclicRootList(RootListHead)) {
            QPRINTF((*OptionValues),2)("SUCCESS: Derivation is acyclic\n");
        } else {
            QPRINTF((*OptionValues),2)("FAILURE: Derivation is cyclic\n");
            OKSoFar = 0;
        }
    }

//----Check a refutation has a false root (at least one)
    if (!GlobalInterrupted && OKSoFar) {
        if (OptionValues->CheckRefutation) {
            if (CheckFalseRootNode(*OptionValues,RootListHead) != NULL) {
                QPRINTF((*OptionValues),2)("SUCCESS: Derivation could be a refutation\n");
            } else {
                OKSoFar = 0;
            }
        } else if (OptionValues->AutoMode && GetFalseRootNode(RootListHead) != NULL) {
            OptionValues->CheckRefutation = 1;
            QPRINTF((*OptionValues),1)("AUTOSET: Has false root, will check as a refutation\n");
            QPRINTF((*OptionValues),2)("SUCCESS: Derivation could be a refutation\n");
        }
    }

//----Check all formulae are used, and a conjecture exists
    if (!GlobalInterrupted && OKSoFar && OptionValues->CheckRefutation) {
        if (UsesFormulae(*OptionValues,Head,RootListHead)) {
            QPRINTF((*OptionValues),2)(
"SUCCESS: Derivation uses all formulae and has a (negated) conjecture\n");
        } 
    }

//----Check that assumptions are propagated properly to discharge
    if (!GlobalInterrupted && OKSoFar) {
        if (AssumptionsPropagated(*OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((*OptionValues),2)("SUCCESS: Assumptions are propagated\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Check that roots have no assumptions
    if (!GlobalInterrupted && OKSoFar && !OptionValues->DerivationExtract) {
        if (NoRootWithAssumptions(*OptionValues,RootListHead)) {
            QPRINTF((*OptionValues),2)("SUCCESS: Assumptions are discharged\n");
        } else {
            OKSoFar = 0;
        }
    }

//----Check that all nodes that have a false parent have two parents, and
//----the second is an ancestor of the false
    if (!GlobalInterrupted && OKSoFar && OptionValues->CheckRefutation) {
        if (OptionValues->NoExpensiveChecks) {
            QPRINTF((*OptionValues),2)(
"WARNING: Suppressed check of well formed proofs by contradiction\n");
        } else if (WellFormedProofsByContradiction(*OptionValues,Head,Signature,
&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((*OptionValues),2)(
"SUCCESS: Derivation has well formed proofs by contradiction\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Check that explicit splits are independent
    if (!GlobalInterrupted && OKSoFar) {
        if (OptionValues->NoExpensiveChecks) {
            QPRINTF((*OptionValues),2)(
"WARNING: Suppressed expensive check of explicit splits\n");
        } else if (ExplicitSplitsIndependent(*OptionValues,Head,Signature,RootListHead,
&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((*OptionValues),2)(
"SUCCESS: All explicit splits are independent and refuted\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

    FreeRootList(&RootListHead,1,Signature);

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
void GetSplitDefinitionNames(OptionsType OptionValues,LISTNODE Head,
ANNOTATEDFORMULA AnnotatedFormula,String SplitDefinitionNames) {

    String UsefulInfo;
    int NumberOfSiblings;
    StringParts SiblingNames;
    int SiblingNumber;
    String SiblingInfo;

    strcpy(SplitDefinitionNames,"");
//----Get the list of split offspring
    if (GetUsefulInfoTerm(AnnotatedFormula,"psuedo_split_to",1,UsefulInfo) == 
NULL) {
        CodingError("Missing psuedo_split_to term");
    }
    ExtractTermArguments(UsefulInfo);
    NumberOfSiblings = Tokenize(UsefulInfo,SiblingNames,",");
//----For each offspring, if it has an esplit defn, get the name
    for (SiblingNumber = 0;SiblingNumber < NumberOfSiblings;SiblingNumber++) {
        if (GetUsefulInfoTerm(GetAnnotatedFormulaFromListByName(Head,
SiblingNames[SiblingNumber]),"esplit_defn",1,SiblingInfo) != NULL) {
            ExtractTermArguments(SiblingInfo);
            strcat(SplitDefinitionNames,SiblingInfo);
            strcat(SplitDefinitionNames,"\n");
        }
    }
}
//-------------------------------------------------------------------------------------------------
LISTNODE GetListOfLeaves(OptionsType OptionValues,LISTNODE Head) {

    LISTNODE Leaves;
    LISTNODE * AddHere;

    Leaves = NULL;
    AddHere = &Leaves;
    while (Head != NULL) {
        if (!DerivedAnnotatedFormula(Head->AnnotatedFormula)) {
            AddListNode(AddHere,NULL,Head->AnnotatedFormula);
            AddHere = &((*AddHere)->Next);
        }
        Head = Head->Next;
    }
    return(Leaves);
}
//-------------------------------------------------------------------------------------------------
void AddTypeFormulae(LISTNODE Head,LISTNODE * ParentList, ANNOTATEDFORMULA Target) {

    String SyntaxTypes;
    SyntaxType TargetSyntax;
    LISTNODE * AddAfter;

    GetListSyntaxTypes(*ParentList,SyntaxTypes);
    TargetSyntax = GetSyntax(Target);
    if (strstr(SyntaxTypes,"thf") != NULL || strstr(SyntaxTypes,"tff") != NULL || 
TargetSyntax == tptp_thf || TargetSyntax == tptp_tff) {
        AddAfter = ParentList;
        while (Head != NULL) {
            if (GetRole(Head->AnnotatedFormula,NULL) == type) {
                AddListNode(AddAfter,*AddAfter,Head->AnnotatedFormula);
                AddAfter = &((*AddAfter)->Next);
            }
            Head = Head->Next;
        }
    }
}
//-------------------------------------------------------------------------------------------------
int UserSemanticsVerification(OptionsType OptionValues,SIGNATURE Signature,LISTNODE Head) {

    LISTNODE Leaves;
    LISTNODE LeafAxioms;
    LISTNODE Types;
    int OKSoFar;
    int Satisfiable;

    OKSoFar = 1;

//----Check axioms are satisfiable, or at least not unsatisfiable
    Leaves = GetListOfLeaves(OptionValues,Head);
    LeafAxioms = GetListOfAnnotatedFormulaeWithRole(Leaves,axiom_like,Signature);
    Types = GetListOfAnnotatedFormulaeWithRole(Leaves,type,Signature);
    LeafAxioms = AppendListsOfAnnotatedTSTPNodes(Types,LeafAxioms);
    if (LeafAxioms != NULL) {
        Satisfiable = GDVCheckSatisfiable(OptionValues,LeafAxioms,"axioms","sat",1);
        if (OptionValues.TimeLimit == 0) {
            QPRINTF(OptionValues,2)(
"HAVE I CREATED: Obligation to show axiom(_like) leaves are satisfiable\n");
        } else {
            if (Satisfiable) {
                QPRINTF(OptionValues,2)("SUCCESS: Leaf axiom(_like) formulae are satisfiable\n");
            } else if (Satisfiable == 0) {
                QPRINTF(OptionValues,2)(
"WARNING: Failed to find model of leaf axiom(_like) formulae\n");
            } else {
                QPRINTF(OptionValues,2)("WARNING: Leaf axiom(_like) formulae are unsatisfiable\n");
            }
        }
    }
    FreeListOfAnnotatedFormulae(&LeafAxioms,Signature);
    FreeListOfAnnotatedFormulae(&Leaves,Signature);

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int ESplitVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
int * NumberOfSplits) {

    LISTNODE Target;
    int OKSoFar;
    String UsefulInfo;
    int UserCheckParentRelevance;
    String FormulaName;
    String FileName;
    int NumberOfParents;
    StringParts ParentNames;
    char * ListParentNames;
    LISTNODE ParentAnnotatedFormulae;
    String SplitDefinitionNames;
    ANNOTATEDFORMULA SplitParent;

    OKSoFar = 1;
    *NumberOfSplits = 0;
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
        GetName(Target->AnnotatedFormula,FormulaName);
        CleanTheFileName(FormulaName,FileName);
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);

//----esplit parent to be inferred from its children, with relevance check
        if (GetUsefulInfoTerm(Target->AnnotatedFormula,"psuedo_split_to",1,UsefulInfo) != NULL) {
            UserCheckParentRelevance = OptionValues.CheckParentRelevance;
            OptionValues.CheckParentRelevance = 1;
//----Get the split children's names
            ExtractTermArguments(UsefulInfo);
            NumberOfParents = Tokenize(UsefulInfo,ParentNames,",");
            ListParentNames = MakePrintableList(ParentNames,NumberOfParents,NULL);
//----Make list of split children
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,Signature);
            if (!CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,FormulaName,
ParentAnnotatedFormulae,ListParentNames,"thm",FileName,-1,"")) {
                OKSoFar = 0;
            } 
            Free((void **)&ListParentNames);
//----Free the parents list
            FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
            OptionValues.CheckParentRelevance = UserCheckParentRelevance;
            (*NumberOfSplits)++;
        }

//----esplit child, to be inferred from the parent and the definitions
//----This is done only if esplit definition were not expected, and therefore
//----created by GDV and the right tags inserted to make all this possible.
//----Hopefully in the future this will be unused.
        if (GetUsefulInfoTerm(Target->AnnotatedFormula,"psuedo_split_from",1,UsefulInfo) != NULL) {
//----Get the split parent's name
            ExtractTermArguments(UsefulInfo);
//----Get the split definitions
            if ((SplitParent = GetAnnotatedFormulaFromListByName(Head,UsefulInfo)) == NULL) {
                CodingError("Missing split parent");
            } 
            GetSplitDefinitionNames(OptionValues,Head,SplitParent,SplitDefinitionNames);
            strcat(UsefulInfo,"\n");
            strcat(UsefulInfo,SplitDefinitionNames);
            NumberOfParents = Tokenize(UsefulInfo,ParentNames,"\n");
            ListParentNames = MakePrintableList(ParentNames,NumberOfParents,NULL);
//----Make list of split children
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,
Signature);
            if (!CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,FormulaName,
ParentAnnotatedFormulae,ListParentNames,"thm",FileName,-1,"")) {
                OKSoFar = 0;
            } else {
                AddVerifiedTag(Target->AnnotatedFormula,Signature,"psuedo_split");
            }
            Free((void **)&ListParentNames);
//----Free the parents list
            FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
            (*NumberOfSplits)++;
        }

        Target = Target->Next;
    }
    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int SRSplitVerification(OptionsType OptionValues,LISTNODE Head,
SIGNATURE Signature,int * NumberOfSplits) {

    LISTNODE Target;
    int OKSoFar;
    String UsefulInfo;
    int UserCheckParentRelevance;
    String FormulaName;
    String FileName;
    int NumberOfParents;
    StringParts ParentNames;
    char * ListParentNames;
    LISTNODE ParentAnnotatedFormulae;
    LISTNODE Parent;
    int OccurenceNumber;

    OKSoFar = 1;
    *NumberOfSplits = 0;
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) &&
Target != NULL) {
        GetName(Target->AnnotatedFormula,FormulaName);
        CleanTheFileName(FormulaName,FileName);
        strcat(FileName,".split");
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);

//----split parent negation to be inferred from its negated children, 
//----with relevance check
        OccurenceNumber = 1;
        while (GetUsefulInfoTerm(Target->AnnotatedFormula,"explicit_split_to",
OccurenceNumber,UsefulInfo) != NULL) {
            OccurenceNumber++;
            UserCheckParentRelevance = OptionValues.CheckParentRelevance;
            OptionValues.CheckParentRelevance = 1;
//----Get the split children's names
            ExtractTermArguments(UsefulInfo);
            NumberOfParents = Tokenize(UsefulInfo,ParentNames,",");
            ListParentNames = MakePrintableList(ParentNames,NumberOfParents,
NULL);
//----Make list of split children
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,Signature);
            NegateListOfAnnotatedTSTPNodes(ParentAnnotatedFormulae,0);
            Negate(Target->AnnotatedFormula,0);
//----Sneakily add all the type formulae for THF and TFF
            AddTypeFormulae(Head,&ParentAnnotatedFormulae,Target->AnnotatedFormula);
            if (!CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,FormulaName,
ParentAnnotatedFormulae,ListParentNames,"thm",FileName,-1,"(Negated formulae for split)")) {
                OKSoFar = 0;
            } else {
                QPRINTF(OptionValues,2)(
"WARNING: Incomplete check of split from %s to %s\n",FormulaName,ListParentNames);
                Parent = ParentAnnotatedFormulae;
                while (Parent != NULL) {
                    AddVerifiedTag(Parent->AnnotatedFormula,Signature,"explicit_split");
                    Parent = Parent->Next;
                }
            }
//----Sneakily remove all the type formulae for THF and TFF
            RemoveAnnotatedFormulaWithRole(&ParentAnnotatedFormulae,Signature,type);
            Negate(Target->AnnotatedFormula,1);
            NegateListOfAnnotatedTSTPNodes(ParentAnnotatedFormulae,1);
            Free((void **)&ListParentNames);
//----Free the parents list
            FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
            OptionValues.CheckParentRelevance = UserCheckParentRelevance;
            (*NumberOfSplits)++;
        }
        Target = Target->Next;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int JoinVerification(OptionsType OptionValues,LISTNODE Head,
SIGNATURE Signature,int * NumberOfJoins) {

    LISTNODE Target;
    int OKSoFar;
    TERM JoinRecord;
    char * AllParentNames;
    int NumberOfParents;
    StringParts ParentNames;
    LISTNODE ParentAnnotatedFormulae;
    LISTNODE Parent;
    LISTNODE ThisParentList;
    String FormulaName;
    String FileName;
    String ThisFileName;
    int ThisParentIndex;

    OKSoFar = 1;
    *NumberOfJoins = 0;
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
        GetName(Target->AnnotatedFormula,FormulaName);
        CleanTheFileName(FormulaName,FileName);
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);

        if ((JoinRecord = GetInferenceInfoTERM(Target->AnnotatedFormula,"__inference_rule__")) != 
NULL && GetArity(JoinRecord) == 2 && !strcmp(GetSymbol(JoinRecord->Arguments[0]),"join")) {
//----Get the parents' in various ways
            AllParentNames = GetNodeParentNames(Target->AnnotatedFormula,NULL);
            NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,Signature);
            Parent = ParentAnnotatedFormulae;
            ThisParentIndex = 0;
            while (!GlobalInterrupted && (OKSoFar || 
OptionValues.ForceContinue) && Parent != NULL) {
                ThisParentList = NewListNode(Parent->AnnotatedFormula);
//----Sneakily add all the type formulae for THF and TFF
                AddTypeFormulae(Head,&ThisParentList,Target->AnnotatedFormula);
                strcpy(ThisFileName,FileName);
                strcat(ThisFileName,".");
                strcat(ThisFileName,ParentNames[ThisParentIndex]);
                if (!CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,FormulaName,
ThisParentList,ParentNames[ThisParentIndex],"thm",ThisFileName,-1,"")) {
                    OKSoFar = 0;
                } else {
                    (*NumberOfJoins)++;
                }
                FreeListOfAnnotatedFormulae(&ThisParentList,Signature);
                ThisParentIndex++;
                Parent = Parent->Next;
            }
//----Free the parents list
            Free((void **)&AllParentNames);
            FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
            if (OKSoFar) {
                AddVerifiedTag(Target->AnnotatedFormula,Signature,"thm");
            }
        }
        Target = Target->Next;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int ProofByContradictionVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
int * NumberOfContradictions) {

    LISTNODE Target;
    int OKSoFar;
    String UsefulInfo;
    String FormulaName;
    String FileName;
    int NumberOfParents;
    StringParts ParentNames;
    LISTNODE ParentAnnotatedFormulae;

    OKSoFar = 1;
    *NumberOfContradictions = 0;
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
        GetName(Target->AnnotatedFormula,FormulaName);
        CleanTheFileName(FormulaName,FileName);
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);

//----Proofs by contradiction
        if (GetUsefulInfoTerm(Target->AnnotatedFormula,"proved_by_contradiction",1,UsefulInfo) != 
NULL) {
//----Get the parent's name
            ExtractTermArguments(UsefulInfo);
            NumberOfParents = 1;
            ParentNames[0] = UsefulInfo;
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,
Signature);
            NegateListOfAnnotatedTSTPNodes(ParentAnnotatedFormulae,0);
            if (!CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,FormulaName,
ParentAnnotatedFormulae,UsefulInfo,"thm",FileName,-1,"(Negated parent for PbC)")) {
                OKSoFar = 0;
            } else {
                AddVerifiedTag(Target->AnnotatedFormula,Signature,"proved_by_contradiction");
            }
            NegateListOfAnnotatedTSTPNodes(ParentAnnotatedFormulae,1);
//----Free the parents list
            FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
            (*NumberOfContradictions)++;
        }
        Target = Target->Next;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int VerifyDischarge(OptionsType OptionValues,SIGNATURE Signature,LISTNODE Head,
ANNOTATEDFORMULA InferredFormula,StringParts DischargedNames,int NumberOfDischargedNames) {

    char * AllParentNames;
    char * ListParentNames;
    StringParts ParentNames;
    int NumberOfParents;
    int ParentIndex;
    int ShiftIndex;
    int AssumptionIndex;
    int OKSoFar;
    String InferredName;
    String AssumptionName;
    String DischargeFileName;
    ANNOTATEDFORMULA Assumption;
    LISTNODE AssumptionList;
    LISTNODE ParentAnnotatedFormulae;

//----Preparation for the later non-assumption check, need to extract 
//----non-assumption parents
    AllParentNames = GetNodeParentNames(InferredFormula,NULL);
    NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");

//----Inferred must be LC of each negated assumption
    GetName(InferredFormula,InferredName);
    AssumptionIndex = 0;
    OKSoFar = 1;
    while (!GlobalInterrupted && OKSoFar && AssumptionIndex < NumberOfDischargedNames) {
        strcpy(AssumptionName,DischargedNames[AssumptionIndex]);
        if ((Assumption = GetAnnotatedFormulaFromListByName(Head, AssumptionName)) == NULL) {
            QPRINTF(OptionValues,2)("FAILURE: Missing assumption %s\n",AssumptionName);
            OKSoFar = 0;
        }
//----Remove assumption from parents list
        ParentIndex = 0;
        while (ParentIndex < NumberOfParents) {
            if (!strcmp(ParentNames[ParentIndex],AssumptionName)) {
                for (ShiftIndex=ParentIndex;ShiftIndex < NumberOfParents-1;ShiftIndex++) {
                    ParentNames[ShiftIndex] = ParentNames[ShiftIndex+1];
                }
                NumberOfParents--;
                ParentIndex = NumberOfParents+1;
            } else {
                ParentIndex++;
            }
        }
        if (ParentIndex == NumberOfParents) {
            QPRINTF(OptionValues,2)(
"FAILURE: Discharged assumption %s not a parent\n",AssumptionName);
            OKSoFar = 0;
        }

//----Do the semantic discharge
        AssumptionList = NULL;
        Negate(Assumption,0);
        AddListNode(&AssumptionList,NULL,Assumption);
        CleanTheFileName(AssumptionName,DischargeFileName);
        strcat(DischargeFileName,"_discharge");
        strcat(AssumptionName,"_negated");
        if (!CorrectlyInferred(OptionValues,Signature,InferredFormula,InferredName,AssumptionList,
AssumptionName,"thm",DischargeFileName,-1,"")) {
            OKSoFar = 0;
        }
        FreeListOfAnnotatedFormulae(&AssumptionList,Signature);
        Negate(Assumption,1);
        AssumptionIndex++;
    }

//----Inferred must be LC of non-assumption parents
    GetName(InferredFormula,InferredName);
    CleanTheFileName(InferredName,InferredName);
    if (!GlobalInterrupted && OKSoFar) {
        ListParentNames = MakePrintableList(ParentNames,NumberOfParents,NULL);
        GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,Signature);
        if (!CorrectlyInferred(OptionValues,Signature,InferredFormula,InferredName,
ParentAnnotatedFormulae,ListParentNames,"thm",InferredName,-1,"")) {
            OKSoFar = 0;
        }
        FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
        Free((void **)&ListParentNames);
    }
//----Free the parents lists
    Free((void **)&AllParentNames);

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int DischargeVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
int * NumberOfDischarges) {

    LISTNODE Target;
    int OKSoFar;
    char * AllDischargedNames;
    TERM DischargeList;
    StringParts DischargedNames;
    int NumberOfDischargedNames;
    TERM TopLevelDischargeInfoTerm;
    String FormulaName;
    String SZSStatus;

    OKSoFar = 1;
    *NumberOfDischarges = 0;
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
        GetName(Target->AnnotatedFormula,FormulaName);
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);

//----Get all the discharged names - if some then discharge has been done
        if ((AllDischargedNames = GetDischargedNames(Target->AnnotatedFormula,&DischargeList)) != 
NULL) {
            NumberOfDischargedNames = Tokenize(AllDischargedNames,DischargedNames,",");

//----Get SZS status
            if (GetInferenceStatus(Target->AnnotatedFormula,SZSStatus) == NULL) {
                QPRINTF(OptionValues,1)(
"WARNING: Cannot get SZS status for %s, assuming thm\n",FormulaName);
                strcpy(SZSStatus,"thm");
            } 
//----SZS status must be thm
            if (strcmp(SZSStatus,"thm")) {
                QPRINTF(OptionValues,2)(
"FAILURE: Discharge inference with non-thm status in %s\n",FormulaName);
                OKSoFar = 0;
//----Check that discharges are all at top level. Temporary until I can deal 
//----with nested ones
            } else if ((TopLevelDischargeInfoTerm = GetInferenceInfoTERM(
Target->AnnotatedFormula,"__inference_rule__")) == NULL ||
GetArity(TopLevelDischargeInfoTerm) != 2 ||
strcmp(GetSymbol(TopLevelDischargeInfoTerm->Arguments[0]),"discharge") ||
GetArity(TopLevelDischargeInfoTerm->Arguments[1]) != NumberOfDischargedNames) {
                QPRINTF(OptionValues,2)(
"FAILURE: Non-top level discharge in %s\n",FormulaName);
                OKSoFar = 0;
            } else if (!VerifyDischarge(OptionValues,Signature,Head,Target->AnnotatedFormula,
DischargedNames,NumberOfDischargedNames)) {
                OKSoFar = 0;
            } else {
                AddVerifiedTag(Target->AnnotatedFormula,Signature,"discharge");
            }   
            Free((void **)&AllDischargedNames);
            (*NumberOfDischarges)++;
        }
        Target = Target->Next;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
//----Incomplete check. Complex parent to be inferred from definition and
//----inferred
int EApplyDefVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
int * NumberOfApplys) {

    int OKSoFar;
    LISTNODE Target;
    TERM InferenceRule;
    String FormulaName;
    LISTNODE Parents;
    LISTNODE ComplexConjecture;
    String ComplexName;
    String ApplyDefFileName;
    char * ParentsNames;

    OKSoFar = 1;
    *NumberOfApplys = 0;
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
        if ((InferenceRule = GetInferenceRuleTERM(Target->AnnotatedFormula)) 
!= NULL && !strcmp(GetSymbol(InferenceRule),"apply_def")) {
            GetName(Target->AnnotatedFormula,FormulaName);
//DEBUG printf("doing apply_def for %s\n",FormulaName);
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);
            if (!GetNodeParentList(Target->AnnotatedFormula,Head,&Parents,Signature) || 
Parents == NULL) {
                QPRINTF(OptionValues,2)(
"FAILURE: Ill-formed apply_def in %s\n",FormulaName);
                return(0);
            }
//----Assume the complex one is first, and is the conjecture
//DEBUG printf("The raw parents are ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Parents,tptp,1);
            ComplexConjecture = NULL;
            AddListNode(&ComplexConjecture,NULL,Parents->AnnotatedFormula);
            FreeAListNode(&Parents,Signature);
//DEBUG printf("Complex conjecture ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,ComplexConjecture,tptp,1);
//DEBUG printf("Parents without complex ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Parents,tptp,1);
//----Add inferred to parents
            AddListNode(&Parents,Parents,Target->AnnotatedFormula);
//DEBUG printf("Parents with simple added ...\n");
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,Parents,tptp,1);
//----Check it can be proved
            CleanTheFileName(FormulaName,ApplyDefFileName);
            strcat(ApplyDefFileName,"_apply_def");
            ParentsNames = MakePrintableListFromList(Parents,NULL);
            if (CorrectlyInferred(OptionValues,Signature,ComplexConjecture->
AnnotatedFormula,GetName(ComplexConjecture->AnnotatedFormula,ComplexName),Parents,ParentsNames,
"thm",ApplyDefFileName,-1,"(defn & inferred |= original)")) {
                QPRINTF(OptionValues,2)("WARNING: Incomplete check of apply_def\n");
                AddVerifiedTag(Target->AnnotatedFormula,Signature,"apply_def");
                (*NumberOfApplys)++;
            } else {
                OKSoFar = 0;
                QPRINTF(OptionValues,2)("FAILURE: Cannot discharge apply_def in %s\n",FormulaName);
            }
            Free((void **)&ParentsNames);
            FreeListOfAnnotatedFormulae(&Parents,Signature);
            FreeListOfAnnotatedFormulae(&ComplexConjecture,Signature);
        }
        Target = Target->Next;
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
int RuleSpecificVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature) {

    int OKSoFar;
    int NumberOfInstances;

    OKSoFar = 1;

//----E's apply_defs
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        if (EApplyDefVerification(OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((OptionValues),2)("SUCCESS: E apply_defs verified\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Esplits
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        if (ESplitVerification(OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((OptionValues),2)("SUCCESS: E splits are verified\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----SR splits
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        if (SRSplitVerification(OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((OptionValues),2)("SUCCESS: SR splits are verified\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Joins
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        if (JoinVerification(OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((OptionValues),2)("SUCCESS: Split joins are verified\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Proofs by contradiction
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        if (ProofByContradictionVerification(OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((OptionValues),2)("SUCCESS: Proof by contradiction is verified\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

//----Discharge of assumptions
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        if (DischargeVerification(OptionValues,Head,Signature,&NumberOfInstances)) {
//----Report only if there are some
            if (NumberOfInstances > 0) {
                QPRINTF((OptionValues),2)("SUCCESS: Discharge of assumptions verified\n");
            }
        } else {
            OKSoFar = 0;
        }
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
void SplitIntoSatisfiableLists(OptionsType OptionValues, LISTNODE Head,SIGNATURE Signature,
LISTNODE * PositiveHead,LISTNODE * NegativeHead,LISTNODE * NeitherHead) {

    int PositiveOrNegative;
    int TypeFormula;
    LISTNODE * AddPositiveHere;
    LISTNODE * AddNegativeHere;
    LISTNODE * AddNeitherHere;

    *PositiveHead = NULL;
    *NegativeHead = NULL;
    *NeitherHead = NULL;
    AddPositiveHere = PositiveHead;
    AddNegativeHere = NegativeHead;
    AddNeitherHere = NeitherHead;
    while (Head != NULL) {
        PositiveOrNegative = 0;
        TypeFormula = CheckRole(GetRole(Head->AnnotatedFormula,NULL),type);
        if (TypeFormula || AnnotatedFormulaTrueInInterpretation(Head->AnnotatedFormula,positive)) {
            AddListNode(AddPositiveHere,NULL,Head->AnnotatedFormula);
            AddPositiveHere = &((*AddPositiveHere)->Next);
            PositiveOrNegative = 1;
        }
        if (TypeFormula || AnnotatedFormulaTrueInInterpretation(Head->AnnotatedFormula,negative)) {
            AddListNode(AddNegativeHere,NULL,Head->AnnotatedFormula);
            AddNegativeHere = &((*AddNegativeHere)->Next);
            PositiveOrNegative = 1;
        }
        if (TypeFormula || !PositiveOrNegative) {
            AddListNode(AddNeitherHere,NULL,Head->AnnotatedFormula);
            AddNeitherHere = &((*AddNeitherHere)->Next);
        }
        Head = Head->Next;
    }

//----Check if any left over
    if (*NeitherHead == NULL) {
        QPRINTF(OptionValues,2)("WOOHOOO: All problem formulae are positive or negative\n");
    } else if (GDVCheckSatisfiable(OptionValues,*NeitherHead,"neither","sat",0) == 1) {
        QPRINTF(OptionValues,2)("WOOHOOO: All problem formulae are in a satisfiable set\n");
    } else {
        QPRINTF(OptionValues,2)("WARNING: Some problem formulae are not in a satisfiable set\n");
//----Free the neither list (making the head NULL) if no use
        FreeListOfAnnotatedFormulae(NeitherHead,Signature);
    }
}
//-------------------------------------------------------------------------------------------------
int LeafVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature) {

    LISTNODE ProblemHead;
    LISTNODE SatisfiableHead;
    LISTNODE PositiveHead;
    LISTNODE NegativeHead;
    LISTNODE NeitherHead;
    LISTNODE Target;
    LISTNODE Types;
    LISTNODE * TypesNext;
    String FormulaName;
    String FileBaseName;
    TERM SourceTerm;
    char * IntroducedType;
    LISTNODE ProblemTarget;
    String ProblemTargetName;
    int OKSoFar;
    int ThisOneOK;
    char * SymbolDefined;
    String ConjectureName;
    LISTNODE ConjectureFromProblem;
    ANNOTATEDFORMULA ProblemFormula;

//----Mark all type formulae as checked (although no check is made yet)
    Target = Head;
    OKSoFar = 1;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
//----If not derived and a type and not verified
        if (!DerivedAnnotatedFormula(Target->AnnotatedFormula) &&
CheckRole(GetRole(Target->AnnotatedFormula,NULL),type) &&
GetUsefulInfoTERM(Target->AnnotatedFormula,"verified",1) == NULL) {
            AddVerifiedTag(Target->AnnotatedFormula,Signature,"type");
        }
        Target = Target->Next;
    }

//----Check introduced leaves next
    Target = Head;
    OKSoFar = 1;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
//----If not derived and not verified
        if (!DerivedAnnotatedFormula(Target->AnnotatedFormula) &&
GetUsefulInfoTERM(Target->AnnotatedFormula,"verified",1) == NULL) {
            GetName(Target->AnnotatedFormula,FormulaName);
//DEBUG printf("Starting leaf named %s\n",FormulaName);

//----Verify introduced leaves by their type.
            if ((SourceTerm = GetSourceTERM(Target->AnnotatedFormula,NULL)) != NULL && 
!strcmp(GetSymbol(SourceTerm),"introduced") && GetArity(SourceTerm) > 0) {
//DEBUG printf("Checking introduced leaf %s\n",FormulaName);
                IntroducedType = GetSymbol(SourceTerm->Arguments[0]);
                if (!strcmp(IntroducedType,"definition")) {
//DEBUG printf("Checking definition %s\n",FormulaName);
                    if (IsSpecifiedDefinition(OptionValues,Target->
AnnotatedFormula,&SymbolDefined) || IsPredicateDefinition(OptionValues,
Target->AnnotatedFormula,&SymbolDefined)) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: %s is an introduced definition of %s\n",FormulaName,SymbolDefined);
                    } else {
                        QPRINTF(OptionValues,2)(
"FAILURE: %s is a faulty definition\n",FormulaName);
                        OKSoFar = 0;
                    }
                } else if (!strcmp(IntroducedType,"axiom_of_choice")) {
                    QPRINTF(OptionValues,2)(
"SUCCESS: %s is an introduced axiom of choice\n",FormulaName);
                } else if (!strcmp(IntroducedType,"assumption")) {
                    QPRINTF(OptionValues,2)(
"SUCCESS: %s is an introduced assumption\n",FormulaName);
                } else if (!strcmp(IntroducedType,"tautology")) {
                    CleanTheFileName(FormulaName,FileBaseName);
                    strcat(FileBaseName,"_is_tautology");
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,NULL,NULL,"thm",FileBaseName,-1,"")) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: %s is an introduced tautology\n",FormulaName);
                    } else {
                        OKSoFar = 0;
                    }
                } else {
                    QPRINTF(OptionValues,2)(
"FAILURE: %s is an ill-formed %s\n",FormulaName,IntroducedType);
                    OKSoFar = 0;
                }
                if (OKSoFar) {
                    AddVerifiedTag(Target->AnnotatedFormula,Signature,"leaf");
                } 
            }
        }
        Target = Target->Next;
    }

//----If introduced failed then abort
    if (!OKSoFar) {
        return(OKSoFar);
    }

//----Get the problem file into memory
    if (!strcmp(OptionValues.ProblemFileName,"")) {
        QPRINTF(OptionValues,2)("WARNING: No problem file, leaf verification might fail\n");
        ProblemHead = NULL;
    } else if ((ProblemHead = ParseFileOfFormulae(OptionValues.ProblemFileName,NULL,Signature,1,
NULL)) == NULL) {
        QPRINTF(OptionValues,1)(
"ERROR: Could not parse problem file %s\n",OptionValues.ProblemFileName);
        QPRINTF(OptionValues,2)("FAILURE: Leaf nodes unverified\n");
        return(0);
    }

    if (OptionValues.Quietness == 0) {
        printf("Problem file contents:\n");
        PrintListOfAnnotatedTSTPNodes(stdout,Signature,ProblemHead,tptp,1);
    }
//----Convert CNF problem into FOF for semantic checking
    FOFifyList(ProblemHead,universal);
    if (OptionValues.Quietness == 0) {
        printf("Problem file contents as FOF:\n");
        PrintListOfAnnotatedTSTPNodes(stdout,Signature,ProblemHead,tptp,1);
    }
//----Get a list of all the type formulae
    Types = GetListOfAnnotatedFormulaeWithRole(ProblemHead,type,Signature);
    TypesNext = &Types;
    while (*TypesNext != NULL) {
        TypesNext = &((*TypesNext)->Next);
    }
//----Extract the conjecture if there is one
    ConjectureFromProblem = SelectListOfAnnotatedFormulaeWithRole(&ProblemHead,conjecture,1,
Signature);

//----Check if the entire input (sans conjecture) is satisfiable
    if (GDVCheckSatisfiable(OptionValues,ProblemHead,"problem","sat",0) == 1) {
        QPRINTF(OptionValues,2)("SUCCESS: Input problem (without conjecture) is satisfiable\n");
        SatisfiableHead = ProblemHead;
        PositiveHead = NULL;
        NegativeHead = NULL;
        NeitherHead = NULL;
    } else {
        SatisfiableHead = NULL;
//----Split problem into satisfiable lists
        SplitIntoSatisfiableLists(OptionValues,ProblemHead,Signature,&PositiveHead,&NegativeHead,
&NeitherHead);
    }

//----For each derivation leaf node, check if the same as a problem node, or
//----can be inferred from one of the satisfiable lists
    Target = Head;
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && Target != NULL) {
//DEBUG printf("Try to verify the node (might not be a leaf) %s\n",GetName(Target->AnnotatedFormula,NULL));
//----If not derived and not verified
        if (!DerivedAnnotatedFormula(Target->AnnotatedFormula) &&
GetUsefulInfoTERM(Target->AnnotatedFormula,"verified",1) == NULL) {
            ThisOneOK = 0;
            GetName(Target->AnnotatedFormula,FormulaName);
//DEBUG printf("Starting leaf named %s\n",FormulaName);

//----Don't verify definitions inserted by GDV
            if ((SourceTerm = GetSourceTERM(Target->AnnotatedFormula,NULL)) != NULL && 
!strcmp(GetSymbol(SourceTerm),"creator") && GetArity(SourceTerm) > 0 && 
!strcmp(GetSymbol(SourceTerm->Arguments[0]),"gdv")) {
                QPRINTF(OptionValues,1)(
"WARNING: GDV leaf %s was created by GDV, and not verified\n",FormulaName);
                ThisOneOK = 1;

//----Verify conjecture separately, in reverse
            } else if (GetRole(Target->AnnotatedFormula,NULL) == conjecture) {
                if (ConjectureFromProblem != NULL) {
                    GetName(ConjectureFromProblem->AnnotatedFormula,ConjectureName);
//----Copy of conjecture
                    if (!OptionValues.GenerateObligations &&
SameFormulaInAnnotatedFormulae(Target->AnnotatedFormula,ConjectureFromProblem->AnnotatedFormula,
1,1)) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: Conjecture leaf %s is a copy of %s (from the problem)\n",FormulaName,ConjectureName);
                        ThisOneOK = 1;
//----Can infer conjecture
                    } else {
                        if (!OptionValues.GenerateObligations) {
                            QPRINTF(OptionValues,2)(
"WARNING: Conjecture leaf %s is not a copy of %s (from the problem)\n",FormulaName,ConjectureName);
                        }
                        AddListNode(TypesNext,NULL,Target->AnnotatedFormula);
                        CleanTheFileName(FormulaName,FileBaseName);
                        strcat(FileBaseName,"_to_conjecture");
//----Check if ConjectureFromProblem->AnnotatedFormula is a theorem of Types (which has the
//----Target->AnnotatedFormula tagged on the end - sneaky hey?)
                        if (CorrectlyInferred(OptionValues,Signature,
ConjectureFromProblem->AnnotatedFormula,ConjectureName,Types,FormulaName,"thm",FileBaseName,-1,
"")) {
                            ThisOneOK = 1;
                        }
                        FreeAListNode(TypesNext,Signature);
                    }
                } else {
                    QPRINTF(OptionValues,2)("FAILURE: No problem conjecture for %s\n",FormulaName);
                }

//----Regular axiom leaves
            } else {
//----Look for an original that has been copied
                ProblemTarget = ProblemHead;
                while (!OptionValues.GenerateObligations && !ThisOneOK && ProblemTarget != NULL) {
                    if (SameFormulaInAnnotatedFormulae(Target->AnnotatedFormula,
ProblemTarget->AnnotatedFormula,1,1)) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: Non-conjecture leaf %s is a copy of %s (from the problem)\n",FormulaName,
GetName(ProblemTarget->AnnotatedFormula,ProblemTargetName));
                        ThisOneOK = 1;
                    } 
                    ProblemTarget = ProblemTarget->Next;
                }
                if (!ThisOneOK) {
                    if (!OptionValues.GenerateObligations) {
                        QPRINTF(OptionValues,2)(
"WARNING: Non-conjecture leaf %s is not a copy of any problem formula\n",FormulaName);
                    }
                }

//----If not a copy, try some inferencing
//----HEY WHY DID I TURN THIS OFF?
                OptionValues.CheckParentRelevance = 0;
//----Try find a formula in the problem with the same name
                if (!ThisOneOK && (ProblemFormula = 
GetAnnotatedFormulaFromListByName(ProblemHead,FormulaName)) != NULL) {
                    AddListNode(TypesNext,NULL,ProblemFormula);
                    CleanTheFileName(FormulaName,FileBaseName);
                    strcat(FileBaseName,"_from_same_named");
//----Check if ConjectureFromProblem->AnnotatedFormula is a theorem of Types (which has the
//----Target->AnnotatedFormula tagged on the end - sneaky hey?)
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,Types,FormulaName,"thm",FileBaseName,-1,"(from the problem)")) {
                        ThisOneOK = 1;
                    } else {
                        QPRINTF(OptionValues,2)(
"WARNING: Non-conjecture leaf %s is not thm of the same named problem formula\n",FormulaName);
                    }
                    FreeAListNode(TypesNext,Signature);
                }
//----Use subsets of problem, prepended by types
                if (!ThisOneOK && SatisfiableHead != NULL) {
                    *TypesNext = SatisfiableHead;
                    CleanTheFileName(FormulaName,FileBaseName);
                    strcat(FileBaseName,"_from_problem");
//----Check if ConjectureFromProblem->AnnotatedFormula is a theorem of Types (which has the
//----Target->AnnotatedFormula tagged on the end - sneaky hey?)
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,Types,"the problem axioms","thm",FileBaseName,-1,"")) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: Non-conjecture leaf %s is a thm of all the input formulae\n",FormulaName);
                        ThisOneOK = 1;
                    }
                    *TypesNext = NULL;
                }
                if (!ThisOneOK && PositiveHead != NULL) {
                    *TypesNext = PositiveHead;
                    CleanTheFileName(FormulaName,FileBaseName);
                    strcat(FileBaseName,"_from_positive");
//----Check if ConjectureFromProblem->AnnotatedFormula is a theorem of Types (which has the
//----Target->AnnotatedFormula tagged on the end - sneaky hey?)
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,Types,"the positive axioms","thm",FileBaseName,-1,"")) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: Non-conjecture leaf %s is a thm of the positive input formulae\n",FormulaName);
                        ThisOneOK = 1;
                    }
                    *TypesNext = NULL;
                }
                if (!ThisOneOK && NegativeHead != NULL) {
                    *TypesNext = NegativeHead;
                    CleanTheFileName(FormulaName,FileBaseName);
                    strcat(FileBaseName,"_from_negative");
//----Check if ConjectureFromProblem->AnnotatedFormula is a theorem of Types (which has the
//----Target->AnnotatedFormula tagged on the end - sneaky hey?)
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,Types,"the negative axioms","thm",FileBaseName,-1,"")) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: Non-conjecture leaf %s is a thm of the negative input formulae\n",FormulaName);
                        ThisOneOK = 1;
                    }
                    *TypesNext = NULL;
                }
                if (!ThisOneOK && NeitherHead != NULL) {
                    *TypesNext = NeitherHead;
                    CleanTheFileName(FormulaName,FileBaseName);
                    strcat(FileBaseName,"_from_neither");
//----Check if ConjectureFromProblem->AnnotatedFormula is a theorem of Types (which has the
//----Target->AnnotatedFormula tagged on the end - sneaky hey?)
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,Types,"the other axioms","thm",FileBaseName,-1,"")) {
                        QPRINTF(OptionValues,2)(
"SUCCESS: Non-conjecture leaf %s is a thm of the neither input formulae\n",FormulaName);
                        ThisOneOK = 1;
                    }
                    *TypesNext = NULL;
                }
                if (!ThisOneOK) {
                    QPRINTF(OptionValues,2)(
"FAILURE: Non-conjecture leaf %s cannot be shown to be a thm of the input formulae\n",FormulaName);
                }
            } 
            if (ThisOneOK) {
                AddVerifiedTag(Target->AnnotatedFormula,Signature,"leaf");
            } 
            OKSoFar *= ThisOneOK;
        } else {
//DEBUG printf("%s is not a leaf node\n",GetName(Target->AnnotatedFormula,NULL));
        }
        Target = Target->Next;
    }

//----Free the satisfiable lists and the problem list
    FreeListOfAnnotatedFormulae(&Types,Signature);
    FreeListOfAnnotatedFormulae(&PositiveHead,Signature);
    FreeListOfAnnotatedFormulae(&NegativeHead,Signature);
    FreeListOfAnnotatedFormulae(&NeitherHead,Signature);
    FreeListOfAnnotatedFormulae(&ProblemHead,Signature);
    FreeListOfAnnotatedFormulae(&ConjectureFromProblem,Signature);

    if (OKSoFar) {
        if (OptionValues.TimeLimit == 0) {
            QPRINTF(OptionValues,2)("CREATED: Obligations to verify leaves\n");
        } else {
            QPRINTF(OptionValues,2)("SUCCESS: Leaves are verified\n");
        }
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
SZSResultType CombineTwoSZSStatusesForVerification(SZSResultType SZS1,SZSResultType SZS2) {

    if (SZS1 == THM && SZS2 == THM) {
        return(THM);
    }
    if ((SZS1 == THM && SZS2 == ESA) || (SZS1 == ESA && SZS2 == THM)) {
        return(ESA);
    }
    if ((SZS1 == THM && SZS2 == CTH) || (SZS1 == CTH && SZS2 == THM)) {
        return(CTH);
    }
    if ((SZS1 == THM && SZS2 == ECS) || (SZS1 == ECS && SZS2 == THM)) {
        return(ECS);
    }

    if (SZS1 == CTH && SZS2 == CTH) {
        return(THM);
    }
    if ((SZS1 == CTH && SZS2 == ESA) || (SZS1 == ESA && SZS2 == CTH)) {
        return(ECS);
    }
    if ((SZS1 == CTH && SZS2 == ECS) || (SZS1 == ECS && SZS2 == CTH)) {
        return(ESA);
    }

    if (SZS1 == ESA && SZS2 == ESA) {
        return(ESA);
    }
    if ((SZS1 == ESA && SZS2 == ECS) || (SZS1 == ECS && SZS2 == ESA)) {
        return(ECS);
    }

    if (SZS1 == ECS && SZS2 == ECS) {
        return(ESA);
    }

    return(NOC);
}
//-------------------------------------------------------------------------------------------------
void CombineSZSStatusesForVerification(SZSResultArray SZSArray,
char * SZSStatus,int NumberOfSZSResults) {

    int Index;
    SZSResultType SZSResult;

    SZSResult = SZSArray[0];
    Index = 1;
    while (SZSResult != NOC && Index < NumberOfSZSResults) {
//DEBUG printf("Combining %s with %s ",SZSResultToString(SZSResult),SZSResultToString(SZSArray[Index]));
        SZSResult = CombineTwoSZSStatusesForVerification(SZSResult,SZSArray[Index]);
//DEBUG printf(" and got %s\n",SZSResultToString(SZSResult));
        Index++;
    }
    strcpy(SZSStatus,SZSResultToString(SZSResult));
    StringToLower(SZSStatus);
}
//-------------------------------------------------------------------------------------------------
//----This is the main part for verifying regular inferences in the derivation
int DerivedVerification(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature) {

    extern int GlobalInterrupted;
    LISTNODE Target;
    String VerifiedTag;
    int OKSoFar;
    String FormulaName;
    String FileName;
    String InferenceRule;
    char * AllParentNames;
    char * ListParentNames;
    StringParts ParentNames;
    int NumberOfParents;
    LISTNODE ParentAnnotatedFormulae;
    String SZSStatus;
    SZSResultArray SZSArray;
    int NumberOfSZSResults;

    Target = Head;
    OKSoFar = 1;
//----Work through list looking for derived nodes
    while (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) &&
Target != NULL) {
//DEBUG printf("checking ...\n");
//DEBUG PrintAnnotatedTSTPNode(stdout,Target->AnnotatedFormula,tptp,1);
        if (DerivedAnnotatedFormula(Target->AnnotatedFormula) &&
GetUsefulInfoTerm(Target->AnnotatedFormula,"verified",1,VerifiedTag) == NULL &&
//----Explicit splits are dealt with elsewhere, but it may have failed.
GetUsefulInfoTerm(Target->AnnotatedFormula,"explicit_split_from",1,
VerifiedTag) == NULL) {
//DEBUG printf("needs to be verified ...\n");
            GetName(Target->AnnotatedFormula,FormulaName);
            CleanTheFileName(FormulaName,FileName);

            GetInferenceRule(Target->AnnotatedFormula,InferenceRule);
//----Get the parents' in various ways
            AllParentNames = GetNodeParentNames(Target->AnnotatedFormula,NULL);
            NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
            ListParentNames = MakePrintableList(ParentNames,NumberOfParents,NULL);
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,
Signature);
//----Sneakily add all the type formulae for THF and TFF
            AddTypeFormulae(Head,&ParentAnnotatedFormulae,Target->AnnotatedFormula);

//----Copied formula. Look at only the first (which ignores the type formulae
//----added for THF)
            if (!strcmp(InferenceRule,"")) {
                if (SameFormulaInAnnotatedFormulae(Target->AnnotatedFormula,
ParentAnnotatedFormulae->AnnotatedFormula,1,1)) {
                    QPRINTF(OptionValues,2)(
"SUCCESS: %s is a copy of %s\n",FormulaName,ParentNames[0]);
                    AddVerifiedTag(Target->AnnotatedFormula,Signature,"thm");
                } else {
                    QPRINTF(OptionValues,2)(
"WARNING: %s is not a copy of %s, try as thm\n",FormulaName,ParentNames[0]);
                    strcpy(SZSStatus,"thm");
                    if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,
FormulaName,ParentAnnotatedFormulae,ListParentNames,SZSStatus,FileName,-1,"")) {
                        AddVerifiedTag(Target->AnnotatedFormula,Signature,SZSStatus);
                    } else {
                        QPRINTF(OptionValues,2)(
"FAILURE: %s is not a copy or thm of %s\n",FormulaName,ParentNames[0]);
                        OKSoFar = 0;
                    }
                }

//----Inferred formula
            } else {
//----Get SZS status
                if ((SZSArray = GetInferenceSZSStatuses(Target->AnnotatedFormula,NULL,
&NumberOfSZSResults)) == NULL) {
                    QPRINTF(OptionValues,1)(
"WARNING: Cannot get SZS status for %s",FormulaName);
//----If none, then try special cases (one right now) - negated_conjecture
//----with conjecture and sole parent
                    if (ParentAnnotatedFormulae != NULL &&
ParentAnnotatedFormulae->Next == NULL &&
ParentAnnotatedFormulae->AnnotatedFormula->AnnotatedFormulaUnion. AnnotatedTSTPFormula.Status == 
conjecture &&
Target->AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status == 
negated_conjecture) {
                        strcpy(SZSStatus,"cth");
                    } else {
                        strcpy(SZSStatus,"thm");
                    }
                    QPRINTF(OptionValues,1)(", assuming %s\n",SZSStatus);
                } else {
                    CombineSZSStatusesForVerification(SZSArray,SZSStatus,NumberOfSZSResults);
                    Free((void **)&SZSArray);
                }
                if (CorrectlyInferred(OptionValues,Signature,Target->AnnotatedFormula,FormulaName,
ParentAnnotatedFormulae,ListParentNames,SZSStatus,FileName,-1,"")) {
                    AddVerifiedTag(Target->AnnotatedFormula,Signature,SZSStatus);
                } else {
                    OKSoFar = 0;
                }
            }
//----Free the parents list
            Free((void **)&ListParentNames);
            Free((void **)&AllParentNames);
            FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
        }
        Target = Target->Next;
    }

    if (OKSoFar) {
        if (OptionValues.TimeLimit == 0) {
            QPRINTF(OptionValues,2)("CREATED: Obligations to verify derived formulae\n");
        } else {
            QPRINTF(OptionValues,2)("SUCCESS: Derived formulae are verified\n");
        }
    }

    return(OKSoFar);
}
//-------------------------------------------------------------------------------------------------
void GetProblemFileName(OptionsType * OptionValues,ANNOTATEDFORMULA AnnotatedFormula,
char * ProblemFileName) {

    String PossibleFileName;

//----If no name given look in first formula
    if (strcmp(ProblemFileName,"")) {
        strcpy(PossibleFileName,ProblemFileName);
    } else if (GetFileSourceNameAndNode(AnnotatedFormula,PossibleFileName) != NULL) {
        *strchr(PossibleFileName,'\n') = '\0';
        if (PossibleFileName[0] == '\'') {
            PossibleFileName[strlen(PossibleFileName)-1] = '\0';
            strcpy(PossibleFileName,PossibleFileName+1);
        }
    } else {
        strcpy(PossibleFileName,"");
    }

//----Check that it's a readable file
    if (strcmp(PossibleFileName,"") && access(PossibleFileName,R_OK) == 0) {
        strcpy(ProblemFileName,PossibleFileName);
        if (OptionValues->AutoMode) {
            OptionValues->VerifyLeaves = 1;
            QPRINTF((*OptionValues),1)(
"AUTOSET: Found readable problem file, will check leaves\n");
        }
    } 
} 
//-------------------------------------------------------------------------------------------------
void ReportVerification(OptionsType OptionValues,LISTNODE Head,LISTNODE CopyOfHead,
SIGNATURE Signature) {

    String Name;
    String VerifiedInfo;
    ANNOTATEDFORMULA VerifiedFormula;

    printf("SZS output start Verification for %s\n",OptionValues.DerivationFileName);
    while (CopyOfHead != NULL) {
        if ((VerifiedFormula = GetAnnotatedFormulaFromListByName(Head,
GetName(CopyOfHead->AnnotatedFormula,Name))) != NULL &&
GetUsefulInfoTerm(VerifiedFormula,"verified",1,VerifiedInfo) != NULL) {
            AddUsefulInformationToAnnotatedFormula(CopyOfHead->AnnotatedFormula,Signature,
VerifiedInfo);
        }
        PrintAnnotatedTSTPNode(stdout,CopyOfHead->AnnotatedFormula,tptp,1);
        CopyOfHead = CopyOfHead->Next;
    }
    printf("SZS output end Verification for %s\n",OptionValues.DerivationFileName);

}
//-------------------------------------------------------------------------------------------------
int main(int argc,char * argv[]) {

    extern int GlobalInterrupted;
    OptionsType OptionValues;
    LISTNODE Head;
    LISTNODE CopyOfHead;
    SIGNATURE Signature;
    int OKSoFar;

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
//----Check SystemOnTPTP is available, unless it's not going to be used (TimeLimit == 0)
    if (OptionValues.TimeLimit > 0 && !SystemOnTPTPAvailable()) {
        exit(EXIT_FAILURE);
    }

//----Read the derivation file
    Signature = NewSignature();
    SetNeedForNonLogicTokens(0);
    if ((Head = ParseFileOfFormulae(OptionValues.DerivationFileName,NULL,Signature,1,NULL)) == 
NULL) {
        QPRINTF(OptionValues,4)("ERROR: Could not parse %s\n",OptionValues.DerivationFileName);
        exit(EXIT_FAILURE);
    }

//----Convert TCF to TFF for now, because it's not highly supported
    QPRINTF(OptionValues,4)("WARNING: Converting TCF to TFF these days\n");
    CopyOfHead = Head;
    while (CopyOfHead != NULL) {
        if (GetSyntax(CopyOfHead->AnnotatedFormula) == tptp_tcf) {
            SetSyntax(CopyOfHead->AnnotatedFormula,tptp_tff);
        }
        CopyOfHead = CopyOfHead->Next;
    }

    if (OptionValues.Quietness == 0) {
        printf("Derivation file contents:\n");
        fflush(stdout);
        PrintListOfAnnotatedTSTPNodes(stdout,Signature,Head,tptp,1);
        fflush(stdout);
    }
//----Get problem file name sorted out
    GetProblemFileName(&OptionValues,Head->AnnotatedFormula,OptionValues.ProblemFileName);

//----Create working directory
    if (!GlobalInterrupted) {
        if (!CreateDirectory(OptionValues.KeepFilesDirectory,OptionValues.DerivationFileName)) {
            QPRINTF(OptionValues,4)("ERROR: Could not create working directory %s\n",
OptionValues.KeepFilesDirectory);
            exit(EXIT_FAILURE);
        }
    }

//----Make copy for final output
    CopyOfHead = DuplicateListOfAnnotatedFormulae(Head,Signature);
//----Cache all the symbols in the non-introduced formulae
    InitializeNewSymbols(OptionValues,Head,Signature);

//----Start verification
    OKSoFar = 1;

//----Structural completion - failure cannot be forced past
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        QPRINTF(OptionValues,0)("Start structural completion\n");
        if (!StructuralCompletion(OptionValues,&Head,Signature)) {
            OKSoFar = 0;
            if (OptionValues.ForceContinue) {
                OptionValues.ForceContinue = 0;
                QPRINTF(OptionValues,2)(
"FAILURE: Structural completion failure, cannot be forced to continue\n");
            }
        }
    }
    fflush(stdout);
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Head,0,1);

//----Structural verification - failure cannot be forced past
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        QPRINTF(OptionValues,0)("Start structural verification\n");
        if (!StructuralVerification(&OptionValues,Head,Signature)) {
            OKSoFar = 0;
            if (OptionValues.ForceContinue) {
                OptionValues.ForceContinue = 0;
                QPRINTF(OptionValues,2)(
"FAILURE: Structural failure, cannot be forced to continue\n");
            }
        }
    }
    fflush(stdout);
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Head,0,1);

//----Convert to FOF for semantic parts
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
        QPRINTF(OptionValues,0)("Quantify clauses\n");
        FOFifyList(Head,universal);
    }
    fflush(stdout);
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Head,0,1);

    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) && 
OptionValues.GenerateLambdaPiFiles) {
        OKSoFar *= WriteLPSignatureFile(OptionValues,Signature);
        OKSoFar *= InitializeLPProofFile(&OptionValues);
    }

//----Leaf verification
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) &&
OptionValues.VerifyLeaves) {
        QPRINTF(OptionValues,0)("Start leaf verification\n");
        OKSoFar *= LeafVerification(OptionValues,Head,Signature);
    }

//----User semantic parts, e.g., axiom-like formulae are satisfiable
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) &&
OptionValues.VerifyUserSemantics) {
        QPRINTF(OptionValues,0)("Start user semantics verification\n");
        OKSoFar *= UserSemanticsVerification(OptionValues,Signature,Head);
    }

//----Add problem formulae to LambdaPi proof file
    if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue) &&
OptionValues.GenerateLambdaPiFiles) {
        OKSoFar *= WriteLPProblemFormulae(OptionValues);
    }

//----Have option to not go below the leaves
    if (OptionValues.VerifyDAGInferences) {

//----Inference rule specific parts
        if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
            QPRINTF(OptionValues,0)("Start rule specific verification\n");
            OKSoFar *= RuleSpecificVerification(OptionValues,Head,Signature);
        }
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Head,0,1);

//----Derived verification
        if (!GlobalInterrupted && (OKSoFar || OptionValues.ForceContinue)) {
            QPRINTF(OptionValues,0)("Start verification of DAG inferences\n");
            OKSoFar *= DerivedVerification(OptionValues,Head,Signature);
        }
    }

//----Delete working directory if not longer needed
    if (!OptionValues.KeepFiles) {
        QPRINTF(OptionValues,0)("Clean up files\n");
        EmptyAndDeleteDirectory(OptionValues.KeepFilesDirectory);
    }

    if (GlobalInterrupted) {
        OKSoFar = 0;
    } else {
//----If the time limit is 0, nothing has been verified
        if (OptionValues.TimeLimit > 0) {
            QPRINTF(OptionValues,2)("CPUTIME: %.2f\n",GetTotalCPUTime());
            QPRINTF(OptionValues,3)("%s\n",OKSoFar?"SUCCESS: Verified":"FAILURE: Not verified");
            QPRINTF(OptionValues,3)("%s\n",OKSoFar?"SZS status Verified":"SZS status NotVerified");
            fflush(stdout);
            if (OKSoFar) {
                QDO(OptionValues,1,ReportVerification(OptionValues,Head,CopyOfHead,Signature);)
                fflush(stdout);
            }
        }
    }

//----Close LambdaPi proof file if open
    if (OptionValues.LambdaPiProofHandle != NULL) {
        fclose(OptionValues.LambdaPiProofHandle);
    }

//----Free memory
    IsNewSymbol(OptionValues,NULL);
    FreeListOfAnnotatedFormulae(&Head,Signature);
    FreeListOfAnnotatedFormulae(&CopyOfHead,Signature);
    FreeSignature(&Signature);

    return(EXIT_SUCCESS);
}
//-------------------------------------------------------------------------------------------------
