#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <unistd.h>
#include <sys/param.h>
#include <sys/types.h>
#include <pwd.h>
#include "DataTypes.h"
#include "Tokenizer.h"
#include "Utilities.h"
#include "FileUtilities.h"
//-----------------------------------------------------------------------------
//----Static for all, which really needs to be passed in when a stream is
//----opened, rather than being set here and copied from here (Yaaaack)
static int NeedNonLogicTokens = 0;
static int Warnings = 0;
//-----------------------------------------------------------------------------
int GetNeedForNonLogicTokens(void) {

    return(NeedNonLogicTokens);
}
//-----------------------------------------------------------------------------
void SetNeedForNonLogicTokens(int OnOff) {

    NeedNonLogicTokens = OnOff;
}
//-----------------------------------------------------------------------------
int GetStreamNeedForNonLogicTokens(READFILE Stream) {

    return(Stream->NeedNonLogicTokens);
}
//-----------------------------------------------------------------------------
int GetWarnings(void) {

    return(Warnings);
}
//-----------------------------------------------------------------------------
void SetWarnings(int GiveWarnings) {

    Warnings = GiveWarnings;
}
//-----------------------------------------------------------------------------
int GetStreamWarnings(READFILE Stream) {

    return(Stream->Warnings);
}
//-----------------------------------------------------------------------------
int EndFile(TOKEN CurrentToken) {

    return(CurrentToken->KindToken == endeof);
}
//-----------------------------------------------------------------------------
void CharacterError(READFILE Stream) {

    String RestOfLine;
    String ErrorMessage;

    strcpy(RestOfLine,"");
    if (Stream->FileHandle != NULL) {
        fgets(RestOfLine,20,Stream->FileHandle);
    } else if (Stream->StringFileContent != NULL) {
        strncat(RestOfLine,Stream->StringFileContent + Stream->StringOffset,20);
    }
    sprintf(ErrorMessage,
"Line %d Char %d Character \"%c\" continuing with \"%s\"\n",
Stream->Line,Stream->Character,CurrentCharacter(Stream),RestOfLine);
    ReportError("SyntaxError",ErrorMessage,1);
}
//-----------------------------------------------------------------------------
//---- Function Character returns the following values depending on the 
//---- Operation value:
//---- -1 : Read into static, return that one
//---- 0 : Return the static
//---- 1 : Return the static, & read next from File into static
int Character(READFILE Stream,int Operation) {

    int Auxilliary;

    assert((Stream->FileHandle != NULL || Stream->StringFileContent != NULL) &&
(Stream->FileHandle == NULL || Stream->StringFileContent == NULL));

    switch (Operation) {
        case 1:
//----Read into static, return it
            if (Stream->CurrentCharacter == '\n') {
                Stream->Line++;
                Stream->Character = 0;
            }
            if (Stream->FileHandle != NULL) {
                Stream->CurrentCharacter = fgetc(Stream->FileHandle);
            } else if (Stream->StringFileContent != NULL) {
                Stream->CurrentCharacter = 
Stream->StringFileContent[Stream->StringOffset];
                Stream->StringOffset++;
//----Convert end of string to end of file
                if (Stream->CurrentCharacter == '\0') {
                    Stream->CurrentCharacter = EOF;
                }
            } else {
                CharacterError(Stream);
            }
            Stream->Character++;
            return(Stream->CurrentCharacter);
            break;
        case 0:
//----Return static
            return(Stream->CurrentCharacter);
            break;
       case -1:
//----Return static, read next into static
            Auxilliary = Stream->CurrentCharacter;
            if (Stream->CurrentCharacter == '\n') {
                Stream->Line++;
                Stream->Character = 0;
            }
            if (Stream->FileHandle != NULL) {
                Stream->CurrentCharacter = fgetc(Stream->FileHandle);
            } else if (Stream->StringFileContent != NULL) {
                Stream->CurrentCharacter = 
Stream->StringFileContent[Stream->StringOffset];
                Stream->StringOffset++;
//----Convert end of string to end of file
                if (Stream->CurrentCharacter == '\0') {
                    Stream->CurrentCharacter = EOF;
                }
            } else {
                CharacterError(Stream);
            }
            Stream->Character++;
            return(Auxilliary);
            break;
       default:
            return(EOF);
            break;
    }
}
//-----------------------------------------------------------------------------
StatusType CheckStringToStatus(char * String) {

    if (!strcmp(String,"initial")) {
        return(initial);
    }
    if (!strcmp(String,"derived")) {
        return(derived);
    }
    if (!strcmp(String,"assumption")) {
        return(assumption);
    }
    if (!strcmp(String,"axiom")) {
        return(axiom);
    }
    if (!strcmp(String,"hypothesis")) {
        return(hypothesis);
    }
    if (!strcmp(String,"definition")) {
        return(definition);
    }
    if (!strcmp(String,"lemma")) {
        return(lemma);
    }
    if (!strcmp(String,"theorem")) {
        return(theorem);
    }
    if (!strcmp(String,"corollary")) {
        return(corollary);
    }
    if (!strcmp(String,"conjecture")) {
        return(conjecture);
    }
    if (!strcmp(String,"question")) {
        return(question);
    }
    if (!strcmp(String,"answer")) {
        return(answer);
    }
    if (!strcmp(String,"negated_conjecture")) {
        return(negated_conjecture);
    }
    if (!strcmp(String,"plain")) {
        return(plain);
    }
    if (!strcmp(String,"type")) {
        return(type);
    }
    if (!strcmp(String,"fi_domain")) {
        return(fi_domain);
    }
    if (!strcmp(String,"fi_functors")) {
        return(fi_functors);
    }
    if (!strcmp(String,"fi_predicates")) {
        return(fi_predicates);
    }
    if (!strcmp(String,"unknown")) {
        return(unknown);
    }
    if (!strcmp(String,"knowledge")) {
        return(knowledge);
    }
    if (!strcmp(String,"external")) {
        return(external);
    }
    if (!strcmp(String,"logic")) {
        return(logic);
    }
    if (!strcmp(String,"input")) {
        return(tpi_input);
    }
    if (!strcmp(String,"output")) {
        return(tpi_output);
    }
    if (!strcmp(String,"activate")) {
        return(tpi_activate);
    }
    if (!strcmp(String,"deactivate")) {
        return(tpi_deactivate);
    }
    if (!strcmp(String,"delete")) {
        return(tpi_delete);
    }
    if (!strcmp(String,"set_role")) {
        return(tpi_set_role);
    }
    if (!strcmp(String,"start_group")) {
        return(tpi_start_group);
    }
    if (!strcmp(String,"end_group")) {
        return(tpi_end_group);
    }
    if (!strcmp(String,"activate_group")) {
        return(tpi_activate_group);
    }
    if (!strcmp(String,"deactivate_group")) {
        return(tpi_deactivate_group);
    }
    if (!strcmp(String,"delete_group")) {
        return(tpi_delete_group);
    }
    if (!strcmp(String,"setenv")) {
        return(tpi_setenv);
    }
    if (!strcmp(String,"waitenv")) {
        return(tpi_waitenv);
    }
    if (!strcmp(String,"unsetenv")) {
        return(tpi_unsetenv);
    }
    if (!strcmp(String,"set_logic")) {
        return(tpi_set_logic);
    }
    if (!strcmp(String,"execute")) {
        return(tpi_execute);
    }
    if (!strcmp(String,"execute_async")) {
        return(tpi_execute_async);
    }
    if (!strcmp(String,"filter")) {
        return(tpi_filter);
    }
    if (!strcmp(String,"generate")) {
        return(tpi_generate);
    }
    if (!strcmp(String,"mktemp")) {
        return(tpi_mktemp);
    }
    if (!strcmp(String,"assert")) {
        return(tpi_assert);
    }
    if (!strcmp(String,"write")) {
        return(tpi_write);
    }
    if (!strcmp(String,"clean")) {
        return(tpi_clean);
    }
    if (!strcmp(String,"exit")) {
        return(tpi_exit);
    }
    return(nonstatus);
}
//-----------------------------------------------------------------------------
StatusType StringToStatus(char * String) {

    StatusType Role;

    if ((Role = CheckStringToStatus(String)) == nonstatus) {
        CodingError("String not a role");
    }
    return(Role);
}
//-----------------------------------------------------------------------------
char * StatusToString(StatusType Status) {

     switch (Status) {
        case initial:
            return("initial");
            break;
        case derived:
            return("derived");
            break;
        case assumption:
            return("assumption");
            break;
        case axiom:
            return("axiom");
            break;
        case hypothesis:
            return("hypothesis");
            break;
        case definition:
            return("definition");
            break;
        case lemma:
            return("lemma");
            break;
        case theorem:
            return("theorem");
            break;
        case corollary:
            return("corollary");
            break;
        case conjecture:
            return("conjecture");
            break;
        case question:
            return("question");
            break;
        case answer:
            return("answer");
            break;
        case negated_conjecture:
            return("negated_conjecture");
            break;
        case plain:
            return("plain");
            break;
        case type:
            return("type");
            break;
        case fi_domain:
            return("fi_domain");
            break;
        case fi_functors:
            return("fi_functors");
            break;
        case fi_predicates:
            return("fi_predicates");
            break;
        case unknown:
            return("unknown");
            break;
        case knowledge:
            return("knowledge");
            break;
        case logic:
            return("logic");
            break;
        case external:
            return("external");
            break;
        case tpi_input:
            return("input");
            break;
        case tpi_output:
            return("output");
            break;
        case tpi_activate:
            return("activate");
            break;
        case tpi_deactivate:
            return("deactivate");
            break;
        case tpi_delete:
            return("delete");
            break;
        case tpi_set_role:
            return("set_role");
            break;
        case tpi_start_group:
            return("start_group");
            break;
        case tpi_end_group:
            return("end_group");
            break;
        case tpi_activate_group:
            return("activate_group");
            break;
        case tpi_deactivate_group:
            return("deactivate_group");
            break;
        case tpi_delete_group:
            return("delete_group");
            break;
        case tpi_setenv:
            return("setenv");
            break;
        case tpi_waitenv:
            return("waitenv");
            break;
        case tpi_unsetenv:
            return("unsetenv");
            break;
        case tpi_set_logic:
            return("set_logic");
            break;
        case tpi_execute:
            return("execute");
            break;
        case tpi_execute_async:
            return("execute_async");
            break;
        case tpi_filter:
            return("filter");
            break;
        case tpi_generate:
            return("generate");
            break;
        case tpi_mktemp:
            return("mktemp");
            break;
        case tpi_assert:
            return("assert");
            break;
        case tpi_write:
            return("write");
            break;
        case tpi_clean:
            return("clean");
            break;
        case tpi_exit:
            return("exit");
            break;
        default:
            CodingError("Not a status to make into a string");
            return(NULL);
            break;
    }
}
//-----------------------------------------------------------------------------
ConnectiveType StringToConnective(char * String) {

    if (!strcmp(String,"|")) {
        return(disjunction);
    }
    if (!strcmp(String,"&")) {
        return(conjunction);
    }
    if (!strcmp(String,"<=>")) {
        return(equivalence);
    }
    if (!strcmp(String,"=>")) {
        return(implication);
    }
    if (!strcmp(String,"<=")) {
        return(reverseimplication);
    }
    if (!strcmp(String,"<~>")) {
        return(nonequivalence);
    }
    if (!strcmp(String,"~|")) {
        return(negateddisjunction);
    }
    if (!strcmp(String,"~&")) {
        return(negatedconjunction);
    }
    if (!strcmp(String,"~")) {
        return(negation);
    }
    if (!strcmp(String,"--")) {
        return(negation);
    }
    if (!strcmp(String,"!")) {
        return(universal);
    }
    if (!strcmp(String,"?")) {
        return(existential);
    }
    if (!strcmp(String,"^")) {
        return(lambda);
    }
    if (!strcmp(String,"!>")) {
        return(pibinder);
    }
    if (!strcmp(String,"?*")) {
        return(sigmabinder);
    }
    if (!strcmp(String,"@+")) {
        return(choicebinder);
    }
    if (!strcmp(String,"@-")) {
        return(descriptionbinder);
    }
    if (!strcmp(String,"@")) {
        return(application);
    }
    if (!strcmp(String,"=")) {
        return(equation);
    }
    if (!strcmp(String,"@=")) {
        return(typedequation);
    }
    if (!strcmp(String,"!=")) {
        return(negequation);
    }
    if (!strcmp(String,"!!")) {
        return(pi);
    }
    if (!strcmp(String,"??")) {
        return(sigma);
    }
    if (!strcmp(String,"@@+")) {
        return(choice);
    }
    if (!strcmp(String,"@@-")) {
        return(description);
    }
    if (!strcmp(String,":")) {
        return(typedeclaration);
    }
    if (!strcmp(String,":=")) {
        return(assignmentsym);
    }
    if (!strcmp(String,"<<")) {
        return(subtype);
    }
    if (!strcmp(String,">")) {
        return(maparrow);
    }
    if (!strcmp(String,"*")) {
        return(xprodtype);
    }
    if (!strcmp(String,"+")) {
        return(uniontype);
    }
    if (!strcmp(String,"-->")) {
        return(gentzenarrow);
    }
    CodingError("String not a connective");
    return(none);
}
//-----------------------------------------------------------------------------
char * ConnectiveToString(ConnectiveType Connective) {

    switch (Connective) {
        case disjunction:
            return("|");
            break;
        case conjunction:
            return("&");
            break;
        case equivalence:
            return("<=>");
            break;
        case implication:
            return("=>");
            break;
        case reverseimplication:
            return("<=");
            break;
        case nonequivalence:
            return("<~>");
            break;
        case negateddisjunction:
            return("~|");
            break;
        case negatedconjunction:
            return("~&");
            break;
        case negation:
            return("~");
            break;
        case universal:
            return("!");
            break;
        case existential:
            return("?");
            break;
        case lambda:
            return("^");
            break;
        case pibinder:
            return("!>");
            break;
        case sigmabinder:
            return("?*");
            break;
        case choicebinder:
            return("@+");
            break;
        case descriptionbinder:
            return("@-");
            break;
        case application:
            return("@");
            break;
        case equation:
            return("=");
            break;
        case typedequation:
            return("@=");
            break;
        case negequation:
            return("!=");
            break;
        case pi:
            return("!!");
            break;
        case sigma:
            return("??");
            break;
        case choice:
            return("@@+");
            break;
        case description:
            return("@@-");
            break;
        case typedeclaration:
            return(":");
            break;
        case assignmentsym:
            return(":=");
            break;
        case subtype:
            return(" <<");
            break;
        case maparrow:
            return(">");
            break;
        case xprodtype:
            return("*");
            break;
        case uniontype:
            return("+");
            break;
        case gentzenarrow:
            return("-->");
            break;
        default:
            CodingError("Not a connective to make into a string");
            return(NULL);
            break;
    }
}
//-----------------------------------------------------------------------------
SyntaxType StringToSyntax(char * String) {

    if (!strcmp(String,"tpi")) {
        return(tptp_tpi);
    }
    if (!strcmp(String,"thf")) {
        return(tptp_thf);
    }
    if (!strcmp(String,"tff")) {
        return(tptp_tff);
    }
    if (!strcmp(String,"tcf")) {
        return(tptp_tcf);
    }
    if (!strcmp(String,"fof")) {
        return(tptp_fof);
    }
    if (!strcmp(String,"cnf")) {
        return(tptp_cnf);
    }
    if (!strcmp(String,"include")) {
        return(include);
    }
    CodingError("Not a string to make into a syntax type");
    return(nontype);
}
//-----------------------------------------------------------------------------
char * SyntaxToString(SyntaxType Syntax) {

    switch (Syntax) {
        case tptp_tpi:
            return("tpi");
            break;
        case tptp_thf:
            return("thf");
            break;
        case tptp_tff:
            return("tff");
            break;
        case tptp_tcf:
            return("tcf");
            break;
        case tptp_fof:
            return("fof");
            break;
        case tptp_cnf:
            return("cnf");
            break;
        case include:
            return("include");
            break;
        default:
            CodingError("Not a syntax to make into a string");
            return(NULL);
            break;
    }
}
//-----------------------------------------------------------------------------
TOKEN BuildToken(TokenType TypeToken,char * LocalValue) {

    TOKEN NewToken;

    NewToken = (TOKEN)(Malloc(sizeof(ReadToken)));
    NewToken->KindToken = TypeToken;
//DEBUG printf("Saving token ===%s===\n",LocalValue);
    NewToken->NameToken = CopyHeapString(LocalValue);

//DEBUG printf("token built is ==%s==\n",NewToken->NameToken);
    return(NewToken);
}
//-----------------------------------------------------------------------------
TOKEN CloneToken(TOKEN TokenCopy) {

    return(BuildToken(TokenCopy->KindToken,TokenCopy->NameToken));
}
//---------------------------------------------------------------------------
void FreeToken(TOKEN * Pointer) {

    if (*Pointer != NULL) {
        Free((void **)&((*Pointer)->NameToken));
        Free((void **)Pointer);
    }
}
//-----------------------------------------------------------------------------
void IncrementTokenIndex(READFILE Stream,int* Index) {

    (*Index)++;
    if (*Index >= SUPERSTRINGLENGTH) {
        ReportError("InputError","Token too long",0);
        CharacterError(Stream);
    }
}
//-----------------------------------------------------------------------------
int NumberToken(READFILE Stream,char PreviousChar,char CurrentChar,
SuperString LocalValue) {

    int Index;

    if (isdigit(CurrentChar)) {
        Index = 0;
//----If signed, keep sign
        if (PreviousChar != '\0') {
            LocalValue[Index++] = PreviousChar;
        }
        do {
            LocalValue[Index] = CurrentChar;
            CurrentChar = NextCharacter(Stream);
            IncrementTokenIndex(Stream,&Index);
        } while (isdigit(CurrentChar));
//----Rationals, and reals from SPASS-XDB (what is personal hack)
        if (CurrentChar == '/' || CurrentChar == '\\') {
            LocalValue[Index] = CurrentChar;
            CurrentChar = NextCharacter(Stream);
            IncrementTokenIndex(Stream,&Index);
            if (CurrentChar == '+' || CurrentChar == '-') {
                LocalValue[Index] = CurrentChar;
                CurrentChar = NextCharacter(Stream);
                IncrementTokenIndex(Stream,&Index);
            }
//----Check there's something in the denominator
            if (isdigit(CurrentChar)) {
                do {
                    LocalValue[Index] = CurrentChar;
                    CurrentChar = NextCharacter(Stream);
                    IncrementTokenIndex(Stream,&Index);
                } while (isdigit(CurrentChar));
            } else {
                CharacterError(Stream);
            }
        } else {
//----Reals
            if (CurrentChar == '.') {
                do {
                    LocalValue[Index] = CurrentChar;
                    CurrentChar = NextCharacter(Stream);
                    IncrementTokenIndex(Stream,&Index);
                } while (isdigit(CurrentChar));
            }
            if (CurrentChar == 'E' || CurrentChar == 'e') {
                LocalValue[Index] = CurrentChar;
                CurrentChar = NextCharacter(Stream);
                IncrementTokenIndex(Stream,&Index);
                if (CurrentChar == '+' || CurrentChar == '-') {
                    LocalValue[Index] = CurrentChar;
                    CurrentChar = NextCharacter(Stream);
                    IncrementTokenIndex(Stream,&Index);
                }
                if (isdigit(CurrentChar)) {
                    do {
                        LocalValue[Index] = CurrentChar;
                        CurrentChar = NextCharacter(Stream);
                        IncrementTokenIndex(Stream,&Index);
                    } while (isdigit(CurrentChar));
                } else {
//----Exponent without numbers
                    CharacterError(Stream);
                }
            }
        }
        LocalValue[Index] = '\0';
        Stream->Overshot = 1;
        return(1);
    } else {
        return(0);
    }
}
//-----------------------------------------------------------------------------
TOKEN QuotedToken(READFILE Stream,char OpeningQuote,TokenType Type) {

    static SuperString LocalValue;
    int Index;

    Index = 0;
    LocalValue[Index] = OpeningQuote;
    do {
        IncrementTokenIndex(Stream,&Index);
        LocalValue[Index] = NextCharacter(Stream);
//----Check legality - only visibles and only quote and escape escaped
        if (LocalValue[Index] < ' ' || LocalValue[Index] > '~') {
            CharacterError(Stream);
        }
        if (LocalValue[Index] == '\\') {
            IncrementTokenIndex(Stream,&Index);
            LocalValue[Index] = NextCharacter(Stream);
            if (LocalValue[Index] != OpeningQuote && 
LocalValue[Index] != '\\') {
                CharacterError(Stream);
            }
        }
    } while (LocalValue[Index] != OpeningQuote || LocalValue[Index-1] == '\\');
    IncrementTokenIndex(Stream,&Index);
    LocalValue[Index] = '\0';

//----Strip '' quotes from regular lower words
    if (LocalValue[0] == '\'' && islower(LocalValue[1])) {
        Index = 1;
//----Make sure it's legal without the ''s
        while (isalnum(LocalValue[Index]) || LocalValue[Index] == '_') {
            Index++;
        }
        if (Index == strlen(LocalValue) -1) {
            LocalValue[Index] = '\0';
            return(BuildToken(lower_word,&(LocalValue[1])));
        } 
    }

    return(BuildToken(Type,LocalValue));
}
//-----------------------------------------------------------------------------
TOKEN GetNextToken(READFILE Stream) {

    int CurrentChar,PreviousChar;
    int Index;
//----static so it doesn't have to get allocated everytime (very often!)
    static SuperString LocalValue;

//DEBUG printf("char was ==%c==\n",CurrentCharacter(Stream));
    if (Stream->Overshot) {
//DEBUG printf("overshot\n");
        CurrentChar = CurrentCharacter(Stream);
    } else {
//DEBUG printf("get next\n");
        CurrentChar = NextCharacter(Stream);
    }
    Stream->Overshot = 0;

//----Skip whitespace
    while (isspace(CurrentChar)) {
        PreviousChar = CurrentChar;
        CurrentChar = NextCharacter(Stream);
//----Check for a blank line, if required
        if (Stream->NeedNonLogicTokens && PreviousChar == '\n' && 
CurrentChar == '\n') {
            return(BuildToken(blank_line_token,""));
        }
    }

//DEBUG printf("char is ==%c==\n",CurrentChar);
    switch (CurrentChar) {
        case '/':
            Index = 0;
            LocalValue[Index++] = CurrentChar;
            PreviousChar = CurrentChar;
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '*') {
                LocalValue[Index] = CurrentChar;
                while (CurrentChar != EOF && (CurrentChar != '/' || 
PreviousChar != '*')) {
                    PreviousChar = CurrentChar;
                    CurrentChar = NextCharacter(Stream);
                    IncrementTokenIndex(Stream,&Index);
                    LocalValue[Index] = CurrentChar;
                }
                if (CurrentChar == '/') {
//----Add eoln if it's there
                    CurrentChar = NextCharacter(Stream);
                    if (CurrentChar == '\n') {
                        IncrementTokenIndex(Stream,&Index);
                        LocalValue[Index] = CurrentChar;
                    } else {
                        Stream->Overshot = 1;
                    }
                    IncrementTokenIndex(Stream,&Index);
                    LocalValue[Index] = '\0';
                    if (Stream->NeedNonLogicTokens) {
                        return(BuildToken(comment_token,LocalValue));
                    } else {
                        return(GetNextToken(Stream));
                    }
                } else {
                    CharacterError(Stream);
                }
            } else {
                CharacterError(Stream);
            }
            break;
        case '%':
        case '#':
            if (Stream->NeedNonLogicTokens) {
                Index = 0;
                do {
                    LocalValue[Index] = CurrentChar;
                    IncrementTokenIndex(Stream,&Index);
                    CurrentChar = NextCharacter(Stream);
                } while (CurrentChar != '\n' && CurrentChar != EOF);
                LocalValue[Index] = '\0';
                Stream->Overshot = 1;
//DEBUG printf("FOUND COMMENT ===%s===\n",LocalValue);
                return(BuildToken(comment_token,LocalValue));
            } else {
//----Discard sequences of comments (recursive approach gave stack overflow)
                do {
                    while (CurrentChar != '\n' && CurrentChar != EOF) {
                        CurrentChar = NextCharacter(Stream);
                    }
                    CurrentChar = NextCharacter(Stream);
                } while (CurrentChar == '%' || CurrentChar == '#');
                Stream->Overshot = 1;
                return(GetNextToken(Stream));
            }
            break;
        case '\'':
            return(QuotedToken(Stream,'\'',lower_word));
            break;
        case '(':
            return(BuildToken(punctuation,"("));
            break;
        case ')':
            return(BuildToken(punctuation,")"));
            break;
        case '[':
            return(BuildToken(punctuation,"["));
            break;
        case ']':
            return(BuildToken(punctuation,"]"));
            break;
        case '!':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '=') {
                return(BuildToken(lower_word,"!="));
            } else if (CurrentChar == '>') {
                return(BuildToken(quantifier,"!>"));
            } else if (CurrentChar == '!') {
                return(BuildToken(lower_word,"!!"));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(quantifier,"!"));
            }
            break;
        case '?':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '*') {
                return(BuildToken(quantifier,"?*"));
            } else if (CurrentChar == '?') {
                return(BuildToken(lower_word,"??"));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(quantifier,"?"));
            }
            break;
        case '^':
            return(BuildToken(quantifier,"^"));
            break;
        case '.':
            return(BuildToken(punctuation,"."));
            break;
        case ':':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '=') {
                return(BuildToken(binary_connective,":="));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(punctuation,":"));
            }
            break;
        case ',':
            return(BuildToken(punctuation,","));
            break;
        case '<':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '='){
                CurrentChar = NextCharacter(Stream);
                if (CurrentChar == '>') {
                    return(BuildToken(binary_connective,"<=>"));
                } else {
                    Stream->Overshot = 1;
                    return(BuildToken(binary_connective,"<="));
                }
            } else if (CurrentChar == '~') {
                CurrentChar = NextCharacter(Stream);
                if (CurrentChar == '>') {
                    return(BuildToken(binary_connective,"<~>"));
                } else {
                    CharacterError(Stream);
                }
            } else if (CurrentChar == '<') {
                return(BuildToken(binary_connective,"<<"));
            } else {
                CharacterError(Stream);
            }
            break;
        case '=':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '>') {
                return(BuildToken(binary_connective,"=>"));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(lower_word,"="));
            }
            break;
        case '~':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '|') {
                return(BuildToken(binary_connective,"~|"));
            } else if (CurrentChar == '&') {
                return(BuildToken(binary_connective,"~&"));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(unary_connective,"~"));
            }
            break;
        case '+':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '+') {
                return(BuildToken(unary_connective,"++"));
            } else if (NumberToken(Stream,'+',CurrentChar,LocalValue)) {
                return(BuildToken(number,LocalValue));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(binary_connective,"+"));
            }
            break;
        case '-':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '-') {
                CurrentChar = NextCharacter(Stream);
                if (CurrentChar == '>') {
                    return(BuildToken(binary_connective,"-->"));
                } else {
                    Stream->Overshot = 1;
                    return(BuildToken(unary_connective,"--"));
                }
//----Code copied from below for numbers
            } else if (NumberToken(Stream,'-',CurrentChar,LocalValue)) {
                return(BuildToken(number,LocalValue));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(punctuation,"-"));
            }
            break;
        case '"':
            return(QuotedToken(Stream,'"',distinct_object));
            break;
        case '|':
            return(BuildToken(binary_connective,"|"));
            break;
        case '&':
            return(BuildToken(binary_connective,"&"));
            break;
        case '@':
            CurrentChar = NextCharacter(Stream);
            if (CurrentChar == '@') {
                CurrentChar = NextCharacter(Stream);
                if (CurrentChar == '+') {
                    return(BuildToken(lower_word,"@@+"));
                } else if (CurrentChar == '-') {
                    return(BuildToken(lower_word,"@@-"));
                } else {
                    CharacterError(Stream);
                }
            } else if (CurrentChar == '=') {
                return(BuildToken(lower_word,"@="));
            } else if (CurrentChar == '+') {
                return(BuildToken(quantifier,"@+"));
            } else if (CurrentChar == '-') {
                return(BuildToken(quantifier,"@-"));
            } else {
                Stream->Overshot = 1;
                return(BuildToken(binary_connective,"@"));
            }
            break;
        case '>':
            return(BuildToken(binary_connective,">"));
            break;
        case '*':
            return(BuildToken(binary_connective,"*"));
            break;
        case EOF:
            return(BuildToken(endeof,""));
            break;
        default:
            Index = 0;
            if (CurrentChar == '$' || islower(CurrentChar)) {
                do {
                    LocalValue[Index] = CurrentChar;
                    CurrentChar = NextCharacter(Stream);
                    IncrementTokenIndex(Stream,&Index);
                } while (isalnum(CurrentChar) || CurrentChar=='_' ||
//----Allow second $ for system predicates and functions
(Index == 1 && CurrentChar == '$' && LocalValue[0] == '$'));
                LocalValue[Index] = '\0';
                Stream->Overshot = 1;
//----Ensure $ words have some length
                Index = 0;
                while (LocalValue[Index] == '$') {
                    Index++;
                }
                if (Index > 0 && !islower(LocalValue[Index])) {
                    CharacterError(Stream);
                }
                return(BuildToken(lower_word,LocalValue));
            } else if (isupper(CurrentChar)) {
                do {
                    LocalValue[Index] = CurrentChar;
                    CurrentChar = NextCharacter(Stream);
                    IncrementTokenIndex(Stream,&Index);
                } while (isalnum(CurrentChar) || (CurrentChar=='_'));
                LocalValue[Index] = '\0';
                Stream->Overshot = 1;
//----Nasty hack to allow end of file to be specified by user on input stream
                if (!strcmp(LocalValue,"EOF__")) {
                    return(BuildToken(endeof,""));
                } else {
                    return(BuildToken(upper_word,LocalValue));
                }
//----Numbers
            } else if (NumberToken(Stream,'\0',CurrentChar,LocalValue)) {
                return(BuildToken(number,LocalValue));
            } else {
                CharacterError(Stream);
            }
            break;
    }
//----Need a default return for the error cases which compiler doesn't get
    return(NULL);
}
//-----------------------------------------------------------------------------
TOKEN Token(READFILE Stream, int Operation) {

//----Can't return the current token with a NULL file
    assert(!(Stream == NULL && Operation != 0));

    switch (Operation) {
        case 2:
            FreeToken(&(Stream->Auxilliary));
            FreeToken(&(Stream->CurrentToken));
            return((TOKEN)NULL);
            break;
        case 1:
//----Read into static, return it
//DEBUG if (Stream->CurrentToken != NULL ) printf("Had %s\n",CurrentToken->NameToken);
            FreeToken(&(Stream->Auxilliary));
            FreeToken(&(Stream->CurrentToken));
            Stream->CurrentToken = GetNextToken(Stream);
//DEBUG printf("Have %s\n",Stream->CurrentToken->NameToken);
            return(Stream->CurrentToken);
            break;
        case 0:
//----Return static
            FreeToken(&(Stream->Auxilliary));
            if (Stream->CurrentToken == NULL) {
                Stream->CurrentToken = GetNextToken(Stream);
                return(Stream->CurrentToken);
            } else {
//DEBUG printf("CT ==%s==\n",Stream->CurrentToken->NameToken);
                return(Stream->CurrentToken);
            }
            break;
        case -1:
//----Return static, read next into static
            FreeToken(&(Stream->Auxilliary));
            if (Stream->CurrentToken == NULL) {
                Stream->CurrentToken = GetNextToken(Stream);
            }
            Stream->Auxilliary = Stream->CurrentToken;
            Stream->CurrentToken = GetNextToken(Stream);
//DEBUG printf("%s\n",Stream->Auxilliary->NameToken);
            return(Stream->Auxilliary);
            break;
       default:
            return((TOKEN)NULL);
            break;
    }
}
//---------------------------------------------------------------------------
void TokenWarning(READFILE Stream,char * Message) {

    printf("WARNING: Line %d Char %d Token \"%s\" : %s\n",
Stream->Line,Stream->Character,CurrentToken(Stream)->NameToken,Message);
}
//-----------------------------------------------------------------------------
void TokenError(READFILE Stream,char * Message) {

    String RestOfLine;
    String ErrorMessage;

    strcpy(RestOfLine,"");
    if (Stream->FileHandle != NULL) {
        fgets(RestOfLine,20,Stream->FileHandle);
    } else if (Stream->StringFileContent != NULL) {
        strncat(RestOfLine,Stream->StringFileContent + Stream->StringOffset,20);
    }
    if (strlen(RestOfLine) > 0 && RestOfLine[strlen(RestOfLine)-1] == '\n') {
        RestOfLine[strlen(RestOfLine)-1] = '\0';
    }

    sprintf(ErrorMessage,
"Line %d Char %d Token \"%s\" continuing with \"%s\" : %s",
Stream->Line,Stream->Character,CurrentToken(Stream)->NameToken,RestOfLine,
Message == NULL ? "" : Message);
    ReportError("SyntaxError",ErrorMessage,1);
}
//-----------------------------------------------------------------------------
void SetTokenType(READFILE Stream,TokenType Type) {

    TOKEN ThisToken;

    ThisToken = CurrentToken(Stream);
    if (ThisToken == NULL) {
        CodingError("No token");
    }

    ThisToken->KindToken = Type;
}
//-----------------------------------------------------------------------------
int CheckTokenType(READFILE Stream,TokenType Type) {

    TOKEN ThisToken;

    ThisToken = CurrentToken(Stream);
    if (ThisToken == NULL) {
        CodingError("No token");
    }

    return((ThisToken->KindToken == Type) ||
(Type == predicate_symbol && ThisToken->KindToken == lower_word) ||
(Type == functor && (ThisToken->KindToken == lower_word || 
ThisToken->KindToken == number || ThisToken->KindToken == distinct_object)) ||
(Type == name && (ThisToken->KindToken == lower_word ||
ThisToken->KindToken == number)));
}
//------------------------------------------------------------------------------
int CheckToken(READFILE Stream,TokenType Type,char * Value) {

//DEBUG printf("Current type = %d Require %d\n",CurrentToken(Stream)->KindToken,Type);
//DEBUG printf("Current value = %s Require %s\n",CurrentToken(Stream)->NameToken,Value);
    return(CheckTokenType(Stream,Type) && 
!strcmp(CurrentToken(Stream)->NameToken,Value));
}
//------------------------------------------------------------------------------
int TakeTokenType(READFILE Stream,TokenType Type) {

    if (CheckTokenType(Stream,Type)) {
        TakeCurrentToken(Stream);
        return(1);
    } else {
        TokenError(Stream,"Wrong token type");
        return(0);
    }
}
//------------------------------------------------------------------------------
int TakeToken(READFILE Stream,TokenType Type,char * Value) {

    String Message;

    if (CheckTokenType(Stream,Type) && 
!strcmp(CurrentToken(Stream)->NameToken,Value)) {
        TakeCurrentToken(Stream); 
        return(1);
    } else {
        sprintf(Message,"Wrong token type or value, expected \"%s\"",Value);
        TokenError(Stream,Message);
        return(0);
    }
}
//------------------------------------------------------------------------------
void EnsureTokenType(READFILE Stream,TokenType Type) {

    if (!CheckTokenType(Stream,Type)) {
        TokenError(Stream,"Wrong token type");
    }
}
//------------------------------------------------------------------------------
void EnsureTokenNotType(READFILE Stream,TokenType NotType) {

    if (CheckTokenType(Stream,NotType)) {
        TokenError(Stream,"Wrong token type");
    }
}
//------------------------------------------------------------------------------
void EnsureToken(READFILE Stream,TokenType Type,char * Value) {

    String Message;

    if (!CheckToken(Stream,Type,Value)) {
        sprintf(Message,"Wrong token type or value, expected \"%s\"",Value);
        TokenError(Stream,Message);
    }
}
//------------------------------------------------------------------------------
int AcceptTokenType(READFILE Stream,TokenType Type) {

    if (CheckTokenType(Stream,Type)) {
        NextToken(Stream); 
        return(1);
    } else {
        TokenError(Stream,"Wrong token type");
        return(0);
    }
} 
//------------------------------------------------------------------------------
int AcceptToken(READFILE Stream,TokenType Type,char * Value) {

    String Message;

    if (CheckTokenType(Stream,Type) && 
!strcmp(CurrentToken(Stream)->NameToken,Value)) {
        NextToken(Stream); 
        return(1);
    } else {
        sprintf(Message,"Wrong token type or value, expected \"%s\"",Value);
        TokenError(Stream,Message);
        return(0);
    }
} 
//------------------------------------------------------------------------------
int NextThenAcceptTokenType(READFILE Stream,TokenType Type) {
 
    NextToken(Stream); 
    return(AcceptTokenType(Stream,Type));
    
} 
//------------------------------------------------------------------------------
int NextThenAcceptToken(READFILE Stream,TokenType Type,char * Value) {
 
    NextToken(Stream); 
    return(AcceptToken(Stream,Type,Value));
} 
//------------------------------------------------------------------------------
