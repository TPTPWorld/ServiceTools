#include <stdio.h>
#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "DataTypes.h"
#include "Utilities.h"
#include "Examine.h"
#include "Parsing.h"
#include "Statistics.h"
#include "ListStatistics.h"
#include "PrintTSTP.h"
#include "Signature.h"
//-----------------------------------------------------------------------------
int ListCount(LISTNODE List,CountType WhatToCount) {

    int Counter;

    Counter = 0;
    while (List != NULL) {
//----Ignore comments
        if (LogicalAnnotatedFormula(List->AnnotatedFormula)) {
            switch (WhatToCount) {
                case nodes:
                    Counter += 1;
                    break;
                case thf_nodes:
                    if (GetSyntax(List->AnnotatedFormula) == tptp_thf) {
                        Counter += 1;
                    }
                    break;
                case tff_nodes:
                    if (GetSyntax(List->AnnotatedFormula) == tptp_tff) {
                        Counter += 1;
                    }
                    break;
                case fof_nodes:
                    if (GetSyntax(List->AnnotatedFormula) == tptp_fof) {
                        Counter += 1;
                    }
                    break;
                case cnf_nodes:
                    if (GetSyntax(List->AnnotatedFormula) == tptp_cnf) {
                        Counter += 1;
                    }
                    break;
                case count_horn_clauses:
                    if (HornClause(List->AnnotatedFormula)) {
                        Counter += 1;
                    }
                    break;
                case unit_formulae:
                    if (CountAnnotatedFormulaAtomsByPredicate(
List->AnnotatedFormula,"") == 1) {
                        Counter += 1;
                    }
                    break;
                case type_formulae:
                    if (GetRole(List->AnnotatedFormula,NULL) == type) {
                        Counter += 1;
                    }
                    break;
                case defn_formulae:
                    if (GetRole(List->AnnotatedFormula,NULL) == definition) {
                        Counter += 1;
                    }
                    break;
                case sequent_formulae:
                    if (LogicalAnnotatedFormula(List->AnnotatedFormula) &&
List->AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables->Formula->Type == sequent) {
                        Counter += 1;
                    }
                    break;
                case count_rr_clauses:
                    if (RangeRestrictedClause(List->AnnotatedFormula)) {
                        Counter += 1;
                    }
                    break;
                case atoms:
                    Counter += CountAnnotatedFormulaAtomsByPredicate(
List->AnnotatedFormula,"");
                    break;
                case equality_atoms:
                    Counter += CountAnnotatedFormulaAtomsByPredicate(
List->AnnotatedFormula,"=");
                    Counter += CountAnnotatedFormulaAtomsByPredicate(
List->AnnotatedFormula,"@=");
                    break;
                case variable_atoms:
                    Counter += CountAnnotatedFormulaAtomsByPredicate(
List->AnnotatedFormula,"VARIABLE");
                    break;
                case literal_count:
                    if (GetSyntax(List->AnnotatedFormula) == tptp_cnf) {
                        Counter += CountAnnotatedFormulaAtomsByPredicate(
List->AnnotatedFormula,"");
                    }
                    break;
                case terms:
                    Counter += CountAnnotatedFormulaTerms(List->
AnnotatedFormula);
                    break;
                case count_variables:
                    Counter += CountAnnotatedFormulaUniqueVariables(List->
AnnotatedFormula);
                    break;
                case count_singletons:
                    Counter += CountAnnotatedFormulaSingletons(List->
AnnotatedFormula);
                    break;
                case count_formula_depth:
                    Counter += AnnotatedFormulaDepth(List->AnnotatedFormula);
                    break;
                case count_term_depth:
                    Counter += SumAnnotatedFormulaTermDepth(List->
AnnotatedFormula);
                    break;
                default:
                    CodingError("Don't know what to count in list");
                    break;
            }
        }
        List = List->Next;
    }
    
    return(Counter);
}
//-----------------------------------------------------------------------------
int HeadListCount(HEADLIST HeadListHead,CountType WhatToCount) {

    int Counter;

    Counter = 0;
    while (HeadListHead != NULL) {
        if (HeadListHead->TheList != NULL) {
            Counter += ListCount(HeadListHead->TheList,WhatToCount);
        }
        HeadListHead = HeadListHead->Next;
    }

    return(Counter);
}
//-----------------------------------------------------------------------------
int ListMaximal(LISTNODE List,MaximizeType WhatToMaximize) {

    int Maximal;

    Maximal = -1;
    while (List != NULL) {
//----Ignore comments
        if (LogicalAnnotatedFormula(List->AnnotatedFormula)) {
            switch (WhatToMaximize) {
                case literals:
                    Maximal = MaximumOfInt(Maximal,
CountAnnotatedFormulaAtomsByPredicate(List->AnnotatedFormula,""));
                    break;
                case term_depth:
                    Maximal = MaximumOfInt(Maximal,
MaxAnnotatedFormulaTermDepth(List->AnnotatedFormula));
                    break;
                case formula_depth:
                    Maximal = MaximumOfInt(Maximal,AnnotatedFormulaDepth(
List->AnnotatedFormula));
                    break;
                default:
                    CodingError("Unknown thing to maximize in list");
                    break;
            }
        }
        List = List->Next;
    }

    return(Maximal);
}
//-----------------------------------------------------------------------------
int HeadListMaximal(HEADLIST HeadListHead,MaximizeType WhatToMaximize) {

    int Maximal;
    int NextMaximal;

    Maximal = -1;
    while (HeadListHead != NULL) {
        if (HeadListHead->TheList != NULL) {
            NextMaximal = ListMaximal(HeadListHead->TheList,WhatToMaximize);
        } else {
            NextMaximal = -1;
        }
        Maximal = MaximumOfInt(NextMaximal,Maximal);
        HeadListHead = HeadListHead->Next;
    }   
    
    return(Maximal);
}
//-----------------------------------------------------------------------------
void AnalyseSymbolList(char * SymbolList,double * NumberOfSymbols,
double * NumberOfArity0,double * MinArity,double * MaxArity) {

    char * SymbolRecord;
    char * RecordRestart;
    char * SymbolField;
    char * FieldRestart;
    int Arity;

    *NumberOfSymbols = 0;
    *NumberOfArity0 = 0;
    *MinArity = -1;
    *MaxArity = -1;

    SymbolRecord = strtok_r(SymbolList,"\n",&RecordRestart);
    while (SymbolRecord != NULL) {
//DEBUG printf("Symbol is %s\n",SymbolRecord);
        (*NumberOfSymbols)++;
        SymbolField = strtok_r(SymbolRecord,"/",&FieldRestart);
        SymbolField = strtok_r(NULL,"/",&FieldRestart);
        Arity = atoi(SymbolField);
        if (Arity == 0) {
            (*NumberOfArity0)++;
        }
        if (*MinArity == -1 || Arity < *MinArity) {
            *MinArity = Arity;
        }
        if (*MaxArity == -1 || Arity > *MaxArity) {
            *MaxArity = Arity;
        }
        SymbolRecord = strtok_r(NULL,"\n",&RecordRestart);
    }
}
//-----------------------------------------------------------------------------
SymbolStatisticsType GetListSymbolUsageStatistics(HEADLIST HeadList) {

    char * PredicateCollector;
    char * FunctorCollector;
    char * OneUsage;
    char * FunctorsStart;
    int PredicateCollectorLength = STRINGLENGTH;
    int FunctorCollectorLength = STRINGLENGTH;
    LISTNODE ListNode;
    SymbolStatisticsType SymbolStatistics;

    InitializeSymbolStatistics(&SymbolStatistics);

    PredicateCollector = (char *)Malloc(sizeof(String));
    strcpy(PredicateCollector,"");
    FunctorCollector = (char *)Malloc(sizeof(String));
    strcpy(FunctorCollector,"");

//----Go down list collecting
    while (HeadList != NULL) {
        ListNode = HeadList->TheList;
        OneUsage = NULL;
        GetListOfAnnotatedFormulaSymbolUsage(ListNode,&OneUsage,&FunctorsStart);
        ExtendString(&FunctorCollector,FunctorsStart,&FunctorCollectorLength);
        *FunctorsStart = '\0';
        ExtendString(&PredicateCollector,OneUsage,&PredicateCollectorLength);
        Free((void **)&OneUsage);
        HeadList = HeadList->Next;
    }

    NormalizeSymbolUsage(FunctorCollector);
    NormalizeSymbolUsage(PredicateCollector);
//DEBUG printf("PREDICATES\n%sFUNCTORS\n%s\n",PredicateCollector,FunctorCollector);
    AnalyseSymbolList(FunctorCollector,&(SymbolStatistics.NumberOfFunctors),
&(SymbolStatistics.NumberOfConstants),&(SymbolStatistics.MinFunctorArity),
&(SymbolStatistics.MaxFunctorArity));
    AnalyseSymbolList(PredicateCollector,
&(SymbolStatistics.NumberOfPredicates),
&(SymbolStatistics.NumberOfPropositions),
&(SymbolStatistics.MinPredicateArity),&(SymbolStatistics.MaxPredicateArity));

    Free((void **)&FunctorCollector);
    Free((void **)&PredicateCollector);

    return(SymbolStatistics);
}
//-----------------------------------------------------------------------------
ConnectiveStatisticsType GetListConnectiveUsageStatistics(HEADLIST HeadList) {

    LISTNODE ListNode;
    ConnectiveStatisticsType ConnectiveStatistics;
    ConnectiveStatisticsType FormulaConnectiveStatistics;

//----Initialize all counters
    InitializeConnectiveStatistics(&ConnectiveStatistics);

//----Go down list collecting
    while (HeadList != NULL) {
        ListNode = HeadList->TheList;
        while (ListNode != NULL) {
//----Ignore comments
            if (LogicalAnnotatedFormula(ListNode->AnnotatedFormula)) {
                InitializeConnectiveStatistics(&FormulaConnectiveStatistics);
                FormulaConnectiveStatistics = GetFormulaConnectiveUsage(
ListNode->AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables->Formula);
                AddOnConnectiveStatistics(&ConnectiveStatistics,
FormulaConnectiveStatistics);
            }
            ListNode = ListNode->Next;
        }
        HeadList = HeadList->Next;
    }
    return(ConnectiveStatistics);
}
//-----------------------------------------------------------------------------
void GetMathmaticsUsage(LISTNODE ListHead,SIGNATURE Signature,
double * NumberOfPredicates,double * NumberOfFunctions,
double * NumberOfNumbers) {

    char* MathPredicates[] = {
        "$less/2",
        "$lesseq/2",
        "$greater/2",
        "$greatereq/2",
        "$is_int/1",
        "$is_rat/1" };
    char* MathFunctions[] = {
        "$uminus/1",
        "$sum/2",
        "$difference/2",
        "$product/2",
        "$quotient/2",
        "$quotient_e/2",
        "$quotient_t/2",
        "$quotient_f/2",
        "$remainder_e/2",
        "$remainder_t/2",
        "$remainder_f/2",
        "$floor/1",
        "$ceiling/1",
        "$truncate/1",
        "$round/1",
        "$to_int/1",
        "$to_rat/1",
        "$to_real/1" };
     
    int Index;
    String MyCopy;
    char * SymbolUsage;
    char * FunctorUsage;
    char * Symbol;
    char * Slash;
    char * EndPtr;
    int Arity;
    int Uses;

//DEBUG printf("PROGRESS: Starting GetMathmaticsUsage\n");
    *NumberOfPredicates = 0;
    for (Index=0; Index < sizeof(MathPredicates)/sizeof(char*);Index++) {
        strcpy(MyCopy,MathPredicates[Index]);
        Slash = strchr(MyCopy,'/');
        *Slash = '\0';
        Slash++;
        Arity = atoi(Slash);
//----Have to ignore arity for THF usage
        if (GetSymbolUses(Signature,predicate,MyCopy,-1) > 0) {
            (*NumberOfPredicates)++;
//DEBUG printf("%s is used\n",MyCopy);
        }
    }
//DEBUG printf("PROGRESS: Done predicates loop\n");
    *NumberOfFunctions = 0;
    for (Index=0; Index < sizeof(MathFunctions)/sizeof(char*);Index++) {
        strcpy(MyCopy,MathFunctions[Index]);
        Slash = strchr(MyCopy,'/');
        *Slash = '\0';
        Arity = atoi(Slash+1);
//----Need to look for math functiosn in predicates because that's what they
//----look like in THF
        if (GetSymbolUses(Signature,predicate,MyCopy,-1) > 0 ||
GetSymbolUses(Signature,function,MyCopy,-1) > 0) {
//----Add GetSymbolUses() to get total occurrences
            (*NumberOfFunctions)++;
//DEBUG printf("%s is used\n",MyCopy);
        }
    }
//DEBUG printf("PROGRESS: Done functions loop\n");

    SymbolUsage = NULL;
    SymbolUsage = GetListOfAnnotatedFormulaSymbolUsage(ListHead,&SymbolUsage,
&FunctorUsage);
//DEBUG printf("PROGRESS: The symbol usage is %s\n",SymbolUsage);
//DEBUG printf("PROGRESS: The functor usage is %s\n",FunctorUsage);

    *NumberOfNumbers = 0;
//----Have to use all symbols because in THF numbers look like predicates
    Symbol = strtok(SymbolUsage,"\n");
    while (Symbol != NULL) {
//----Search from end to avoid finding / in rational numbers (aaaargh)
//DEBUG printf("Analyse ==%s==\n",Symbol);
        Slash = strrchr(Symbol,'/');
        *Slash = '\0';
        Slash++;
//DEBUG printf("Uses %s\n",Slash);
        Uses = atoi(Slash);
        Slash = strrchr(Symbol,'/');
        *Slash = '\0';
        Slash++;
//DEBUG printf("Arity %s\n",Slash);
        Arity = atoi(Slash);
//----Numbers must have 0 arity, must be recognized as a real, or have a /
//----so they are rationals.
//DEBUG printf("Symbol %s Arity %d\n",Symbol,Arity);
//----Bad hack to fix strtod whch thinks infuncsetfunc is a number!
        if (Arity == 0 && isdigit(Symbol[0]) && (
strtod(Symbol,&EndPtr) != 0 || EndPtr != Symbol ||
//----Bad hack to look for rationals
(strchr(Symbol,'/') != NULL && Symbol[0] != '\'' && Symbol[0] != '"'))) {
//DEBUG printf("Symbol %s Arity %d is a number with value %f\n",Symbol,Arity,strtod(Symbol,&EndPtr));
            (*NumberOfNumbers)++;
//---Use this to get total occurrences ...  += Uses;
        }
        Symbol = strtok(NULL,"\n");
    }
//DEBUG printf("PROGRESS: Done number counts = %f\n",*NumberOfNumbers);

    Free((void **)&SymbolUsage);
}
//-----------------------------------------------------------------------------
//----If the signature is non-NULL use it for symbols
StatisticsType GetListStatistics(LISTNODE ListHead,SIGNATURE Signature) {

    StatisticsType Statistics;
    HeadListType HeadListNode;
    double NumberOfTerms;

//----Make a single node for list of lists
    HeadListNode.TheList = ListHead;
    HeadListNode.Next = NULL;

    InitializeStatistics(&Statistics);

//DEBUG printf("PROGRESS: starting\n");
    Statistics.FormulaStatistics.NumberOfFormulae = 
HeadListCount(&HeadListNode,nodes);
    Statistics.FormulaStatistics.NumberOfFOF = 
HeadListCount(&HeadListNode,fof_nodes);
    Statistics.FormulaStatistics.NumberOfTHF = 
HeadListCount(&HeadListNode,thf_nodes);
    Statistics.FormulaStatistics.NumberOfTFF = 
HeadListCount(&HeadListNode,tff_nodes);
    Statistics.FormulaStatistics.NumberOfCNF = 
HeadListCount(&HeadListNode,cnf_nodes);
//DEBUG printf("PROGRESS: counted nodes of type\n");

    Statistics.FormulaStatistics.NumberOfUnitFormulae = 
HeadListCount(&HeadListNode,unit_formulae);
    Statistics.FormulaStatistics.NumberOfTypeFormulae = 
HeadListCount(&HeadListNode,type_formulae);
    Statistics.FormulaStatistics.NumberOfDefnFormulae = 
HeadListCount(&HeadListNode,defn_formulae);
    Statistics.FormulaStatistics.NumberOfSequents = 
HeadListCount(&HeadListNode,sequent_formulae);
//DEBUG printf("PROGRESS: counted formulae of type\n");
    Statistics.FormulaStatistics.NumberOfAtoms = 
HeadListCount(&HeadListNode,atoms);
    Statistics.FormulaStatistics.NumberOfEqualityAtoms = 
HeadListCount(&HeadListNode,equality_atoms);
    Statistics.FormulaStatistics.NumberOfVariableAtoms = 
HeadListCount(&HeadListNode,variable_atoms);
    Statistics.FormulaStatistics.NumberOfLiterals = 
HeadListCount(&HeadListNode,literal_count);
//DEBUG printf("PROGRESS: counted atoms of type\n");

    Statistics.FormulaStatistics.MaxFormulaDepth = 
HeadListMaximal(&HeadListNode,formula_depth);
    if (Statistics.FormulaStatistics.NumberOfFormulae > 0) {
        Statistics.FormulaStatistics.AverageFormulaDepth = 
HeadListCount(&HeadListNode,count_formula_depth) / 
Statistics.FormulaStatistics.NumberOfFormulae;
    } else {
        Statistics.FormulaStatistics.AverageFormulaDepth = 0.0;
    }
//DEBUG printf("PROGRESS: got formulae depth\n");
    Statistics.ConnectiveStatistics = GetListConnectiveUsageStatistics(
&HeadListNode);
//DEBUG //DEBUG printf("PROGRESS: counted connectives\n");

    Statistics.FormulaStatistics.NumberOfHornClauses = HeadListCount(
&HeadListNode,count_horn_clauses);
// BUG HERE FOR STICKSEL EXAMPLES
    Statistics.FormulaStatistics.NumberOfRRClauses = HeadListCount(
&HeadListNode,count_rr_clauses);
    Statistics.FormulaStatistics.MaxClauseSize = HeadListMaximal(
&HeadListNode,literals);
    if (Statistics.FormulaStatistics.NumberOfAtoms > 0) {
        Statistics.FormulaStatistics.AverageClauseSize = 
Statistics.FormulaStatistics.NumberOfLiterals /
Statistics.FormulaStatistics.NumberOfCNF;
    } else {
        Statistics.FormulaStatistics.AverageClauseSize = 0.0;
    }
//DEBUG printf("PROGRESS: counted THF and CNF formula types\n");

    if (Signature != NULL) {
//DEBUG printf("PROGRESS: Getting predicate symbol statistics from signature\n");
        GetSignatureSymbolUsageStatistics(Signature->Predicates,
&(Statistics.SymbolStatistics.NumberOfPredicates),
&(Statistics.SymbolStatistics.NumberOfPropositions),
&(Statistics.SymbolStatistics.MinPredicateArity),
&(Statistics.SymbolStatistics.MaxPredicateArity));
//DEBUG printf("PROGRESS: Getting function symbol statistics from signature\n");
        GetSignatureSymbolUsageStatistics(Signature->Functions,
&(Statistics.SymbolStatistics.NumberOfFunctors),
&(Statistics.SymbolStatistics.NumberOfConstants),
&(Statistics.SymbolStatistics.MinFunctorArity),
&(Statistics.SymbolStatistics.MaxFunctorArity));
    } else {
//DEBUG printf("Getting symbol statistics from formulae\n");
        Statistics.SymbolStatistics = GetListSymbolUsageStatistics(
&HeadListNode);
    }
//DEBUG printf("PROGRESS: counted predicates and functions\n");
    Statistics.SymbolStatistics.NumberOfVariables = HeadListCount(
&HeadListNode,count_variables);
    Statistics.SymbolStatistics.NumberOfSingletons = HeadListCount(
&HeadListNode,count_singletons);
//DEBUG printf("PROGRESS: counted variables\n");
    Statistics.FormulaStatistics.MaxTermDepth = HeadListMaximal(
&HeadListNode,term_depth);
    if ((NumberOfTerms = HeadListCount(&HeadListNode,terms)) > 0) {
        Statistics.FormulaStatistics.AverageTermDepth = HeadListCount(
&HeadListNode,count_term_depth) / NumberOfTerms;
    } else {
        Statistics.FormulaStatistics.AverageTermDepth = 0.0;
    }
//DEBUG printf("PROGRESS: got term depth\n");

//----Statistics for mathematics. Number of vars collected with connectives.
    GetMathmaticsUsage(ListHead,Signature,
&Statistics.SymbolStatistics.NumberOfMathPredicates,
&Statistics.SymbolStatistics.NumberOfMathFunctions,
&Statistics.SymbolStatistics.NumberOfNumbers);
//DEBUG printf("PROGRESS: got mathematics statistics\n");

    return(Statistics);
}
//-----------------------------------------------------------------------------
void PrintMinMaxArity(FILE * Stream,double Arity) {

    if (Arity == -1) {
        fprintf(Stream,"-");
    } else {
        fprintf(Stream,"%.0f",Arity);
    }
}
//-----------------------------------------------------------------------------
void PrintListStatistics(FILE * Stream,StatisticsType Statistics) {

    if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfTHF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
        fprintf(Stream,
"%% Syntax   : Number of formulae    : %4.0f (%4.0f unit",
Statistics.FormulaStatistics.NumberOfFormulae,
Statistics.FormulaStatistics.NumberOfUnitFormulae);
        if (Statistics.FormulaStatistics.NumberOfTHF > 0 || 
Statistics.FormulaStatistics.NumberOfTFF) {
            fprintf(Stream,";%4.0f type",
Statistics.FormulaStatistics.NumberOfTypeFormulae);
        }
        if (Statistics.FormulaStatistics.NumberOfTHF > 0) {
            fprintf(Stream,";%4.0f defn",
Statistics.FormulaStatistics.NumberOfDefnFormulae);
        }
    fprintf(Stream,")\n");
    }

    if (Statistics.FormulaStatistics.NumberOfCNF > 0) {
        if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfTHF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
            fprintf(Stream,"%%            ");
        } else {
            fprintf(Stream,"%% Syntax   : ");
        }
        fprintf(Stream,
"Number of clauses     : %4.0f (%4.0f non-Horn;%4.0f unit;%4.0f RR)\n",
Statistics.FormulaStatistics.NumberOfCNF,
Statistics.FormulaStatistics.NumberOfCNF -
Statistics.FormulaStatistics.NumberOfHornClauses,
Statistics.FormulaStatistics.NumberOfUnitFormulae,
Statistics.FormulaStatistics.NumberOfRRClauses);
    }

    fprintf(Stream,
"%%            Number of atoms       : %4.0f (%4.0f equality",
Statistics.FormulaStatistics.NumberOfAtoms,
Statistics.FormulaStatistics.NumberOfEqualityAtoms);
    if (Statistics.FormulaStatistics.NumberOfTHF > 0) {
        fprintf(Stream,";%4.0f variable",
Statistics.FormulaStatistics.NumberOfVariableAtoms);
    }
    fprintf(Stream,")\n");

    if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfTHF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
        fprintf(Stream,
"%%            Maximal formula depth : %4.0f (%4.0f average)\n",
Statistics.FormulaStatistics.MaxFormulaDepth,
Statistics.FormulaStatistics.AverageFormulaDepth);
    }
    if (Statistics.FormulaStatistics.NumberOfCNF > 0) {
        fprintf(Stream,
"%%            Maximal clause size   : %4.0f (%4.0f average)\n",
Statistics.FormulaStatistics.MaxClauseSize,
Statistics.FormulaStatistics.AverageClauseSize);
    }

    if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfTHF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
//----First connectives line
        fprintf(Stream,
"%%            Number of connectives : %4.0f (%4.0f   ~;%4.0f   |;%4.0f   &",
Statistics.ConnectiveStatistics.NumberOfConnectives,
Statistics.ConnectiveStatistics.NumberOfNegations,
Statistics.ConnectiveStatistics.NumberOfDisjunctions,
Statistics.ConnectiveStatistics.NumberOfConjunctions);
        if (Statistics.FormulaStatistics.NumberOfTHF > 0) {
            fprintf(Stream,";%4.0f   @",
Statistics.ConnectiveStatistics.NumberOfApplications);
        }
        fprintf(Stream,")\n");
//----Second connectives line
        fprintf(Stream,
"%%                                         (%4.0f <=>;%4.0f  =>;%4.0f  <=;%4.0f <~>)\n",
Statistics.ConnectiveStatistics.NumberOfEquivalences,
Statistics.ConnectiveStatistics.NumberOfImplications,
Statistics.ConnectiveStatistics.NumberOfReverseImplications,
Statistics.ConnectiveStatistics.NumberOfXors);
//----Third connectives line
        fprintf(Stream,
"%%                                         (%4.0f  ~|;%4.0f  ~&",
Statistics.ConnectiveStatistics.NumberOfNors,
Statistics.ConnectiveStatistics.NumberOfNands);
        fprintf(Stream,")\n");
        if (Statistics.FormulaStatistics.NumberOfTHF > 0 || 
Statistics.FormulaStatistics.NumberOfTFF > 0) {
//----Fourth connectives line, THF and TFF only
            fprintf(Stream,
"%%            Number of type conns  : %4.0f (%4.0f   >;%4.0f   *;%4.0f   +;%4.0f  <<)\n",
Statistics.ConnectiveStatistics.NumberOfTypeConnectives,
Statistics.ConnectiveStatistics.NumberOfMaparrows,
Statistics.ConnectiveStatistics.NumberOfXprods,
Statistics.ConnectiveStatistics.NumberOfUnions,
Statistics.ConnectiveStatistics.NumberOfSubtypes);
        }
    }

//----Symbols
    if (Statistics.FormulaStatistics.NumberOfTHF > 0) {
        fprintf(Stream,
"%%            Number of symbols     : %4.0f (%4.0f   :;%4.0f   =",
Statistics.SymbolStatistics.NumberOfPredicates,
Statistics.ConnectiveStatistics.NumberOfGlobalTypeDecs,
Statistics.ConnectiveStatistics.NumberOfEquations);
//----For TF1 print uses of @= and others as terms
        if (Statistics.ConnectiveStatistics.NumberOfPiBinders > 0 ||
Statistics.ConnectiveStatistics.NumberOfTypedEquations > 0 ||
Statistics.ConnectiveStatistics.NumberOfPis > 0 ||
Statistics.ConnectiveStatistics.NumberOfSigmas > 0 ||
Statistics.ConnectiveStatistics.NumberOfChoices > 0 ||
Statistics.ConnectiveStatistics.NumberOfDescriptions > 0) {
            fprintf(Stream,";%4.0f  @=)\n",
Statistics.ConnectiveStatistics.NumberOfTypedEquations);
            fprintf(Stream,
"%%                                         (%4.0f  !!;%4.0f  ??;%4.0f @@+;%4.0f @@-)\n",
Statistics.ConnectiveStatistics.NumberOfPis,
Statistics.ConnectiveStatistics.NumberOfSigmas,
Statistics.ConnectiveStatistics.NumberOfChoices,
Statistics.ConnectiveStatistics.NumberOfDescriptions);
        } else {
            fprintf(Stream,")\n");
        }
    }

    if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfCNF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
        fprintf(Stream,
"%%            Number of predicates  : %4.0f (%4.0f propositional; ",
Statistics.SymbolStatistics.NumberOfPredicates,
Statistics.SymbolStatistics.NumberOfPropositions);
        PrintMinMaxArity(Stream,Statistics.SymbolStatistics.MinPredicateArity);
        fprintf(Stream,"-");
        PrintMinMaxArity(Stream,Statistics.SymbolStatistics.MaxPredicateArity);
        fprintf(Stream," arity)\n");
        fprintf(Stream,
"%%            Number of functors    : %4.0f (%4.0f constant; ",
Statistics.SymbolStatistics.NumberOfFunctors,
Statistics.SymbolStatistics.NumberOfConstants);
        PrintMinMaxArity(Stream,Statistics.SymbolStatistics.MinFunctorArity),
        fprintf(Stream,"-");
        PrintMinMaxArity(Stream,Statistics.SymbolStatistics.MaxFunctorArity);
        fprintf(Stream," arity)\n");
    }

//----Variables. Fuck, watch the sgn for FOF and THF, singleton for CNF
    fprintf(Stream,
"%%            Number of variables   : %4.0f (%4.0f ",
Statistics.SymbolStatistics.NumberOfVariables,
Statistics.SymbolStatistics.NumberOfSingletons);

    if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfTHF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
        fprintf(Stream,"sgn;%4.0f   !;%4.0f   ?",
Statistics.ConnectiveStatistics.NumberOfUniversals,
Statistics.ConnectiveStatistics.NumberOfExistentials);
        if (Statistics.FormulaStatistics.NumberOfTHF > 0) {
            fprintf(Stream,";%4.0f   ^",
Statistics.ConnectiveStatistics.NumberOfLambdas);
        }
    } else {
        fprintf(Stream,"singleton");
    }
    fprintf(Stream,")\n");
    if (Statistics.FormulaStatistics.NumberOfTFF > 0 ||
Statistics.FormulaStatistics.NumberOfTHF > 0) {
        fprintf(Stream,
"%%                                         (%4.0f   :;%4.0f  !>;%4.0f  ?*)\n",
Statistics.ConnectiveStatistics.NumberOfTypedVariables,
Statistics.ConnectiveStatistics.NumberOfPiBinders,
Statistics.ConnectiveStatistics.NumberOfSigmaBinders);
    }
    if (Statistics.FormulaStatistics.NumberOfTHF > 0) {
        fprintf(Stream,
"%%                                         (%4.0f  @-;%4.0f  @+)\n",
Statistics.ConnectiveStatistics.NumberOfDescriptionBinders,
Statistics.ConnectiveStatistics.NumberOfChoiceBinders);
    }

//----Terms
    if (Statistics.FormulaStatistics.NumberOfFOF > 0 || 
Statistics.FormulaStatistics.NumberOfCNF > 0 ||
Statistics.FormulaStatistics.NumberOfTFF > 0) {
        fprintf(Stream,
"%%            Maximal term depth    : %4.0f (%4.0f average)\n",
Statistics.FormulaStatistics.MaxTermDepth,
Statistics.FormulaStatistics.AverageTermDepth); 
    }

//----Mathematics
    if (Statistics.SymbolStatistics.NumberOfMathPredicates > 0 ||
Statistics.SymbolStatistics.NumberOfMathFunctions > 0 ||
Statistics.SymbolStatistics.NumberOfNumbers > 0 ||
Statistics.ConnectiveStatistics.NumberOfMathVariables > 0 ) {
        fprintf(Stream,
"%%            Arithmetic symbols    : %4.0f (%4.0f prd;%4.0f fun;%4.0f num;%4.0f var)\n",
Statistics.SymbolStatistics.NumberOfMathPredicates + 
Statistics.SymbolStatistics.NumberOfMathFunctions +
Statistics.SymbolStatistics.NumberOfNumbers +
Statistics.ConnectiveStatistics.NumberOfMathVariables,
Statistics.SymbolStatistics.NumberOfMathPredicates,
Statistics.SymbolStatistics.NumberOfMathFunctions,
Statistics.SymbolStatistics.NumberOfNumbers,
Statistics.ConnectiveStatistics.NumberOfMathVariables);
    }
}
//-----------------------------------------------------------------------------
