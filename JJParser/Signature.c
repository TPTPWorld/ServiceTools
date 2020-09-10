#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>
#include "Tokenizer.h"
#include "Signature.h"
#include "Utilities.h"
#include "DataTypes.h"
//-----------------------------------------------------------------------------
static int GlobalSymbolIndex;
//-----------------------------------------------------------------------------
SYMBOLNODE NewSignatureNode(char * Name,int Arity) {

    SYMBOLNODE Symbol;
    SuperString ShortName;

    Symbol = (SYMBOLNODE)Malloc(sizeof(SymbolNodeType));
    Symbol->NameSymbol = CopyHeapString(Name);
    if (isupper(Name[0])) {
        sprintf(ShortName,"X%d",++GlobalSymbolIndex);
    } else if (islower(Name[0])) {
        sprintf(ShortName,"s%d",++GlobalSymbolIndex);
    } else {
        strcpy(ShortName,Name);
    }
    Symbol->ShortSymbol = CopyHeapString(ShortName);
    Symbol->NumberOfUses = 1;
    Symbol->Arity = Arity;
    Symbol->LastSymbol = NULL;
    Symbol->NextSymbol = NULL;

//DEBUG printf("New symbol %s/%d with short name %s\n",
//DEBUG Symbol->NameSymbol,Symbol->Arity,Symbol->ShortSymbol);
    return(Symbol);
}
//-----------------------------------------------------------------------------
SIGNATURE NewSignature(void) {

    SIGNATURE Signature;

    Signature = (SIGNATURE)Malloc(sizeof(SignatureType));
    Signature->Variables = NULL;
    Signature->Functions = NULL;
    Signature->Predicates = NULL;
    Signature->NonLogicals = NULL;

    return(Signature);
}
//-----------------------------------------------------------------------------
SYMBOLNODE DuplicateSymbols(SYMBOLNODE Original) {

    SYMBOLNODE Copy;

    if (Original == NULL) {
        Copy = NULL;
    } else {
        Copy = NewSignatureNode(Original->NameSymbol,Original->Arity);
        Copy->NumberOfUses = Original->NumberOfUses;
        Copy->LastSymbol = DuplicateSymbols(Original->LastSymbol);
        Copy->NextSymbol = DuplicateSymbols(Original->NextSymbol);
    }

    return(Copy);
}
//-----------------------------------------------------------------------------
SIGNATURE DuplicateSignature(SIGNATURE Original) {

    SIGNATURE Copy;

    Copy = NewSignature();
    Copy->Variables = DuplicateSymbols(Original->Variables);
    Copy->Functions = DuplicateSymbols(Original->Functions);
    Copy->Predicates = DuplicateSymbols(Original->Predicates);
    Copy->NonLogicals = DuplicateSymbols(Original->NonLogicals);

    return(Copy);
}
//-----------------------------------------------------------------------------
void FreeSignatureList(SYMBOLNODE * Symbols) {

    if ((*Symbols) != NULL) {
        assert((*Symbols)->NumberOfUses == 0);
        FreeSignatureList(&((*Symbols)->LastSymbol));
        FreeSignatureList(&((*Symbols)->NextSymbol));
        Free((void **)(&((*Symbols)->NameSymbol)));
        Free((void **)Symbols);
    }
}
//-----------------------------------------------------------------------------
void FreeSignature(SIGNATURE * Signature) {

    FreeSignatureList(&((*Signature)->Variables));
    assert((*Signature)->Variables == NULL);
    FreeSignatureList(&((*Signature)->Functions));
    assert((*Signature)->Functions == NULL);
    FreeSignatureList(&((*Signature)->Predicates));
    assert((*Signature)->Predicates == NULL);
    FreeSignatureList(&((*Signature)->NonLogicals));
    assert((*Signature)->NonLogicals == NULL);

    Free((void **)Signature);
}
//-----------------------------------------------------------------------------
SYMBOLNODE RemoveSignatureNodeFromTree(SYMBOLNODE * OneToDeletePtr) {

    SYMBOLNODE * LargestPointer;
    SYMBOLNODE Deleted;

    Deleted = *OneToDeletePtr;

    if (Deleted->LastSymbol == NULL) {
        if (Deleted->NextSymbol != NULL) {
            *OneToDeletePtr = Deleted->NextSymbol;
        } else {
            *OneToDeletePtr = NULL;
        }
    } else if (Deleted->NextSymbol == NULL) {
        *OneToDeletePtr = Deleted->LastSymbol;
    } else {
        LargestPointer = &(Deleted->LastSymbol);
        while ((*LargestPointer)->NextSymbol != NULL) {
            LargestPointer = &((*LargestPointer)->NextSymbol);
        }
        *OneToDeletePtr = RemoveSignatureNodeFromTree(LargestPointer);
        (*OneToDeletePtr)->LastSymbol = Deleted->LastSymbol;
        (*OneToDeletePtr)->NextSymbol = Deleted->NextSymbol;
    }
    Deleted->NextSymbol = NULL;
    Deleted->LastSymbol = NULL;
    return(Deleted);
}
//-----------------------------------------------------------------------------
int RemovedUnusedSymbolsFromList(SYMBOLNODE * Symbols) {

    int NumberRemoved;
    SYMBOLNODE ToFree;

    NumberRemoved = 0;
    if (*Symbols != NULL) {
        NumberRemoved += RemovedUnusedSymbolsFromList(&((*Symbols)->
LastSymbol));
        NumberRemoved += RemovedUnusedSymbolsFromList(&((*Symbols)->
NextSymbol));
        if ((*Symbols)->NumberOfUses  == 0) {
            ToFree = RemoveSignatureNodeFromTree(Symbols);
            Free((void **)&ToFree);
            NumberRemoved++;
        }
    }

    return(NumberRemoved);
}
//-----------------------------------------------------------------------------
int RemovedUnusedSymbols(SIGNATURE Signature) {

    int TotalRemoved;

    TotalRemoved = 0;
    TotalRemoved += RemovedUnusedSymbolsFromList(&(Signature->Variables));
    TotalRemoved += RemovedUnusedSymbolsFromList(&(Signature->Functions));
    TotalRemoved += RemovedUnusedSymbolsFromList(&(Signature->Predicates));
    TotalRemoved += RemovedUnusedSymbolsFromList(&(Signature->NonLogicals));

    return(TotalRemoved);
}
//-----------------------------------------------------------------------------
char * GetSignatureSymbol(SYMBOLNODE SymbolNode) {

    return(SymbolNode->NameSymbol);
}
//-----------------------------------------------------------------------------
char * GetSignatureShortSymbol(SYMBOLNODE SymbolNode) {

    return(SymbolNode->ShortSymbol);
}
//-----------------------------------------------------------------------------
int GetSignatureArity(SYMBOLNODE SymbolNode) {

    return(SymbolNode->Arity);
}
//-----------------------------------------------------------------------------
int GetSignatureUses(SYMBOLNODE SymbolNode) {

    return(SymbolNode->NumberOfUses);
}
//-----------------------------------------------------------------------------
void IncreaseSymbolUseCount(SYMBOLNODE Symbol,int HowMuch) {

    Symbol->NumberOfUses += HowMuch;
}
//-----------------------------------------------------------------------------
SYMBOLNODE IsSymbolInSignatureList(SYMBOLNODE List,char * Name,int Arity) {

    if (List == NULL || (!strcmp(GetSignatureSymbol(List),Name) &&
//----Arity -1 means we don't care
(Arity == -1 || GetSignatureArity(List) == Arity))) {
        return(List);
    } else if (strcmp(Name,GetSignatureSymbol(List)) < 0 ||
(strcmp(Name,GetSignatureSymbol(List)) == 0 &&
 Arity < GetSignatureArity(List))) {
        return(IsSymbolInSignatureList(List->LastSymbol,Name,Arity));
    } else {
        return(IsSymbolInSignatureList(List->NextSymbol,Name,Arity));
    }
}
//-----------------------------------------------------------------------------
SYMBOLNODE * IsSymbolInSignatureListPointer(SYMBOLNODE * List,char * Name,
int Arity) {

    if (*List == NULL) {
        return(NULL);
    }
    if (!strcmp(GetSignatureSymbol(*List),Name) &&
//----Arity -1 means we don't care
(Arity == -1 || GetSignatureArity(*List) == Arity)) {
        return(List);
    } else if (strcmp(Name,GetSignatureSymbol(*List)) < 0 ||
(strcmp(Name,GetSignatureSymbol(*List)) == 0 &&
 Arity < GetSignatureArity(*List))) {
        return(IsSymbolInSignatureListPointer(&((*List)->LastSymbol),Name,
Arity));
    } else {
        return(IsSymbolInSignatureListPointer(&((*List)->NextSymbol),Name,
Arity));
    }
}
//-----------------------------------------------------------------------------
SYMBOLNODE InsertIntoSignatureList(SYMBOLNODE * List,char * Name,int Arity,
READFILE Stream) {

    SuperString DuplicateArity;
    SYMBOLNODE * Current = List;

//DEBUG printf("Inserting %s %d into sig\n",Name,Arity);
//DEBUG PrintSignatureTree(*List);
    while (*Current != NULL) {
//----Same name
        if (!strcmp(GetSignatureSymbol(*Current),Name)) {
//----Same arity, we're done
            if (GetSignatureArity(*Current) == Arity) {
                IncreaseSymbolUseCount(*Current,1);
                return(*Current);
            } else {
                if (Stream != NULL && GetStreamWarnings(Stream)) {
//----Warning if symbol overloading is not allowed
                    sprintf(DuplicateArity,
"Multiple arity symbol %s, arity %d and now %d",
Name,GetSignatureArity(*Current),Arity);
                    TokenWarning(Stream,DuplicateArity);
                }
            }
        }

        if (strcmp(Name,GetSignatureSymbol(*Current)) < 0 ||
(strcmp(Name,GetSignatureSymbol(*Current)) == 0 &&
 Arity < GetSignatureArity(*Current))) {
            Current = &((*Current)->LastSymbol);
        } else {
            Current = &((*Current)->NextSymbol);
        }
    }

    *Current = NewSignatureNode(Name,Arity);
//DEBUG printf("After inserting\n");
//DEBUG PrintSignatureTree(*List);
    return(*Current);
}
//-----------------------------------------------------------------------------
SYMBOLNODE InsertNodeIntoSignatureList(SYMBOLNODE * List,
SYMBOLNODE NodeToInsert,READFILE Stream) {

    SuperString DoubleUsage;

    if (*List == NULL) {
        *List = NodeToInsert;
        return(*List);
    }

//----Same name and arity - something wrong here
    if (!strcmp(GetSignatureSymbol(*List),NodeToInsert->NameSymbol) &&
GetSignatureArity(*List) == NodeToInsert->Arity) {
        sprintf(DoubleUsage,"Symbol %s/%d already exists",
NodeToInsert->NameSymbol,NodeToInsert->Arity);
        ReportError(NULL,DoubleUsage,1);
        return(NULL);
    }

    if (strcmp(NodeToInsert->NameSymbol,GetSignatureSymbol(*List)) < 0 ||
(strcmp(NodeToInsert->NameSymbol,GetSignatureSymbol(*List)) == 0 &&
 NodeToInsert->Arity < GetSignatureArity(*List))) {
        return(InsertNodeIntoSignatureList(&((*List)->LastSymbol),NodeToInsert,
Stream));
    } else {
        return(InsertNodeIntoSignatureList(&((*List)->NextSymbol),NodeToInsert,
Stream));
    }
}
//-----------------------------------------------------------------------------
SYMBOLNODE InsertIntoSignature(SIGNATURE Signature,TermType Type,
char * Name,int Arity,READFILE Stream) {

    String ErrorMessage;
    SYMBOLNODE * NodePointerPointer;
    SYMBOLNODE NodePointer;

//DEBUG printf("Insert %s/%d\n",Name,Arity);
    switch (Type) {
        case variable:
            return(InsertIntoSignatureList(&(Signature->Variables),Name,Arity,
Stream));
            break;
//----Functions might have mistakenly been put into predicates when their
//----type was declared. Note arity would be 0.
        case function:
            if ((NodePointerPointer = IsSymbolInSignatureListPointer(
&(Signature->Predicates),Name,0)) != NULL) {
                NodePointer =  RemoveSignatureNodeFromTree(NodePointerPointer);
                NodePointer->Arity = Arity;
                IncreaseSymbolUseCount(NodePointer,1);
//DEBUG printf("Move %s/%d to functions\n",Name,NodePointer->Arity);
                return(InsertNodeIntoSignatureList(&(Signature->Functions),
NodePointer,Stream));
            } else {
                return(InsertIntoSignatureList(&(Signature->Functions),Name,
Arity,Stream));
            }
            break;
        case predicate:
//----Fucking hell, I process include files after the main file, so the
//----mislabelling of functions as predicates might be in the other order
            if (Arity == 0 && (NodePointer = IsSymbolInSignatureList(
Signature->Functions,Name,-1)) != NULL) {
                IncreaseSymbolUseCount(NodePointer,1);
                return(NodePointer);
            }
//----NOTE the fallthrough here
        case connective:
            return(InsertIntoSignatureList(&(Signature->Predicates),Name,
Arity,Stream));
            break;
        case non_logical_data:
            return(InsertIntoSignatureList(&(Signature->NonLogicals),Name,
Arity,Stream));
            break;
        default:
            sprintf(ErrorMessage,"Unknown type for signature, %s %d",Name,
Arity);
            CodingError(ErrorMessage);
            return(NULL);
            break;
    }
}
//-----------------------------------------------------------------------------
void DoNextInSignature(SYMBOLNODE SignatureTree,SYMBOLNODE Current,
int * CurrentFound,int * NextFound,SYMBOLNODE * Next) {

//----If the tree exists and the next (after current) has not been found
    if (SignatureTree != NULL && !*NextFound) {
//----If the current has not even been found, search on
        if (!*CurrentFound) {
//----If there's a current one (not the first time) and this is it, woohoo
            if (Current != NULL &&
!strcmp(GetSignatureSymbol(SignatureTree),GetSignatureSymbol(Current)) &&
GetSignatureArity(SignatureTree) == GetSignatureArity(Current)) {
//----If there's a right subtree, get the left most of that
                if (SignatureTree->NextSymbol != NULL) {
                    DoNextInSignature(SignatureTree->NextSymbol,NULL,
CurrentFound,NextFound,Next);
//----Otherwise catch the next on the way out of the recursion
                } else {
                    *CurrentFound = 1;
                }
//----If there's no current one (first time) or the current is small, go left
            } else if (Current == NULL ||
strcmp(GetSignatureSymbol(Current),GetSignatureSymbol(SignatureTree)) < 0 ||
(strcmp(GetSignatureSymbol(Current),GetSignatureSymbol(SignatureTree)) == 0 &&
 GetSignatureArity(Current) < GetSignatureArity(SignatureTree))) {
                DoNextInSignature(SignatureTree->LastSymbol,Current,
CurrentFound,NextFound,Next);
//----If current found to the (immediate ... next not found) left, catch
//----the next one here
                if (*CurrentFound && !*NextFound) {
                    *NextFound = 1;
                    *Next = SignatureTree;
                }
//----Current exists and is larger ... head right
            } else {
                DoNextInSignature(SignatureTree->NextSymbol,Current,
CurrentFound,NextFound,Next);
            }
//----If the current has been found, then we're one level on the way out
//----of the recursion, and this is the next. Catch it.
        } else {
            *Next = SignatureTree;
            *NextFound = 1;
        }
//----If at the end of the tree, then the current does not exist, i.e., must
//----have been NULL, so we've reached the left corner. Mark current as found
//----so left corner node is caught on way out of recursion.
    } else {
        *CurrentFound = 1;
    }
}
//-----------------------------------------------------------------------------
SYMBOLNODE NextInSignatureTree(SYMBOLNODE SignatureTree,SYMBOLNODE Current) {

    SYMBOLNODE Next;
    int CurrentFound;
    int NextFound;

    Next = NULL;
    CurrentFound = 0;
    NextFound = 0;
    DoNextInSignature(SignatureTree,Current,&CurrentFound,&NextFound,&Next);
    return(Next);
}
//-----------------------------------------------------------------------------
void ListSignatureBySearch(SYMBOLNODE SignatureTree) {

    SYMBOLNODE Current;

    Current = NextInSignatureTree(SignatureTree,NULL);
    while (Current != NULL) {
        printf("%s/%d(%d)\n",GetSignatureSymbol(Current),
GetSignatureArity(Current),GetSignatureUses(Current));
        fflush(stdout);
        Current = NextInSignatureTree(SignatureTree,Current);
    }
}
//-----------------------------------------------------------------------------
void PrintSignatureTree(SYMBOLNODE SignatureTree) {

    if (SignatureTree != NULL) {
        PrintSignatureTree(SignatureTree->LastSymbol);
        printf("%s/%d(%d)\n",GetSignatureSymbol(SignatureTree),
GetSignatureArity(SignatureTree),GetSignatureUses(SignatureTree));
        fflush(stdout);
        PrintSignatureTree(SignatureTree->NextSymbol);
    }
}
//-----------------------------------------------------------------------------
void PrintSignature(SIGNATURE Signature) {

    printf("Variables:\n");
    PrintSignatureTree(Signature->Variables);
    printf("\n");
    printf("Functions:\n");
    PrintSignatureTree(Signature->Functions);
    printf("\n");
    printf("Predicates:\n");
    PrintSignatureTree(Signature->Predicates);
    printf("\n");
    printf("NonLogical:\n");
    PrintSignatureTree(Signature->NonLogicals);
    printf("\n");
}
//-----------------------------------------------------------------------------
void DoGetSignatureSymbolUsage(char ** PutUsageHere,char ** PutNextHere,
SYMBOLNODE Current,long * UsageLength,int * SpareLength) {

//DEBUG static long Counter = 0;
    int ExtraLengthNeeded;
    int PutNextHereOffset;

    if (Current != NULL) {
        DoGetSignatureSymbolUsage(PutUsageHere,PutNextHere,Current->LastSymbol,
UsageLength,SpareLength);
//----Get more memory if needed (assume 20 is enough for arity and uses)
        ExtraLengthNeeded = strlen(Current->NameSymbol) + 20;
        PutNextHereOffset = *PutNextHere - *PutUsageHere;
        while (*SpareLength < ExtraLengthNeeded) {
//DEBUG printf("Need to ask for %ld memory\n",*UsageLength+STRINGLENGTH);
            *PutUsageHere = (char *)Realloc((void *)*PutUsageHere,
*UsageLength+STRINGLENGTH);
            *SpareLength += STRINGLENGTH;
            *UsageLength += STRINGLENGTH;
        }
//----Keep track of right place after Realloc
        *PutNextHere = *PutUsageHere + PutNextHereOffset;
//DEBUG printf("About to print %s into %d spare\n",Current->NameSymbol,*SpareLength);
//---Avoid using API to get max speed
        sprintf(*PutNextHere,"%s/%d/%d\n",Current->NameSymbol,Current->Arity,
Current->NumberOfUses);
        *SpareLength -= strlen(*PutNextHere);
//DEBUG printf("Printed %s leaving %d\n",*PutNextHere,*SpareLength);
//DEBUG printf("All are %s\n",*PutUsageHere);
        *PutNextHere += strlen(*PutNextHere);
//DEBUG if (++Counter % 1000 == 0) printf("%ld\n",Counter);

        DoGetSignatureSymbolUsage(PutUsageHere,PutNextHere,Current->NextSymbol,
UsageLength,SpareLength);
    }
}
//-----------------------------------------------------------------------------
//----PutUsageHere must be address of a malloced String
char * GetSignatureSymbolUsage(SIGNATURE Signature,char ** PutUsageHere,
char ** FunctorUsageStartsHere) {

    int SpareLength;
    long UsageLength;
    char * PutNextHere;
    long FunctorUsageOffset;

//DEBUG PrintSignature(Signature);
    strcpy(*PutUsageHere,"");
    UsageLength = STRINGLENGTH;
    SpareLength = STRINGLENGTH;
    PutNextHere = *PutUsageHere;
    DoGetSignatureSymbolUsage(PutUsageHere,&PutNextHere,Signature->Predicates,
&UsageLength,&SpareLength);
//DEBUG printf("Predicates ===>>%s<<===\n",*PutUsageHere);
    FunctorUsageOffset = PutNextHere - *PutUsageHere;
    DoGetSignatureSymbolUsage(PutUsageHere,&PutNextHere,Signature->Functions,
&UsageLength,&SpareLength);
//DEBUG printf("===\n%s",*PutUsageHere);
    *FunctorUsageStartsHere = *PutUsageHere + FunctorUsageOffset;
    return(*PutUsageHere);
}
//-----------------------------------------------------------------------------
void DoGetSignatureSymbolUsageStatistics(SYMBOLNODE SignatureNode,
double * NumberOfSymbols,double * NumberOfSymbolsArity0,
double * MinSymbolArity,double * MaxSymbolArity) {

    if (SignatureNode != NULL) {
//DEBUG printf("Symbol is %s\n",SignatureNode->NameSymbol);
        if (GetSignatureUses(SignatureNode) > 0) {
//DEBUG printf("    and it is used\n");
            (*NumberOfSymbols)++;
            if (SignatureNode->Arity == 0) {
                (*NumberOfSymbolsArity0)++;
            }
            if (*MinSymbolArity == -1 || SignatureNode->Arity < *MinSymbolArity) {
                *MinSymbolArity = SignatureNode->Arity;
            }
            if (SignatureNode->Arity > *MaxSymbolArity) {
                *MaxSymbolArity = SignatureNode->Arity;
            }
        }
        DoGetSignatureSymbolUsageStatistics(SignatureNode->LastSymbol,
NumberOfSymbols,NumberOfSymbolsArity0,MinSymbolArity,MaxSymbolArity);
        DoGetSignatureSymbolUsageStatistics(SignatureNode->NextSymbol,
NumberOfSymbols,NumberOfSymbolsArity0,MinSymbolArity,MaxSymbolArity);
    }
}
//-----------------------------------------------------------------------------
void GetSignatureSymbolUsageStatistics(SYMBOLNODE SignatureNode,
double * NumberOfSymbols,double * NumberOfSymbolsArity0,
double * MinSymbolArity,double * MaxSymbolArity) {

    *NumberOfSymbols = 0;
    *NumberOfSymbolsArity0 = 0;
    *MinSymbolArity = -1;
    *MaxSymbolArity = -1;
    DoGetSignatureSymbolUsageStatistics(SignatureNode,NumberOfSymbols,
NumberOfSymbolsArity0,MinSymbolArity,MaxSymbolArity);
}
//-----------------------------------------------------------------------------
