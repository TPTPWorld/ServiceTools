#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <ctype.h>
#include <stdlib.h>

#include "DataTypes.h"
#include "Utilities.h"
#include "Signature.h"
#include "Parsing.h"
#include "List.h"
#include "PrintTSTP.h"
#include "Examine.h"
#include "SystemOnTPTP.h"
//-----------------------------------------------------------------------------
char * GetInferenceParentNames(TERM InferenceTerm,String PutNamesHere);
int CountVariableUsageInTerm(TERM Term,VARIABLENODE Variable);
//-----------------------------------------------------------------------------
char * GetSymbol(TERM Term) {

    if (Term == NULL) {
        CodingError("Getting symbol for NULL term");
    }

    if (Term->Type == variable) {
        return(GetSignatureSymbol(Term->TheSymbol.Variable->VariableName));
    } else {
        return(GetSignatureSymbol(Term->TheSymbol.NonVariable));
    }
}
//-----------------------------------------------------------------------------
int GetArity(TERM Term) {

    if (Term == NULL) {
        CodingError("Getting arity for NULL term");
    }

    if (Term->Type == variable) {
        return(GetSignatureArity(Term->TheSymbol.Variable->VariableName));
//----Lists have flexible arity (signature arity should be -1)
    } else if (!strcmp(GetSymbol(Term),"[]")) {
        return(Term->FlexibleArity);
//----Otherwise get from the signature, but check Arguments because declared
//----symbols have wrong arity
    } if (Term->Arguments == NULL) {
          return(0);
    } else {
        return(GetSignatureArity(Term->TheSymbol.NonVariable));
    }
}
//-----------------------------------------------------------------------------
int LooksLikeAReal(char * RealString) {

    int NumberScanned;
    float TheFloat;

    NumberScanned = sscanf(RealString,"%f",&TheFloat);
//DEBUG printf("%s scanned %d as %f\n",Term,NumberScanned,TheFloat);
    return(NumberScanned);

//----Doing it by hand
//     char * Dot;
//     char * E;
//     SuperString CopyOfRealString;
// 
// //----Currently does not recognize scientific format
//     strcpy(CopyOfRealString,RealString);
//     if ((Dot = strchr(CopyOfRealString,'.')) != NULL) {
//         *Dot = '\0';
//         if (LooksLikeAnInteger(CopyOfRealString)) {
//             if ((E = strchr(Dot+1,'E')) != NULL || 
// (E = strchr(Dot+1,'e')) != NULL) {
//                 *E = '\0';
//                 return(LooksLikeAnUnsignedInteger(Dot+1) && 
// LooksLikeAnInteger(E+1));
//             } else {
//                 return(LooksLikeAnInteger(CopyOfRealString) &&
// LooksLikeAnUnsignedInteger(Dot+1));
//             }
//         } else {
//             return(0);
//         }
//     } else {
//         return(0);
//     }
}
//-----------------------------------------------------------------------------
int LooksLikeAnInteger(char * IntegerString) {

    int NumberScanned;
    long TheLong;

    NumberScanned = sscanf(IntegerString,"%ld",&TheLong);
//DEBUG printf("%s scanned %d as %f\n",Term,NumberScanned,TheFloat);
    return(NumberScanned && !LooksLikeAReal(IntegerString));

//----Doing it by hand
//     unsigned int Index;
// 
//     Index = 0;
//     if (IntegerString[Index] == '-' || IntegerString[Index] == '+') {
//         Index++;
//     }
//     return(LooksLikeAnUnsignedInteger(&IntegerString[Index]));
}
//-----------------------------------------------------------------------------
int LooksLikeAnUnsignedInteger(char * UnsignedIntegerString) {

    if (*UnsignedIntegerString == '-' || *UnsignedIntegerString == '+') {
        return(0);
    } else {
        return(LooksLikeAnInteger(UnsignedIntegerString));
    }
//----Doing it by hand
//     unsigned int Index;
// 
//     Index = 0;
//     while (Index < strlen(UnsignedIntegerString)) {
//         if (! isdigit(UnsignedIntegerString[Index])) {
//             return(0);
//         }
//         Index++;
//     }
//     return(1);
}
//-----------------------------------------------------------------------------
int LooksLikeARational(char * RationalString) {

    char * Slash;
    SuperString CopyOfRationalString;

    strcpy(CopyOfRationalString,RationalString);
    if ((Slash = strchr(CopyOfRationalString,'/')) != NULL) {
        *Slash = '\0';
        return(LooksLikeAnInteger(CopyOfRationalString) &&
LooksLikeAnUnsignedInteger(Slash+1));
    } else {
        return(0);
    }
}
//-----------------------------------------------------------------------------
int LooksLikeANumber(char * NumberString) {

    return(LooksLikeAnInteger(NumberString) || 
LooksLikeARational(NumberString) || LooksLikeAReal(NumberString));
}
//-----------------------------------------------------------------------------
int LooksLikeAList(TERM Term,int MinElements,int MaxElements) {

    if (Term == NULL) {
        CodingError("Check if NULL term is a list");
    }

    return(Term->Type != variable && !strcmp(GetSymbol(Term),"[]") &&
(MinElements == -1 || GetArity(Term) >= MinElements) && 
(MaxElements == -1 || GetArity(Term) <= MaxElements));
}
//-----------------------------------------------------------------------------
int CheckRole(StatusType Role,StatusType DesiredRole) {

     return(Role == DesiredRole || (DesiredRole == axiom_like &&
(Role == axiom || Role == hypothesis || Role == definition || 
Role == lemma || Role == theorem || Role == corollary || Role == external)) || 
//----Note: assumptions are not axiom_like
(DesiredRole == not_conjecture && Role != conjecture && 
Role != negated_conjecture && Role != question));
}
//-----------------------------------------------------------------------------
int CheckAnnotatedFormulaRole(ANNOTATEDFORMULA AnnotatedFormula,
StatusType DesiredRole) {

    return(ReallyAnAnnotatedFormula(AnnotatedFormula) &&
CheckRole(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status,
DesiredRole));

}
//-----------------------------------------------------------------------------
int CheckAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula,
SyntaxType ExpectedSyntax) {

    return(AnnotatedFormula != NULL && 
AnnotatedFormula->Syntax == ExpectedSyntax &&
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables != NULL);
}
//-----------------------------------------------------------------------------
int LogicalAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula) {

    return(CheckAnnotatedFormula(AnnotatedFormula,tptp_thf) ||
CheckAnnotatedFormula(AnnotatedFormula,tptp_tff) ||
CheckAnnotatedFormula(AnnotatedFormula,tptp_tcf) ||
CheckAnnotatedFormula(AnnotatedFormula,tptp_fof) ||
CheckAnnotatedFormula(AnnotatedFormula,tptp_cnf));
}
//-----------------------------------------------------------------------------
int TPIAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula) {

    return(CheckAnnotatedFormula(AnnotatedFormula,tptp_tpi));
}
//-----------------------------------------------------------------------------
int ReallyAnAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula) {

    return(LogicalAnnotatedFormula(AnnotatedFormula) ||
TPIAnnotatedFormula(AnnotatedFormula));
}
//-----------------------------------------------------------------------------
int CopiedAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula) {

//----Logical
    return(LogicalAnnotatedFormula(AnnotatedFormula) &&
//----Has a source
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source != NULL && 
//----Source is a single word, not "unknown", i.e., a node name
GetArity(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source) 
== 0 &&
strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source),"unknown"));
}
//-----------------------------------------------------------------------------
int InferredAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula) {

//DEBUG printf("logical %d\n",LogicalAnnotatedFormula(AnnotatedFormula));
//DEBUG printf("has source %d\n",AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source != NULL);
//DEBUG printf("is inference %d\n",!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
//DEBUG Source),"inference"));
//DEBUG printf("arity 3 is %d\n",GetArity(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source) == 3);
//----Logical
    return(LogicalAnnotatedFormula(AnnotatedFormula) &&
//----Has a source
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source != NULL && 
//----Source is inference
!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source),"inference") &&
GetArity(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source) 
== 3);
}
//-----------------------------------------------------------------------------
int DerivedAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula) {

//----Logical
    return(CopiedAnnotatedFormula(AnnotatedFormula) ||
InferredAnnotatedFormula(AnnotatedFormula));
}
//-----------------------------------------------------------------------------
//----Extract the contents of a term (wot's in the ()s)
int ExtractTermArguments(String Term) {

    char * Open;
    char * Close;
    String Arguments;

    if ((Open = strchr(Term,'(')) != NULL && (Close = strrchr(Term,')')) !=
NULL) {
        *Close = '\0';
        strcpy(Arguments,Open+1);
        strcpy(Term,Arguments);
        return(1);
    } else {
        return(0);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * TSTPTermToString(TERM Term,char * PutTermHere) {

    char * Part;
    int Index;
    int Arity;
    String OpeningBracket,ClosingBracket;
    char * Buffer;
    int BufferSize;

//----Build in malloced memory
    Buffer = (char *)Malloc(sizeof(String));
    Buffer[0] = '\0';
    BufferSize = sizeof(String);

//----Check if infix - or : (see also PrintTSTPTerm in PrintTSTP.c)
//----No need to worry about infix equality here - only for non_logical_data
    if (!strcmp(GetSymbol(Term),"-") || !strcmp(GetSymbol(Term),":")) {
        Part = TSTPTermToString(Term->Arguments[0],NULL);
        ExtendString(&Buffer,Part,&BufferSize);
        Free((void **)&Part);
        ExtendString(&Buffer,GetSymbol(Term),&BufferSize);
        Part = TSTPTermToString(Term->Arguments[1],NULL);
        ExtendString(&Buffer,Part,&BufferSize);
        Free((void **)&Part);
    } else {
//----Check if a list
        if (!strcmp(GetSymbol(Term),"[]")) {
            strcpy(OpeningBracket,"[");
            strcpy(ClosingBracket,"]");
        } else {
            ExtendString(&Buffer,GetSymbol(Term),&BufferSize);
            strcpy(OpeningBracket,"(");
            strcpy(ClosingBracket,")");
        }
        
        if ((Arity = GetArity(Term)) > 0 || !strcmp(OpeningBracket,"[")) {
            ExtendString(&Buffer,OpeningBracket,&BufferSize);
            if (Arity > 0) {
                Part = TSTPTermToString(Term->Arguments[0],NULL);
                ExtendString(&Buffer,Part,&BufferSize);
                Free((void **)&Part);
                for (Index=1;Index < Arity;Index++) {
                    ExtendString(&Buffer,",",&BufferSize);
                    Part = TSTPTermToString(Term->Arguments[Index],NULL);
                    ExtendString(&Buffer,Part,&BufferSize);
                    Free((void **)&Part);
                }
            }
            ExtendString(&Buffer,ClosingBracket,&BufferSize);
        }
    }
//----Check if user provided memory or not
    if (PutTermHere != NULL) {
        strcpy(PutTermHere,Buffer);
        Free((void **)&Buffer);
        return(PutTermHere);
    } else {
        return(Buffer);
    }
}
//-----------------------------------------------------------------------------
int CountVariableUsageInArguments(TERMArray Arguments,int Arity,
VARIABLENODE Variable) {

    int Count;
    int Index;

    Count = 0;
    for (Index = 0;Index<Arity;Index++) {
        Count += CountVariableUsageInTerm(Arguments[Index],Variable);
    }
    return(Count);
}
//-----------------------------------------------------------------------------
int CountVariableUsageInTerm(TERM Term,VARIABLENODE Variable) {

    switch (Term->Type) {
        case variable:
            return(Term->TheSymbol.Variable == Variable ? 1 : 0);
            break;
        case function:
        case predicate:
            return(CountVariableUsageInArguments(Term->Arguments,Term->
TheSymbol.NonVariable->Arity,Variable));
            break;
        case ite_term:
            return(
CountVariableUsageInTerm(Term->TheSymbol.ConditionalTerm.TermIfTrue,Variable) +
CountVariableUsageInTerm(Term->TheSymbol.ConditionalTerm.TermIfFalse,Variable));
            break;
        case let_term:
            return(
CountVariableUsageInTerm(Term->TheSymbol.LetTerm.LetBody,Variable));
            break;
        default:
            CodingError("Bad term type for counting variable occurences");
            return(0);
            break;
    }

}
//-----------------------------------------------------------------------------
int CountVariableUsageInTupleFormulae(int NumberOfElements,
FORMULAArray TupleFormulae,VARIABLENODE Variable,int * QuantifiedOccurences) {

    int ElementNumber;
    int TotalUsage;
    int LocalQuantifiedUsage;

    *QuantifiedOccurences = 0;
    TotalUsage = 0;
    LocalQuantifiedUsage = 0;
    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        TotalUsage += CountVariableUsageInFormula(TupleFormulae[ElementNumber],
Variable,&LocalQuantifiedUsage);
        *QuantifiedOccurences += LocalQuantifiedUsage;
    }
    return(TotalUsage);
}
//-----------------------------------------------------------------------------
int CountVariableUsageInFormula(FORMULA Formula,VARIABLENODE Variable,
int * QuantifiedOccurences) {

    int LocalQuantifiedOccurences;
    int LocalQuantifiedOccurences2;
    int LocalCount;

    LocalQuantifiedOccurences = 0;
    LocalQuantifiedOccurences2 = 0;

    switch (Formula->Type) {
        case sequent:
            LocalCount = CountVariableUsageInTupleFormulae(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS,Variable,&LocalQuantifiedOccurences);
            LocalCount += CountVariableUsageInTupleFormulae(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS,Variable,&LocalQuantifiedOccurences2);
            LocalQuantifiedOccurences += LocalQuantifiedOccurences2;
            break;
        case quantified:
            LocalCount = CountVariableUsageInFormula(Formula->
FormulaUnion.QuantifiedFormula.Formula,Variable,&LocalQuantifiedOccurences);
            if (Formula->FormulaUnion.QuantifiedFormula.Variable->
TheSymbol.Variable == Variable) {
                LocalQuantifiedOccurences++;
            }
            break;
        case binary:
            LocalCount = CountVariableUsageInFormula(Formula->FormulaUnion.
BinaryFormula.LHS,Variable,&LocalQuantifiedOccurences);
            LocalCount += CountVariableUsageInFormula(Formula->FormulaUnion.
BinaryFormula.RHS,Variable,&LocalQuantifiedOccurences2);
            LocalQuantifiedOccurences += LocalQuantifiedOccurences2;
            break;
        case unary:
            LocalCount = CountVariableUsageInFormula(Formula->FormulaUnion.
UnaryFormula.Formula,Variable,&LocalQuantifiedOccurences);
            break;
        case atom:
            LocalCount = CountVariableUsageInTerm(Formula->FormulaUnion.Atom,
Variable);
            break;
        case ite_formula:
            LocalCount = CountVariableUsageInFormula(Formula->FormulaUnion.
ConditionalFormula.Condition,Variable,&LocalQuantifiedOccurences);
            LocalCount += CountVariableUsageInFormula(Formula->FormulaUnion.
ConditionalFormula.FormulaIfTrue,Variable,&LocalQuantifiedOccurences);
            LocalCount += CountVariableUsageInFormula(Formula->FormulaUnion.
ConditionalFormula.FormulaIfFalse,Variable,&LocalQuantifiedOccurences);
            break;
        case let_formula:
            LocalCount = CountVariableUsageInFormula(Formula->FormulaUnion.
LetFormula.LetBody,Variable,&LocalQuantifiedOccurences);
            break;
        default:
            CodingError("Unknown formula type in count variables usage");
            break;
    }
    if (LocalQuantifiedOccurences > 1) {
        CodingError("Multiply quantified variable");
    }
    if (QuantifiedOccurences != NULL) {
        *QuantifiedOccurences = LocalQuantifiedOccurences;
    }

    return(LocalCount);
}
//-----------------------------------------------------------------------------
void NormalizeSymbolUsage(char * SymbolUsage) {

    SYMBOLNODE Head;
    SYMBOLNODE Searcher;
    char * Triple;
    char * TripleLast;
    char * Functor;
    int Arity,Uses;
    SuperString NextTriple;
    char * Slash;

    Head = NULL;
    TripleLast = NULL;
    Triple = strtok_r(SymbolUsage,"\n",&TripleLast);
    while (Triple != NULL) {
//----Have to search backwards to avoid / in rationals
        Slash = strrchr(Triple,'/');
        *Slash = '\0';
        Slash++;
        Uses = atoi(Slash);
        Slash = strrchr(Triple,'/');
        *Slash = '\0';
        Slash++;
        Arity = atoi(Slash);
        Functor = Triple;
        Searcher = Head;
        while (Searcher != NULL && (strcmp(Searcher->NameSymbol,Functor) || 
Searcher->Arity != Arity)) {
            Searcher = Searcher->NextSymbol;
        }
        if (Searcher != NULL) {
            Searcher->NumberOfUses += Uses;
        } else {
            Searcher = (SYMBOLNODE)Malloc(sizeof(SymbolNodeType));
            Searcher->NameSymbol = CopyHeapString(Functor);
            Searcher->Arity = Arity;
            Searcher->NumberOfUses = Uses;
            Searcher->NextSymbol = Head;
            Head = Searcher;
        }
        Triple = strtok_r(NULL,"\n",&TripleLast);
    }

    strcpy(SymbolUsage,"");
    while (Head != NULL) {
        sprintf(NextTriple,"%s/%d/%d\n",Head->NameSymbol,Head->Arity,
Head->NumberOfUses);
        strcat(SymbolUsage,NextTriple);
        Searcher = Head;
        Head = Head->NextSymbol;
        Free((void **)&(Searcher->NameSymbol));
        Free((void **)&Searcher);
    }
}
//-----------------------------------------------------------------------------
void CollectVariablesInAtom(TERM Term,char ** Collector,int * CollectorLength) {

    SuperString Variable;
    int index;
    char * PredicateCollector;
    char * FunctorCollector;
    int PredicateCollectorLength;
    int FunctorCollectorLength;

    if (Term->Type == variable) {
        sprintf(Variable,"%s/0/1\n",
Term->TheSymbol.Variable->VariableName->NameSymbol);
        ExtendString(Collector,Variable,CollectorLength);
    } else if (Term->Type == ite_term) {
        PredicateCollector = (char *)Malloc(sizeof(String));
        strcpy(PredicateCollector,"");
        PredicateCollectorLength = STRINGLENGTH;
        FunctorCollector = (char *)Malloc(sizeof(String));
        strcpy(FunctorCollector,"");
        FunctorCollectorLength = STRINGLENGTH;
        CollectSymbolsInFormula(Term->TheSymbol.ConditionalTerm.Condition,
&PredicateCollector,&PredicateCollectorLength,&FunctorCollector,
&FunctorCollectorLength,Collector,CollectorLength);
        CollectVariablesInAtom(Term->TheSymbol.ConditionalTerm.TermIfTrue,
Collector,CollectorLength);
        CollectVariablesInAtom(Term->TheSymbol.ConditionalTerm.TermIfFalse,
Collector,CollectorLength);
        Free((void **)&PredicateCollector);
        Free((void **)&FunctorCollector);
    } else if (Term->Type == let_term) {
        CollectVariablesInAtom(Term->TheSymbol.LetTerm.LetBody,Collector,
CollectorLength);
    } else if (Term->Type == predicate || Term->Type == function) {
        for (index = 0; index < GetArity(Term); index++) {
            CollectVariablesInAtom(Term->Arguments[index],Collector,
CollectorLength);
        }
    }
}
//-----------------------------------------------------------------------------
void CollectFunctorsInAtom(TERM Term,char ** Collector,int * CollectorLength) {

    SuperString FunctorAndArity;
    int index;
    char * PredicateCollector;
    char * VariableCollector;
    int PredicateCollectorLength;
    int VariableCollectorLength;

    if (Term->Type == predicate || Term->Type == function) {
        if (Term->Type == function) {
            sprintf(FunctorAndArity,"%s/%d/1\n",
Term->TheSymbol.NonVariable->NameSymbol,Term->TheSymbol.NonVariable->Arity);
            ExtendString(Collector,FunctorAndArity,CollectorLength);
        }
        for (index = 0; index < GetArity(Term); index++) {
            CollectFunctorsInAtom(Term->Arguments[index],Collector,
CollectorLength);
        }
    } else if (Term->Type == ite_term) {
        PredicateCollector = (char *)Malloc(sizeof(String));
        strcpy(PredicateCollector,"");
        PredicateCollectorLength = STRINGLENGTH;
        VariableCollector = (char *)Malloc(sizeof(String));
        strcpy(VariableCollector,"");
        VariableCollectorLength = STRINGLENGTH;
        CollectSymbolsInFormula(Term->TheSymbol.ConditionalTerm.Condition,
&PredicateCollector,&PredicateCollectorLength,Collector,CollectorLength,
&VariableCollector,&VariableCollectorLength);
        CollectFunctorsInAtom(Term->TheSymbol.ConditionalTerm.TermIfTrue,
Collector,CollectorLength);
        CollectFunctorsInAtom(Term->TheSymbol.ConditionalTerm.TermIfFalse,
Collector,CollectorLength);
        Free((void **)&PredicateCollector);
        Free((void **)&VariableCollector);
    } else if (Term->Type == let_term) {
        PredicateCollector = (char *)Malloc(sizeof(String));
        strcpy(PredicateCollector,"");
        PredicateCollectorLength = STRINGLENGTH;
        VariableCollector = (char *)Malloc(sizeof(String));
        strcpy(VariableCollector,"");
        VariableCollectorLength = STRINGLENGTH;
        CollectSymbolsInFormula(Term->TheSymbol.LetTerm.LetDefn,
&PredicateCollector,&PredicateCollectorLength,Collector,CollectorLength,
&VariableCollector,&VariableCollectorLength);
        CollectFunctorsInAtom(Term->TheSymbol.LetTerm.LetBody,
Collector,CollectorLength);
        Free((void **)&PredicateCollector);
        Free((void **)&VariableCollector);
    }
}
//-----------------------------------------------------------------------------
//----PutUsageHere must be address of a malloced String
char * GetLiteralSymbolUsage(FORMULA Literal,char ** PutUsageHere,
char ** VariablesStartHere) {

    char Sign;
    char * Collector;
    int UsageLength = STRINGLENGTH;
    int CollectorLength;

    strcpy(*PutUsageHere,"");
    if (Literal == NULL) {
        return(NULL);
    } else if (Literal->Type == unary && 
Literal->FormulaUnion.UnaryFormula.Connective == negation) {
        Sign = '~';
        Literal = Literal->FormulaUnion.UnaryFormula.Formula;
    } else if (Literal->Type == atom) {
        Sign = ' ';
    } else {
        return(NULL);
    }

    sprintf(*PutUsageHere,"%c%s/%d/1\n",Sign,
Literal->FormulaUnion.Atom->TheSymbol.NonVariable->NameSymbol,
Literal->FormulaUnion.Atom->TheSymbol.NonVariable->Arity);

    Collector = (char *)Malloc(sizeof(String));
    CollectorLength = STRINGLENGTH;
    strcpy(Collector,"");
    CollectFunctorsInAtom(Literal->FormulaUnion.Atom,&Collector,
&CollectorLength);
    NormalizeSymbolUsage(Collector);
    ExtendString(PutUsageHere,Collector,&UsageLength);
    Free((void **)&Collector);

//----Collect variables if not a NULL start pointer
    if (VariablesStartHere != NULL) {
        Collector = (char *)Malloc(sizeof(String));
        CollectorLength = STRINGLENGTH;
        strcpy(Collector,"");
        CollectVariablesInAtom(Literal->FormulaUnion.Atom,&Collector,
&CollectorLength);
        *VariablesStartHere = &((*PutUsageHere)[strlen(*PutUsageHere)]);
        NormalizeSymbolUsage(Collector);
        ExtendString(PutUsageHere,Collector,&UsageLength);
        Free((void **)&Collector);
    }

    return(*PutUsageHere);
}
//-----------------------------------------------------------------------------
void CollectSymbolsInTupleFormulae(int NumberOfElements,
FORMULAArray TupleFormulae,char ** PredicateCollector,
int * PredicateCollectorLength,char ** FunctorCollector,
int * FunctorCollectorLength,char ** VariableCollector,
int * VariableCollectorLength) {

    int ElementNumber;

    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        CollectSymbolsInFormula(TupleFormulae[ElementNumber],
PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
    }
}
//-----------------------------------------------------------------------------
void CollectSymbolsInFormula(FORMULA Formula,char ** PredicateCollector,
int * PredicateCollectorLength,char ** FunctorCollector,
int * FunctorCollectorLength,char ** VariableCollector,
int * VariableCollectorLength) {

    char * PredicateAndArity;

    switch (Formula->Type) {
        case sequent:
//DEBUG printf("CollectSymbolsInFormula: sequent");
            CollectSymbolsInTupleFormulae(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS,
PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
            CollectSymbolsInTupleFormulae(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS,
PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
            break;
        case quantified:
//DEBUG printf("CollectSymbolsInFormula: quantified");
//----Add in RHS of : and := variables
            if (Formula->FormulaUnion.QuantifiedFormula.VariableType != NULL) {
                CollectSymbolsInFormula(Formula->FormulaUnion.QuantifiedFormula.
VariableType,PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
            }
            CollectSymbolsInFormula(Formula->FormulaUnion.QuantifiedFormula.
Formula,PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
            break;
        case binary:
//DEBUG printf("CollectSymbolsInFormula: binary");
//----Do LHS unless : or := or <<
            if (Formula->FormulaUnion.BinaryFormula.Connective != 
typedeclaration && Formula->FormulaUnion.BinaryFormula.Connective !=
assignment && Formula->FormulaUnion.BinaryFormula.Connective !=
subtype) {
                CollectSymbolsInFormula(Formula->FormulaUnion.BinaryFormula.LHS,
PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
            }
//----Don't do <<
            if (Formula->FormulaUnion.BinaryFormula.Connective != subtype) {
                CollectSymbolsInFormula(Formula->FormulaUnion.BinaryFormula.RHS,
PredicateCollector,PredicateCollectorLength,FunctorCollector,
FunctorCollectorLength,VariableCollector,VariableCollectorLength);
            }
            break;
        case unary:
//DEBUG printf("CollectSymbolsInFormula: unary");
            CollectSymbolsInFormula(Formula->
FormulaUnion.UnaryFormula.Formula,PredicateCollector,PredicateCollectorLength,
FunctorCollector,FunctorCollectorLength,VariableCollector,
VariableCollectorLength);
            break;
        case atom:
//DEBUG printf("CollectSymbolsInFormula: atom\n");
//----$true and $false are exempt NOT ANY MORE - WHO DOES THIS AFFECT :-(
//            if (strcmp(GetSymbol(Formula->FormulaUnion.Atom),"$true") &&
//strcmp(GetSymbol(Formula->FormulaUnion.Atom),"$false")) {
//----Variables in THF are not symbols
            if (Formula->FormulaUnion.Atom->Type != variable) {
                PredicateAndArity = (char *)Malloc(sizeof(SuperString));
                sprintf(PredicateAndArity,"%s/%d/1\n",GetSymbol(Formula->
FormulaUnion.Atom),GetArity(Formula->FormulaUnion.Atom));
                ExtendString(PredicateCollector,PredicateAndArity,
PredicateCollectorLength);
                Free((void **)&PredicateAndArity);
                CollectFunctorsInAtom(Formula->FormulaUnion.Atom,
FunctorCollector,FunctorCollectorLength);
                CollectVariablesInAtom(Formula->FormulaUnion.Atom,
VariableCollector,VariableCollectorLength);
            }
            break;
        case tuple:
            CollectSymbolsInTupleFormulae(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements,PredicateCollector,
PredicateCollectorLength,FunctorCollector,FunctorCollectorLength,
VariableCollector,VariableCollectorLength);
            break;
        case ite_formula:
//DEBUG printf("CollectSymbolsInFormula: ite_formula");
            CollectSymbolsInFormula(
Formula->FormulaUnion.ConditionalFormula.Condition,PredicateCollector,
PredicateCollectorLength,FunctorCollector,FunctorCollectorLength,
VariableCollector,VariableCollectorLength);
            CollectSymbolsInFormula(
Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue,PredicateCollector,
PredicateCollectorLength,FunctorCollector,FunctorCollectorLength,
VariableCollector,VariableCollectorLength);
            CollectSymbolsInFormula(
Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse,PredicateCollector,
PredicateCollectorLength,FunctorCollector,FunctorCollectorLength,
VariableCollector,VariableCollectorLength);
            break;
        case let_formula:
//DEBUG printf("CollectSymbolsInFormula: let_formula");
            CollectSymbolsInFormula(
Formula->FormulaUnion.LetFormula.LetDefn,PredicateCollector,
PredicateCollectorLength,FunctorCollector,FunctorCollectorLength,
VariableCollector,VariableCollectorLength);
            CollectSymbolsInFormula(
Formula->FormulaUnion.LetFormula.LetBody,PredicateCollector,
PredicateCollectorLength,FunctorCollector,FunctorCollectorLength,
VariableCollector,VariableCollectorLength);
            break;
        default:
            CodingError("Not a known formula type in collect predicates");
            break;
    }
}
//-----------------------------------------------------------------------------
//----PutUsageHere must be address of a malloced String
char * GetFormulaSymbolUsage(FORMULA Formula,char ** PutUsageHere,
char ** FunctorUsageStartsHere,char ** VariableUsageStartsHere) {

    char * PredicateCollector;
    char * FunctorCollector;
    char * VariableCollector;
    int UsageLength = STRINGLENGTH;
    int PredicateCollectorLength = STRINGLENGTH;
    int FunctorCollectorLength = STRINGLENGTH;
    int VariableCollectorLength = STRINGLENGTH;
    int PredicateLength;
    int FunctorLength;

//DEBUG printf("PROGRESS: Allocate memory for GetFormulaSymbolUsage\n");
    PredicateCollector = (char *)Malloc(sizeof(String));
    strcpy(PredicateCollector,"");
    FunctorCollector = (char *)Malloc(sizeof(String));
    strcpy(FunctorCollector,"");
    VariableCollector = (char *)Malloc(sizeof(String));
    strcpy(VariableCollector,"");
    CollectSymbolsInFormula(Formula,
&PredicateCollector,&PredicateCollectorLength,&FunctorCollector,
&FunctorCollectorLength,&VariableCollector,&VariableCollectorLength);
//DEBUG printf("Predicates:%s\n",PredicateCollector);
//DEBUG printf("Functors  :%s\n",FunctorCollector);
//DEBUG printf("Variables :%s\n",VariableCollector);

    strcpy(*PutUsageHere,"");
    NormalizeSymbolUsage(PredicateCollector);
    PredicateLength = strlen(PredicateCollector);
    ExtendString(PutUsageHere,PredicateCollector,&UsageLength);
    Free((void **)&PredicateCollector);

    NormalizeSymbolUsage(FunctorCollector);
    FunctorLength = strlen(FunctorCollector);
    ExtendString(PutUsageHere,FunctorCollector,&UsageLength);
    Free((void **)&FunctorCollector);

    NormalizeSymbolUsage(VariableCollector);
    ExtendString(PutUsageHere,VariableCollector,&UsageLength);
    Free((void **)&VariableCollector);

    *FunctorUsageStartsHere = *PutUsageHere + PredicateLength;
    *VariableUsageStartsHere = *FunctorUsageStartsHere + FunctorLength;

    return(*PutUsageHere);
}
//-----------------------------------------------------------------------------
//----PutUsageHere must be address of a malloced String
char * GetAnnotatedFormulaSymbolUsage(ANNOTATEDFORMULA AnnotatedTSTPFormula,
char ** PutUsageHere,char ** FunctorUsageStartsHere) {

    char * VariableUsage;
    char * Result;

//----Ignore comments
    if (LogicalAnnotatedFormula(AnnotatedTSTPFormula)) {
        if ((Result = GetFormulaSymbolUsage(AnnotatedTSTPFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula,
PutUsageHere,FunctorUsageStartsHere,&VariableUsage)) != NULL) {
//----Variables not returned at the moment, maybe later
            *VariableUsage = '\0';
            return(Result);
        } else {
            return(NULL);
        }
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
//----PutUsageHere must be address of a malloced String or pointer to NULL
char * GetListOfAnnotatedFormulaSymbolUsage(LISTNODE ListNode,
char ** PutUsageHere,char ** FunctorUsageStartsHere) {

    char * PredicateCollector;
    char * FunctorCollector;
    char * OneUsage;
    char * FunctorsStart;
    int UsageLength = STRINGLENGTH;
    int PredicateCollectorLength = STRINGLENGTH;
    int FunctorCollectorLength = STRINGLENGTH;

//DEBUG printf("PROGRESS: Allocate memory\n");
//----Initialize PutUsageHere if not done already
    if (*PutUsageHere == NULL) {
        *PutUsageHere = (char *)Malloc(sizeof(String));
        strcpy(*PutUsageHere,"");
    }

//----Collect predicates and functors
    PredicateCollector = (char *)Malloc(sizeof(String));
    strcpy(PredicateCollector,"");
    FunctorCollector = (char *)Malloc(sizeof(String));
    strcpy(FunctorCollector,"");

//DEBUG printf("PROGRESS: Allocated memory\n");
    while (ListNode != NULL) {
        OneUsage = (char *)Malloc(sizeof(String));
        strcpy(OneUsage,"");
        if (GetAnnotatedFormulaSymbolUsage(ListNode->AnnotatedFormula,
&OneUsage,&FunctorsStart) != NULL) {
            ExtendString(&FunctorCollector,FunctorsStart,
&FunctorCollectorLength);
            *FunctorsStart = '\0';
            ExtendString(&PredicateCollector,OneUsage,
&PredicateCollectorLength);
        }
        Free((void **)&OneUsage);
        ListNode = ListNode->Next;
    }
//DEBUG printf("PROGRESS: Done nodes\n");

    strcpy(*PutUsageHere,"");
    NormalizeSymbolUsage(PredicateCollector);
    ExtendString(PutUsageHere,PredicateCollector,&UsageLength);
    PredicateCollectorLength = strlen(*PutUsageHere);
    Free((void **)&PredicateCollector);
//DEBUG printf("PROGRESS: Normalized predicates\n");
    NormalizeSymbolUsage(FunctorCollector);
    ExtendString(PutUsageHere,FunctorCollector,&UsageLength);
    *FunctorUsageStartsHere = (*PutUsageHere) + PredicateCollectorLength;
    Free((void **)&FunctorCollector);
//DEBUG printf("PROGRESS: Normalized functors\n");

    return(*PutUsageHere);
}
//-----------------------------------------------------------------------------
//----PutPositivesHere and PutNegativesHere must be addresses of
//----malloced empty strings
void CollectVariablesOfPolarity(FORMULA DisjunctionOrLiteral,
char ** PutPositivesHere,int * PositivesLength,char ** PutNegativesHere,
int * NegativesLength) {

    char * LiteralSymbols;
    char * LiteralVariables;

    if (DisjunctionOrLiteral == NULL) {
        return;
    }

    switch (DisjunctionOrLiteral->Type) {
        case binary:
            CollectVariablesOfPolarity(DisjunctionOrLiteral->
FormulaUnion.BinaryFormula.LHS,PutPositivesHere,PositivesLength,
PutNegativesHere,NegativesLength);
            CollectVariablesOfPolarity(DisjunctionOrLiteral->
FormulaUnion.BinaryFormula.RHS,PutPositivesHere,PositivesLength,
PutNegativesHere,NegativesLength);
            break;
        case unary:
        case atom:
            LiteralSymbols = (char *)Malloc(sizeof(String));
            if (GetLiteralSymbolUsage(DisjunctionOrLiteral,&LiteralSymbols,
&LiteralVariables) != NULL) {
//DEBUG printf("Literal symbols are \n%s\n",LiteralSymbols);
//DEBUG printf("Literal variables are \n%s\n",LiteralVariables);
                if (DisjunctionOrLiteral->Type == unary) {
                    ExtendString(PutNegativesHere,LiteralVariables,
NegativesLength);
                } else {
                    ExtendString(PutPositivesHere,LiteralVariables,
PositivesLength);
                }
            } else {
                CodingError("Cannot get literal symbol usage");
            }
            Free((void **)&LiteralSymbols);
            break;
        default:
            ReportError("SyntaxError","Not a clause in tptp_cnf",1);
            break;
    }
    NormalizeSymbolUsage(*PutPositivesHere);
    NormalizeSymbolUsage(*PutNegativesHere);
}
//-----------------------------------------------------------------------------
int RangeRestrictedClause(ANNOTATEDFORMULA AnnotatedFormula) {

    char * PutPositivesHere;
    int PositivesLength;
    char * PutNegativesHere;
    int NegativesLength;
    int RangeRestricted;
    char * PositiveVariable;
    char * Slash;
    String CRNameSlash;

    if (!CheckAnnotatedFormula(AnnotatedFormula,tptp_cnf) &&
!CheckAnnotatedFormula(AnnotatedFormula,tptp_tcf)) {
        return(0);
    }

    PutPositivesHere = (char *)Malloc(sizeof(SuperString));
    strcpy(PutPositivesHere,"");
    PositivesLength = STRINGLENGTH;
    PutNegativesHere = (char *)Malloc(sizeof(SuperString));
    strcpy(PutNegativesHere,"");
    NegativesLength = STRINGLENGTH;

    CollectVariablesOfPolarity(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.FormulaWithVariables->Formula,&PutPositivesHere,
&PositivesLength,&PutNegativesHere,&NegativesLength);

//----Assume RR
    RangeRestricted = 1;
    PositiveVariable = strtok(PutPositivesHere,"\n");
//----Check each positive is also a negative
    while (RangeRestricted && PositiveVariable != NULL) {
        if ((Slash = strchr(PositiveVariable,'/')) == NULL) {
            CodingError("No slash in variable information");
        }
        *(Slash+1) = '\0';
        strcpy(CRNameSlash,"\n");
        strcat(CRNameSlash,PositiveVariable);
//----Check at start of list and beyond (see NameInList)
        if ((strstr(PutNegativesHere,&CRNameSlash[1]) != PutNegativesHere) &&
(strstr(PutNegativesHere,CRNameSlash) == NULL)) {
            RangeRestricted = 0;
        }
        PositiveVariable = strtok(NULL,"\n");
    }

    Free((void **)&PutPositivesHere);
    Free((void **)&PutNegativesHere);

    return(RangeRestricted);
}
//-----------------------------------------------------------------------------
int CountFormulaLiteralsOfPolarity(FORMULA DisjunctionOrLiteral,int Sign) {

    if (DisjunctionOrLiteral == NULL) {
        return(0);
    }

    switch (DisjunctionOrLiteral->Type) {
        case binary:
            return(
CountFormulaLiteralsOfPolarity(DisjunctionOrLiteral->
FormulaUnion.BinaryFormula.LHS,Sign) +
CountFormulaLiteralsOfPolarity(DisjunctionOrLiteral->
FormulaUnion.BinaryFormula.RHS,Sign));
            break;
        case unary:
            if (Sign == -1) {
                return(1);
            } else {
                return(0);
            }
            break;
        case atom:
            if (Sign ==  1) {
                 return(1);
            } else {
                return(0);
            }
            break;
        default:
            ReportError("SyntaxError","Not a clause in tptp_cnf",1);
            return(0);
            break;
    }
}
//-----------------------------------------------------------------------------
int GetSymbolUses(SIGNATURE Signature,TermType Type,char * Name,int Arity) {

    SYMBOLNODE List;
    SYMBOLNODE SymbolNode;

    if (Type == predicate) {
        List = Signature->Predicates;
    } else if (Type == function) {
        List = Signature->Functions;
    } else {
        List = NULL;
        CodingError("Unknown type of symbol for GetSymbolUses");
    }

    if ((SymbolNode = IsSymbolInSignatureList(List,Name,Arity)) != NULL) {
        return(GetSignatureUses(SymbolNode));
    } else {
        return(0);
    }
}
//-----------------------------------------------------------------------------
int CountLiteralsOfPolarity(ANNOTATEDFORMULA AnnotatedFormula,int * Positive,
int * Negative) {

    FORMULA DisjunctionOrLiteral;

    if (!CheckAnnotatedFormula(AnnotatedFormula,tptp_cnf) &&
!CheckAnnotatedFormula(AnnotatedFormula,tptp_tcf)) {
        return(0);
    }

    DisjunctionOrLiteral = AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula;
    *Positive = CountFormulaLiteralsOfPolarity(DisjunctionOrLiteral,1);
    *Negative = CountFormulaLiteralsOfPolarity(DisjunctionOrLiteral,-1);
    return(1);
}
//-----------------------------------------------------------------------------
int HornClause(ANNOTATEDFORMULA AnnotatedFormula) {

    int Positive,Negative;

    return(CountLiteralsOfPolarity(AnnotatedFormula,&Positive,&Negative) &&
Positive <= 1);
}
//-----------------------------------------------------------------------------
int NonHornClause(ANNOTATEDFORMULA AnnotatedFormula) {

    int Positive,Negative;

    return(CountLiteralsOfPolarity(AnnotatedFormula,&Positive,&Negative) &&
Positive > 1);
}
//-----------------------------------------------------------------------------
int CountAnnotatedFormulaUniqueVariablesByUse(ANNOTATEDFORMULA 
AnnotatedFormula,int MinUse,int MaxUse,ConnectiveType Quantification) {

    int Counter;
    VARIABLENODE VariableNode;

    if (LogicalAnnotatedFormula(AnnotatedFormula)) {
        Counter = 0;
        VariableNode = AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Variables;
        while (VariableNode != NULL) {
            if (
//----Usage constraint
(MinUse < 0 || MaxUse < MinUse || (VariableNode->NumberOfUses >= MinUse && 
VariableNode->NumberOfUses <= MaxUse)) && 
//----Quantification constraint
(Quantification == none || VariableNode->Quantification == Quantification)) {
                Counter++;
            }
            VariableNode = VariableNode->NextVariable;
        }
        return(Counter);
    } else {
        return(-1);
    }

}
//-----------------------------------------------------------------------------
int CountAnnotatedFormulaSingletons(ANNOTATEDFORMULA AnnotatedFormula) {

    return(CountAnnotatedFormulaUniqueVariablesByUse(AnnotatedFormula,1,1,
none));
}
//-----------------------------------------------------------------------------
int CountAnnotatedFormulaUniqueVariables(ANNOTATEDFORMULA AnnotatedFormula) {

    return(CountAnnotatedFormulaUniqueVariablesByUse(AnnotatedFormula,-1,-1,
none));
}
//-----------------------------------------------------------------------------
int CountTupleFormulaeTerms(int NumberOfElements,FORMULAArray TupleFormulae) {

    int ElementNumber;
    int TotalTerms;

    TotalTerms = 0;
    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        TotalTerms += CountFormulaTerms(TupleFormulae[ElementNumber]);
    }
    return(TotalTerms);
}
//-----------------------------------------------------------------------------
int CountFormulaTerms(FORMULA Formula) {

    switch(Formula->Type) {
        case sequent:
            return(CountTupleFormulaeTerms(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS) + 
CountTupleFormulaeTerms(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS));
            break;
        case quantified:
            return(
CountFormulaTerms(Formula->FormulaUnion.QuantifiedFormula.Formula));
            break;
        case binary:
            return(
CountFormulaTerms(Formula->FormulaUnion.BinaryFormula.LHS) + 
CountFormulaTerms(Formula->FormulaUnion.BinaryFormula.RHS));
            break;
        case unary:
            return(CountFormulaTerms(
Formula->FormulaUnion.UnaryFormula.Formula));
            break;
        case atom:
            return(GetArity(Formula->FormulaUnion.Atom));
            break;
        case tuple:
            return(CountTupleFormulaeTerms(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements));
            break;
        case ite_formula:
            return(
CountFormulaTerms(Formula->FormulaUnion.ConditionalFormula.Condition) +
CountFormulaTerms(Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue) +
CountFormulaTerms(Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse));
            break;
        case let_formula:
            return(
CountFormulaTerms(Formula->FormulaUnion.LetFormula.LetDefn) +
CountFormulaTerms(Formula->FormulaUnion.LetFormula.LetBody));
            break;
        default:
            CodingError("Invalid formula type for counting atoms");
            exit(EXIT_FAILURE);
            break;
    }
}
//-----------------------------------------------------------------------------
int CountAnnotatedFormulaTerms(ANNOTATEDFORMULA AnnotatedFormula) {

    return(CountFormulaTerms(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.FormulaWithVariables->Formula));
}
//-----------------------------------------------------------------------------
int CountTupleFormulaeAtomsByPredicate(int NumberOfElements,
FORMULAArray TupleFormulae,char * Predicate) {

    int ElementNumber;
    int TotalAtoms;

    TotalAtoms = 0;
    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        TotalAtoms += CountFormulaAtomsByPredicate(
TupleFormulae[ElementNumber],Predicate);
    }
    return(TotalAtoms);
}
//-----------------------------------------------------------------------------
int CountFormulaAtomsByPredicate(FORMULA Formula,char * Predicate) {

    int Count;

    Count = 0;
    switch(Formula->Type) {
        case sequent:
            return(CountTupleFormulaeAtomsByPredicate(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS,Predicate) + 
CountTupleFormulaeAtomsByPredicate(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS,Predicate));

            break;
        case quantified:
//----Add in RHS of : variables
//            if (Formula->FormulaUnion.QuantifiedFormula.VariableType != NULL) {
//                Count += CountFormulaAtomsByPredicate(
//Formula->FormulaUnion.QuantifiedFormula.VariableType,Predicate);
//            }
            Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.QuantifiedFormula.Formula,Predicate);
            return(Count);
            break;
        case binary:
//----Do unless : or :=
            if (Formula->FormulaUnion.BinaryFormula.Connective != 
typedeclaration && Formula->FormulaUnion.BinaryFormula.Connective !=
assignment) {
                Count += CountFormulaAtomsByPredicate(Formula->
FormulaUnion.BinaryFormula.LHS,Predicate);
                Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.BinaryFormula.RHS,Predicate);
//----Equality counts as an atom
                if (Formula->FormulaUnion.BinaryFormula.Connective == 
equation && (strlen(Predicate) == 0 || !strcmp(Predicate,"="))) {
                    Count++;
                }
            } 
            return(Count);
            break;
        case unary:
            return(CountFormulaAtomsByPredicate(
Formula->FormulaUnion.UnaryFormula.Formula,Predicate));
            break;
        case atom:
//----What the fuck was this for?
            if (strlen(Predicate) == 0 || 
//----It's the predicate I want
!strcmp(Predicate,GetSymbol(Formula->FormulaUnion.Atom)) ||
//----Nasty legacy use of equal/2
(!strcmp(Predicate,"=") && 
 !strcmp(GetSymbol(Formula->FormulaUnion.Atom),"equal")) ||
//----A variable in THF
(!strcmp(Predicate,"VARIABLE") && Formula->FormulaUnion.Atom->Type == 
variable)) {
//DEBUG printf("--%s-- matches --%s--\n",GetSymbol(Formula->FormulaUnion.Atom),Predicate);
                return(1);
            } else {
                return(0);
            }
            break;
        case tuple:
            return(CountTupleFormulaeAtomsByPredicate(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements,Predicate));
            break;
        case ite_formula:
            Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.ConditionalFormula.Condition,Predicate);
            Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue,Predicate);
            Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse,Predicate);
            return(Count);
            break;
        case let_formula:
            Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.LetFormula.LetDefn,Predicate);
            Count += CountFormulaAtomsByPredicate(
Formula->FormulaUnion.LetFormula.LetBody,Predicate);
            return(Count);
            break;
        default:
            CodingError("Invalid formula type for counting atoms");
            return(0);
            break;
    }
}
//-----------------------------------------------------------------------------
int CountAnnotatedFormulaAtomsByPredicate(ANNOTATEDFORMULA AnnotatedFormula,
char * Predicate) {

    if (LogicalAnnotatedFormula(AnnotatedFormula)) {
        return(CountFormulaAtomsByPredicate(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula,
Predicate));
    } else {
        return(-1);
    }
}
//-----------------------------------------------------------------------------
//----All the counters have to be previously initialized to 0
ConnectiveStatisticsType GetTupleFormulaeConnectiveUsage(int NumberOfElements,
FORMULAArray TupleFormulae) {

    ConnectiveStatisticsType ConnectiveStatistics;
    ConnectiveStatisticsType MoreConnectiveStatistics;
    int ElementNumber;

    InitializeConnectiveStatistics(&ConnectiveStatistics);

    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        MoreConnectiveStatistics = GetFormulaConnectiveUsage(
TupleFormulae[ElementNumber]);
        AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
    }
    return(ConnectiveStatistics);
}
//-----------------------------------------------------------------------------
ConnectiveStatisticsType GetFormulaConnectiveUsage(FORMULA Formula) {

    ConnectiveStatisticsType ConnectiveStatistics;
    ConnectiveStatisticsType MoreConnectiveStatistics;
    FormulaType * VariableType;

    InitializeConnectiveStatistics(&ConnectiveStatistics);
    InitializeConnectiveStatistics(&MoreConnectiveStatistics);

    switch(Formula->Type) {
        case sequent:
            ConnectiveStatistics = GetTupleFormulaeConnectiveUsage(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS);
            MoreConnectiveStatistics = GetTupleFormulaeConnectiveUsage(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            break;
        case quantified:
//----For typed variables
            VariableType = Formula->FormulaUnion.QuantifiedFormula.VariableType;
            if (VariableType != NULL) {
                ConnectiveStatistics = GetFormulaConnectiveUsage(VariableType);
                ConnectiveStatistics.NumberOfTypedVariables++;
//----Count math variables
                if (VariableType->Type == atom && 
GetArity(VariableType->FormulaUnion.Atom) == 0 &&
(!strcmp(GetSymbol(VariableType->FormulaUnion.Atom),"$int") ||
 !strcmp(GetSymbol(VariableType->FormulaUnion.Atom),"$rat") ||
 !strcmp(GetSymbol(VariableType->FormulaUnion.Atom),"$real"))) {
                    ConnectiveStatistics.NumberOfMathVariables++;
                }
            }
            MoreConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.QuantifiedFormula.Formula);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            switch (Formula->FormulaUnion.QuantifiedFormula.Quantifier) {
                case universal:
                    ConnectiveStatistics.NumberOfUniversals++;
                    break;
                case existential:
                    ConnectiveStatistics.NumberOfExistentials++;
                    break;
                case lambda:
                    ConnectiveStatistics.NumberOfLambdas++;
                    break;
                case pibinder:
                    ConnectiveStatistics.NumberOfPiBinders++;
                    break;
                case sigmabinder:
                    ConnectiveStatistics.NumberOfSigmaBinders++;
                    break;
                case descriptionbinder:
                    ConnectiveStatistics.NumberOfDescriptionBinders++;
                    break;
                case choicebinder:
                    ConnectiveStatistics.NumberOfChoiceBinders++;
                    break;
                default:
                    CodingError("Unknown quantifer type in counting");
                    break;
            }
            break;
        case binary:
//----Do LHS unless : or :=
            if (Formula->FormulaUnion.BinaryFormula.Connective != 
typedeclaration && Formula->FormulaUnion.BinaryFormula.Connective !=
assignment) {
                ConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.BinaryFormula.LHS);
            }
            MoreConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.BinaryFormula.RHS);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            switch(Formula->FormulaUnion.BinaryFormula.Connective) {
                case disjunction:
                    ConnectiveStatistics.NumberOfDisjunctions++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case conjunction:
                    ConnectiveStatistics.NumberOfConjunctions++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case equivalence:
                    ConnectiveStatistics.NumberOfEquivalences++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case implication:
                    ConnectiveStatistics.NumberOfImplications++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case reverseimplication:
                    ConnectiveStatistics.NumberOfReverseImplications++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case nonequivalence:
                    ConnectiveStatistics.NumberOfXors++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case negateddisjunction:
                    ConnectiveStatistics.NumberOfNors++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case negatedconjunction:
                    ConnectiveStatistics.NumberOfNands++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case application:
                    ConnectiveStatistics.NumberOfApplications++;
                    ConnectiveStatistics.NumberOfConnectives++;
                    break;
                case subtype:
                    ConnectiveStatistics.NumberOfSubtypes++;
                    ConnectiveStatistics.NumberOfTypeConnectives++;
                    break;
                case maparrow:
                    ConnectiveStatistics.NumberOfMaparrows++;
                    ConnectiveStatistics.NumberOfTypeConnectives++;
                    break;
                case xprodtype:
                    ConnectiveStatistics.NumberOfXprods++;
                    ConnectiveStatistics.NumberOfTypeConnectives++;
                    break;
                case uniontype:
                    ConnectiveStatistics.NumberOfUnions++;
                    ConnectiveStatistics.NumberOfTypeConnectives++;
                    break;
                case typedeclaration:
                    ConnectiveStatistics.NumberOfGlobalTypeDecs++;
                    break;
                case assignment:
                    ConnectiveStatistics.NumberOfGlobalDefns++;
                    break;
                case equation:
                    break;
                default:
//DEBUG printf("%d===%s===\n",Formula->FormulaUnion.BinaryFormula.Connective,ConnectiveToString(Formula->FormulaUnion.BinaryFormula.Connective));
                    CodingError("Unknown binary connective in counting");
                    break;
            }
            break;
        case unary:
            ConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.UnaryFormula.Formula);
            switch (Formula->FormulaUnion.UnaryFormula.Connective) {
                case negation:
                    ConnectiveStatistics.NumberOfNegations++;
                    break;
//----Ignore these - they are counted as atoms
                case pi:
                case sigma:
                case choice:
                case description:
                    break;
                default:
printf("%d===%s===\n",Formula->FormulaUnion.UnaryFormula.Connective,ConnectiveToString(Formula->FormulaUnion.UnaryFormula.Connective));
                    CodingError("Unknown unary connective in counting");
                    break;
            }
            ConnectiveStatistics.NumberOfConnectives++;
            break;
        case atom:
//----Count use of connectives as atoms
            if (Formula->FormulaUnion.Atom->Type == connective) {
                switch (StringToConnective(GetSymbol(
Formula->FormulaUnion.Atom))) {
                    case equation:
                        ConnectiveStatistics.NumberOfEquations++;
                        break;
                    case typedequation:
                        ConnectiveStatistics.NumberOfTypedEquations++;
                        break;
                    case pi:
                        ConnectiveStatistics.NumberOfPis++;
                        break;
                    case sigma:
                        ConnectiveStatistics.NumberOfSigmas++;
                        break;
                    case choice:
                        ConnectiveStatistics.NumberOfChoices++;
                        break;
                    case description:
                        ConnectiveStatistics.NumberOfDescriptions++;
                        break;
                    default:
                        break;
                }
            }
            break;
        case tuple:
            ConnectiveStatistics = GetTupleFormulaeConnectiveUsage(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements);
            break;
        case ite_formula:
            ConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.ConditionalFormula.Condition);
            MoreConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            MoreConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            break;
        case let_formula:
            ConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.LetFormula.LetDefn);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            MoreConnectiveStatistics = GetFormulaConnectiveUsage(
Formula->FormulaUnion.LetFormula.LetBody);
            AddOnConnectiveStatistics(&ConnectiveStatistics,
MoreConnectiveStatistics);
            break;
        default:
            CodingError("Invalid formula type for counting connectives");
            break;
    }
    return(ConnectiveStatistics);
}
//-----------------------------------------------------------------------------
int TupleFormulaeDepth(int NumberOfElements,FORMULAArray TupleFormulae) {

    int ElementNumber;
    int MaximalDepth;

    MaximalDepth = 0;
    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        MaximalDepth = MaximumOfInt(MaximalDepth,
FormulaDepth(TupleFormulae[ElementNumber]));
    }
    return(MaximalDepth);
}
//-----------------------------------------------------------------------------
int FormulaDepth(FORMULA Formula) {

    switch(Formula->Type) {
        case sequent:
            return(MaximumOfInt(TupleFormulaeDepth(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS),
TupleFormulaeDepth(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS)));
            break;
        case quantified:
            return(1 + FormulaDepth(
Formula->FormulaUnion.QuantifiedFormula.Formula));
            break;
        case binary:
            return(1 + 
MaximumOfInt(FormulaDepth(Formula->FormulaUnion.BinaryFormula.LHS),
FormulaDepth(Formula->FormulaUnion.BinaryFormula.RHS)));
            break;
        case unary:
            return(1 + FormulaDepth(
Formula->FormulaUnion.UnaryFormula.Formula));
            break;
        case atom:
            return(1);
            break;
        case tuple:
            return(TupleFormulaeDepth(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements));
            break;
        case ite_formula:
            return(1 + MaximumOfInt(FormulaDepth(
Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue),
FormulaDepth(Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse)));
            break;
        case let_formula:
            return(1 + FormulaDepth(
Formula->FormulaUnion.LetFormula.LetBody));
            break;
        default:
            CodingError("Invalid formula type for measuring depth");
            return(0);
            break;
    }
}
//-----------------------------------------------------------------------------
int AnnotatedFormulaDepth(ANNOTATEDFORMULA AnnotatedFormula) {

    if (LogicalAnnotatedFormula(AnnotatedFormula)) {
        return(FormulaDepth(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.FormulaWithVariables->Formula));
    } else {
        return(-1);
    }
}
//-----------------------------------------------------------------------------
int MaxTermDepth(TERM Term) {

    int MaxDepth;
    int Index;

    if (Term->Type == ite_term) {
        return(
MaximumOfInt(MaxFormulaTermDepth(Term->TheSymbol.ConditionalTerm.Condition),
MaximumOfInt(MaxTermDepth(Term->TheSymbol.ConditionalTerm.TermIfTrue),
MaxTermDepth(Term->TheSymbol.ConditionalTerm.TermIfFalse))));
    } else if (Term->Type == let_term) {
        return(MaxTermDepth(Term->TheSymbol.LetTerm.LetBody));
    } else {
        MaxDepth = 0;
        for (Index = 0; Index < GetArity(Term); Index++) {
            MaxDepth = MaximumOfInt(MaxDepth,MaxTermDepth(
Term->Arguments[Index]));
        }
        return(1 + MaxDepth);
    }
}
//-----------------------------------------------------------------------------
int MaxTupleFormulaeTermDepth(int NumberOfElements,FORMULAArray TupleFormulae) {

    int ElementNumber;
    int MaximalDepth;

    MaximalDepth = 0;
    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        MaximalDepth = MaximumOfInt(MaximalDepth,MaxFormulaTermDepth(
TupleFormulae[ElementNumber]));
    }
    return(MaximalDepth);
}
//-----------------------------------------------------------------------------
int MaxFormulaTermDepth(FORMULA Formula) {

    switch(Formula->Type) {
        case sequent:
            return(MaximumOfInt(MaxTupleFormulaeTermDepth(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS),
MaxTupleFormulaeTermDepth(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS)));
        case quantified:
            return(MaxFormulaTermDepth(
Formula->FormulaUnion.QuantifiedFormula.Formula));
            break;
        case binary:
            return(MaximumOfInt(
MaxFormulaTermDepth(Formula->FormulaUnion.BinaryFormula.LHS),
MaxFormulaTermDepth(Formula->FormulaUnion.BinaryFormula.RHS)));
            break;
        case unary:
            return(MaxFormulaTermDepth(
Formula->FormulaUnion.UnaryFormula.Formula));
            break;
        case atom:
            return(MaxTermDepth(Formula->FormulaUnion.Atom)-1);
//----Minus 1 because the predicate doesn't count
            break;
        case tuple:
            return(MaxTupleFormulaeTermDepth(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements));
            break;
        case ite_formula:
            return(MaximumOfInt(
MaxFormulaTermDepth(Formula->FormulaUnion.ConditionalFormula.Condition),
MaximumOfInt(
MaxFormulaTermDepth(Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue),
MaxFormulaTermDepth(Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse))));
            break;
        case let_formula:
            return(
MaxFormulaTermDepth(Formula->FormulaUnion.LetFormula.LetBody));
            break;
        default:
            CodingError("Invalid formula type for max term depth\n");
            return(0);
            break;
    }
}
//-----------------------------------------------------------------------------
int MaxAnnotatedFormulaTermDepth(ANNOTATEDFORMULA AnnotatedFormula) {

    if (LogicalAnnotatedFormula(AnnotatedFormula)) {
        return(MaxFormulaTermDepth(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.FormulaWithVariables->Formula));
    } else {
        return(-1);
    }
}
//-----------------------------------------------------------------------------
int SumTermDepth(TERM Atom) {

    int SumDepth;
    int Index;
    
    SumDepth = 0;
    for (Index = 0; Index < GetArity(Atom); Index++) {
        SumDepth += MaxTermDepth(Atom->Arguments[Index]);
    }

    return(SumDepth);
}
//-----------------------------------------------------------------------------
int SumTupleFormulaeTermDepth(int NumberOfElements,FORMULAArray TupleFormulae) {

    int ElementNumber;
    int TotalDepth;

    TotalDepth = 0;
    for (ElementNumber = 0;ElementNumber < NumberOfElements;ElementNumber++) {
        TotalDepth += SumFormulaTermDepth(TupleFormulae[ElementNumber]);
    }
    return(TotalDepth);
}
//-----------------------------------------------------------------------------
int SumFormulaTermDepth(FORMULA Formula) {

    switch(Formula->Type) {
        case sequent:
            return(SumTupleFormulaeTermDepth(
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS) +
SumTupleFormulaeTermDepth(
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS));
        case quantified:
            return(SumFormulaTermDepth(
Formula->FormulaUnion.QuantifiedFormula.Formula));
            break;
        case binary:
            return(
SumFormulaTermDepth(Formula->FormulaUnion.BinaryFormula.LHS) + 
SumFormulaTermDepth(Formula->FormulaUnion.BinaryFormula.RHS));
            break;
        case unary:
            return(SumFormulaTermDepth(
Formula->FormulaUnion.UnaryFormula.Formula));
            break;
        case atom:
            return(SumTermDepth(Formula->FormulaUnion.Atom));
            break;
        case tuple:
            return(SumTupleFormulaeTermDepth(
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements));
            break;
        case ite_formula:
            return(
SumFormulaTermDepth(Formula->FormulaUnion.ConditionalFormula.Condition) + 
SumFormulaTermDepth(Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue) + 
SumFormulaTermDepth(Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse));
            break;
        case let_formula:
            return(
SumFormulaTermDepth(Formula->FormulaUnion.LetFormula.LetBody));
            break;
        default:
            CodingError("Invalid formula type for max term depth");
            return(0);
            break;
    }
}
//-----------------------------------------------------------------------------
int SumAnnotatedFormulaTermDepth(ANNOTATEDFORMULA AnnotatedFormula) {

    if (LogicalAnnotatedFormula(AnnotatedFormula)) {
        return(SumFormulaTermDepth(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.FormulaWithVariables->Formula));
    } else {
        return(-1);
    }
}
//-----------------------------------------------------------------------------
SyntaxType GetSyntax(ANNOTATEDFORMULA AnnotatedFormula) {

    assert(AnnotatedFormula != NULL);
    return(AnnotatedFormula->Syntax);
}
//-----------------------------------------------------------------------------
SyntaxType GetListSyntax(LISTNODE Head) {

    SyntaxType SyntaxOfFirstAnnotatedFormula;

    SyntaxOfFirstAnnotatedFormula = nontype;
    while (Head != NULL && !LogicalAnnotatedFormula(Head->AnnotatedFormula)) {
        Head = Head->Next;
    }
    if (Head != NULL) {
        SyntaxOfFirstAnnotatedFormula = GetSyntax(Head->AnnotatedFormula);
        Head = Head->Next;
        while (Head != NULL) {
            if (LogicalAnnotatedFormula(Head->AnnotatedFormula) &&
SyntaxOfFirstAnnotatedFormula != GetSyntax(Head->AnnotatedFormula)) {
                return(tptp_mixed);
            }
            Head = Head->Next;
        }
    }
    return(SyntaxOfFirstAnnotatedFormula);
}
//-----------------------------------------------------------------------------
void GetListSyntaxTypes(LISTNODE Head,String SyntaxTypes) {

    int Syntax;
    LISTNODE Node;

    strcpy(SyntaxTypes,"");

    for (Syntax=tptp_tpi;Syntax<=tptp_cnf;Syntax++) {
        Node = Head;
        while (Node != NULL) {
            if (GetSyntax(Node->AnnotatedFormula) == Syntax) {
                strcat(SyntaxTypes,SyntaxToString((SyntaxType)Syntax));
                strcat(SyntaxTypes,"\n");
                Node = NULL;
            } else {
                Node = Node->Next;
            }
        }
    }
}
//-----------------------------------------------------------------------------
//----If PutNameHere is NULL, return pointer to original, else copy into
//----PutNameHere and return pointer to that
char * GetName(ANNOTATEDFORMULA AnnotatedFormula,char * PutNameHere) {

    if (ReallyAnAnnotatedFormula(AnnotatedFormula)) {
        if (PutNameHere == NULL) {
            return(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.Name);
        } else {
            strcpy(PutNameHere,
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name);
            return(PutNameHere);
        }
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
StatusType GetRole(ANNOTATEDFORMULA AnnotatedFormula,StatusType * SubStatus) {

    if (AnnotatedFormula == NULL) {
        CodingError("No formula in GetRole");
    }

    if (ReallyAnAnnotatedFormula(AnnotatedFormula)) {
//----Return the substatus only if the pointer is non-NULL
        if (SubStatus != NULL) {
            *SubStatus = AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.SubStatus;
        }
        return(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status);
    } else {
        return(nonstatus);
    }
}
//-----------------------------------------------------------------------------
FORMULA GetUniversalCoreFormula(FORMULA QuantifiedFormula) {

    while (QuantifiedFormula->Type == quantified &&
QuantifiedFormula->FormulaUnion.QuantifiedFormula.Quantifier == universal) {
        QuantifiedFormula = QuantifiedFormula->FormulaUnion.QuantifiedFormula.
Formula;
    }

    return(QuantifiedFormula);
}
//-----------------------------------------------------------------------------
int ThereIsAConjecture(LISTNODE Head) {

    StatusType Role;

    while (Head != NULL) {
        if ((Role = GetRole(Head->AnnotatedFormula,NULL)) == conjecture ||
Role == negated_conjecture || Role == question) {
            return(1);
        }
        Head = Head->Next;
    }

    return(0);
}
//-----------------------------------------------------------------------------
FORMULA GetLiteralFromClauseByNumber(FORMULA Clause,int Number) {

    if (Clause->Type == binary) {
        if (Number == 1) {
            return(Clause->FormulaUnion.BinaryFormula.LHS);
        } else {
            return(GetLiteralFromClauseByNumber(
Clause->FormulaUnion.BinaryFormula.RHS,Number-1));
        }
    } else if ((Clause->Type == unary || Clause->Type == atom) && Number == 1) {
        return(Clause);
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
FORMULA GetLiteralFromAnnotatedClauseByNumber(ANNOTATEDFORMULA AnnotatedClause,
int Number) {

//    FORMULAWITHVARIABLES FormulaWithVariables;

    if (CheckAnnotatedFormula(AnnotatedClause,tptp_cnf)) {
//        FormulaWithVariables = AnnotatedClause->
//AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables;
        return(GetLiteralFromClauseByNumber(AnnotatedClause->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula,
Number));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
TERM GetSourceTERM(ANNOTATEDFORMULA AnnotatedFormula,char * SourceSymbol) {

    if (!ReallyAnAnnotatedFormula(AnnotatedFormula) || 
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source == NULL) {
        return(NULL);
    }

    if (SourceSymbol == NULL ||
!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source),SourceSymbol)) {
        return(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source);
    }
    return(NULL);
}
//-----------------------------------------------------------------------------
char * GetSource(ANNOTATEDFORMULA AnnotatedFormula) {

    TERM SourceTerm;

    if ((SourceTerm = GetSourceTERM(AnnotatedFormula,NULL)) != NULL) {
        return(GetSymbol(SourceTerm));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetSourceTerm(ANNOTATEDFORMULA AnnotatedFormula,char * PutInfoHere) {

    TERM SourceTerm;

    if ((SourceTerm = GetSourceTERM(AnnotatedFormula,NULL)) != NULL) {
        return(TSTPTermToString(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.Source,PutInfoHere));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
TERM GetInferenceRuleTERM(ANNOTATEDFORMULA AnnotatedFormula) {

    if (DerivedAnnotatedFormula(AnnotatedFormula) &&
//----Source is an inference term
!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source),"inference")) {
        return(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source->Arguments[0]);
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetInferenceRule(ANNOTATEDFORMULA AnnotatedFormula,char * PutNameHere) {

    char * Buffer;
    int BufferSize;

    if (DerivedAnnotatedFormula(AnnotatedFormula)) {
//----Source is an inference term
        if (!strcmp(GetSymbol(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source),"inference")) {
            return(TSTPTermToString(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.Source->Arguments[0],PutNameHere));
        } else {
//----Must be a plain copy of another, no inference rule
            MakeBuffer(&Buffer,&BufferSize);
            return(BufferReturn(&Buffer,PutNameHere));
        }
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
TERM GetSourceInfoTERMFromSourceInfo(TERM InferenceInfo,char * Symbol,
char * InferenceRuleName,int * Index) {

    String FinalSymbol;

    if (!strcmp(Symbol,"__inference_rule__")) {
        strcpy(FinalSymbol,InferenceRuleName);
    } else {
        strcpy(FinalSymbol,Symbol);
    }
    for ( ; *Index < InferenceInfo->FlexibleArity; (*Index)++) {
        if (!strcmp(FinalSymbol,InferenceInfo->Arguments[*Index]->TheSymbol.
NonVariable->NameSymbol)) {
            return(InferenceInfo->Arguments[*Index]);
        }
    }
    return(NULL);
}
//-----------------------------------------------------------------------------
void DoGetInferenceInfoTERMsFromInferenceRecord(TERM InferenceRecord,
char * Symbol,TERMArray * ArrayOfInfoTERMs,int * NumberOfTerms) {

    TERM ThisInfoTERM;
    TERM ParentsList;
    int Index;

//----Check that it's an inference record with a list of parents
    if (GetArity(InferenceRecord) != 3 ||
!LooksLikeAList(InferenceRecord->Arguments[2],-1,-1)) {
        CodingError("Getting inference info from malformed inference record");
    }

    Index = 0;
    while ((ThisInfoTERM = GetSourceInfoTERMFromSourceInfo(InferenceRecord->
Arguments[1],Symbol,GetSymbol(InferenceRecord->Arguments[0]),&Index)) != NULL) {
        (*NumberOfTerms)++;
        *ArrayOfInfoTERMs = (TERMArray)Realloc((void *)*ArrayOfInfoTERMs,
(*NumberOfTerms) * sizeof(TERM));
        (*ArrayOfInfoTERMs)[(*NumberOfTerms) - 1] = ThisInfoTERM;
        Index++;
    }

//----Now look in the parents list for nested inferences
    ParentsList = InferenceRecord->Arguments[2];
    for (Index=0;Index < ParentsList->FlexibleArity;Index++) {
        if (!strcmp(GetSymbol(ParentsList->Arguments[Index]),"inference")) {
            DoGetInferenceInfoTERMsFromInferenceRecord(ParentsList->
Arguments[Index],Symbol,ArrayOfInfoTERMs,NumberOfTerms);
        }
    }
}
//-----------------------------------------------------------------------------
//----Gets one from this layer, then looks through the parents to get more
//----from nested inference records
void GetInferenceInfoTERMsFromInferenceRecord(TERM InferenceRecord,
char * Symbol,TERMArray * ArrayOfInfoTERMs,int * NumberOfTerms) {

    *NumberOfTerms = 0;
    DoGetInferenceInfoTERMsFromInferenceRecord(InferenceRecord,Symbol,
ArrayOfInfoTERMs,NumberOfTerms);
}
//-----------------------------------------------------------------------------
TERMArray GetInferenceInfoTERMs(ANNOTATEDFORMULA AnnotatedFormula,
char * Symbol,int * NumberOfTerms) {

    TERMArray ArrayOfInfoTERMs;

    ArrayOfInfoTERMs = NULL;
    *NumberOfTerms = 0;
    if (LogicalAnnotatedFormula(AnnotatedFormula) &&
//----It's derived
DerivedAnnotatedFormula(AnnotatedFormula) &&
//----Source is an inference term
!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source),"inference")) {
        GetInferenceInfoTERMsFromInferenceRecord(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source,Symbol,
&ArrayOfInfoTERMs,NumberOfTerms);
    }
    return(ArrayOfInfoTERMs);
}
//-----------------------------------------------------------------------------
TERM GetSourceInfoTERM(ANNOTATEDFORMULA AnnotatedFormula,char * SourceSymbol,
char * InfoTermSymbol) {

    int Index;

//DEBUG printf("SourceSymbol %s InfoTermSymbol %s\n",SourceSymbol,InfoTermSymbol);
//----Source is any or as specified
    if ((SourceSymbol == NULL ||
!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source),SourceSymbol)) &&
//----Must have at least two arguments
GetArity(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source)
>= 2 &&
//----The second argument must look like a list
LooksLikeAList(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
Source->Arguments[1],-1,-1)) {
        Index = 0;
        return(GetSourceInfoTERMFromSourceInfo(AnnotatedFormula-> 
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source->Arguments[1],InfoTermSymbol,
GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source->
Arguments[0]),&Index));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetSourceInfoTerm(ANNOTATEDFORMULA AnnotatedFormula,char * SourceSymbol,
char * InfoTermSymbol,char * PutInfoHere) {

    TERM SourceTerm;

    if ((SourceTerm = GetSourceInfoTERM(AnnotatedFormula,SourceSymbol,
InfoTermSymbol)) != NULL) {
        return(TSTPTermToString(SourceTerm,PutInfoHere));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
TERM GetInferenceInfoTERM(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol) {

    if (DerivedAnnotatedFormula(AnnotatedFormula)) {
        return(GetSourceInfoTERM(AnnotatedFormula,"inference",Symbol));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
//----Gets a useful info term from an inference source
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetInferenceInfoTerm(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol,
char * PutInfoHere) {

    TERM InferenceTerm;

    if ((InferenceTerm = GetInferenceInfoTERM(AnnotatedFormula,Symbol)) != 
NULL) {
        return(TSTPTermToString(InferenceTerm,PutInfoHere));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and 
//----take responsibility for the malloced memory.
SZSResultArray GetInferenceSZSStatuses(ANNOTATEDFORMULA AnnotatedFormula,
SZSResultArray ArrayOfSZSStatuses,int * NumberOfSZSResults) {

    TERMArray ArrayOfStatusTERMs;
    int NumberOfTerms;
    int Index;

    ArrayOfStatusTERMs = GetInferenceInfoTERMs(AnnotatedFormula,"status",
&NumberOfTerms);
    if (NumberOfTerms == 0) {
        if (ArrayOfStatusTERMs != NULL) {
            Free((void **)&ArrayOfStatusTERMs);
        }
        *NumberOfSZSResults = 0;
        return(NULL);
    } else {
        if (ArrayOfSZSStatuses == NULL) {
            ArrayOfSZSStatuses = (SZSResultArray)Malloc(NumberOfTerms * 
sizeof(SZSResultType));
        }
        for (Index=0;Index<NumberOfTerms;Index++) {
            ArrayOfSZSStatuses[Index] = StringToSZSResult(
ArrayOfStatusTERMs[Index]->Arguments[0]->TheSymbol.NonVariable->NameSymbol);
        }
        if (ArrayOfStatusTERMs != NULL) {
            Free((void **)&ArrayOfStatusTERMs);
        }
        *NumberOfSZSResults = NumberOfTerms;
        return(ArrayOfSZSStatuses);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and 
//----take responsibility for the malloced memory.
char * GetInferenceStatus(ANNOTATEDFORMULA AnnotatedFormula,char * SZSStatus) {

    char * Buffer;

    Buffer = GetInferenceInfoTerm(AnnotatedFormula,"status",NULL);
    if (Buffer == NULL) {
        return(NULL);
    }
    if (!ExtractTermArguments(Buffer)) {
        Free((void **)&Buffer);
        return(NULL);
    }
    return(BufferReturn(&Buffer,SZSStatus));
}
//-----------------------------------------------------------------------------
char * GetDischargedNames(ANNOTATEDFORMULA AnnotatedFormula,
TERM * DischargeList) {

    TERMArray ArrayOfInfoTERMs;
    int NumberOfTerms;
    int Index;
    char * Buffer;
    int BufferSize;
    int NameIndex;

    MakeBuffer(&Buffer,&BufferSize);
    ArrayOfInfoTERMs = GetInferenceInfoTERMs(AnnotatedFormula,
"__inference_rule__",&NumberOfTerms);
    for (Index=0;Index < NumberOfTerms;Index++) {
        if (GetArity(ArrayOfInfoTERMs[Index]) == 2 &&
!strcmp(GetSymbol(ArrayOfInfoTERMs[Index]->Arguments[0]),"discharge")) {
            if (!LooksLikeAList(ArrayOfInfoTERMs[Index]->Arguments[1],-1,-1)) {
                CodingError("No list of discharged assumptions");
            }
//----This assumes only one discharge list, which is prolly true
            *DischargeList = ArrayOfInfoTERMs[Index]->Arguments[1];
            for (NameIndex=0;NameIndex < GetArity(ArrayOfInfoTERMs[Index]->
Arguments[1]);NameIndex++) {
                ExtendString(&Buffer,GetSymbol(ArrayOfInfoTERMs[Index]->
Arguments[1]->Arguments[NameIndex]),&BufferSize);
                ExtendString(&Buffer,",",&BufferSize);
            }
        }
    }
    if (ArrayOfInfoTERMs != NULL) {
        Free((void **)&ArrayOfInfoTERMs);
    }
//----Check if any discharges found
    if (strlen(Buffer) == 0) {
        Free((void **)&Buffer);
    }
    return(Buffer);
}
//-----------------------------------------------------------------------------
//----Get a list of assumptions in Malloced memory. User must Free the memory.
char * ExtractAssumptionsList(TERM AssumptionsTerm) {

    char * Buffer;
    int BufferSize;
    int Index;
    TERM TheList;

    if (AssumptionsTerm == NULL || GetArity(AssumptionsTerm) != 1 || 
!LooksLikeAList(AssumptionsTerm->Arguments[0],-1,-1)) {
        CodingError("Illformed assumptions record");
    }
    TheList = AssumptionsTerm->Arguments[0];
//----Check for empty list
    if (GetArity(TheList) == 0) {
        return(NULL);
    } else {
        MakeBuffer(&Buffer,&BufferSize);
        for (Index=0;Index < GetArity(TheList);Index++) {
            ExtendString(&Buffer,GetSymbol(TheList->Arguments[Index]),
&BufferSize);
            ExtendString(&Buffer,",",&BufferSize);
        }
        return(Buffer);
    }
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetOneParentNames(TERM ParentSource,char * PutNamesHere) {

    char * Buffer;
    int BufferSize;

//----Build in malloced memory
    MakeBuffer(&Buffer,&BufferSize);

//----If an atom, return that name
    if (GetArity(ParentSource) == 0) {
        ExtendString(&Buffer,GetSymbol(ParentSource),&BufferSize);
        ExtendString(&Buffer,"\n",&BufferSize);
//----If a theory
    } else if (!strcmp(GetSymbol(ParentSource),"theory")) {
        ExtendAndFree(&Buffer,TSTPTermToString(ParentSource,NULL),&BufferSize);
        ExtendString(&Buffer,"\n",&BufferSize);
//----If an atom with extra information about the inference
    } else if (!strcmp(GetSymbol(ParentSource),":") && GetArity(ParentSource) 
== 2) {
        ExtendString(&Buffer,GetSymbol(ParentSource->Arguments[0]),&BufferSize);
        ExtendString(&Buffer,"\n",&BufferSize);
//----If a nested inference record
    } else if (!strcmp(GetSymbol(ParentSource),"inference")) {
        ExtendAndFree(&Buffer,GetInferenceParentNames(ParentSource,NULL),
&BufferSize);
    } 

    return(BufferReturn(&Buffer,PutNamesHere));
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetInferenceParentNames(TERM InferenceTerm,char * PutNamesHere) {

    int Index;
    char * Buffer;
    int BufferSize;

//----Check that it's an inference record with a list of parents
    if (GetArity(InferenceTerm) != 3 ||
GetSymbol(InferenceTerm->Arguments[2])[0] != '[') {
        CodingError("Getting parent names from malformed inference record");
    }

//----Build in malloced memory
    MakeBuffer(&Buffer,&BufferSize);

    for (Index = 0; Index < GetArity(InferenceTerm->Arguments[2]); Index++) {
        ExtendAndFree(&Buffer,GetOneParentNames(InferenceTerm->Arguments[2]->
Arguments[Index],NULL),&BufferSize);
    }

    return(BufferReturn(&Buffer,PutNamesHere));
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetParentNames(ANNOTATEDFORMULA AnnotatedFormula,char * PutNamesHere) {

    char * Buffer;
    int BufferSize;

//----Check it's an annotated formula
    if (LogicalAnnotatedFormula(AnnotatedFormula)) {
//----Check if it's derived and it has a source
        if (DerivedAnnotatedFormula(AnnotatedFormula)) {
//----Check if it's an inference
            if (InferredAnnotatedFormula(AnnotatedFormula)) {
                Buffer = GetInferenceParentNames(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source,NULL);
            } else {
//----Must be the name of a node directly
                MakeBuffer(&Buffer,&BufferSize);
                ExtendString(&Buffer,GetSymbol(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source),&BufferSize);
                ExtendString(&Buffer,"\n",&BufferSize);
            }
        } else {
            MakeBuffer(&Buffer,&BufferSize);
        }
    } else {
//----Something wrong
        CodingError("Getting parent names from non-formula");
    }

    return(BufferReturn(&Buffer,PutNamesHere));
}
//-----------------------------------------------------------------------------
//----Same as GetParentNames but no theory names
char * GetNodeParentNames(ANNOTATEDFORMULA AnnotatedFormula,
char * PutNamesHere) {

    char * Buffer;
    char * StartOfTheory;
    char * EndOfTheory;

    Buffer = GetParentNames(AnnotatedFormula,NULL);
    while ((StartOfTheory = strstr(Buffer,"theory(")) != NULL) {
        EndOfTheory = strchr(StartOfTheory,'\n');
        strcpy(StartOfTheory,EndOfTheory+1);
    }

    return(BufferReturn(&Buffer,PutNamesHere));
}
//-----------------------------------------------------------------------------
int GetNodeParentList(ANNOTATEDFORMULA AnnotatedFormula,LISTNODE Head,
LISTNODE * Parents) {

    char * AllParentNames;
    int NumberOfParents;
    StringParts ParentNames;

    *Parents = NULL;
    AllParentNames = GetNodeParentNames(AnnotatedFormula,NULL);
    NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
    if (!GetNodesForNames(Head,ParentNames,NumberOfParents,Parents)) {
        Free((void **)&AllParentNames);
        return(0);
    }
    Free((void **)&AllParentNames);
    return(1);
}
//-----------------------------------------------------------------------------
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetFileSourceNameAndNode(ANNOTATEDFORMULA AnnotatedFormula,
char * PutResultHere) {

    TERM FileTerm;
    char * Buffer;
    int BufferSize;

//----Formula is OK
    if (ReallyAnAnnotatedFormula(AnnotatedFormula) &&
//----File source
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source != NULL &&
!strcmp(GetSymbol(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source),"file")) {
//----Build in malloced memory
        MakeBuffer(&Buffer,&BufferSize);
//----Build the parts
        FileTerm = AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source;
        ExtendAndFree(&Buffer,TSTPTermToString(FileTerm->Arguments[0],NULL),
&BufferSize);
        ExtendString(&Buffer,"\n",&BufferSize);
//----Check if the node name is given
        if (GetArity(FileTerm) > 1) {
            ExtendAndFree(&Buffer,TSTPTermToString(FileTerm->Arguments[1],NULL),
&BufferSize);
        } else {
            ExtendString(&Buffer,"unknown",&BufferSize);
        }
        return(BufferReturn(&Buffer,PutResultHere));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
TERM GetUsefulInfoTERM(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol,
int OccurenceNumber) {

    TERM UsefulInfo;
    int Index;

    if (!ReallyAnAnnotatedFormula(AnnotatedFormula)) {
        CodingError("Trying to get useful info from a non-formula");
    }

//----It has useful info
    if (AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo != NULL) {
        UsefulInfo = AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo;
        for (Index = 0; Index < UsefulInfo->FlexibleArity; Index++) {
            if (!strcmp(Symbol,UsefulInfo->Arguments[Index]->
TheSymbol.NonVariable->NameSymbol) && 
(OccurenceNumber < 0 || --OccurenceNumber == 0)) {
                return(UsefulInfo->Arguments[Index]);
            }
        }
    }
    return(NULL);

}
//-----------------------------------------------------------------------------
//----Gets a term from the useful info global to a CNF/FOF node
//----Calling routine must provide enough space for info, or send NULL and
//----take responsibility for the malloced memory.
char * GetUsefulInfoTerm(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol,
int OccurenceNumber,char * PutInfoHere) {

    TERM UsefulTerm;

    if ((UsefulTerm = GetUsefulInfoTERM(AnnotatedFormula,Symbol,
OccurenceNumber)) != NULL) {
        return(TSTPTermToString(UsefulTerm,PutInfoHere));
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
