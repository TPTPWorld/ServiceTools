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
