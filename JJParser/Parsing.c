#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "Parsing.h"
#include "Tokenizer.h"
#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "Signature.h"
#include "Examine.h"
#include "List.h"
#include "ParseTSTP.h"
#include "ParseTPTP.h"
#include "PrintTSTP.h"
//-----------------------------------------------------------------------------
static int AllowFreeVariables = 0;
static int AllowFOFNumbers = 0;
//-----------------------------------------------------------------------------
void SetAllowFreeVariables(int OnOff) {

    AllowFreeVariables = OnOff;
}
//-----------------------------------------------------------------------------
void SetAllowFOFNumbers(int OnOff) {

    AllowFOFNumbers = OnOff;
}
//-----------------------------------------------------------------------------
void IncreaseVariableUseCount(VARIABLENODE Variable,int HowMuch) {

    Variable->NumberOfUses += HowMuch;
    IncreaseSymbolUseCount(Variable->VariableName,HowMuch);
}
//-----------------------------------------------------------------------------
void PrintVariableList(VARIABLENODE Variables,VARIABLENODE EndOfScope) {

    printf("Formula variables: ");
    if (EndOfScope == NULL) {
        printf("(EndOfScope is NULL): ");
    } 
    while (Variables != NULL) {
        printf("%s/%d(%d)@%p ",GetSignatureSymbol(Variables->VariableName),
GetSignatureArity(Variables->VariableName),Variables->NumberOfUses,Variables);
        if (Variables == EndOfScope) {
            printf("--- end of scope ---\n");
        }
        Variables = Variables->NextVariable;
    }
    printf("\n");
}
//-----------------------------------------------------------------------------
VARIABLENODE IsVariableInList(VARIABLENODE List,VARIABLENODE EndOfScope,
char * Name) {

    VARIABLENODE NodeFound;

//DEBUG printf("about to start search for %s in list ...\n",Name);
//DEBUG PrintVariableList(List,EndOfScope);
    NodeFound = NULL;
//----Need the last with this name in list up to end of scope. Last to get
//----smallest scope
    while (EndOfScope != NULL && List != NULL) {
//----If found then woohoo
//DEBUG printf("looking for %s, looking at %s\n",Name,GetSignatureSymbol(List->VariableName));
        if (!strcmp(GetSignatureSymbol(List->VariableName),Name)) {
            NodeFound = List;
        }
//----If at end of scope then not found
        if (List == EndOfScope) {
            return(NodeFound);
        }
//----Otherwise move on down the list
        List = List->NextVariable;
    }

    return(NodeFound);
}
//-----------------------------------------------------------------------------
VARIABLENODE NewVariable(void) {

    VARIABLENODE NewVariable;

    NewVariable = (VARIABLENODE)Malloc(sizeof(VariableNodeType));
    NewVariable->NumberOfUses = 0;
    NewVariable->Quantification = none;
    NewVariable->Instantiation = NULL;
    NewVariable->VariableName = NULL;
    NewVariable->NextVariable = NULL;

    return(NewVariable);
}
//-----------------------------------------------------------------------------
void RemoveVariable(VARIABLENODE * Variables,VARIABLENODE * Variable) {

//----Variables points to the pointer to the first element of the list of
//----variable node. Variable points to the pointer to the one to remove.
//----Search down the list.
    while (*Variables != NULL && *Variables != *Variable) {
        Variables = &((*Variables)->NextVariable);
    }

    if (*Variables == NULL) {
        CodingError("Tried to remove a non-existent variable");
    }

//----Bypass in the list
    *Variables = (*Variables)->NextVariable;
//----Remove the list element
    Free((void **)Variable);
}
//-----------------------------------------------------------------------------
VARIABLENODE InsertVariable(READFILE Stream,SIGNATURE Signature,
VARIABLENODE * Variables,VARIABLENODE * EndOfScope,int ForceNew,
char * VariableName,ConnectiveType Quantification,
int MustBeQuantifiedAlready) {

    VARIABLENODE Variable;
    VARIABLENODE FoundVariable;

//DEBUG printf("Variable %s forced = %d allowfree = %d mbqa = %d\n",VariableName,ForceNew,AllowFreeVariables,MustBeQuantifiedAlready);
//DEBUG PrintVariableList(*Variables,*EndOfScope);

    FoundVariable = IsVariableInList(*Variables,*EndOfScope,VariableName);

//----Bail if not quantified
    if (!AllowFreeVariables && MustBeQuantifiedAlready && 
Quantification == free_variable && FoundVariable == NULL) {
        TokenError(Stream);
    }

//----Check if variable exists in the current scope
    if (!ForceNew && FoundVariable != NULL) {
//DEBUG printf("Found variable %s  in the list\n",VariableName);
        IncreaseVariableUseCount(FoundVariable,1);
        return(FoundVariable);
    } else {

//----Add new variable
        Variable = NewVariable();
        Variable->NumberOfUses = 1;
        Variable->Quantification = Quantification;
        Variable->Instantiation = NULL;
        Variable->VariableName = InsertIntoSignature(Signature,variable,
VariableName,0,NULL);

//----If a tolerated free variable, add at top and don't change context
        if (FoundVariable == NULL && Quantification == free_variable &&
AllowFreeVariables) {
//DEBUG printf("Adding free variable %s\n",VariableName);
            Variable->NextVariable = (*Variables);
            *Variables = Variable;
            if (*EndOfScope == NULL) {
                *EndOfScope = Variable;
            }
//DEBUG PrintVariableList(*Variables,*EndOfScope);
        } else {
//----If the top of the formula's variable list, then update the context
            if (*EndOfScope == NULL) {
                Variable->NextVariable = (*Variables);
                *Variables = Variable;
            } else {
//----Otherwise add after the end of scope
                assert(*Variables != NULL);
                Variable->NextVariable = (*EndOfScope)->NextVariable;
                (*EndOfScope)->NextVariable = Variable;
            }
//----This new variable is the new end of scope
            *EndOfScope = Variable;
        }
//DEBUG PrintVariableList(*Variables,*EndOfScope);
        return(Variable);
    }
}
//-----------------------------------------------------------------------------
VARIABLENODE ParallelCopyVariableList(VARIABLENODE Original) {

    VARIABLENODE Copy;

    if (Original == NULL) {
        return(NULL);
    } else {
        Copy = NewVariable();
        *Copy = *Original;
        Copy->NumberOfUses = 0;
        Copy->Instantiation = (TERM)Original;
        Copy->NextVariable = ParallelCopyVariableList(Original->NextVariable);
        return(Copy);
    }

}
//-----------------------------------------------------------------------------
void ParallelCopyVariableInstantiations(VARIABLENODE Original,
VARIABLENODE Copy) {

    if (Original == NULL) {
        if (Copy == NULL) {
            return;
        } else {
            CodingError("Different length variable lists from duplication");
        }
    } else {
        Copy->Instantiation = Original->Instantiation;
        ParallelCopyVariableInstantiations(Original->NextVariable,
Copy->NextVariable);
    }
}
//-----------------------------------------------------------------------------
TERM NewTerm(void) {

    TERM Term;

    Term = (TERM)Malloc(sizeof(TermNodeType));
    Term->Type = nonterm;
    Term->FlexibleArity = -1;
    Term->TheSymbol.Variable = NULL;
    Term->Arguments = NULL;

    return(Term);
}
//-----------------------------------------------------------------------------
TERMWITHVARIABLES NewTermWithVariables(void) {

    TERMWITHVARIABLES TermWithVariables;

    TermWithVariables = 
(TERMWITHVARIABLES)Malloc(sizeof(TermWithVariablesType));
    TermWithVariables->Term = NULL;
    TermWithVariables->Variables = NULL;

    return(TermWithVariables);
}
//-----------------------------------------------------------------------------
void FreeTerm(TERM * Term,VARIABLENODE * Variables) {

    int ArgumentIndex;

    if ((*Term) != NULL) {
        if ((*Term)->Type == variable) {
            (*Term)->TheSymbol.Variable->VariableName->NumberOfUses--;
            (*Term)->TheSymbol.Variable->NumberOfUses--;
            if ((*Term)->TheSymbol.Variable->NumberOfUses == 0) {
                RemoveVariable(Variables,&((*Term)->TheSymbol.Variable));
                assert((*Term)->TheSymbol.Variable == NULL);
            }
        } else if ((*Term)->Type == formula) {
            FreeFormula(&((*Term)->TheSymbol.Formula),Variables);
        } else if ((*Term)->Type == nested_thf || 
(*Term)->Type == nested_tff || (*Term)->Type == nested_tcf ||
(*Term)->Type == nested_fof || (*Term)->Type == nested_cnf) {
            FreeFormulaWithVariables(&((*Term)->TheSymbol.NestedFormula));
        } else if ((*Term)->Type == nested_fot) {
            FreeTermWithVariables(&((*Term)->TheSymbol.NestedTerm));
        } else if ((*Term)->Type == ite_term) {
            FreeFormula(&((*Term)->TheSymbol.ConditionalTerm.Condition),
Variables);
            FreeTerm(&((*Term)->TheSymbol.ConditionalTerm.TermIfTrue),
Variables);
            FreeTerm(&((*Term)->TheSymbol.ConditionalTerm.TermIfFalse),
Variables);
        } else if ((*Term)->Type == let_term) {
            FreeFormula(&((*Term)->TheSymbol.LetTerm.LetTypes),
Variables);
            FreeFormula(&((*Term)->TheSymbol.LetTerm.LetDefn),
Variables);
            FreeTerm(&((*Term)->TheSymbol.LetTerm.LetBody),
Variables);
        } else {
            for (ArgumentIndex=0;ArgumentIndex<GetArity(*Term);
ArgumentIndex++) {
                FreeTerm(&((*Term)->Arguments[ArgumentIndex]),Variables);
                assert((*Term)->Arguments[ArgumentIndex] == NULL);
            }
            if ((*Term)->Arguments != NULL) {
                Free((void **)&((*Term)->Arguments));
            }
            (*Term)->TheSymbol.NonVariable->NumberOfUses--;
        }
        Free((void **)Term);
    }
}
//-----------------------------------------------------------------------------
void FreeTermWithVariables(TERMWITHVARIABLES * TermWithVariables) {

    if (*TermWithVariables != NULL) {
        FreeTerm(&((*TermWithVariables)->Term),
&((*TermWithVariables)->Variables));
        assert((*TermWithVariables)->Term == NULL);
        assert((*TermWithVariables)->Variables == NULL);
        Free((void **)TermWithVariables);
    }
}
//-----------------------------------------------------------------------------
FORMULA NewFormula(void) {

    FORMULA Formula;

    Formula = (FORMULA)Malloc(sizeof(FormulaType));
    Formula->Type = nonformulatype;

    return(Formula);
}
//-----------------------------------------------------------------------------
FORMULAWITHVARIABLES NewFormulaWithVariables(void) {

    FORMULAWITHVARIABLES FormulaWithVariables;

    FormulaWithVariables = 
(FORMULAWITHVARIABLES)Malloc(sizeof(FormulaWithVariablesType));
    FormulaWithVariables->Formula = NULL;
    FormulaWithVariables->Variables = NULL;

    return(FormulaWithVariables);
}
//-----------------------------------------------------------------------------
void FreeTupleFormulae(int NumberOfElements,FORMULAArray * TupleFormulae,
VARIABLENODE * Variables) {

    if (NumberOfElements > 0) {
        while (NumberOfElements > 0) {
            FreeFormula((*TupleFormulae)+NumberOfElements-1,Variables);
            NumberOfElements--;
        }
        Free((void **)TupleFormulae);
        *TupleFormulae = NULL;
    } else {
//----Check that the array is empty
        assert(*TupleFormulae == NULL);
    }
}
//-----------------------------------------------------------------------------
void FreeFormula(FORMULA * Formula,VARIABLENODE * Variables) {

    if (*Formula != NULL) {
        switch ((*Formula)->Type) {
            case tuple:
                FreeTupleFormulae(
(*Formula)->FormulaUnion.TupleFormula.NumberOfElements,
&((*Formula)->FormulaUnion.TupleFormula.Elements),Variables);
                assert((*Formula)->FormulaUnion.TupleFormula.Elements == NULL);
                break;
                FreeTupleFormulae(
(*Formula)->FormulaUnion.SequentFormula.NumberOfLHSElements,
&((*Formula)->FormulaUnion.SequentFormula.LHS),Variables);
                assert((*Formula)->FormulaUnion.SequentFormula.LHS == NULL);
                FreeTupleFormulae(
(*Formula)->FormulaUnion.SequentFormula.NumberOfRHSElements,
&((*Formula)->FormulaUnion.SequentFormula.RHS),Variables);
                assert((*Formula)->FormulaUnion.SequentFormula.RHS == NULL);
                break;
            case quantified:
                FreeTerm(&((*Formula)->FormulaUnion.QuantifiedFormula.Variable),
Variables);
                assert((*Formula)->FormulaUnion.QuantifiedFormula.Variable == 
NULL);
                FreeFormula(&((*Formula)->FormulaUnion.QuantifiedFormula.
VariableType),Variables);
                assert((*Formula)->FormulaUnion.QuantifiedFormula.VariableType
== NULL);
                FreeFormula(&((*Formula)->
FormulaUnion.QuantifiedFormula.Formula),Variables);
                assert((*Formula)->FormulaUnion.QuantifiedFormula.Formula == 
NULL);
                break;
            case binary:
                FreeFormula(&((*Formula)->FormulaUnion.BinaryFormula.LHS),
Variables);
                assert((*Formula)->FormulaUnion.BinaryFormula.LHS == NULL);
                FreeFormula(&((*Formula)->FormulaUnion.BinaryFormula.RHS),
Variables);
                assert((*Formula)->FormulaUnion.BinaryFormula.RHS == NULL);
                break;
            case unary:
                FreeFormula(&((*Formula)->FormulaUnion.UnaryFormula.Formula),
Variables);
                assert((*Formula)->FormulaUnion.UnaryFormula.Formula == NULL);
                break; 
            case atom:
                FreeTerm(&((*Formula)->FormulaUnion.Atom),Variables);
                assert((*Formula)->FormulaUnion.Atom == NULL);
                break;
            case ite_formula:
                FreeFormula(&((*Formula)->FormulaUnion.ConditionalFormula.
Condition),Variables);
                FreeFormula(&((*Formula)->FormulaUnion.ConditionalFormula.
FormulaIfTrue),Variables);
                FreeFormula(&((*Formula)->FormulaUnion.ConditionalFormula.
FormulaIfFalse),Variables);
                break;
            case let_formula:
                FreeFormula(&((*Formula)->FormulaUnion.LetFormula.LetTypes),
Variables);
                FreeFormula(&((*Formula)->FormulaUnion.LetFormula.LetDefn),
Variables);
                FreeFormula(&((*Formula)->FormulaUnion.LetFormula.LetBody),
Variables);
                break;
            default:
                CodingError("Formula type unknown for freeing");
                break;
        }
        Free((void **)Formula);
    }
}
//-----------------------------------------------------------------------------
void FreeFormulaWithVariables(FORMULAWITHVARIABLES * FormulaWithVariables) {

    if (*FormulaWithVariables != NULL) {
        FreeFormula(&((*FormulaWithVariables)->Formula),
&((*FormulaWithVariables)->Variables));
        assert((*FormulaWithVariables)->Formula == NULL);
        assert((*FormulaWithVariables)->Variables == NULL);
        Free((void **)FormulaWithVariables);
    }
}
//-----------------------------------------------------------------------------
TERMArray NewArguments(int NumberOfArguments) {

    TERMArray Arguments;
    int Index;

    Arguments = (TERMArray)Malloc(NumberOfArguments * sizeof(TERM));
    for (Index = 0; Index < NumberOfArguments; Index++) {
        Arguments[Index] = NULL;
    }

    return(Arguments);
}
//-----------------------------------------------------------------------------
TERMArray DuplicateArguments(TERMArray Original,ContextType Context,int Arity,
int ForceNewVariables) {

    TERMArray Arguments;
    int ArgumentNumber;

    if (Arity > 0) {
        Arguments = NewArguments(Arity);
        for (ArgumentNumber=0;ArgumentNumber<Arity;ArgumentNumber++) {
            Arguments[ArgumentNumber] = DuplicateTerm(Original[ArgumentNumber],
Context,ForceNewVariables);
        }
        return(Arguments);
    } else {
        return(NULL);
    }
}
//-----------------------------------------------------------------------------
TERM ParseArgument(READFILE Stream,SyntaxType Language,ContextType Context,
VARIABLENODE * EndOfScope,TermType Type,int VariablesMustBeQuantified) {

    TERM THFTerm;

//----In THF all things are atoms (no terms), so it stays predicate
    if (Language == tptp_thf && Type == predicate) {
        THFTerm = NewTerm();
        THFTerm->Type = formula;
        THFTerm->TheSymbol.Formula = ParseFormula(Stream,Language,
Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
        return(THFTerm);
    } else {
//----If parsing non-logical, keep it like that, else it must be a term
        if (Type != non_logical_data) {
            Type = term;
        }
        return(ParseTerm(Stream,Language,Context,EndOfScope,Type,
free_variable,NULL,VariablesMustBeQuantified));
    }
}
//-----------------------------------------------------------------------------
TERMArray ParseArguments(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int * Arity,TermType Type,
char * MatchingBracket,int VariablesMustBeQuantified) {

    TERMArray Arguments;

//----Disallows the () case, which is illegal in the BNF
    if (!strcmp(MatchingBracket,"]") && 
CheckToken(Stream,punctuation,MatchingBracket)) {
        Arguments = (TERMArray)NULL;
        *Arity = 0;
    } else {
        Arguments = (TERMArray)Malloc(sizeof(TERM));
        *Arity = 1;
        Arguments[0] = ParseArgument(Stream,Language,Context,EndOfScope,
Type,VariablesMustBeQuantified);
        while (CheckToken(Stream,punctuation,",")) {
//DEBUG printf("and another argument\n");
            AcceptToken(Stream,punctuation,",");
            (*Arity)++;
            Arguments = (TERMArray)Realloc((void *)Arguments,
*Arity * sizeof(TERM));
            Arguments[*Arity - 1] = ParseArgument(Stream,Language,Context,
EndOfScope,Type,VariablesMustBeQuantified);
        }
    }

    return(Arguments);
}
//-----------------------------------------------------------------------------
//----This assumes it's in the context of duplicating a formula with variables
TERM DuplicateTerm(TERM Original,ContextType Context,int ForceNewVariables) {

    TERM Term;
    int NumberOfArguments;
    VARIABLENODE Variable;

    if (Original == NULL) {
        return(NULL);
    } else {
        Term = NewTerm();
        *Term = *Original;

        if (Term->Type == variable) {
//----Look for the corresponding variable in the new variables list
            Variable = *(Context.Variables);
            while (Variable != NULL && Variable->Instantiation !=
(TERM)Original->TheSymbol.Variable) {
                Variable = Variable->NextVariable;
            }
            if (Variable == NULL) {
                CodingError("Cannot find variable for copy of original");
            }
//----Check if it has been quantified, if not use original unless new is
//----forced
            if (Variable->NumberOfUses > 0 || ForceNewVariables) {
                Term->TheSymbol.Variable = Variable;
            } else {
//----Use of the original is for the case of duplication of subformulae
//----within a formula.
                Term->TheSymbol.Variable = Original->TheSymbol.Variable;
            }
            IncreaseVariableUseCount(Term->TheSymbol.Variable,1);
        } else if (Term->Type == nested_thf || 
Term->Type == nested_tff || Term->Type == nested_tcf ||
Term->Type == nested_fof || Term->Type == nested_cnf) {
//----For CNF the variables are implicitly universally quantified, and must
//----be new variables. For FOF we use the originals (can't recall why)
//----But later I decided that nested formulae are special, and should always
//----use new variables, e.g., for bind/2 terms.
            Term->TheSymbol.NestedFormula = DuplicateFormulaWithVariables(
Original->TheSymbol.NestedFormula,Context.Signature,1);
        } else if (Term->Type == nested_fot) {
            Term->TheSymbol.NestedTerm = DuplicateTermWithVariables(Original->
TheSymbol.NestedTerm,Context.Signature,0);
        } else if (Term->Type == ite_term) {
            Term->TheSymbol.ConditionalTerm.Condition = 
DuplicateFormula(Original->TheSymbol.ConditionalTerm.Condition,Context,
ForceNewVariables);
            Term->TheSymbol.ConditionalTerm.TermIfTrue = 
DuplicateTerm(Original->TheSymbol.ConditionalTerm.TermIfTrue,Context,0);
            Term->TheSymbol.ConditionalTerm.TermIfFalse = 
DuplicateTerm(Original->TheSymbol.ConditionalTerm.TermIfFalse,Context,0);
        } else if (Term->Type == let_term) {
            Term->TheSymbol.LetTerm.LetTypes = 
DuplicateFormula(Original->TheSymbol.LetTerm.LetTypes,Context,
ForceNewVariables);
            Term->TheSymbol.LetTerm.LetDefn = 
DuplicateFormula(Original->TheSymbol.LetTerm.LetDefn,Context,
ForceNewVariables);
            Term->TheSymbol.LetTerm.LetBody = 
DuplicateTerm(Original->TheSymbol.LetTerm.LetBody,Context,0);
        } else {
            Term->TheSymbol.NonVariable = InsertIntoSignature(Context.Signature,
Term->Type,Original->TheSymbol.NonVariable->NameSymbol,
Original->TheSymbol.NonVariable->Arity,NULL);
//----Check if a flexible arity case
            if (Term->TheSymbol.NonVariable->Arity == -1) {
                NumberOfArguments = Term->FlexibleArity;
            } else {
                NumberOfArguments = Term->TheSymbol.NonVariable->Arity;
            }
            Term->Arguments = DuplicateArguments(Original->Arguments,Context,
NumberOfArguments,ForceNewVariables);
        }
        return(Term);
    }
}
//-----------------------------------------------------------------------------
TERMWITHVARIABLES DuplicateTermWithVariables(TERMWITHVARIABLES Original,
SIGNATURE Signature,int ForceNewVariables) {

    ContextType Context;
    TERMWITHVARIABLES TermWithVariables;
    
    TermWithVariables = NewTermWithVariables();

//----Copy the variables list, setting each use to 0, and setting the
//----instantiation to point to the original (cheating in duplication :-)
    TermWithVariables->Variables = ParallelCopyVariableList(
Original->Variables);
    
//----Create a context for the parsing
    Context.Variables = &(TermWithVariables->Variables);
    Context.Signature = Signature;
    
//DEBUG printf("original variables\n");
//DEBUG PrintVariableList(Original->Variables,NULL);
//DEBUG printf("parallel copy variables\n");
//DEBUG PrintVariableList(FormulaWithVariables->Variables,NULL);
    TermWithVariables->Term = DuplicateTerm(Original->Term,
Context,ForceNewVariables);
//DEBUG printf("after copy variables\n");
//DEBUG PrintVariableList(FormulaWithVariables->Variables,NULL);

//----Set the variable instantiations to their rightful values
    ParallelCopyVariableInstantiations(Original->Variables,
TermWithVariables->Variables);

    return(TermWithVariables); 
}
//-----------------------------------------------------------------------------
TermType KnownTermTypeOrError(READFILE Stream,SyntaxType Language) {

    if (CheckTokenType(Stream,upper_word)) {
//DEBUG printf("Found a variable %s\n",CurrentToken(Stream)->NameToken);
        return(variable);
    } else {
//DEBUG printf("Found a function with functor %s\n",CurrentToken(Stream)->NameToken);
        if (CheckTokenType(Stream,functor) || 
CheckToken(Stream,punctuation,"[")) {
//DEBUG printf("%s parsed as a function\n",CurrentToken(Stream)->NameToken);
//----Numbers not allowed in CNF or FOF
            if (!AllowFOFNumbers && (Language == tptp_cnf || 
Language == tptp_fof)) {
//----Comment out this line when running tptp4X -t donum or noint
                EnsureTokenNotType(Stream,number);
            }
            if (CheckToken(Stream,lower_word,"$ite")) {
                return(ite_term);
            } else if (CheckToken(Stream,lower_word,"$let")) {
                return(let_term);
            } else {
                return(function);
            }
        } else {
//----Connectives are terms in THF
            if (Language == tptp_thf && 
(CheckTokenType(Stream,binary_connective) || 
 CheckTokenType(Stream,unary_connective))) {
                return(function);
            } else {
//----Force an error
                EnsureTokenType(Stream,functor);
                return(nonterm);
            }
        }
    }
}
//-----------------------------------------------------------------------------
int InfixOperatorParsing(READFILE Stream,SyntaxType Language,
TermType OriginallyExpectedType,TermType * ExpectedRHSTermType) {

//----For THF equality is dealt with as a binary operator
    if (Language != tptp_thf && OriginallyExpectedType == predicate && 
(CheckToken(Stream,lower_word,"=") || CheckToken(Stream,lower_word,"!="))) {
        *ExpectedRHSTermType = term;
        return(1);
    }

//----Non-logical contructs
    if (OriginallyExpectedType == non_logical_data &&
(CheckToken(Stream,punctuation,"-") || CheckToken(Stream,punctuation,":"))) {
        *ExpectedRHSTermType = non_logical_data;
        return(1);
    }

    return(0);
}
//-----------------------------------------------------------------------------
TERM ParseTerm(READFILE Stream,SyntaxType Language,ContextType Context,
VARIABLENODE * EndOfScope,TermType Type,ConnectiveType VariableQuantifier,
int * InfixNegatedAtom,int VariablesMustBeQuantified) {

    TokenType FunctorType;
    TERM InfixTerm,Term;
    int NumberOfArguments;
    char * PrefixSymbol;
    String MatchingBracket;
    TermType TypeIfInfix;
    TermType InfixRHSType;
    int DoInfixProcessing;
    char * InfixToken;

    Term = NewTerm();
    TypeIfInfix = nonterm;

//DEBUG printf("ParseTerm with token %s\n",CurrentToken(Stream)->NameToken);
//----Record token type to check if brackets are legal later
    FunctorType = CurrentToken(Stream)->KindToken;

//----If a generic term, look at first letter to decide which
    switch (Type) {
        case term:
            Type = KnownTermTypeOrError(Stream,Language);
            break;
        case variable:
        case new_variable:
            EnsureTokenType(Stream,upper_word);
            break;
        case function:
            EnsureTokenType(Stream,functor);
            break;
        case predicate:
//----Can't check it's a predicate because it might be infix with var first
//----      EnsureTokenType(Stream,predicate_symbol);
//DEBUG printf("Found a predicate with symbol %s %d (want %d)\n",CurrentToken(Stream)->NameToken,CurrentToken(Stream)->KindToken,lower_word);
//----Guess that it's a variable or function for infix predicate
            TypeIfInfix = KnownTermTypeOrError(Stream,Language);
            break;
        case non_logical_data:
//DEBUG printf("Found a non-logical with symbol %s\n",CurrentToken(Stream)->NameToken);
//----Nested formulae and terms
            if (CheckToken(Stream,lower_word,"$thf")) {
                Type = nested_thf;
            } else if (CheckToken(Stream,lower_word,"$tff")) {
                Type = nested_tff;
            } else if (CheckToken(Stream,lower_word,"$tcf")) {
                Type = nested_tcf;
            } else if (CheckToken(Stream,lower_word,"$fof")) {
                Type = nested_fof;
            } else if (CheckToken(Stream,lower_word,"$cnf")) {
                Type = nested_cnf;
            } else if (CheckToken(Stream,lower_word,"$fot")) {
                Type = nested_fot;
            } else {
                TypeIfInfix = non_logical_data;
//----Make sure it's something that looks like a term
                if (!CheckTokenType(Stream,functor) && !CheckToken(Stream,
punctuation,"[") && !CheckTokenType(Stream,upper_word)) {
                    TokenError(Stream);
                }
            }
            break;
        default:
            CodingError("Term type unknown in parsing");
            break;
    }
    Term->Type = Type;

//----Save the symbol for inserting in signature later
    PrefixSymbol = CopyHeapString(CurrentToken(Stream)->NameToken);
//DEBUG printf("Found a type %d term %s\n",Type,PrefixSymbol);
//----Move on if not a list or nested formula
    if (strcmp(PrefixSymbol,"[") && strcmp(PrefixSymbol,"(")) {
        NextToken(Stream);
    }

//----Is it a conditional term?
//----FIX why TypeIfInfix??
    if (Type == ite_term || TypeIfInfix == ite_term) {
        NumberOfArguments = 0;
        Term->Arguments = NULL;
        AcceptToken(Stream,punctuation,"(");
        Term->TheSymbol.ConditionalTerm.Condition = ParseFormula(Stream,
Language,Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
        AcceptToken(Stream,punctuation,",");
// TO FIX ... NEED TO ACCEPT FORMULAE HERE TOO
// Test case tff(an,axiom,p($ite(q,r & f,r & g))).
        Term->TheSymbol.ConditionalTerm.TermIfTrue = ParseTerm(Stream,
Language,Context,EndOfScope,term,none,NULL,VariablesMustBeQuantified);
        AcceptToken(Stream,punctuation,",");
        Term->TheSymbol.ConditionalTerm.TermIfFalse = ParseTerm(Stream,
Language,Context,EndOfScope,term,none,NULL,VariablesMustBeQuantified);
        AcceptToken(Stream,punctuation,")");
    } else if (Type == let_term) {
        NumberOfArguments = 0;
        Term->Arguments = NULL;
        AcceptToken(Stream,punctuation,"(");
        Term->TheSymbol.LetTerm.LetTypes = ParseFormula(Stream,Language,
Context,EndOfScope,1,0,VariablesMustBeQuantified,none);
        AcceptToken(Stream,punctuation,",");
        Term->TheSymbol.LetTerm.LetDefn = ParseFormula(Stream,Language,
Context,EndOfScope,1,0,VariablesMustBeQuantified,none);
        AcceptToken(Stream,punctuation,",");
// TO FIX ... NEED TO ACCEPT FORMULAE HERE TOO
        Term->TheSymbol.LetTerm.LetBody = ParseTerm(Stream,Language,
Context,EndOfScope,term,none,NULL,VariablesMustBeQuantified);
        AcceptToken(Stream,punctuation,")");
//----Deal with a list of things, with either ( or [ brackets
    } else if ( 
        ( ( Type == predicate 
//----Prevent THF connectives being used as predicates with arguments
          && ( Language != tptp_thf 
            || islower(PrefixSymbol[0]) ) ) 
        || Type == function 
        || Type == non_logical_data ) 
      && ( CheckToken(Stream,punctuation,"(") 
        || CheckToken(Stream,punctuation,"[") ) ) {
//DEBUG printf("it ==%s==has arguments\n\n",PrefixSymbol);
//----Variables, distinct objects and numbers cannot have arguments
//THF TO FIX - Currently only allows ground predicates with arguments
        if (FunctorType == upper_word || FunctorType == distinct_object || 
FunctorType == number) {
            TokenError(Stream);
        }
        if (CheckToken(Stream,punctuation,"(")) {
//----Now we can check that expected predicates look like predicates
            if (Type == predicate && FunctorType != lower_word) {
                TokenError(Stream);
            }
            strcpy(MatchingBracket,")");
        } else {
            strcpy(MatchingBracket,"]");
        }
        AcceptTokenType(Stream,punctuation);
        Term->Arguments = ParseArguments(Stream,Language,Context,EndOfScope,
&NumberOfArguments,Type,MatchingBracket,VariablesMustBeQuantified);
        AcceptToken(Stream,punctuation,MatchingBracket);
//----Is it a nested formula?
    } else if (Type == nested_thf || Type == nested_tff || 
Type == nested_tcf || Type == nested_fof || Type == nested_cnf) {
        NumberOfArguments = 0;
        Term->Arguments = NULL;
        AcceptToken(Stream,punctuation,"(");
        Term->TheSymbol.NestedFormula = ParseFormulaWithVariables(Stream,
Type == nested_thf ? tptp_thf : 
Type == nested_tff ? tptp_tff : Type == nested_tcf ? tptp_tcf :
Type == nested_fof ? tptp_fof : tptp_cnf,Context.Signature,0);
//----Have to allow unbound variables in nested terms, e.g., for bind/2
//----terms in inference() terms where the list of bindings together makes
//----"free" variables ground.
        AcceptToken(Stream,punctuation,")");
    } else if (Type == nested_fot) {
        NumberOfArguments = 0;
        Term->Arguments = NULL;
        AcceptToken(Stream,punctuation,"(");
        Term->TheSymbol.NestedTerm = ParseTermWithVariables(Stream,Language,
Context.Signature,0);
        AcceptToken(Stream,punctuation,")");
//----Otherwise no list (roughly, no arguments to a predicate or function)
    } else {
        NumberOfArguments = 0;
        Term->Arguments = NULL;
//DEBUG printf("it ==%s== does not have arguments\n",PrefixSymbol);
    }

//----If a list make a special name and record flexible arity
    if (!strcmp(PrefixSymbol,"[")) {
//----Need an extra byte :-)
        Free((void **)&PrefixSymbol);
        PrefixSymbol = CopyHeapString("[]");
        Term->FlexibleArity = NumberOfArguments;
        NumberOfArguments = -1;
    }

//----Check for infix predicate
    if ((DoInfixProcessing = InfixOperatorParsing(Stream,Language,Type,
&InfixRHSType))) {
        Term->Type = TypeIfInfix;
//----If a term is expected, then if a variable it must be free here (infix =)
        if (InfixRHSType == term) {
            VariableQuantifier = free_variable;
        }
    } else {
        InfixRHSType = nonterm;
//----Cannot have a variable if a predicate was expected, unless in a typed
//----language, where variables can be types in polymorphic cases.
        if (Language != tptp_thf && Language != tptp_tff &&
Type == predicate && FunctorType == upper_word) {
            TokenError(Stream);
        }
    }

//----Insert symbol into signature. Could be LHS of infix.
    if (Term->Type == new_variable) {
        Term->Type = variable;
        Term->TheSymbol.Variable = InsertVariable(Stream,Context.Signature,
Context.Variables,EndOfScope,1,PrefixSymbol,VariableQuantifier,
VariablesMustBeQuantified);
//THF - this was Term->Type == variable, but I want to allow variable 
//predicates. Will this work?
    } else if ((Language == tptp_thf && FunctorType == upper_word) ||
Term->Type == variable) {
//----Force the term type to variable
        Term->Type = variable;
        Term->TheSymbol.Variable = InsertVariable(Stream,Context.Signature,
Context.Variables,EndOfScope,0,PrefixSymbol,free_variable,
VariablesMustBeQuantified);
    } else if (Term->Type == nested_thf || 
Term->Type == nested_tff || Term->Type == nested_tcf ||
Term->Type == nested_fof || Term->Type == nested_cnf || 
Term->Type == nested_fot || 
Term->Type == ite_term || Term->Type == let_term) {
//----Do nothing
    } else {
//----Need to note connectives used as terms
        if (FunctorType == unary_connective || 
FunctorType == binary_connective ||
(FunctorType == lower_word && !strcmp(PrefixSymbol,"="))) {
            Term->Type = connective;
        }
        Term->TheSymbol.NonVariable = InsertIntoSignature(Context.Signature,
Term->Type,PrefixSymbol,NumberOfArguments,Stream);
//----Note that if the term is a THF connective that is not a term, then the
//----formula is deleted in ParseUnaryFormula and the NumberOfUses in the 
//----signature will be decremented, possibly down to 0.
    }

//----Free the saved symbol
    Free((void **)&PrefixSymbol);

//----Build the infix structure
    if (DoInfixProcessing) {
        InfixTerm = NewTerm();
        InfixTerm->Type = Type;
//----Insert the infix symbol
        if (InfixNegatedAtom != NULL && CheckToken(Stream,lower_word,"!=")) {
            InfixToken = "=";
            *InfixNegatedAtom = 1;
        } else {
            InfixToken = CurrentToken(Stream)->NameToken;
        }
        InfixTerm->TheSymbol.NonVariable = InsertIntoSignature(
Context.Signature,InfixTerm->Type,InfixToken,2,Stream);
        InfixTerm->Arguments = NewArguments(2);
        InfixTerm->Arguments[0] = Term;
//----Move on only after saving the infix operator
        NextToken(Stream);
        InfixTerm->Arguments[1] = ParseTerm(Stream,Language,Context,EndOfScope,
InfixRHSType,VariableQuantifier,NULL,VariablesMustBeQuantified);
        return(InfixTerm);
    } else {
//----Non-infix
        return(Term);
    }
}
//-----------------------------------------------------------------------------
TERMWITHVARIABLES ParseTermWithVariables(READFILE Stream,SyntaxType Language,
SIGNATURE Signature,int VariablesMustBeQuantified) {

    ContextType Context;
    TERMWITHVARIABLES TermWithVariables;
    VARIABLENODE EndOfScope;
    int NeedNonLogicTokens;

    EndOfScope = NULL;
    TermWithVariables = NewTermWithVariables();

//----Create a context for the parsing
    Context.Variables = &(TermWithVariables->Variables);
    Context.Signature = Signature;

    NeedNonLogicTokens = Stream->NeedNonLogicTokens;
    Stream->NeedNonLogicTokens = 0;
    TermWithVariables->Term = ParseTerm(Stream,Language,Context,&EndOfScope,
non_logical_data,none,NULL,VariablesMustBeQuantified);
    Stream->NeedNonLogicTokens = NeedNonLogicTokens;
    return(TermWithVariables);
}
//-----------------------------------------------------------------------------
int RightAssociative(ConnectiveType Connective) {

    return(Connective == disjunction || Connective == conjunction ||
Connective == maparrow);
}
//-----------------------------------------------------------------------------
int LeftAssociative(ConnectiveType Connective) {

    return(Connective == disjunction || Connective == conjunction ||
Connective == application || Connective == xprodtype ||
Connective == uniontype);
}
//-----------------------------------------------------------------------------
int Associative(ConnectiveType Connective) {

    return(RightAssociative(Connective) || LeftAssociative(Connective));
}
//-----------------------------------------------------------------------------
int FullyAssociative(ConnectiveType Connective) {

    return(RightAssociative(Connective) && LeftAssociative(Connective));
}
//-----------------------------------------------------------------------------
int Symmetric(ConnectiveType Connective) {

    return(FullyAssociative(Connective) || Connective == equivalence ||
Connective == nonequivalence);
}
//-----------------------------------------------------------------------------
//----Unused now, for chaning a right branch to a left branch
FORMULA ChangeAssociationRightToLeft(FORMULA Formula) {

    FORMULA RHS;

    if (Formula->FormulaUnion.BinaryFormula.RHS->Type == binary) {
        RHS = Formula->FormulaUnion.BinaryFormula.RHS;
        Formula->FormulaUnion.BinaryFormula.RHS = RHS->
FormulaUnion.BinaryFormula.LHS;
        RHS->FormulaUnion.BinaryFormula.LHS = Formula;
        return(ChangeAssociationRightToLeft(RHS));
    } else {
        return(Formula);
    }
}
//-----------------------------------------------------------------------------
FORMULA ParseAtom(READFILE Stream,SyntaxType Language,ContextType Context,
VARIABLENODE * EndOfScope,int VariablesMustBeQuantified) {

    FORMULA Formula;
    int InfixNegatedAtom;
    FORMULA InfixFormula;

    InfixNegatedAtom = 0;
    Formula = NewFormula();
    Formula->Type = atom;
    Formula->FormulaUnion.Atom = ParseTerm(Stream,Language,Context,EndOfScope,
predicate,none,&InfixNegatedAtom,VariablesMustBeQuantified);

//----Hack to fix negated infix equality
    if (InfixNegatedAtom) {
        InfixFormula = NewFormula();
        InfixFormula->Type = unary;
        InfixFormula->FormulaUnion.UnaryFormula.Connective = negation;
        InfixFormula->FormulaUnion.UnaryFormula.Formula = Formula;
        Formula = InfixFormula;
    }

    return(Formula);
}
//-----------------------------------------------------------------------------
FORMULA ParseUnaryFormula(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int VariablesMustBeQuantified) {

    FORMULA Formula;
    ConnectiveType Connective;
    READFILE StringStream;
    
    Connective = StringToConnective(CurrentToken(Stream)->NameToken);
    AcceptTokenType(Stream,unary_connective);
//----See if a ), which means it was a connective term
    if (CheckToken(Stream,punctuation,")")) {
        if ((StringStream = OpenStringReadFile(
ConnectiveToString(Connective))) == NULL) {
            CodingError("Could not open string stream");
            return(NULL);
        }
//----Unary connective as a term in THF
        Formula = ParseAtom(StringStream,Language,Context,EndOfScope,
VariablesMustBeQuantified);
        CloseReadFile(StringStream);
//        Formula->FormulaUnion.Atom = ParseTerm(StringStream,Language,Context,
//EndOfScope,term,none,NULL,VariablesMustBeQuantified);
    } else {
        Formula = NewFormula();
        Formula->Type = unary;
        Formula->FormulaUnion.UnaryFormula.Connective = Connective;
//----No binary inside unary
        Formula->FormulaUnion.UnaryFormula.Formula = ParseFormula(Stream,
Language,Context,EndOfScope,0,0,VariablesMustBeQuantified,none);
    }
    return(Formula);
}
//-----------------------------------------------------------------------------
void ParseQuantifiedVariable(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,ConnectiveType Quantifier,
int VariablesMustBeQuantified,QuantifiedFormulaType * QuantifiedFormula) {

    if (QuantifiedFormula->Quantifier == existential &&
CheckTokenType(Stream,number)) {
        QuantifiedFormula->ExistentialCount =
atoi(CurrentToken(Stream)->NameToken);
        AcceptTokenType(Stream,number);
        AcceptToken(Stream,punctuation,":");
    } else {
        QuantifiedFormula->ExistentialCount = -1;
    }

//----Get the variable. The EndOfScope is extended to include this variable.
    QuantifiedFormula->Variable =
ParseTerm(Stream,Language,Context,EndOfScope,new_variable,Quantifier,NULL,0);
//----Variable type
//----For THF0 require type, TFF optional type
    if (Language == tptp_thf) {
        AcceptToken(Stream,punctuation,":");
        QuantifiedFormula->VariableType = ParseFormula(Stream,Language,
Context,EndOfScope,-1,1,VariablesMustBeQuantified,none);
    } else if ((Language == tptp_tff || Language == tptp_tcf) && 
CheckToken(Stream,punctuation,":")) {
        AcceptToken(Stream,punctuation,":");
        QuantifiedFormula->VariableType = ParseAtom(Stream,Language,
Context,EndOfScope,VariablesMustBeQuantified);
//----Check that it's a constant - nope, TFF1 allows type constructors
//        if (GetArity(QuantifiedFormula->VariableType->FormulaUnion.Atom) != 0) {
//            TokenError(Stream);
//        }
    } else {
        QuantifiedFormula->VariableType = NULL;
    }
}
//-----------------------------------------------------------------------------
FORMULA ParseQuantifiedRemainder(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,ConnectiveType Quantifier,
int VariablesMustBeQuantified) {

    FORMULA Formula;

    if (CheckToken(Stream,punctuation,"]")) {
        AcceptToken(Stream,punctuation,"]");
        AcceptToken(Stream,punctuation,":");
//----No Binary formulae allowed (i.e., quantification binds tight). But = 
//----and != do get allowed.
        Formula = ParseFormula(Stream,Language,Context,EndOfScope,0,1,
VariablesMustBeQuantified,none);
        return(Formula);
    } else {
        AcceptToken(Stream,punctuation,",");
        Formula = NewFormula();
        Formula->Type = quantified;
        Formula->FormulaUnion.QuantifiedFormula.Quantifier = Quantifier;
        ParseQuantifiedVariable(Stream,Language,Context,EndOfScope,Quantifier,
VariablesMustBeQuantified,&(Formula->FormulaUnion.QuantifiedFormula));
//----Now get the rest of the variables
        Formula->FormulaUnion.QuantifiedFormula.Formula = 
ParseQuantifiedRemainder(Stream,Language,Context,EndOfScope,Quantifier,
VariablesMustBeQuantified);
        return(Formula);
    }
}
//-----------------------------------------------------------------------------
FORMULA ParseQuantifiedFormula(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int VariablesMustBeQuantified) {

    FORMULA Formula;
    VARIABLENODE OldEndOfScope;
    
    Formula = NewFormula();
    Formula->Type = quantified;
    Formula->FormulaUnion.QuantifiedFormula.Quantifier = 
StringToConnective(CurrentToken(Stream)->NameToken);
    AcceptTokenType(Stream,quantifier);
    AcceptToken(Stream,punctuation,"[");
    OldEndOfScope = *EndOfScope;
    ParseQuantifiedVariable(Stream,Language,Context,EndOfScope,
Formula->FormulaUnion.QuantifiedFormula.Quantifier,VariablesMustBeQuantified,
&(Formula->FormulaUnion.QuantifiedFormula));
    Formula->FormulaUnion.QuantifiedFormula.Formula = ParseQuantifiedRemainder(
Stream,Language,Context,EndOfScope,Formula->
FormulaUnion.QuantifiedFormula.Quantifier,VariablesMustBeQuantified);
    *EndOfScope = OldEndOfScope;

    return(Formula);
}
//-----------------------------------------------------------------------------
FORMULAArray DuplicateTupleFormulae(int NumberOfElements,
FORMULAArray Original,ContextType Context,int ForceNewVariables) {

    FORMULAArray Duplicate;
    
    Duplicate = (FORMULAArray)Malloc(NumberOfElements * sizeof(FORMULA));
    while (NumberOfElements > 0) {
        Duplicate[NumberOfElements-1] = DuplicateFormula(
Original[NumberOfElements-1],Context,ForceNewVariables);
    }
    return(Duplicate);
}
//-----------------------------------------------------------------------------
FORMULAArray ParseTupleFormulae(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int AllowBinary,
int VariablesMustBeQuantified,ConnectiveType LastConnective,
int * NumberOfElements) {

    FORMULAArray TupleFormulae;

    TupleFormulae = NULL;
    *NumberOfElements = 0;
    AcceptToken(Stream,punctuation,"[");
    if (!CheckToken(Stream,punctuation,"]")) {
        (*NumberOfElements)++;
        TupleFormulae = (FORMULAArray)Malloc(sizeof(FORMULA));
        TupleFormulae[*NumberOfElements-1] = ParseFormula(Stream,
Language,Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
        while (CheckToken(Stream,punctuation,",")) {
            AcceptToken(Stream,punctuation,",");
            (*NumberOfElements)++;
            TupleFormulae = (FORMULAArray)Realloc((void *)TupleFormulae,
*NumberOfElements * sizeof(FORMULA));
            TupleFormulae[*NumberOfElements-1] = ParseFormula(Stream,
Language,Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
        }
    } else {
        TupleFormulae = NULL;
    }
    AcceptToken(Stream,punctuation,"]");
    return(TupleFormulae);
}
//-----------------------------------------------------------------------------
FORMULA ParseTupleOrSequentFormula(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int AllowBinary,
int VariablesMustBeQuantified,ConnectiveType LastConnective) {

    FORMULA TupleOrSequent;
    FORMULAArray FirstTuple;
    int NumberOfElements;

    EnsureToken(Stream,punctuation,"[");
    TupleOrSequent = NewFormula();
    FirstTuple = ParseTupleFormulae(Stream,
Language,Context,EndOfScope,AllowBinary,VariablesMustBeQuantified,
LastConnective,&NumberOfElements);
    if (CheckToken(Stream,binary_connective,"-->")) {
        TupleOrSequent->Type = sequent;
        TupleOrSequent->FormulaUnion.SequentFormula.LHS = FirstTuple;
        TupleOrSequent->FormulaUnion.SequentFormula.NumberOfLHSElements = 
NumberOfElements;
        AcceptToken(Stream,binary_connective,"-->");
        TupleOrSequent->FormulaUnion.SequentFormula.RHS = ParseTupleFormulae(
Stream,Language,Context,EndOfScope,AllowBinary,VariablesMustBeQuantified,
LastConnective,&(TupleOrSequent->FormulaUnion.SequentFormula.
NumberOfRHSElements));
    } else {
        TupleOrSequent->Type = tuple;
        TupleOrSequent->FormulaUnion.TupleFormula.Elements = FirstTuple;
        TupleOrSequent->FormulaUnion.TupleFormula.NumberOfElements =
NumberOfElements;
    }

    return(TupleOrSequent);
}
//-----------------------------------------------------------------------------
FORMULA ParseITEFormula(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int VariablesMustBeQuantified) {

    FORMULA ITEFormula;

    ITEFormula = NewFormula();
    ITEFormula->Type = ite_formula;
    
    AcceptToken(Stream,predicate_symbol,"$ite");
    AcceptToken(Stream,punctuation,"(");
    ITEFormula->FormulaUnion.ConditionalFormula.Condition = ParseFormula(
Stream,Language,Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
    AcceptToken(Stream,punctuation,",");
    ITEFormula->FormulaUnion.ConditionalFormula.FormulaIfTrue = ParseFormula(
Stream,Language,Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
    AcceptToken(Stream,punctuation,",");
    ITEFormula->FormulaUnion.ConditionalFormula.FormulaIfFalse = ParseFormula(
Stream,Language,Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
    AcceptToken(Stream,punctuation,")");

    return(ITEFormula);
}
//-----------------------------------------------------------------------------
FORMULA ParseLETFormula(READFILE Stream,SyntaxType Language,
ContextType Context,VARIABLENODE * EndOfScope,int VariablesMustBeQuantified) {

    FORMULA LETFormula;

    LETFormula = NewFormula();
    LETFormula->Type = let_formula;
    
    AcceptToken(Stream,predicate_symbol,"$let");
    AcceptToken(Stream,punctuation,"(");
//----ParseFormula accepts tuples too :-)
    LETFormula->FormulaUnion.LetFormula.LetTypes = ParseFormula(Stream,Language,
Context,EndOfScope,1,0,0,none);
    AcceptToken(Stream,punctuation,",");
    LETFormula->FormulaUnion.LetFormula.LetDefn = ParseFormula(Stream,Language,
Context,EndOfScope,1,1,0,none);
    AcceptToken(Stream,punctuation,",");
    LETFormula->FormulaUnion.LetFormula.LetBody = ParseFormula(Stream,Language,
Context,EndOfScope,1,1,VariablesMustBeQuantified,none);
    AcceptToken(Stream,punctuation,")");

    return(LETFormula);
}
//-----------------------------------------------------------------------------
//----This assumes it's in the context of duplicating a formula with variables
FORMULA DuplicateFormula(FORMULA Original,ContextType Context,
int ForceNewVariables) {

    FORMULA Formula;

    if (Original == NULL) {
        return(NULL);
    } else {
        Formula = NewFormula();
        *Formula = *Original;

        switch (Formula->Type) {
            case tuple:
                Formula->FormulaUnion.TupleFormula.Elements = 
DuplicateTupleFormulae(
Original->FormulaUnion.TupleFormula.NumberOfElements,
Original->FormulaUnion.TupleFormula.Elements,Context,
ForceNewVariables);
                break;
            case sequent:
                Formula->FormulaUnion.SequentFormula.LHS = 
DuplicateTupleFormulae(
Original->FormulaUnion.SequentFormula.NumberOfLHSElements,
Original->FormulaUnion.SequentFormula.LHS,Context,
ForceNewVariables);
                Formula->FormulaUnion.SequentFormula.RHS = 
DuplicateTupleFormulae(
Original->FormulaUnion.SequentFormula.NumberOfRHSElements,
Original->FormulaUnion.SequentFormula.RHS,Context,
ForceNewVariables);
                break;
            case quantified:
                Formula->FormulaUnion.QuantifiedFormula.Variable =
DuplicateTerm(Original->FormulaUnion.QuantifiedFormula.Variable,Context,1);
                Formula->FormulaUnion.QuantifiedFormula.VariableType =
DuplicateFormula(Original->FormulaUnion.QuantifiedFormula.VariableType,
Context,ForceNewVariables);
                Formula->FormulaUnion.QuantifiedFormula.Formula =
DuplicateFormula(Original->FormulaUnion.QuantifiedFormula.Formula,Context,
ForceNewVariables);
                break;
            case binary:
                Formula->FormulaUnion.BinaryFormula.LHS =
DuplicateFormula(Original->FormulaUnion.BinaryFormula.LHS,Context,
ForceNewVariables);
                Formula->FormulaUnion.BinaryFormula.RHS =
DuplicateFormula(Original->FormulaUnion.BinaryFormula.RHS,Context,
ForceNewVariables);
                break;
            case unary:
                Formula->FormulaUnion.UnaryFormula.Formula =
DuplicateFormula(Original->FormulaUnion.UnaryFormula.Formula,Context,
ForceNewVariables);
                break; 
            case atom:
                Formula->FormulaUnion.Atom =
DuplicateTerm(Original->FormulaUnion.Atom,Context,
ForceNewVariables);
                break;
            case ite_formula:
                Formula->FormulaUnion.ConditionalFormula.Condition =
DuplicateFormula(Original->FormulaUnion.ConditionalFormula.Condition,Context,
ForceNewVariables);
                Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue =
DuplicateFormula(Original->FormulaUnion.ConditionalFormula.FormulaIfTrue,
Context,ForceNewVariables);
                Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse =
DuplicateFormula(Original->FormulaUnion.ConditionalFormula.FormulaIfFalse,
Context,ForceNewVariables);
                break;
            case let_formula:
                Formula->FormulaUnion.LetFormula.LetDefn =
DuplicateFormula(Original->FormulaUnion.LetFormula.LetDefn,Context,
ForceNewVariables);
                Formula->FormulaUnion.LetFormula.LetBody =
DuplicateFormula(Original->FormulaUnion.LetFormula.LetBody,
Context,ForceNewVariables);
                break;
            default:
                CodingError("Formula type unknown for duplication");
                break;
        }
    }
    return(Formula);
}
//-----------------------------------------------------------------------------
FORMULA ParseFormula(READFILE Stream,SyntaxType Language,ContextType Context,
VARIABLENODE * EndOfScope,int AllowBinary,int AllowInfixEquality,
int VariablesMustBeQuantified,ConnectiveType LastConnective) {

    FORMULA Formula = NULL;
    FORMULA BinaryFormula = NULL;
    FORMULA InfixFormula = NULL;
    ConnectiveType NextConnective;

//DEBUG printf("ParseFormula with token %s\n",CurrentToken(Stream)->NameToken);
    switch (CurrentToken(Stream)->KindToken) {
//----Two types of punctuation - ( for ()ed, [ for tuple
        case punctuation:
            if (CheckToken(Stream,punctuation,"[")) {
                Formula = ParseTupleOrSequentFormula(Stream,Language,Context,
EndOfScope,AllowBinary,VariablesMustBeQuantified,LastConnective);
            } else {
                AcceptToken(Stream,punctuation,"(");
                Formula = ParseFormula(Stream,Language,Context,EndOfScope,1,1,
VariablesMustBeQuantified,none);
                AcceptToken(Stream,punctuation,")");
            }
            break;
        case quantifier:
            Formula = ParseQuantifiedFormula(Stream,Language,Context,EndOfScope,
VariablesMustBeQuantified);
            break;
        case unary_connective:
            Formula = ParseUnaryFormula(Stream,Language,Context,EndOfScope,
VariablesMustBeQuantified);
            break;
//----Binary connective as a term in THF
        case binary_connective:
            Formula = NewFormula();
            Formula->Type = atom;
            Formula->FormulaUnion.Atom = ParseTerm(Stream,Language,Context,
EndOfScope,predicate,none,NULL,VariablesMustBeQuantified);
            break;
        default:
            if (!strcmp(CurrentToken(Stream)->NameToken,"$ite")) {
                Formula = ParseITEFormula(Stream,Language,Context,EndOfScope,
VariablesMustBeQuantified);
            } else if (!strcmp(CurrentToken(Stream)->NameToken,"$let")) {
                Formula = ParseLETFormula(Stream,Language,Context,EndOfScope,
VariablesMustBeQuantified);
            } else {
//DEBUG printf("parse atom %s\n",CurrentToken(Stream)->NameToken);
                Formula = ParseAtom(Stream,Language,Context,EndOfScope,
VariablesMustBeQuantified);
//DEBUG printf("done atom %s\n",CurrentToken(Stream)->NameToken);
            }
            break;
    }

//----Check for a binary formula
    if (
//----THF and TFX allow formulae as arguments of equality 
( AllowInfixEquality &&
  ( Language == tptp_thf ||
    Language == tptp_tff ) && 
  ( CheckToken(Stream,lower_word,"=") || 
    CheckToken(Stream,lower_word,"!=")
  )
) ||
( AllowBinary && 
  ( CheckTokenType(Stream,binary_connective) ||
//----THF and TFF have types. Should this be allowed independent of AllowBinary?
    ( ( Language == tptp_thf ||
        Language == tptp_tff  || Language == tptp_tcf ) &&
      ( CheckToken(Stream,punctuation,":") ||
        CheckToken(Stream,punctuation,">") ||
        CheckToken(Stream,punctuation,":=") ||
        CheckToken(Stream,punctuation,"<<")
      )
    )
  ) 
)  ) {
//DEBUG printf("do infix because it is %s\n",CurrentToken(Stream)->NameToken);
        NextConnective = StringToConnective(CurrentToken(Stream)->NameToken);
//----If doing an (in)equation, no last connective for associativity
        if (NextConnective == equation || NextConnective == negequation) {
            LastConnective = none;
        }
        if (LastConnective == none || (Associative(NextConnective) &&
LastConnective == NextConnective)) {
            if ((LastConnective == none && !LeftAssociative(NextConnective)) || 
RightAssociative(NextConnective)) {
                BinaryFormula = NewFormula();
                BinaryFormula->Type = binary;
                BinaryFormula->FormulaUnion.BinaryFormula.LHS = Formula;
                BinaryFormula->FormulaUnion.BinaryFormula.Connective = 
NextConnective;
//----For : the LHS is "none" because ()s are not needed.
                if (NextConnective == assignment ||
NextConnective == typedeclaration || NextConnective == maparrow) {
                    NextConnective = none;
                }
//----There are many different connectives here, so cannot "AcceptToken"
                NextToken(Stream);
                BinaryFormula->FormulaUnion.BinaryFormula.RHS = ParseFormula(
Stream,Language,Context,EndOfScope,AllowBinary,1,VariablesMustBeQuantified,
NextConnective);
//----Hack to fix negated infix equality
                if (BinaryFormula->FormulaUnion.BinaryFormula.Connective ==
negequation) {
                    InfixFormula = NewFormula();
                    InfixFormula->Type = unary;
                    InfixFormula->FormulaUnion.UnaryFormula.Connective = 
negation;
                    BinaryFormula->FormulaUnion.BinaryFormula.Connective =
equation;
                    InfixFormula->FormulaUnion.UnaryFormula.Formula = 
BinaryFormula;
                    BinaryFormula = InfixFormula;
                }
                return(BinaryFormula);
            } else if (LeftAssociative(NextConnective)) {
                while (LastConnective == none || 
LastConnective == NextConnective) {
                    BinaryFormula = NewFormula();
                    BinaryFormula->Type = binary;
                    BinaryFormula->FormulaUnion.BinaryFormula.LHS = Formula;
                    BinaryFormula->FormulaUnion.BinaryFormula.Connective =
NextConnective;
//----Only binary connectives are left associative, so I can "AcceptToken"
                    AcceptTokenType(Stream,binary_connective);
                    BinaryFormula->FormulaUnion.BinaryFormula.RHS = 
ParseFormula(Stream,Language,Context,EndOfScope,0,1,VariablesMustBeQuantified,
NextConnective);
                    Formula = BinaryFormula;
                    LastConnective = NextConnective;
                    if (CheckTokenType(Stream,binary_connective)) {
                        NextConnective = StringToConnective(
CurrentToken(Stream)->NameToken);
                    } else {
                        NextConnective = none;
                    }
                }
                return(BinaryFormula);
            } else if (LastConnective != none) {
                CodingError("Association neither left nor right");
                return(NULL);
            } else {
                CodingError("Should never get here in ParseFormula");
                return(NULL);
            }
        } else {
            TokenError(Stream);
            return(NULL);
        }
    } else {
        return(Formula);
    }
}
//-----------------------------------------------------------------------------
FORMULAWITHVARIABLES DuplicateFormulaWithVariables(
FORMULAWITHVARIABLES Original,SIGNATURE Signature,int ForceNewVariables) {

    ContextType Context;
    FORMULAWITHVARIABLES FormulaWithVariables;
    
    FormulaWithVariables = NewFormulaWithVariables();

//----Copy the variables list, setting each use to 0, and setting the
//----instantiation to point to the original (cheating in duplication :-)
    FormulaWithVariables->Variables = ParallelCopyVariableList(
Original->Variables);
    
//----Create a context for the parsing
    Context.Variables = &(FormulaWithVariables->Variables);
    Context.Signature = Signature;
    
//DEBUG printf("original variables\n");
//DEBUG PrintVariableList(Original->Variables,NULL);
//DEBUG printf("parallel copy variables\n");
//DEBUG PrintVariableList(FormulaWithVariables->Variables,NULL);
    FormulaWithVariables->Formula = DuplicateFormula(Original->Formula,
Context,ForceNewVariables);
//DEBUG printf("after copy variables\n");
//DEBUG PrintVariableList(FormulaWithVariables->Variables,NULL);

//----Set the variable instantiations to their rightful values
    ParallelCopyVariableInstantiations(Original->Variables,
FormulaWithVariables->Variables);

    return(FormulaWithVariables); 
}
//-----------------------------------------------------------------------------
FORMULA DuplicateInternalFormulaWithVariables(FORMULA Original,ContextType 
OriginalContext) {

    FORMULAWITHVARIABLES LocalFormulaWithVariables;
    FORMULAWITHVARIABLES CopiedFormulaWithVariables;
    VARIABLENODE * VariableNodePP;
    VARIABLENODE VariableNode;
    FORMULA Copy;

//----Make a local formula with variables to copy
    LocalFormulaWithVariables = NewFormulaWithVariables();
    LocalFormulaWithVariables->Variables = *(OriginalContext.Variables);
    LocalFormulaWithVariables->Formula = Original;

//----Copy it
    CopiedFormulaWithVariables = DuplicateFormulaWithVariables(
LocalFormulaWithVariables,OriginalContext.Signature,0);

//----Remove unused variables in copy
    VariableNodePP = &(CopiedFormulaWithVariables->Variables);
    while (*VariableNodePP != NULL) {
        if ((*VariableNodePP)->NumberOfUses == 0) {
            VariableNode = *VariableNodePP;
            *VariableNodePP = VariableNode->NextVariable;
            Free((void **)&VariableNode);
        } else {
            VariableNodePP = &((*VariableNodePP)->NextVariable);
        }
    }

//----Add into original variables
    *VariableNodePP = *(OriginalContext.Variables);
    *(OriginalContext.Variables) = CopiedFormulaWithVariables->Variables;

//----Discard the local formula with variables
    Copy = CopiedFormulaWithVariables->Formula;
    Free((void **)&CopiedFormulaWithVariables);

    return(Copy);
}
//-----------------------------------------------------------------------------
FORMULAWITHVARIABLES ParseFormulaWithVariables(READFILE Stream,
SyntaxType Language,SIGNATURE Signature,int VariablesMustBeQuantified) {

    ContextType Context;
    FORMULAWITHVARIABLES FormulaWithVariables;
    VARIABLENODE EndOfScope;
    int NeedNonLogicTokens;

    EndOfScope = NULL;
    FormulaWithVariables = NewFormulaWithVariables();

//----Create a context for the parsing
    Context.Variables = &(FormulaWithVariables->Variables);
    Context.Signature = Signature;

    NeedNonLogicTokens = Stream->NeedNonLogicTokens;
    Stream->NeedNonLogicTokens = 0;
    FormulaWithVariables->Formula = ParseFormula(Stream,Language,
Context,&EndOfScope,1,1,VariablesMustBeQuantified,none);
    Stream->NeedNonLogicTokens = NeedNonLogicTokens;
    return(FormulaWithVariables);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA ParseInclude(READFILE Stream,SIGNATURE Signature) {

    ContextType Context;
    ANNOTATEDFORMULA AnnotatedFormula;
    int Arity;

    AnnotatedFormula = NewAnnotatedFormula(include);
    Context.Variables = NULL;
    Context.Signature = Signature;
    AnnotatedFormula->AnnotatedFormulaUnion.Include = ParseTerm(Stream,
nontype,Context,NULL,non_logical_data,none,NULL,0);
//DEBUG printf("file\n%s\n",AnnotatedFormula->AnnotatedFormulaUnion.Include->Arguments[0]->TheSymbol.NonVariable->NameSymbol);
    TakeToken(Stream,punctuation,".");

//----Check it looks like an include
    if (strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.Include),
"include") || (((Arity = GetArity(AnnotatedFormula->
AnnotatedFormulaUnion.Include)) != 1) && Arity != 2) || (Arity == 1 &&
GetArity(AnnotatedFormula->AnnotatedFormulaUnion.Include->Arguments[0]) != 0) ||
(Arity == 2 && strcmp(GetSymbol(AnnotatedFormula->
AnnotatedFormulaUnion.Include->Arguments[1]),"[]"))) {
        TokenError(Stream);
    }

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA ParseComment(READFILE Stream) {

    ANNOTATEDFORMULA AnnotatedFormula;

    AnnotatedFormula = NewAnnotatedFormula(comment);
    AnnotatedFormula->AnnotatedFormulaUnion.Comment = CopyHeapString(
CurrentToken(Stream)->NameToken);
    AcceptTokenType(Stream,comment_token);

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA ParseBlankLine(READFILE Stream) {

    ANNOTATEDFORMULA AnnotatedFormula;

    AnnotatedFormula = NewAnnotatedFormula(blank_line);
    AcceptTokenType(Stream,blank_line_token);

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA DuplicateAnnotatedFormula(ANNOTATEDFORMULA Original,
SIGNATURE Signature) {

    switch (Original->Syntax) {
        case include:
        case blank_line:
        case comment:
            CodingError(
"Includes, blank lines, and comments cannot be duplicated\n");
            break;
//----For CNF the variables are implicitly universally quantified, and must
//----be new variables. For FOF we use the originals (can't recall why)
        case tptp_thf:
        case tptp_tff:
        case tptp_fof:
            return(DuplicateAnnotatedTSTPFormula(Original,Signature,0));
            break;
        case tptp_tcf:
        case tptp_cnf:
            return(DuplicateAnnotatedTSTPFormula(Original,Signature,1));
            break;
        default:
            CodingError("Annotated formula syntax unknown for duplicating");
            break;
    }
    return(NULL);
}
//-----------------------------------------------------------------------------
void FreeAnnotatedFormula(ANNOTATEDFORMULA * AnnotatedFormula) {

    if (*AnnotatedFormula != NULL) {
        if (--((*AnnotatedFormula)->NumberOfUses) == 0) {
            switch ((*AnnotatedFormula)->Syntax) {
                case include:
                    FreeTerm(&((*AnnotatedFormula)->
AnnotatedFormulaUnion.Include),NULL);
                    Free((void **)AnnotatedFormula);
                    break;
                case comment:
                    Free((void **)&((*AnnotatedFormula)->
AnnotatedFormulaUnion.Comment));
                    Free((void **)AnnotatedFormula);
                    break;
                case blank_line:
                    Free((void **)AnnotatedFormula);
                    break;
                case tptp_tpi:
                case tptp_thf:
                case tptp_tff:
                case tptp_tcf:
                case tptp_fof:
                case tptp_cnf:
                    FreeAnnotatedTSTPFormula(AnnotatedFormula);
                    break;
                default:
                    CodingError(
"Annotated formula syntax unknown for freeing\n");
                    break;
            }
        }
    }
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA ParseAnnotatedFormula(READFILE Stream,SIGNATURE Signature) {

    int NeedNonLogicTokens;
    ANNOTATEDFORMULA AnnotatedFormula;

    NeedNonLogicTokens = Stream->NeedNonLogicTokens;

    if (CheckToken(Stream,lower_word,"input_formula")) {
        Stream->NeedNonLogicTokens = 0;
        AnnotatedFormula = ParseAnnotatedTPTPFormula(Stream,Signature);
    } else if (CheckToken(Stream,lower_word,"input_clause")) {
        Stream->NeedNonLogicTokens = 0;
        AnnotatedFormula = ParseAnnotatedTPTPClause(Stream,Signature);
    } else if (CheckToken(Stream,lower_word,"include")) {
        Stream->NeedNonLogicTokens = 0;
        AnnotatedFormula = ParseInclude(Stream,Signature);
    } else if (CheckTokenType(Stream,comment_token)) {
        AnnotatedFormula = ParseComment(Stream);
    } else if (CheckTokenType(Stream,blank_line_token)) {
        AnnotatedFormula = ParseBlankLine(Stream);
    } else {
        Stream->NeedNonLogicTokens = 0;
        AnnotatedFormula = ParseAnnotatedTSTPFormula(Stream,Signature);
    }

    Stream->NeedNonLogicTokens = NeedNonLogicTokens;
    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
//----Use this entry point if you want the count updated
ANNOTATEDFORMULA ParseAndUseAnnotatedFormula(READFILE Stream,SIGNATURE 
Signature) {

    ANNOTATEDFORMULA AnnotatedFormula;

    if ((AnnotatedFormula = ParseAnnotatedFormula(Stream,Signature)) != NULL) {
        AnnotatedFormula->NumberOfUses++;
    }

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
void GetIncludeParts(ANNOTATEDFORMULA AnnotatedFormula,String IncludeFile,
SuperString IncludeFilter) {

    int Index;

    strcpy(IncludeFile,GetSymbol(
AnnotatedFormula->AnnotatedFormulaUnion.Include->Arguments[0]));
    if (GetArity(AnnotatedFormula->AnnotatedFormulaUnion.Include) > 1) {
        if (!strcmp(GetSymbol(
AnnotatedFormula->AnnotatedFormulaUnion.Include->Arguments[1]),"all")) {
            strcpy(IncludeFilter,"all");
        } else {
            if (GetSymbol(
AnnotatedFormula->AnnotatedFormulaUnion.Include->Arguments[1])[0] == '[') {
                strcpy(IncludeFilter,"");
                for (Index = 0; Index < GetArity(
AnnotatedFormula->AnnotatedFormulaUnion.Include->Arguments[1]);Index++) {
                    strcat(IncludeFilter,GetSymbol(AnnotatedFormula->
AnnotatedFormulaUnion.Include->Arguments[1]->Arguments[Index]));
                    strcat(IncludeFilter,"\n");
                }
            } else {
                ReportError("SyntaxError","Include directive is malformed",1);
            }
        }
    } else {
        strcpy(IncludeFilter,"all");
    }
//DEBUG printf("==%s==%s==\n",IncludeFile,IncludeFilter);
}
//-----------------------------------------------------------------------------
LISTNODE GetIncludedAnnotatedFormulae(READFILE Stream,SIGNATURE Signature,
int ExpandIncludes,ANNOTATEDFORMULA AnnotatedFormula) {

    String IncludeFile;
    SuperString IncludeFilter;
    LISTNODE IncludedHead;
    LISTNODE HeaderNode;
    String ErrorMessage;

    GetIncludeParts(AnnotatedFormula,IncludeFile,IncludeFilter);
//DEBUG printf("Have to include %s filtered by %s\n",IncludeFile,IncludeFilter);
    if ((IncludedHead = ParseFileOfFormulae(IncludeFile,Stream->FileName,
Signature,ExpandIncludes,IncludeFilter)) == NULL) {
        sprintf(ErrorMessage,"Could not include %s",IncludeFile);
        ReportError("InputError",ErrorMessage,0);
    } else {
//DEBUG printf("===%s===\n",IncludeFile);
//DEBUG PrintListOfAnnotatedTSTPNodes(stdout,Signature,IncludedHead,1,1);
//DEBUG printf("-------------\n");

//----Remove included header
        if (IncludedHead->Next != NULL &&
IncludedHead->Next->AnnotatedFormula->Syntax == comment &&
strstr(IncludedHead->Next->AnnotatedFormula->AnnotatedFormulaUnion.Comment,
"% File     :") == IncludedHead->Next->AnnotatedFormula->
AnnotatedFormulaUnion.Comment) {
            do {
                HeaderNode = IncludedHead;
                IncludedHead = IncludedHead->Next;
                FreeAnnotatedFormula(&(HeaderNode-> AnnotatedFormula));
                Free((void **)&HeaderNode);
            } while (IncludedHead != NULL &&
!(IncludedHead->AnnotatedFormula->Syntax == comment &&
strstr(IncludedHead->AnnotatedFormula->AnnotatedFormulaUnion.Comment,
"%------------------------------------------------------") ==
IncludedHead->AnnotatedFormula->AnnotatedFormulaUnion.Comment));
        }
    }
    return(IncludedHead);
}
//-----------------------------------------------------------------------------
LISTNODE ParseREADFILEOfHeader(READFILE Stream) {

    SIGNATURE Signature;
    int HeaderFound;
    int HeaderMissing;
    ANNOTATEDFORMULA AnnotatedFormula;
    LISTNODE Head;
    LISTNODE * Current;

    Signature = NewSignature();
    Head = NULL;
    Current = &Head;
    HeaderFound = 0;
    HeaderMissing = 0;

//----Look for start of header
    while (!HeaderFound && !HeaderMissing && !CheckTokenType(Stream,endeof)) {
        AnnotatedFormula = ParseAndUseAnnotatedFormula(Stream,Signature);
        if (GetSyntax(AnnotatedFormula) == comment &&
strstr(AnnotatedFormula->AnnotatedFormulaUnion.Comment,"% File ") != NULL) {
            HeaderFound = 1;
        } else {
            if (GetSyntax(AnnotatedFormula) != comment) {
                HeaderMissing = 1;
            }
            FreeAnnotatedFormula(&AnnotatedFormula);
        } 
    }
    while (HeaderFound && !HeaderMissing && !CheckTokenType(Stream,endeof)) {
        AddListNode(Current,NULL,AnnotatedFormula);
        Current = &((*Current)->Next);
        AnnotatedFormula = ParseAndUseAnnotatedFormula(Stream,Signature);
        if (GetSyntax(AnnotatedFormula) == blank_line) {
//----Blank lines are OK
        } else if (GetSyntax(AnnotatedFormula) == comment) {
            if (strstr(AnnotatedFormula->AnnotatedFormulaUnion.Comment,
"%--------") != NULL) {
                HeaderFound = 0;
                FreeAnnotatedFormula(&AnnotatedFormula);
            }
        } else {
            HeaderMissing = 1;
            FreeAnnotatedFormula(&AnnotatedFormula);
        }
    }


//----Delete if still in header
    if (HeaderMissing) {
        FreeListOfAnnotatedFormulae(&Head);
    } 
    FreeSignature(&Signature);
    return(Head);
}
//-----------------------------------------------------------------------------
LISTNODE ParseREADFILEOfFormulae(READFILE Stream,SIGNATURE Signature,
int ExpandIncludes,char * NameFilter) {

    ANNOTATEDFORMULA AnnotatedFormula;
    LISTNODE Head;
    String FormulaName;
    String IncludedNames;
    LISTNODE IncludedHead,IncludeNode;
    LISTNODE * Current;
    LISTNODE Mover;
    String ErrorMessage;

    Head = NULL;
    Current = &Head;
    while (!CheckTokenType(Stream,endeof)) {
        AnnotatedFormula = ParseAnnotatedFormula(Stream,Signature);
//----The usage count for the AnnotatedFormula is incremented in the addition
//----of a list node
        AddListNode(Current,NULL,AnnotatedFormula);
        Current = &((*Current)->Next);
    }

//----Expand includes if required
    if (ExpandIncludes) {
        Current = &Head;
        while ((*Current) != NULL) {
            if (GetSyntax((*Current)->AnnotatedFormula) == include) {
                IncludedHead = GetIncludedAnnotatedFormulae(Stream,Signature,
ExpandIncludes,(*Current)->AnnotatedFormula);

//----Link in and move down to the end
                IncludeNode = (*Current);
                if (IncludedHead == NULL) {
                    (*Current) = IncludeNode->Next;
                } else {
                    (*Current) = IncludedHead;
                    Mover = *Current;
                    while (Mover->Next != NULL) {
                        Mover = Mover->Next;
                    }
                    Mover->Next = IncludeNode->Next;
                }
                FreeAnnotatedFormula(&(IncludeNode->AnnotatedFormula));
                Free((void **)&IncludeNode);
            } else {
                Current = &((*Current)->Next);
            }
        }
    }

//----Filter formulae by name - only makes sense if includes have been expanded
//----and you are not requesting all
    if (ExpandIncludes && NameFilter != NULL && strcmp(NameFilter,"all")) {
        strcpy(IncludedNames,"");
        Current = &Head;
        while ((*Current) != NULL) {
            if (ReallyAnAnnotatedFormula((*Current)->AnnotatedFormula)) {
                GetName((*Current)->AnnotatedFormula,FormulaName);
//----If the name is in the list, delete it from the list and move on
                if (NameInList(FormulaName,IncludedNames)) {
                    sprintf(ErrorMessage,"Ambiguous include selection - %s",
FormulaName);
                    ReportError("InputError",ErrorMessage,0);
                } 
                if (RemoveNameFromList(FormulaName,NameFilter)) {
                    Current = &((*Current)->Next);
                    strcat(IncludedNames,FormulaName);
                    strcat(IncludedNames,"\n");
                } else {
                    Mover = (*Current)->Next;
                    FreeAnnotatedFormula(&((*Current)->AnnotatedFormula));
                    Free((void **)Current);
                    *Current = Mover;
                }
            } else {
                Current = &((*Current)->Next);
            }
        }
//----Make sure all have been found
        if (strcmp(NameFilter,"")) {
            sprintf(ErrorMessage,"Could not find %s",NameFilter);
            ReportError("InputError",ErrorMessage,0);
        }
    }

    return(Head);
}
//-----------------------------------------------------------------------------
LISTNODE ParseFILEOfHeader(FILE * FileStream) {

    READFILE Stream; 
    LISTNODE Head;

    if ((Stream = OpenFILEReadFile(FileStream)) == NULL) {
        return(NULL);
    }

    Head = ParseREADFILEOfHeader(Stream);
    CloseReadFile(Stream);

    return(Head);
}
//-----------------------------------------------------------------------------
LISTNODE ParseFILEOfFormulae(FILE * FileStream,SIGNATURE Signature,
int ExpandIncludes,char * NameFilter) {

    READFILE Stream; 
    LISTNODE Head;

    if ((Stream = OpenFILEReadFile(FileStream)) == NULL) {
        return(NULL);
    }

    Head = ParseREADFILEOfFormulae(Stream,Signature,ExpandIncludes,NameFilter);
    CloseReadFile(Stream);

    return(Head);
}
//-----------------------------------------------------------------------------
LISTNODE ParseFileOfHeader(char * FileName) {

    READFILE Stream; 
    LISTNODE Head;

    if ((Stream = OpenReadFile(FileName,NULL)) == NULL) {
        return(NULL);
    }

    Head = ParseREADFILEOfHeader(Stream);
    CloseReadFile(Stream);

    return(Head);
}
//-----------------------------------------------------------------------------
//----Send NULL as the CurrentFileName when starting. It's used for resolving
//----includes. Send NULL as the NameFilter if no filtering required.
LISTNODE ParseFileOfFormulae(char * FileName,char * CurrentFileName,
SIGNATURE Signature,int ExpandIncludes,char * NameFilter) {

    READFILE Stream; 
    LISTNODE Head;

    if ((Stream = OpenReadFile(FileName,CurrentFileName)) == NULL) {
        return(NULL);
    }

    Head = ParseREADFILEOfFormulae(Stream,Signature,ExpandIncludes,NameFilter);
    CloseReadFile(Stream);

    return(Head);
}
//-----------------------------------------------------------------------------
LISTNODE ParseStringOfFormulae(char * Content,SIGNATURE Signature,
int ExpandIncludes,char * NameFilter) {

    READFILE Stream;
    LISTNODE Head;
    
    if ((Stream = OpenStringReadFile(Content)) == NULL) {
        return(NULL);
    }
    
    Head = ParseREADFILEOfFormulae(Stream,Signature,ExpandIncludes,NameFilter);
    CloseReadFile(Stream);
    
    return(Head);

}
//-----------------------------------------------------------------------------
TERM ParseStringTerm(char * Content,SyntaxType Language,SIGNATURE Signature,
int VariablesMustBeQuantified) {

    READFILE Stream;
    ContextType Context;
    TERM Term;

    if ((Stream = OpenStringReadFile(Content)) == NULL) {
        return(NULL);
    }

//----Create a context for the parsing. No variable in non-logical data
    Context.Variables = NULL;
    Context.Signature = Signature;
    Term = ParseTerm(Stream,Language,Context,NULL,non_logical_data,none,NULL,
VariablesMustBeQuantified);
    CloseReadFile(Stream);

    return(Term);
}
//-----------------------------------------------------------------------------
