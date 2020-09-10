#ifndef TREESTATISTICS_H
#define TREESTATISTICS_H
//-----------------------------------------------------------------------------
#include "DataTypes.h"
#include "Statistics.h"

typedef struct {
    double NumberOfFormulae;
    double NumberOfFormulaeExpanded;
    double NumberOfLeaves;
    double NumberOfLeavesExpanded;
    double TreeDepth;
    double NumberOfAtoms; 
    double NumberOfAtomsExpanded;
    double NumberOfEqualityAtoms; 
    double NumberOfEqualityAtomsExpanded;

    double NumberOfTHF;
    double NumberOfTFF;
    double NumberOfFOF;

//----Not for pure CNF
    double MaxFormulaDepth;
    double AverageFormulaDepth;

//----Not for pure FOF
    double NumberOfCNF;
    double NumberOfCNFExpanded;
    double MaxClauseSize;
    double AverageClauseSize;

    double MaxTermDepth;
    double AverageTermDepth;
    double NumberOfLiterals;
} TreeStatisticsRecordType;
//-----------------------------------------------------------------------------
TreeStatisticsRecordType * GetTreeStatistics(ROOTLIST RootListHead,
TreeStatisticsRecordType * Statistics);
void PrintTreeStatistics(FILE * Stream,TreeStatisticsRecordType Statistics);
//-----------------------------------------------------------------------------
#endif
