#ifndef SYSTEMONTPTP_H
#define SYSTEMONTPTP_H
//-----------------------------------------------------------------------------
#include <unistd.h>
#include "DataTypes.h"
#include "PrintTSTP.h"
//-----------------------------------------------------------------------------
typedef enum {SZS,
              SUC,
              UNP,SAP,ESA,
              SAT,FSA,THM,EQV,TAC,WEC,ETH,TAU,WTC,WTH,
              CAX,SCA,TCA,WCA,
              CUP,CSP,ECS,
              CSA,CTH,CEQ,UNC,WCC,ECT,FUN,UNS,WUC,WCT,
              SCC,UCA,
              NOC,
              NOS,
              OPN,UNK,ASS,
              STP,ERR,OSE,INE,SYE,SEE,TYE,
              FOR,USR,RSO,TMO,MMO,GUP,INC,IAP,INP,NTT,NTY,
              nonszsresult} SZSResultType;

typedef SZSResultType * SZSResultArray;

typedef enum {LDa,
              Sol,
              Prf,Der,Ref,CRf,
              Int,DIn,FIn,IIn,HIn,
              Mod,DMo,FMo,IMo,HMo,Sat,
              Lof,Lth,Lfo,Lcn,
              NSo,IPr,IRf,ICf,Ass,
              Non,
              nonszsoutput} SZSOutputType;

typedef SZSOutputType * SZSOutputArray;

typedef struct {
    SZSResultType TLA;
    char * TLAString;
    char * UserString;
} SZSResultTripleType;

typedef struct {
    SZSOutputType TLA;
    char * TLAString;
    char * UserString;
} SZSOutputTripleType;
//-----------------------------------------------------------------------------
#ifndef TPTP_HOME
    #define TPTP_HOME "/home/tptp"
#endif
#define SYSTEM_ON_TPTP "SystemExecution/SystemOnTPTP"
//-----------------------------------------------------------------------------
SZSResultType StringToSZSResult(char * SZSResult);
char * SZSResultToUserString(SZSResultType SZSResult);
char * SZSResultToString(SZSResultType SZSResult);

SZSOutputType StringToSZSOutput(char * SZSOutput);
char * SZSOutputToUserString(SZSOutputType SZSOutput);
char * SZSOutputToString(SZSOutputType SZSOutput);
int SZSIsA(SZSResultType SZSResult,SZSResultType DesiredResult);
int SZSOutputIsA(SZSOutputType SZSOutput,SZSOutputType DesiredOutput);

void SystemOnTPTPFileName(char * Directory,char * BaseName,char * Extension,
String FileName);
int MakeProblemFile(char * FilesDirectory,char * BaseName,char * Extension,
String ProblemFileName,LISTNODE Head,StatusType AxiomsStatus,
ANNOTATEDFORMULA Conjecture,StatusType ConjectureStatus);
int SystemOnTPTPAvailable(void);
int SystemOnTPTP(LISTNODE Axioms,ANNOTATEDFORMULA Conjecture,
char * PositiveChecker,char * PositiveResult,int TestNegative,
char * NegativeChecker,char * NegativeResult,int TimeLimit,
char * SystemOutputPrefix,char * OptionalFlags,int KeepOutputFiles,
char * FilesDirectory,char * UsersOutputFileName,String OutputFileName);
int SystemOnTPTPGetResult(int QuietnessLevel,char * ProblemFileName,
char * ATPSystem,int TimeLimit,char * X2TSTPFlag,char * SystemOutputPrefix,
char * OptionalFlags,int KeepOutputFiles,char * FilesDirectory,
char * UsersOutputFileName,char * OutputFileName,char * PutResultHere,
char * PutOutputHere);
SZSResultType SZSSystemOnTPTP(LISTNODE Axioms,ANNOTATEDFORMULA Conjecture,
char * System,SZSResultType DesiredResult,int QuietnessLevel,int TimeLimit,
char * X2TSTPFlag,char * SystemOutputPrefix,char * OptionalFlags,
int KeepOutputFiles,char * FilesDirectory,char * UsersOutputFileName,
String OutputFileName,SZSOutputType * SZSOutput);

LISTNODE ApplyExternalProgram(LISTNODE Head,StatusType AsStatus,
ANNOTATEDFORMULA Conjecture,const char * ExecuteFormatString,
SIGNATURE Signature);
//-----------------------------------------------------------------------------
#endif
