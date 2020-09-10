//-----------------------------------------------------------------------------
#include "DataTypes.h"
//-----------------------------------------------------------------------------
typedef struct {
    int Quietness;
    String DerivationFileName;
    String ProblemFileName;
    PrintFormatType Format;
    int Pretty;
    double MinimalRating;
    int KeepInterestingnessComponents;
} OptionsType;

//-----------------------------------------------------------------------------
#define RATER "/home/tptp/Systems/AGInT---4.0/discover"
//-----------------------------------------------------------------------------
#define QPRINTF(Q,P) if ((P) >= (Q.Quietness)) printf
#define QDO(Q,P,D) if ((P) >= (Q.Quietness)) D
//-----------------------------------------------------------------------------
#define DEFAULT_QUIETNESS 1
#define DEFAULT_FORMAT tptp
#define DEFAULT_PRETTY 1
#define DEFAULT_KEEP_COMPONENTS 0
#define DEFAULT_MINIMAL_RATING -1.0
//-----------------------------------------------------------------------------
int GlobalInterrupted;
//-----------------------------------------------------------------------------
