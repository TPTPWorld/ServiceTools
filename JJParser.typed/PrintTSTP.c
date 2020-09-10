#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "Signature.h"
#include "Parsing.h"
#include "Tokenizer.h"
#include "Examine.h"
#include "Modify.h"
#include "PrintTSTP.h"
#include "PrintDFG.h"
#include "PrintOtter.h"
#include "PrintKIF.h"
#include "PrintXML.h"
#include "PrintSMT2.h"
#include "PrintSUMO.h"
//-----------------------------------------------------------------------------
void PrintFileTSTPFormula(PRINTFILE Stream,SyntaxType Language,FORMULA Formula,
int Indent,int Pretty,ConnectiveType LastConnective,int TSTPSyntaxFlag);
//----Pretty = 0 means one line, lots of ()s
//----Pretty = 1 means nicest human readable

static int PrintShortSymbols = 1;
//-----------------------------------------------------------------------------
void SetPrintShortSymbols(int Choice) {

    PrintShortSymbols = Choice;
}
//-----------------------------------------------------------------------------
char * GetPrintSymbol(TERM Term) {

    if (Term == NULL) {
        CodingError("Getting print symbol for NULL term");
    }

    if (Term->Type == variable) {
        if (PrintShortSymbols) {
            return(GetSignatureShortSymbol(Term->TheSymbol.Variable->
VariableName));
        } else {
            return(GetSignatureSymbol(Term->TheSymbol.Variable->VariableName));
        }
    } else {
        if (PrintShortSymbols) {
            return(GetSignatureShortSymbol(Term->TheSymbol.NonVariable));
        } else {
            return(GetSignatureSymbol(Term->TheSymbol.NonVariable));
        }
    }
}
//-----------------------------------------------------------------------------
PrintFormatType StringToPrintFormat(char * FormatString) {

    String ErrorMessage;

    if (!strcmp(FormatString,"tptp")) {
        return(tptp);
    }
    if (!strcmp(FormatString,"tptp:long")) {
        return(tptp);
    }
    if (!strcmp(FormatString,"tptp:raw")) {
        return(tptp);
    }
    if (!strcmp(FormatString,"tptp:short")) {
        return(tptp_short);
    }
    if (!strcmp(FormatString,"oldtptp")) {
        return(oldtptp);
    }
//----Foreign formats
    if (!strcmp(FormatString,"dfg")) {
        return(dfg);
    }
    if (!strcmp(FormatString,"otter")) {
        return(otter);
    }
    if (!strcmp(FormatString,"kif")) {
        return(kif);
    }
    if (!strcmp(FormatString,"xml")) {
        return(xml);
    }
    if (!strcmp(FormatString,"xml_short")) {
        return(xml_short);
    }
    if (!strcmp(FormatString,"sumo")) {
        return(sumo);
    }
    if (!strcmp(FormatString,"smt2")) {
        return(smt2);
    }
    sprintf(ErrorMessage,"%s is not a known print format",FormatString);
    CodingError(ErrorMessage);
//----Will never get here because CodingError exits
    return(nonprinttype);
}
//-----------------------------------------------------------------------------
char * PrintFormatToString(PrintFormatType Format) {

     switch (Format) {
        case tptp:
            return("tptp");
            break;
        case tptp_short:
            return("tptp:short");
            break;
        case oldtptp:
            return("oldtptp");
            break;
//----Foreign formats
        case dfg:
            return("dfg");
            break;
        case otter:
            return("otter");
            break;
        case kif:
            return("kif");
            break;
        case xml:
            return("xml");
            break;
        case xml_short:
            return("xml_short");
            break;
        case sumo:
            return("sumo");
            break;
        default:
            CodingError("Not a print format");
//----Will never get here because CodingError exits
            return(NULL);
            break;
    }
}
//-----------------------------------------------------------------------------
void PrintFileIndent(PRINTFILE Stream,int Indent,int AlreadyIndented,
int Pretty) {

    int Index;

    if (Pretty) {
        for (Index = AlreadyIndented+1;Index <= Indent;Index++) {
            PFprintf(Stream," ");
        }
    }
}
//-----------------------------------------------------------------------------
void PrintIndent(FILE * Stream,int Indent,int AlreadyIndented,int Pretty) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileIndent(LocalStream,Indent,AlreadyIndented,Pretty);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintSpaces(PRINTFILE Stream,int Spaces) {

    int Index;
    for (Index=0;Index < Spaces;Index++) {
        PFprintf(Stream," ");
    }
}
//-----------------------------------------------------------------------------
int PositiveEquality(TERM Atom) {

    return(!strcmp(GetSymbol(Atom),"=") && GetArity(Atom) == 2);
}
//-----------------------------------------------------------------------------
int NegatedEquality(FORMULA Formula) {

    return(Formula->Type == unary && 
Formula->FormulaUnion.UnaryFormula.Connective == negation &&
Formula->FormulaUnion.UnaryFormula.Formula->Type == atom &&
PositiveEquality(Formula->FormulaUnion.UnaryFormula.Formula->
FormulaUnion.Atom));
}
//-----------------------------------------------------------------------------
void PrintFileTSTPTerm(PRINTFILE Stream,SyntaxType Language,TERM Term,
int Indent,int TSTPSyntaxFlag) {

    int Index;
    int Arity;
    char OpeningBracket,ClosingBracket;
    char * StartOfSymbol;

//----All THF and TFF (because of TFX) terms are formulae
    if ((Language == tptp_thf || Language == tptp_tff) && 
Term->Type == formula) {
        PrintFileTSTPFormula(Stream,tptp_thf,Term->TheSymbol.Formula,0,0,
outermost,1);
//----Check if a nested formula - no symbol
    } else if (Term->Type == nested_thf) {
        PFprintf(Stream,"$thf(");
//----Have to turn off pretty printing for nested formulae (so things come
//----out on one line), which means sequences of quantifiers are not listed
//----together. I'll live with it.
        PrintFileTSTPFormula(Stream,tptp_thf,Term->TheSymbol.NestedFormula->
Formula,0,0,outermost,1);
        PFprintf(Stream,")");
    } else if (Term->Type == nested_tff) {
        PFprintf(Stream,"$tff(");
        PrintFileTSTPFormula(Stream,tptp_tff,Term->TheSymbol.NestedFormula->
Formula,0,0,outermost,1);
        PFprintf(Stream,")");
    } else if (Term->Type == nested_fof) {
        PFprintf(Stream,"$fof(");
        PrintFileTSTPFormula(Stream,tptp_fof,Term->TheSymbol.NestedFormula->
Formula,0,0,outermost,1);
        PFprintf(Stream,")");
    } else if (Term->Type == nested_cnf) {
        PFprintf(Stream,"$cnf(");
        PrintFileTSTPFormula(Stream,tptp_cnf,Term->TheSymbol.NestedFormula->
Formula,0,0,outermost,1);
        PFprintf(Stream,")");
    } else if (Term->Type == nested_fot) {
        PFprintf(Stream,"$fot(");
        PrintFileTSTPTerm(Stream,Language,Term->TheSymbol.NestedTerm->Term,
Indent,TSTPSyntaxFlag);
        PFprintf(Stream,")");
    } else if (Term->Type == ite_term) {
        PFprintf(Stream,"$ite(");
        PrintFileTSTPFormula(Stream,tptp_tff,Term->TheSymbol.ConditionalTerm.
Condition,0,0,outermost,1);
        PFprintf(Stream,", ");
        PrintFileTSTPTerm(Stream,Language,
Term->TheSymbol.ConditionalTerm.TermIfTrue,Indent,TSTPSyntaxFlag);
        PFprintf(Stream,", ");
        PrintFileTSTPTerm(Stream,Language,
Term->TheSymbol.ConditionalTerm.TermIfFalse,Indent,TSTPSyntaxFlag);
        PFprintf(Stream,")");
    } else if (Term->Type == let_term) {
        PFprintf(Stream,"$let(");
        PrintFileTSTPFormula(Stream,tptp_tff,Term->TheSymbol.LetTerm.LetTypes,
0,0,outermost,1);
        PFprintf(Stream,", ");
        PrintFileTSTPFormula(Stream,tptp_tff,Term->TheSymbol.LetTerm.LetDefn,
0,0,outermost,1);
        PFprintf(Stream,", ");
        PrintFileTSTPTerm(Stream,Language,Term->TheSymbol.LetTerm.LetBody,
Indent,TSTPSyntaxFlag);
        PFprintf(Stream,")");
//----Check if infix - or : (see also TSTPTermToString in Examine.c)
    } else if (!strcmp(GetSymbol(Term),"-") || !strcmp(GetSymbol(Term),":")) {
        PrintFileTSTPTerm(Stream,Language,Term->Arguments[0],Indent,
TSTPSyntaxFlag);
        PFprintf(Stream,"%s",GetPrintSymbol(Term));
        PrintFileTSTPTerm(Stream,Language,Term->Arguments[1],Indent,
TSTPSyntaxFlag);
//----If infix equality or inequality
    } else if (TSTPSyntaxFlag && !strcmp(GetSymbol(Term),"=") &&
GetArity(Term) == 2) {
        PrintFileTSTPTerm(Stream,Language,Term->Arguments[0],Indent,1);
        PFprintf(Stream," ");
        if (TSTPSyntaxFlag == 2) {
            PFprintf(Stream,"!");
        }
        PFprintf(Stream,"= ");
        PrintFileTSTPTerm(Stream,Language,Term->Arguments[1],Indent,1);
    } else {
//----Check if a list
        if (GetSymbol(Term)[0] == '[') {
            OpeningBracket = '[';
            ClosingBracket = ']';
//----Otherwise assume an atom
        } else {
            StartOfSymbol = GetPrintSymbol(Term);
//----Skip past the $ if not in full TSTP mode, e.g., oldtptp
            if (!TSTPSyntaxFlag && *StartOfSymbol == '$') {
                StartOfSymbol++;
            }
//----If not TSTPSyntaxFlag or doesn't look like equality, then print = as equal
//----Not any more, because = is a term in THF
//             if ((!TSTPSyntaxFlag || GetArity(Term) != 2)  && 
// !strcmp(StartOfSymbol,"=")) {
//                 StartOfSymbol = "equal";
//             }
//----Strip lead + of positive numbers (cannot be a + in any other context)
            if (*StartOfSymbol == '+') {
                StartOfSymbol++;
            }
//----And now actually print what's left
            PFprintf(Stream,"%s",StartOfSymbol);
            OpeningBracket = '(';
            ClosingBracket = ')';
        }
        
        if ((Arity = GetArity(Term)) > 0 || OpeningBracket == '[') {
//----Pretty printing of []ed lists - used for outmost lists, e.g., multiple
//----inference() terms.
            PFprintf(Stream,"%c",OpeningBracket);
            if (OpeningBracket == '[' && Indent > 0 && Arity > 0) {
                PFprintf(Stream," ");
            }
            if (Arity > 0) {
                PrintFileTSTPTerm(Stream,Language,Term->Arguments[0],-1,
TSTPSyntaxFlag);
                for (Index=1;Index < Arity;Index++) {
                    PFprintf(Stream,",");
                    if (OpeningBracket == '[' && Indent > 0) {
                        PFprintf(Stream,"\n");
                        PrintSpaces(Stream,Indent+2);
                    }
                    PrintFileTSTPTerm(Stream,Language,Term->Arguments[Index],
-1,TSTPSyntaxFlag);
                }
            }
            if (OpeningBracket == '[' && Indent > 0 && Arity > 0) {
                PFprintf(Stream," ");
            }
            PFprintf(Stream,"%c",ClosingBracket);
        }
    }
}
//-----------------------------------------------------------------------------
void PrintStringTSTPTerm(char * PutOutputHere,SyntaxType Language,TERM Term,
int Indent,int TSTPSyntaxFlag) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenStringPrintFile(PutOutputHere)) != NULL) {
        PrintFileTSTPTerm(LocalStream,Language,Term,Indent,TSTPSyntaxFlag);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintTSTPTerm(FILE * Stream,SyntaxType Language,TERM Term,int Indent,
int TSTPSyntaxFlag) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileTSTPTerm(LocalStream,Language,Term,Indent,TSTPSyntaxFlag);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
int TypeOrDefnConnective(ConnectiveType Connective) {

    return(Connective == typedeclaration || Connective == subtype ||
Connective == assignment);
}
//-----------------------------------------------------------------------------
int FlatBinaryConnective(ConnectiveType Connective) {

    return(Connective == application || Connective == maparrow ||
Connective == xprodtype || Connective == uniontype);
}
//-----------------------------------------------------------------------------
int SymbolFormula(FORMULA Formula) {

//----Atoms and FOL predicates are "symbols". Thus $ite() and $let() are in 
//----this category. Note tuples have arity -1 and are not "symbols".
    return(
(Formula->Type == atom && GetArity(Formula->FormulaUnion.Atom) >= 0));
//NOT MORE FOR FOOL Formula->Type == ite_formula || Formula->Type == let_formula);
}
//-----------------------------------------------------------------------------
int LiteralFormula(FORMULA Formula) {

    return(SymbolFormula(Formula) ||
(Formula->Type == unary &&
 Formula->FormulaUnion.UnaryFormula.Connective == negation &&
 LiteralFormula(Formula->FormulaUnion.UnaryFormula.Formula)));
}
//-----------------------------------------------------------------------------
int NegatedEquation(FORMULA Formula,FORMULA * LHS,FORMULA * RHS) {

    if (Formula->Type == unary && 
Formula->FormulaUnion.UnaryFormula.Connective == negation && 
Formula->FormulaUnion.UnaryFormula.Formula->Type == binary && 
Formula->FormulaUnion.UnaryFormula.Formula->
FormulaUnion.BinaryFormula.Connective == equation) {
        if (LHS != NULL) {
            *LHS = Formula->FormulaUnion.UnaryFormula.Formula->
FormulaUnion.BinaryFormula.LHS;
        }
        if (RHS != NULL) {
            *RHS = Formula->FormulaUnion.UnaryFormula.Formula->
FormulaUnion.BinaryFormula.RHS;
        }
        return(1);
    } else {
        return(0);
    }
}
//-----------------------------------------------------------------------------
int Equation(FORMULA Formula,FORMULA * LHS,FORMULA * RHS) {

    if (Formula->Type == binary &&
Formula->FormulaUnion.BinaryFormula.Connective == equation) {
        if (LHS != NULL) {
            *LHS = Formula->FormulaUnion.BinaryFormula.LHS;
        }
        if (RHS != NULL) {
            *RHS = Formula->FormulaUnion.BinaryFormula.RHS;
        }
        return(1);
    } else {
        return(NegatedEquation(Formula,LHS,RHS));
    }
}
//-----------------------------------------------------------------------------
int TypeOrDefnFormula(FORMULA Formula) {

    return(Formula->Type == binary &&
TypeOrDefnConnective(Formula->FormulaUnion.BinaryFormula.Connective));
}
//-----------------------------------------------------------------------------
int FlatEquation(FORMULA Formula) {
    
    FORMULA LHS;
    FORMULA RHS;

    return(Equation(Formula,&LHS,&RHS) &&
LiteralFormula(LHS) && LiteralFormula(RHS));
}
//-----------------------------------------------------------------------------
//----Local mutual recursion
int FlatFormula(FORMULA Formula);
//-----------------------------------------------------------------------------
int FlatBinaryFormula(FORMULA Formula) {

    return(Formula->Type == binary &&
FlatBinaryConnective(Formula->FormulaUnion.BinaryFormula.Connective) &&
FlatFormula(Formula->FormulaUnion.BinaryFormula.LHS) &&
FlatFormula(Formula->FormulaUnion.BinaryFormula.RHS));
}
//-----------------------------------------------------------------------------
int FlatTypeFormula(FORMULA Formula) {

    return(TypeOrDefnFormula(Formula) &&
SymbolFormula(Formula->FormulaUnion.BinaryFormula.LHS) &&
SymbolFormula(Formula->FormulaUnion.BinaryFormula.RHS));

}
//-----------------------------------------------------------------------------
int ApplicationFormula(FORMULA Formula) {

    return(Formula->Type == binary && 
Formula->FormulaUnion.BinaryFormula.Connective == application);

}
//-----------------------------------------------------------------------------
int FlatFormula(FORMULA Formula) {

    return(LiteralFormula(Formula) || FlatEquation(Formula) || 
FlatBinaryFormula(Formula) || TypeOrDefnFormula(Formula));
}
//-----------------------------------------------------------------------------
int FlatQuantifiedVariable(QuantifiedFormulaType QuantifiedFormula) {

    if (QuantifiedFormula.VariableType == NULL) {
        return(1);
    } else {
        return(FlatFormula(QuantifiedFormula.VariableType));
    }
}
//-----------------------------------------------------------------------------
void PrintQuantifiedVariable(PRINTFILE Stream,SyntaxType Language,
QuantifiedFormulaType QuantifiedFormula,int Indent,int Pretty,
int TSTPSyntaxFlag) {

    ConnectiveType FakeConnective;

//----Print existential count if there is one
    if (QuantifiedFormula.Quantifier == existential && 
QuantifiedFormula.ExistentialCount >= 0) {
        PFprintf(Stream,"%d:",QuantifiedFormula.ExistentialCount);
    }
    PFprintf(Stream,"%s",GetPrintSymbol(QuantifiedFormula.Variable));
    Indent += 2;
//----Here's where types are printed
    if (QuantifiedFormula.VariableType != NULL) {
        PFprintf(Stream,": ");
        if (LiteralFormula(QuantifiedFormula.VariableType) ||
FlatBinaryFormula(QuantifiedFormula.VariableType)) {
            FakeConnective = outermost;
        } else {
            FakeConnective = none;
        }
        PrintFileTSTPFormula(Stream,Language,QuantifiedFormula.VariableType,
Indent,Pretty,FakeConnective,TSTPSyntaxFlag);
    }
}
//-----------------------------------------------------------------------------
void PrintFileTupleFormulae(PRINTFILE Stream,SyntaxType Language,
int NumberOfElements,FORMULAArray TupleFormulae,int Indent,int Pretty,
int TSTPSyntaxFlag) {

    int ElementNumber;

    PFprintf(Stream,"[");
    if (NumberOfElements > 0) {
        PFprintf(Stream," ");
        PrintFileTSTPFormula(Stream,Language,TupleFormulae[0],Indent+2,
Pretty,outermost,TSTPSyntaxFlag);
        for (ElementNumber=1;ElementNumber < NumberOfElements;
ElementNumber++) {
            PFprintf(Stream,", ");
            if (Pretty) {
                PFprintf(Stream,"\n");
                PrintSpaces(Stream,Indent+2);
            }
            PrintFileTSTPFormula(Stream,Language,TupleFormulae[ElementNumber],
Indent+2,Pretty,outermost,TSTPSyntaxFlag);
        }
    }
    PFprintf(Stream," ]");
}
//-----------------------------------------------------------------------------
void PrintFileTSTPFormula(PRINTFILE Stream,SyntaxType Language,FORMULA Formula,
int Indent,int Pretty,ConnectiveType LastConnective,int TSTPSyntaxFlag) {
//----TSTPSyntaxFlag = 2 is the case of a negated equation or equality - the
//----former becomes <~> and the latter becomes !=.

    int NeedBrackets;
    int NeedNewLine;
    int ConnectiveIndent;
    int VariableIndent;
    ConnectiveType Connective;
    ConnectiveType FakeConnective;
    FORMULA SideFormula;

    if (Formula == NULL) {
        CodingError("No TSTP formula to print");
    } else {
        switch (Formula->Type) {
            case tuple:
                PrintFileTupleFormulae(Stream,Language,
Formula->FormulaUnion.TupleFormula.NumberOfElements,
Formula->FormulaUnion.TupleFormula.Elements,Indent,Pretty,TSTPSyntaxFlag);
                break;
            case sequent:
                PrintFileTupleFormulae(Stream,Language,
Formula->FormulaUnion.SequentFormula.NumberOfLHSElements,
Formula->FormulaUnion.SequentFormula.LHS,Indent,Pretty,TSTPSyntaxFlag);
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    PrintSpaces(Stream,Indent - 1 - 
strlen(ConnectiveToString(gentzenarrow)));
                }
                PFprintf(Stream,"%s ",ConnectiveToString(gentzenarrow));
                PrintFileTupleFormulae(Stream,Language,
Formula->FormulaUnion.SequentFormula.NumberOfRHSElements,
Formula->FormulaUnion.SequentFormula.RHS,Indent,Pretty,TSTPSyntaxFlag);
                break;

            case quantified:
                if (LastConnective == brackets) {
                    PFprintf(Stream,"( ");
                    Indent += 2;
                }
                PFprintf(Stream,"%s",ConnectiveToString(
Formula->FormulaUnion.QuantifiedFormula.Quantifier));
                PrintSpaces(Stream,2 - strlen(ConnectiveToString(
Formula->FormulaUnion.QuantifiedFormula.Quantifier)));
                PFprintf(Stream,"[");
                VariableIndent = Indent + 3;
                PrintQuantifiedVariable(Stream,Language,Formula->
FormulaUnion.QuantifiedFormula,Indent+4,Pretty,TSTPSyntaxFlag);
                while (Pretty && 
//----Sequence of nested quantified formulae
Formula->FormulaUnion.QuantifiedFormula.Formula->Type == quantified &&
//----With the same quantifier
Formula->FormulaUnion.QuantifiedFormula.Quantifier ==
Formula->FormulaUnion.QuantifiedFormula.Formula->FormulaUnion.
QuantifiedFormula.Quantifier) {
                    PFprintf(Stream,",");
//----If current and next are flat stay on this line
                    if (!FlatQuantifiedVariable(Formula->
FormulaUnion.QuantifiedFormula) || !FlatQuantifiedVariable(
Formula->FormulaUnion.QuantifiedFormula.Formula->
FormulaUnion.QuantifiedFormula)) {
                        PFprintf(Stream,"\n");
                        PrintSpaces(Stream,VariableIndent);
                    }
                    Formula = Formula->FormulaUnion.QuantifiedFormula.Formula;
                    PrintQuantifiedVariable(Stream,Language,Formula->
FormulaUnion.QuantifiedFormula,Indent+4,Pretty,TSTPSyntaxFlag);
                }
                PFprintf(Stream,"] :");
//----If not pretty, or unary and atom, or atom, do on same line
                if (!Pretty || 
LiteralFormula(Formula->FormulaUnion.QuantifiedFormula.Formula) ||
FlatEquation(Formula->FormulaUnion.QuantifiedFormula.Formula)) {
                    PFprintf(Stream," ");
                    PrintFileTSTPFormula(Stream,Language,Formula->
FormulaUnion.QuantifiedFormula.Formula,0,Pretty,none,TSTPSyntaxFlag);
                } else {
//----Otherwise on the next line
                    PFprintf(Stream,"\n");
//----If another quantified, no extra indent
                    if (Formula->FormulaUnion.QuantifiedFormula.Formula->
Type != quantified) {
                        Indent += 2;
                    }
                    PrintSpaces(Stream,Indent);
                    PrintFileTSTPFormula(Stream,Language,Formula->
FormulaUnion.QuantifiedFormula.Formula,Indent,Pretty,none,TSTPSyntaxFlag);
                }
                if (LastConnective == brackets) {
                    PFprintf(Stream," )");
                }
                break;

            case binary:
                Connective = Formula->FormulaUnion.BinaryFormula.Connective;
//----No brackets for sequences of associative formulae and top level
                if (LastConnective == outermost ||
(Connective == LastConnective && Associative(Connective))) {
                    NeedBrackets = 0;
                    ConnectiveIndent = Indent - strlen(ConnectiveToString(
Connective)) - 1;
                } else {
                    NeedBrackets = 1;
                    ConnectiveIndent = Indent - strlen(ConnectiveToString(
Connective)) + 1;
                    PFprintf(Stream,"( ");
                    Indent += 2;
                }
//----No new line for sequences of @ and >, and flat equations
                NeedNewLine = !FlatFormula(Formula);
//----If in a negated infix equality, use != and reset
                if (Connective == equation && TSTPSyntaxFlag == 2) {
                    Connective = negequation;
                    ConnectiveIndent--;
                    TSTPSyntaxFlag = 1;
                } 
//----Need to force brackets for right associative operators
                SideFormula = Formula->FormulaUnion.BinaryFormula.LHS;
                if ((Associative(Connective) && 
!FullyAssociative(Connective) && SideFormula->Type == binary &&
RightAssociative(SideFormula->FormulaUnion.BinaryFormula.Connective)) ||
//----And for non-simple equations
((Connective == equation || Connective == negequation) && 
!SymbolFormula(SideFormula))) {
//----tptp2X needs them for literals too (sad - the BNF does not)
//    !LiteralFormula(SideFormula))) {
                    FakeConnective = brackets;
                } else {
                    FakeConnective = Connective;
                }
                PrintFileTSTPFormula(Stream,Language,SideFormula,Indent,Pretty,
FakeConnective,TSTPSyntaxFlag);
                if (NeedNewLine && Pretty) {
                    PFprintf(Stream,"\n");
                    PrintSpaces(Stream,ConnectiveIndent);
                } else if (!TypeOrDefnConnective(Connective)) {
                    PFprintf(Stream," ");
                }
                PFprintf(Stream,"%s ",ConnectiveToString(Connective));
                SideFormula = Formula->FormulaUnion.BinaryFormula.RHS;
//----If a type dec or defn then new line if not flat RHS
                if (TypeOrDefnFormula(Formula) && !FlatFormula(SideFormula) &&
Pretty) {
                    PFprintf(Stream,"\n");
                    Indent +=2;
                    PrintSpaces(Stream,Indent);
                }
//----If a : or := then no ()s required on RHS except if @ constructor
                if (TypeOrDefnConnective(Connective) && 
FlatFormula(SideFormula) && !ApplicationFormula(SideFormula)) {
                    FakeConnective = outermost;
//----Need to force brackets for left associative operators
                } else if ((Associative(Connective) && 
!FullyAssociative(Connective) && SideFormula->Type == binary && 
LeftAssociative(SideFormula->FormulaUnion.BinaryFormula.Connective)) ||
((Connective == equation || Connective == negequation) && 
!SymbolFormula(SideFormula))) {
//----tptp2X needs them for literals too (sad - the BNF does not)
//    !LiteralFormula(SideFormula))) {
                    FakeConnective = brackets;
                } else {
                    FakeConnective = Connective;
                }
                PrintFileTSTPFormula(Stream,Language,SideFormula,Indent,Pretty,
FakeConnective,TSTPSyntaxFlag);
                if (NeedBrackets) {
                    PFprintf(Stream," )");
                }
                break;

            case unary:
//----Special for infix negated equality
                if (TSTPSyntaxFlag && 
(NegatedEquation(Formula,NULL,NULL) || NegatedEquality(Formula))) {
                    TSTPSyntaxFlag = 2;
                    PrintFileTSTPFormula(Stream,Language,Formula->
FormulaUnion.UnaryFormula.Formula,Indent,Pretty,LastConnective,TSTPSyntaxFlag);
                } else {
                    if (Equation(Formula->FormulaUnion.UnaryFormula.Formula,
NULL,NULL) || NegatedEquation(Formula->FormulaUnion.UnaryFormula.Formula,
NULL,NULL) || NegatedEquality(Formula->FormulaUnion.UnaryFormula.Formula)) {
                        FakeConnective = brackets;
                    } else {
                        FakeConnective = none;
                    }
                    if (LastConnective == brackets) {
                        PFprintf(Stream,"( ");
                        Indent +=2;
                    }
                    PFprintf(Stream,"%s",ConnectiveToString(
Formula->FormulaUnion.UnaryFormula.Connective));
                    if (2 - strlen(ConnectiveToString(
Formula->FormulaUnion.UnaryFormula.Connective)) <= 0) {
                        PrintSpaces(Stream,1);
                    } else {
                        PrintSpaces(Stream,2 - strlen(ConnectiveToString(
Formula->FormulaUnion.UnaryFormula.Connective)));
                    }
                    Indent += 2;
//----If not pretty add extra ()s around negated formula
                    if (!SymbolFormula(
Formula->FormulaUnion.UnaryFormula.Formula) && 
(!Pretty || FakeConnective == brackets)) {
                        PFprintf(Stream,"( ");
                        Indent +=2;
                    }
                    PrintFileTSTPFormula(Stream,Language,Formula->
FormulaUnion.UnaryFormula.Formula,Indent,Pretty,none,TSTPSyntaxFlag);
                    if (!SymbolFormula(
Formula->FormulaUnion.UnaryFormula.Formula) && 
(!Pretty || FakeConnective == brackets)) {
                        PFprintf(Stream," )");
                    }
                    if (LastConnective == brackets) {
                        PFprintf(Stream," )");
                    }
                }
                break;

            case atom:
                NeedBrackets = 
Formula->FormulaUnion.Atom->Type == connective || LastConnective == brackets;
                if (NeedBrackets) {
                    PFprintf(Stream,"(");
                    if (LastConnective == brackets) {
                        PFprintf(Stream," ");
                    }
                }
                PrintFileTSTPTerm(Stream,Language,Formula->FormulaUnion.Atom,
-1,TSTPSyntaxFlag);
                if (NeedBrackets) {
                    if (LastConnective == brackets) {
                        PFprintf(Stream," ");
                    }
                    PFprintf(Stream,")");
                }
                break;

            case ite_formula:
                PFprintf(Stream,"$ite(");
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    Indent += 2;
                    PrintSpaces(Stream,Indent);
                }
                PrintFileTSTPFormula(Stream,Language,
Formula->FormulaUnion.ConditionalFormula.Condition,Indent,Pretty,none,
TSTPSyntaxFlag);
                PFprintf(Stream,", ");
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    PrintSpaces(Stream,Indent);
                }
                PrintFileTSTPFormula(Stream,Language,
Formula->FormulaUnion.ConditionalFormula.FormulaIfTrue,Indent,Pretty,none,
TSTPSyntaxFlag);
                PFprintf(Stream,", ");
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    PrintSpaces(Stream,Indent);
                }
                PrintFileTSTPFormula(Stream,Language,
Formula->FormulaUnion.ConditionalFormula.FormulaIfFalse,Indent,Pretty,none,
TSTPSyntaxFlag);
                PFprintf(Stream," )");
                break;

            case let_formula:
                PFprintf(Stream,"$let(");
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    Indent += 2;
                    PrintSpaces(Stream,Indent);
                }
                PrintFileTSTPFormula(Stream,Language,
Formula->FormulaUnion.LetFormula.LetTypes,Indent,Pretty,outermost,
TSTPSyntaxFlag);
                PFprintf(Stream,", ");
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    PrintSpaces(Stream,Indent);
                }
                PrintFileTSTPFormula(Stream,Language,
Formula->FormulaUnion.LetFormula.LetDefn,Indent,Pretty,outermost,
TSTPSyntaxFlag);
                PFprintf(Stream,", ");
                if (Pretty) {
                    PFprintf(Stream,"\n");
                    PrintSpaces(Stream,Indent);
                }
                PrintFileTSTPFormula(Stream,Language,
Formula->FormulaUnion.LetFormula.LetBody,Indent,Pretty,none,TSTPSyntaxFlag);
                PFprintf(Stream," )");
                break;

            default:
                CodingError("Formula type unknown for printing");
                break;
        }
    }
}
//-----------------------------------------------------------------------------
void PrintTSTPFormula(FILE * Stream,SyntaxType Language,FORMULA Formula,
int Indent,int Pretty,ConnectiveType LastConnective,int TSTPSyntaxFlag) {

    PRINTFILE LocalStream;
                
    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileTSTPFormula(LocalStream,Language,Formula,Indent,Pretty,
LastConnective,TSTPSyntaxFlag);
        ClosePrintFile(LocalStream);
    }
}           
//-----------------------------------------------------------------------------
void PrintFileAnnotatedTSTPFormula(PRINTFILE Stream,SyntaxType Language,
AnnotatedTSTPFormulaType AnnotatedTSTPFormula,PrintFormatType Format,
int Pretty) {

    switch (Language) {
        case tptp_tpi:
            PFprintf(Stream,"tpi");
            break;
        case tptp_thf:
            PFprintf(Stream,"thf");
            break;
        case tptp_tff:
            PFprintf(Stream,"tff");
            break;
        case tptp_fof:
            PFprintf(Stream,"fof");
            break;
        case tptp_cnf:
            PFprintf(Stream,"cnf");
            break;
        default:
            CodingError("Formula type unknown for printing");
            break;
    }
    PFprintf(Stream,"(%s,%s",AnnotatedTSTPFormula.Name,
StatusToString(AnnotatedTSTPFormula.Status));
    if (Format == tptp && AnnotatedTSTPFormula.SubStatus != nonstatus) {
        PFprintf(Stream,"-%s",StatusToString(AnnotatedTSTPFormula.SubStatus));
    }
    PFprintf(Stream,",");

    if (Language == tptp_tpi) {
        PrintFileTSTPFormula(Stream,Language,
AnnotatedTSTPFormula.FormulaWithVariables->Formula,0,0,outermost,1);
    } else {
        if (Pretty) {
//----Things that start on a new line alone
            if (
(Language == tptp_thf || Language == tptp_tff || Language == tptp_fof) &&
(AnnotatedTSTPFormula.FormulaWithVariables->Formula->Type == quantified ||
AnnotatedTSTPFormula.FormulaWithVariables->Formula->Type == unary ||
//----No top level tuples
// AnnotatedTSTPFormula.FormulaWithVariables->Formula->Type == tuple ||
TypeOrDefnFormula(AnnotatedTSTPFormula.FormulaWithVariables->Formula) ||
LiteralFormula(AnnotatedTSTPFormula.FormulaWithVariables->Formula) ||
//----$let and $ite are no longer LiteralFormula (why??), add here explicitly
AnnotatedTSTPFormula.FormulaWithVariables->Formula->Type == ite_formula ||
AnnotatedTSTPFormula.FormulaWithVariables->Formula->Type == let_formula ||
FlatEquation(AnnotatedTSTPFormula.FormulaWithVariables->Formula) ||
FlatBinaryFormula(AnnotatedTSTPFormula.FormulaWithVariables->Formula))) {
                PFprintf(Stream,"(\n");
                PrintSpaces(Stream,4);
                PrintFileTSTPFormula(Stream,Language,
AnnotatedTSTPFormula.FormulaWithVariables->Formula,4,Pretty,outermost,1);
            } else {
//----Things that need ()s on the new line
                PFprintf(Stream,"\n");
                PrintSpaces(Stream,4);
                PFprintf(Stream,"( ");
                PrintFileTSTPFormula(Stream,Language,
AnnotatedTSTPFormula.FormulaWithVariables->Formula,6,Pretty,outermost,1);
            }
        } else {
            PFprintf(Stream,"( ");
            PrintFileTSTPFormula(Stream,Language,
AnnotatedTSTPFormula.FormulaWithVariables->Formula,0,Pretty,outermost,1);
        }
        PFprintf(Stream," )");
    }

//----Source and useful info are optional
    if (Format == tptp && AnnotatedTSTPFormula.Source != NULL) {
        PFprintf(Stream,",%s",(Pretty?"\n    ":""));
//----Still need full TSTP mode because formulae might appear in the source
//----of useful info
        PrintFileTSTPTerm(Stream,Language,AnnotatedTSTPFormula.Source,4,1);
        if (AnnotatedTSTPFormula.UsefulInfo != NULL) {
            PFprintf(Stream,",%s",(Pretty?"\n    ":""));
            PrintFileTSTPTerm(Stream,Language,AnnotatedTSTPFormula.UsefulInfo,
-1,1);
        }
    }
    PFprintf(Stream,").\n");
}
//-----------------------------------------------------------------------------
void PrintAnnotatedTSTPFormula(FILE * Stream,SyntaxType Language,
AnnotatedTSTPFormulaType AnnotatedTSTPFormula,PrintFormatType Format,
int Pretty) {

    PRINTFILE LocalStream;
                
    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileAnnotatedTSTPFormula(LocalStream,Language,AnnotatedTSTPFormula,
Format,Pretty);
        ClosePrintFile(LocalStream);
    }
}           
//-----------------------------------------------------------------------------
void PrintFileTPTPClause(PRINTFILE Stream,SyntaxType Language,FORMULA Formula,
int Indent,int AlreadyIndented,int NeedCommaNewline) {

//----Bypass the universal quantifiers (all outermost)
    while (Formula->Type == quantified &&  
Formula->FormulaUnion.QuantifiedFormula.Quantifier == universal) {
//DEBUG printf("drop quantifier\n");
        Formula = Formula->FormulaUnion.QuantifiedFormula.Formula;
    }

//-----Start formatting
    if (NeedCommaNewline) {
        PFprintf(Stream,",\n");
        AlreadyIndented = 0;
    }
    PrintFileIndent(Stream,Indent,AlreadyIndented,1);

//-----Print the literals
    switch (Formula->Type) {
        case atom:
//----Print nothing for an empty clause
            if (strcmp(GetSymbol(Formula->FormulaUnion.Atom),"$false")) {
                PFprintf(Stream,"++");
                PrintFileTSTPTerm(Stream,Language,Formula->FormulaUnion.Atom,
-1,0);
            }
            break;
        case unary:
            if (Formula->FormulaUnion.UnaryFormula.Connective == negation) {
                PFprintf(Stream,"--");
                PrintFileTSTPTerm(Stream,Language,
Formula->FormulaUnion.UnaryFormula.Formula->FormulaUnion.Atom,-1,0);
            } else {
                CodingError("Printing a non-clause as a clause");
            }
            break;
        case binary:
            if (Formula->FormulaUnion.BinaryFormula.Connective == disjunction) {
                PrintFileTPTPClause(Stream,Language,
Formula->FormulaUnion.BinaryFormula.LHS,Indent,Indent,0);
                PrintFileTPTPClause(Stream,Language,
Formula->FormulaUnion.BinaryFormula.RHS,Indent,0,1);
            } else {
                CodingError("Printing a non-clause as a clause");
            }
            break;
        default:
            CodingError("Printing a non-clause as a clause");
            break;
    }
}
//-----------------------------------------------------------------------------
void PrintTPTPClause(FILE * Stream,SyntaxType Language,FORMULA Formula,
int Indent,int AlreadyIndented,int NeedCommaNewline) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileTPTPClause(LocalStream,Language,Formula,Indent,AlreadyIndented,
NeedCommaNewline);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintFileAnnotatedTPTPFormula(PRINTFILE Stream,SyntaxType Language,
AnnotatedTSTPFormulaType AnnotatedTSTPFormula,int Pretty) {

    switch (Language) {
        case tptp_fof:
            PFprintf(Stream,"input_formula");
            break;
        case tptp_cnf:
            PFprintf(Stream,"input_clause");
            break;
        default:
            CodingError("Formula type unknown for printing");
            break;
    }
    PFprintf(Stream,"(%s,%s,%s",AnnotatedTSTPFormula.Name,
StatusToString(AnnotatedTSTPFormula.Status),(Pretty?"\n":""));
    switch (Language) {
        case tptp_fof:
            PFprintf(Stream,"    (");
            PrintFileTSTPFormula(Stream,tptp_fof,AnnotatedTSTPFormula.
FormulaWithVariables->Formula,6,Pretty,outermost,0);
            PFprintf(Stream," )");
            break;
        case tptp_cnf:
            PFprintf(Stream,"    [");
            PrintFileTPTPClause(Stream,Language,AnnotatedTSTPFormula.
FormulaWithVariables->Formula,5,5,0);
            PFprintf(Stream,"]");
            break;
        default:
            CodingError("Formula type unknown for printing");
            break;
    }
    PFprintf(Stream,").\n");
}
//-----------------------------------------------------------------------------
void PrintAnnotatedTPTPFormula(FILE * Stream,SyntaxType Language,
AnnotatedTSTPFormulaType AnnotatedTSTPFormula,int Pretty) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileAnnotatedTPTPFormula(LocalStream,Language,AnnotatedTSTPFormula,
Pretty);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintFileAnnotatedTSTPNode(PRINTFILE Stream,
ANNOTATEDFORMULA AnnotatedFormula,PrintFormatType Format,int Pretty) {

    if (AnnotatedFormula != NULL) {
        switch (AnnotatedFormula->Syntax) {
            case include:
                PrintFileTSTPTerm(Stream,AnnotatedFormula->Syntax,
AnnotatedFormula->AnnotatedFormulaUnion.Include,-1,0);
                PFprintf(Stream,".\n");
                break;
            case comment:
                PFprintf(Stream,"%s\n",
AnnotatedFormula->AnnotatedFormulaUnion.Comment);
                break;
            case blank_line:
                PFprintf(Stream,"\n");
                break;
            case tptp_tpi:
            case tptp_thf:
            case tptp_tff:
            case tptp_fof:
            case tptp_cnf:
                switch (Format) {
                    case tptp:
                    case tptp_short:
                        PrintFileAnnotatedTSTPFormula(Stream,
AnnotatedFormula->Syntax,
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula,Format,Pretty);
                        break;
                    case oldtptp:
                        PrintFileAnnotatedTPTPFormula(Stream,
AnnotatedFormula->Syntax,
AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula,Pretty);
                        break;
                    default:
                        CodingError("Print format not known");
                        break;
                }
                break;
            default:
                CodingError("Annotated formula syntax unknown for printing");
                exit(EXIT_FAILURE);
                break;
        }
    }
}
//-----------------------------------------------------------------------------
void PrintStringAnnotatedTSTPNode(char * PutOutputHere,
ANNOTATEDFORMULA AnnotatedFormula,PrintFormatType Format,int Pretty) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenStringPrintFile(PutOutputHere)) != NULL) {
        PrintFileAnnotatedTSTPNode(LocalStream,AnnotatedFormula,Format,Pretty);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintAnnotatedTSTPNode(FILE * Stream,ANNOTATEDFORMULA AnnotatedFormula,
PrintFormatType Format,int Pretty) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileAnnotatedTSTPNode(LocalStream,AnnotatedFormula,Format,Pretty);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintFileAnnotatedTSTPNodeWithStatus(PRINTFILE Stream,ANNOTATEDFORMULA
AnnotatedFormula,PrintFormatType Format,int Pretty,StatusType Role) {

    StatusType OldRole;
    StatusType OldSubRole;
    StatusType DesiredRole;

    if (!ReallyAnAnnotatedFormula(AnnotatedFormula)) {
        CodingError("Trying to print a non-formula");
    }
    OldRole = GetRole(AnnotatedFormula,&OldSubRole);
    DesiredRole = Role == axiom ? axiom_like : Role;
    
//----Only set if not nonstatus, not type (hack), and not what we want
    if (Role != nonstatus && OldRole != type && 
!CheckRole(OldRole,DesiredRole)) {
        SetStatus(AnnotatedFormula,Role,nonstatus);
    }
    PrintFileAnnotatedTSTPNode(Stream,AnnotatedFormula,Format,Pretty);
    SetStatus(AnnotatedFormula,OldRole,OldSubRole);
}
//-----------------------------------------------------------------------------
void PrintAnnotatedTSTPNodeWithStatus(FILE * Stream,ANNOTATEDFORMULA
AnnotatedFormula,PrintFormatType Format,int Pretty,StatusType Status) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileAnnotatedTSTPNodeWithStatus(LocalStream,AnnotatedFormula,
Format,Pretty,Status);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintFileListOfAnnotatedTSTPNodes(PRINTFILE Stream,SIGNATURE Signature,
LISTNODE Head,PrintFormatType Format,int Pretty) {

    switch (Format) {
        case tptp:
        case tptp_short:
        case oldtptp:
            while (Head != NULL) {
                PrintFileAnnotatedTSTPNode(Stream,Head->AnnotatedFormula,Format,
Pretty);
//----Always a blank line after a logical, if pretty
                if (
Pretty && 
((LogicalAnnotatedFormula(Head->AnnotatedFormula) &&
 (Head->Next == NULL || Head->Next->AnnotatedFormula->Syntax != blank_line)) ||
(TPIAnnotatedFormula(Head->AnnotatedFormula) &&
 (Head->Next == NULL || 
  LogicalAnnotatedFormula(Head->Next->AnnotatedFormula))))) {
                    PFprintf(Stream,"\n");
                }
                Head = Head->Next;
            }
            break;
        case dfg:
            DFGPrintHeader(Stream->FileHandle,Head,Signature);
            DFGPrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head);
            DFGPrintTailer(Stream->FileHandle);
            break;
        case otter:
            OtterPrintHeader(Stream->FileHandle,Head,Signature);
            OtterPrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head);
            OtterPrintTailer(Stream->FileHandle);
            break;
        case kif:
            KIFPrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head);
            break;
        case xml:
            XMLPrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head,
CONTENT_XML,FALSE);
            break;
        case xml_short:
            XMLPrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head,
CONTENT_TSTP,FALSE);
            break;
        case sumo:
            SUMOPrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head);
            break;
        case smt2:
            SMT2PrintHeader(Stream->FileHandle,Head,Signature);
            SMT2PrintListOfAnnotatedTSTPNodes(Stream->FileHandle,Head);
            break;
        case nonprinttype:
            CodingError("Not a print type for printing list of nodes");
            break;
    }
}
//-----------------------------------------------------------------------------
void PrintListOfAnnotatedTSTPNodes(FILE * Stream,SIGNATURE Signature,
LISTNODE Head,PrintFormatType Format,int Pretty) {

    PRINTFILE LocalStream;
            
    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileListOfAnnotatedTSTPNodes(LocalStream,Signature,Head,Format,
Pretty);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
void PrintFileListOfAnnotatedTSTPNodesWithStatus(PRINTFILE Stream,
SIGNATURE Signature,LISTNODE Head,PrintFormatType Format,int Pretty,
StatusType Status) {

    while (Head != NULL) {
        PrintFileAnnotatedTSTPNodeWithStatus(Stream,Head->AnnotatedFormula,
Format,Pretty,Status);
        Head = Head->Next;
    }
}
//-----------------------------------------------------------------------------
void PrintListOfAnnotatedTSTPNodesWithStatus(FILE * Stream,SIGNATURE Signature,
LISTNODE Head,PrintFormatType Format,int Pretty,StatusType Status) {

    PRINTFILE LocalStream;

    if ((LocalStream = OpenFILEPrintFile(Stream,NULL)) != NULL) {
        PrintFileListOfAnnotatedTSTPNodesWithStatus(LocalStream,Signature,Head,
Format,Pretty,Status);
        ClosePrintFile(LocalStream);
    }
}
//-----------------------------------------------------------------------------
