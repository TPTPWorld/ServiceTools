#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "ParseTSTP.h"
#include "PrintTSTP.h"
#include "Tokenizer.h"
#include "DataTypes.h"
#include "Utilities.h"
#include "Examine.h"
#include "Signature.h"
#include "Parsing.h"
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA NewAnnotatedFormula(SyntaxType Syntax) {

    ANNOTATEDFORMULA AnnotatedFormula;

    AnnotatedFormula = (ANNOTATEDFORMULA)Malloc(sizeof(AnnotatedFormulaType));
    AnnotatedFormula->Syntax = Syntax;
    AnnotatedFormula->NumberOfUses = 0;

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA NewAnnotatedTSTPFormula(SyntaxType Syntax) {

    ANNOTATEDFORMULA AnnotatedFormula;

    AnnotatedFormula = NewAnnotatedFormula(Syntax);
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name = NULL;
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status = 
nonstatus;
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.SubStatus = 
nonstatus;
    AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables = NULL;
    AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source = NULL;
    AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo = NULL;
    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
void FreeAnnotatedTSTPFormula(ANNOTATEDFORMULA * AnnotatedFormula) {

    Free((void **)&((*AnnotatedFormula)->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name));
    assert((*AnnotatedFormula)->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name == NULL);
    FreeFormulaWithVariables(&((*AnnotatedFormula)->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables));
    assert((*AnnotatedFormula)->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables == NULL);
    FreeTerm(&((*AnnotatedFormula)->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source),NULL);
    FreeTerm(&((*AnnotatedFormula)->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo),NULL);
    Free((void **)AnnotatedFormula);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA DuplicateAnnotatedTSTPFormula(ANNOTATEDFORMULA Original,
SIGNATURE Signature,int ForceNewVariables) {

    ContextType Context;
    ANNOTATEDFORMULA AnnotatedFormula;

    if (Original == NULL) {
        CodingError("Duplicating a NULL formula");
    }
    AnnotatedFormula = NewAnnotatedTSTPFormula(Original->Syntax);

    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name = 
CopyHeapString(Original->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name);
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status = 
Original->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status;
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.SubStatus = 
Original->AnnotatedFormulaUnion.AnnotatedTSTPFormula.SubStatus;
    AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables =
DuplicateFormulaWithVariables(Original->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables,Signature,
ForceNewVariables);

//----Create context for duplicating non-logical stuff
    Context.Variables = NULL;
    Context.Signature = Signature;
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source =
DuplicateTerm(Original->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source,
Context,0);
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo =
DuplicateTerm(Original->AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo,
Context,0);

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
ANNOTATEDFORMULA ParseAnnotatedTSTPFormula(READFILE Stream,
SIGNATURE Signature) {

    ContextType Context;
    ANNOTATEDFORMULA AnnotatedFormula;
    int VariablesMustBeQuantifiedAlready;
    VARIABLENODE EndOfScope;
    SyntaxType Language;

    if (CheckToken(Stream,lower_word,"tpi")) {
        AcceptToken(Stream,lower_word,"tpi");
        Language = tptp_tpi;
        AnnotatedFormula = NewAnnotatedTSTPFormula(tptp_tpi);
        VariablesMustBeQuantifiedAlready = 0;
    } else if (CheckToken(Stream,lower_word,"thf")) {
        AcceptToken(Stream,lower_word,"thf");
        Language = tptp_thf;
        AnnotatedFormula = NewAnnotatedTSTPFormula(tptp_thf);
        VariablesMustBeQuantifiedAlready = 1;
    } else if (CheckToken(Stream,lower_word,"tff")) {
        AcceptToken(Stream,lower_word,"tff");
        Language = tptp_tff;
        AnnotatedFormula = NewAnnotatedTSTPFormula(tptp_tff);
        VariablesMustBeQuantifiedAlready = 1;
    } else if (CheckToken(Stream,lower_word,"fof")) {
        AcceptToken(Stream,lower_word,"fof");
        Language = tptp_fof;
        AnnotatedFormula = NewAnnotatedTSTPFormula(tptp_fof);
        VariablesMustBeQuantifiedAlready = 1;
    } else {
        AcceptToken(Stream,lower_word,"cnf");
        Language = tptp_cnf;
        AnnotatedFormula = NewAnnotatedTSTPFormula(tptp_cnf);
        VariablesMustBeQuantifiedAlready = 0;
    }
    AcceptToken(Stream,punctuation,"(");
    EnsureTokenType(Stream,name);
    AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name = 
CopyHeapString(CurrentToken(Stream)->NameToken);
    AcceptTokenType(Stream,name);
    AcceptToken(Stream,punctuation,",");
    EnsureTokenType(Stream,lower_word);
    if ((AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status = 
CheckStringToStatus(CurrentToken(Stream)->NameToken)) == nonstatus) {
        TokenError(Stream);
    }
    AcceptTokenType(Stream,lower_word);
//----Check for substatus
    if (CheckToken(Stream,punctuation,"-")) {
        AcceptToken(Stream,punctuation,"-");
        AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.SubStatus =
StringToStatus(CurrentToken(Stream)->NameToken);
        AcceptTokenType(Stream,lower_word);
    }
    AcceptToken(Stream,punctuation,",");
    AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables = 
ParseFormulaWithVariables(Stream,Language,Signature,
VariablesMustBeQuantifiedAlready);

//----Create context for duplicating non-logical stuff
    Context.Variables = NULL;
    Context.Signature = Signature;
//----Check if source and useful info are there
    if (CheckToken(Stream,punctuation,",")) {
        AcceptToken(Stream,punctuation,",");
//----Local scope for source
        EndOfScope = NULL;
        AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source =
ParseTerm(Stream,nontype,Context,&EndOfScope,non_logical_data,none,NULL,0);
//DEBUG printf("The source is \n");
//DEBUG PrintTSTPTerm(stdout,AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source,-1,1);
//DEBUG printf("\n===========\n");
//----Check inference record has three arguments
        if (!strcmp(GetSymbol(AnnotatedFormula->AnnotatedFormulaUnion.
AnnotatedTSTPFormula.Source),"inference") && GetArity(AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source) != 3) {
            TokenError(Stream);
        }
//----Don't check that inference sources have at least one parent - must allow
//----derived but no parents - for tautologies which are inferred from nothing
//----NOPE - they should use introduced() records
//----NOPE NOPE - for some tautologies there might be an inference process
//----that confirms that it is a tautology, which needs to be recorded. In
//----this case an inference record is appropriate.
//        if (InferredAnnotatedFormula(AnnotatedFormula) && GetArity(
//AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source->
//Arguments[2]) == 0) {
//            TokenError(Stream);
//        } 
        if (CheckToken(Stream,punctuation,",")) {
            AcceptToken(Stream,punctuation,",");
//----Local scope for useful info
            EndOfScope = NULL;
            AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.UsefulInfo =
ParseTerm(Stream,nontype,Context,&EndOfScope,non_logical_data,none,NULL,0);
        }
    }

    AcceptToken(Stream,punctuation,")");
    TakeToken(Stream,punctuation,".");

    return(AnnotatedFormula);
}
//-----------------------------------------------------------------------------
