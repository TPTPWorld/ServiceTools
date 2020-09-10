#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include "DataTypes.h"
#include "Utilities.h"
#include "Tokenizer.h"
#include "Parsing.h"
#include "Signature.h"
#include "Examine.h"
#include "Modify.h"
#include "List.h"
#include "ListStatistics.h"
#include "FileUtilities.h"
#include "Utilities.h"
#include "PrintTSTP.h"
//-----------------------------------------------------------------------------
#define MAX_NUM_GROSS_PARENTS 500
#define BLOCKSIZE 1
#define SCALE 1
typedef struct InterestingLemma{
    double App;
    double Useful;
    double Surp;
    double Score;
    int NumOfChildren;
} IntLemma;
typedef IntLemma * INTLEMMA;

int ConvertNameToInt(char * NameString);
void SplitNames(char * PutNamesHere, char ** MyParents);

void ParseIntr(LISTNODE head,int ** IntrParentsAdd, int *number);
void ParseInfo(int ** UsefulnessArrayAdd, int * number, FILE * InputStreamInfo);
double Usefulness(ANNOTATEDFORMULA AnnotatedFormula, int * Array, int * IntrArray, int *NumOfChildren);
double Applicability(ANNOTATEDFORMULA AnnotatedFormula);
double Surprisingness(ANNOTATEDFORMULA AnnotatedFormula, int *SurprisingGraph, int *tableeither, int NumOfAxioms, int TableSize, char **HashResults);
int BuildGraph(LISTNODE Head, int ** SurprisingGraphAdd, char *** HashResultsAdd, int **TableEitherAdd,int *TableSizeAdd,char**);
int hash(char *str,int tablesize);
void CutStr(char *str);
void BreakStr(char *str,char **Strs);
int CountNumReturns(char *str);
int SymbolOccurs(char *str,char *allstr);

// ANNOTATEDFORMULA ParseAnnotatedFormula(READFILE Stream,SIGNATURE Signature);
//-----------------------------------------------------------------------------
int main(int argc, char *argv[]) {
    //LISTNODE Head;
    //LISTNODE AnotherHead;
    READFILE Stream;
    SIGNATURE Signature;
    ANNOTATEDFORMULA AnnotatedFormula,FormulaWithTrue;
    //TERM InferenceTerm;
    TERM TermForTrue;
    char *TempSymbols, *AnotherSymbolUsage;
    char *PosTrueString, *NegTrueString;
    String PutNamesHere,ParentNames;
    int NotFound=0;
    
    TempSymbols = (char *)Malloc(sizeof(String));
    PosTrueString = (char *)Malloc(sizeof(String));
    NegTrueString =  (char *)Malloc(sizeof(String));

    strcpy(PosTrueString,"true");
    strcpy(NegTrueString,"false");
    strcpy(PutNamesHere,"");
//----DEBUG    printf("Pos: %s, Neg: %s, PutNamesHere: %s\n",PosTrueString,NegTrueString,PutNamesHere);

//----Reading formulae one-by-one from stdin. Ignore comments, etc
    Signature = NewSignature();
    SetNeedForNonLogicTokens(0);
    if ((Stream = OpenFILEReadFile(stdin)) != NULL) {
        NextToken(Stream);
         while (!CheckTokenType(Stream,endeof)) {
//----DEBUG             printf("Got here before AnnotatedFormula?\n");

             AnnotatedFormula = ParseAnnotatedFormula(Stream,Signature);
//----DEBUG             printf("Got here after AnnotatedFormula?\n");

             printf("\n");
             if(GetAnnotatedFormulaSymbolUsage(AnnotatedFormula,&TempSymbols,&AnotherSymbolUsage) != NULL){
                if((SymbolOccurs(PosTrueString,TempSymbols))||(SymbolOccurs(NegTrueString,TempSymbols))){
//----DEBUG                        printf("One target found!\n");
                        if(NotFound) FreeAnnotatedFormula(&FormulaWithTrue);
                        else NotFound = 1;
                        GetName(AnnotatedFormula,PutNamesHere);
                        //InferenceTerm = AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source;  
                        //AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source = NULL;
                        FormulaWithTrue = AnnotatedFormula;
                }
                else{
                    if(NotFound){
                        GetParentNames(AnnotatedFormula,ParentNames);
//---DEBUG
                       // printf("Here are the parents: %s\n",ParentNames);
                       // printf(" and the true's name:%s\n",PutNamesHere);

                        if(SymbolOccurs(PutNamesHere,ParentNames)){
                               TermForTrue = AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source;
                               AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source = FormulaWithTrue->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source;
                               FormulaWithTrue->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Source =  TermForTrue;
                               NotFound = 0;
                               FreeAnnotatedFormula(&FormulaWithTrue);
                        }
                    }
                    PrintAnnotatedTSTPNode(stdout,AnnotatedFormula,tptp,1);
                    //printf("NotFound Now is %d \n",NotFound);
                    FreeAnnotatedFormula(&AnnotatedFormula);
                }
            }
        }
    }
    if(NotFound)  FreeAnnotatedFormula(&FormulaWithTrue);
    Free((void **)&TempSymbols);
    Free((void **)&PosTrueString);
    Free((void **)&NegTrueString);

    return(EXIT_SUCCESS);
}

int SymbolOccurs(char *str,char *allstr){
    char *myallstr;
    char ** AllStrs;
    int n;
    int m;
    int occ = 0;
    
    myallstr = (char *)Malloc(sizeof(String));
    strcpy(myallstr,allstr);
//----DEBUG    printf("str is %s, myallstr is %s \n",str,myallstr);
    n = CountNumReturns(myallstr);
    AllStrs = (char **)Malloc((n+1)*sizeof(char*));
    BreakStr(myallstr,AllStrs);
    for(m = 0; m < n; m++){
        CutStr(AllStrs[m]);
//----DEBUG    printf("str is %s, str to check is %s \n",str,AllStrs[m]);
        if(!strcmp(str,AllStrs[m])){
           occ = 1;
           break;
        }
    }
    Free((void**)&AllStrs);
    Free((void**)&myallstr);
    return(occ);
}

void CutStr(char *str){
    char ch = ' ';
    int i;
    for(i = 0;(ch!='/')&&(ch!='\0');i++) ch=*(str + i);
    if(ch=='/') *(str+i-1) = '\0';
    return;
}

int CountNumReturns(char *str){
    char ch = ' ';
    int counter;
    int i;
    for(counter = 0,i = 0; ch != '\0'; i++){
        ch = *(str+i);
        if(ch == '\n') counter++;
    }
    return(counter);
}

void BreakStr(char *str,char **Strs){
    int i;
    i = 0;
    Strs[i] = strtok(str,"\n");
    while(Strs[i++] != NULL){
        Strs[i] = strtok(NULL,"\n");
    }
}
