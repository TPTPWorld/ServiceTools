#ifndef LISTSTATISTICS_H
#define LISTSTATISTICS_H
//-----------------------------------------------------------------------------
#include "DataTypes.h"
#include "Statistics.h"
//-----------------------------------------------------------------------------
int ListCount(LISTNODE List,CountType WhatToCount);
int HeadListCount(HEADLIST HeadListHead,CountType WhatToCount);
int ListMaximal(LISTNODE List,MaximizeType WhatToMaximize);

SymbolStatisticsType GetListSymbolUsageStatistics(HEADLIST HeadList);
StatisticsType GetListStatistics(LISTNODE ListHead,SIGNATURE Signature);
void PrintListStatistics(FILE * Stream,StatisticsType Statistics);
//-----------------------------------------------------------------------------
#endif
