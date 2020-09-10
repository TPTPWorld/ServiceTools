#include <stdio.h>
#include <assert.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include "DataTypes.h"
#include "Utilities.h"
#include "Tokenizer.h"
#include "Parsing.h"
#include "Signature.h"
#include "Examine.h"
#include "List.h"
#include "Tree.h"
#include "Statistics.h"
#include "TreeStatistics.h"
#include "ListStatistics.h"
#include "PrintTSTP.h"
//-----------------------------------------------------------------------------
int main(int argc, char *argv[]) {

    LISTNODE Head;
    SIGNATURE Signature;
    StatisticsType Statistics;
    int FileNameIndex;
    int ExpandIncludes;

    if (argc == 1) {
        printf("Usage: MakeListStats [-i] <file name>\n");
        return(0);
    }

    FileNameIndex = 1;
    ExpandIncludes = 1;
    if (!strcmp(argv[FileNameIndex],"-i")) {
        FileNameIndex++;
        ExpandIncludes = 0;
    }
    Signature = NewSignature();
    SetNeedForNonLogicTokens(0);
    // SetAllowFreeVariables(1);
//DEBUG printf("PROGRESS: about to read\n");
    if ((Head = ParseFileOfFormulae(argv[FileNameIndex],NULL,Signature,
ExpandIncludes,NULL)) != NULL) {
//DEBUG printf("PROGRESS: read complete\n");
        Statistics = GetListStatistics(Head,Signature);
//DEBUG printf("PROGRESS: statistics complete\n");
        PrintListStatistics(stdout,Statistics);
//DEBUG printf("PROGRESS: printing complete\n");
        FreeListOfAnnotatedFormulae(&Head);
        assert(Head == NULL);
        FreeSignature(&Signature);
    } else {
        printf("%% Syntax   : WARNING: No formulae parsed from %s\n",argv[1]);
    }

    return(0);
}
//-----------------------------------------------------------------------------
