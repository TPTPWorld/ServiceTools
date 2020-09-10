#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <ctype.h>
#include <stdlib.h>
#include "DataTypes.h"
#include "Utilities.h"
#include "Parsing.h"
#include "FileUtilities.h"
#include "Modify.h"
#include "SystemOnTPTP.h"
//-----------------------------------------------------------------------------
static SZSResultTripleType ResultTriples[] = {
    {SZS,"SZS","SZSResultValue"},
    {SUC,"SUC","Success"},
    {UNP,"UNP","UnsatisfiabilityPreserving"},
    {SAP,"SAP","SatisfiabilityPreserving"},
    {ESA,"ESA","EquiSatisfiable"},
    {SAT,"SAT","Satisfiable"},
    {FSA,"FSA","FinitelySatisfiable"},
    {THM,"THM","Theorem"},
    {EQV,"EQV","Equivalent"},
    {TAC,"TAC","TautologousConclusion"},
    {WEC,"WEC","WeakerConclusion"},
    {ETH,"ETH","EquivalentTheorem"},
    {TAU,"TAU","Tautology"},
    {WTC,"WTC","WeakerTautologousConclusion"},
    {WTH,"WTH","WeakerTheorem"},
    {CAX,"CAX","ContradictoryAxioms"},
    {SCA,"SCA","SatisfiableConclusionContradictoryAxioms"},
    {TCA,"TCA","TautologousConclusionContradictoryAxioms"},
    {WCA,"WCA","WeakerConclusionContradictoryAxioms"},
//----Negative side
    {CUP,"CUP","CounterUnsatisfiabilityPreserving"},
    {CSP,"CSP","CounterSatisfiabilityPreserving"},
    {ECS,"ECS","EquiCounterSatisfiable"},
    {CSA,"CSA","CounterSatisfiable"},
    {CTH,"CTH","CounterTheorem"},
    {CEQ,"CEQ","CounterEquivalent"},
    {UNC,"UNC","UnsatisfiableConclusion"},
    {WCC,"WCC","WeakerCounterConclusion"},
    {ECT,"ECT","EquivalentCounterTheorem"},
    {FUN,"FUN","FinitelyUnsatisfiable"},
    {UNS,"UNS","Unsatisfiable"},
    {WUC,"WUC","WeakerUnsatisfiableConclusion"},
    {WCT,"WCT","WeakerCounterTheorem"},
    {SCC,"SCC","SatisfiableCounterConclusionContradictoryAxioms"},
    {UCA,"UCA","UnsatisfiableConclusionContradictoryAxioms"},
    {NOC,"NOC","NoConsequence"},
//----No-success ontology
    {NOS,"NOS","NoSuccess"},
    {OPN,"OPN","Open"},
    {UNK,"UNK","Unknown"},
    {ASS,"ASS","Assumed"},
    {STP,"STP","Stopped"},
    {ERR,"ERR","Error"},
    {OSE,"OSE","OSError"},
    {INE,"INE","InputError"},
    {SYE,"SYE","SyntaxError"},
    {SEE,"SEE","SemanticError"},
    {TYE,"TYE","TypeError"},
    {FOR,"FOR","Forced"},
    {USR,"USR","User"},
    {RSO,"RSO","ResourceOut"},
    {TMO,"TMO","Timeout"},
    {MMO,"MMO","MemoryOut"},
    {GUP,"GUP","GaveUp"},
    {INC,"INC","Incomplete"},
    {IAP,"IAP","Inappropriate"},
    {INP,"INP","InProgress"},
    {NTT,"NTT","NotTested"},
    {NTY,"NTY","NotTestedYet"}
};

static SZSResultType ResultIsaPairs[][2] = {
    {SUC,SZS},{NOS,SZS},
    {UNP,SUC},{SAP,SUC},{CSP,SUC},{CUP,SUC},{FUN,SUC},
    {CSA,UNP},{ESA,UNP},
    {ESA,SAP},{THM,SAP},
    {SAT,ESA},
    {FSA,SAT},{EQV,SAT},{TAC,SAT},{WEC,SAT},{NOC,SAT},
    {EQV,THM},{TAC,THM},{WEC,THM},{CAX,THM},
    {ETH,EQV},{TAU,EQV},
    {TAU,TAC},{WTC,TAC},
    {WTC,WEC},{WTH,WEC},
    {SCA,CAX},{SCC,CAX},
    {TCA,SCA},{WCA,SCA},
    {SAT,CUP},{ECS,CUP},
    {ECS,CSP},{CTH,CSP},
    {CSA,ECS},
    {CEQ,CSA},{UNC,CSA},{WCC,CSA},{NOC,CSA},
    {CEQ,CTH},{UNC,CTH},{WCC,CTH},{CAX,CTH},
    {ECT,CEQ},{UNS,CEQ},
    {UNS,UNC},{WUC,UNC},
    {WUC,WCC},{WCT,WCC},
    {UNS,FUN},
    {UCA,SCC},{WCA,SCC},
    {OPN,NOS},{UNK,NOS},{ASS,NOS},
        {STP,UNK},{INP,UNK},{NTT,UNK},
        {ERR,STP},{FOR,STP},{GUP,STP},
        {OSE,ERR},{INE,ERR},
        {SYE,INE},{SEE,INE},
        {TYE,SEE},
        {USR,FOR},{RSO,FOR},
        {TMO,RSO},{MMO,RSO},
        {RSO,GUP},{INC,GUP},{ERR,GUP},{IAP,GUP},
        {IAP,NTT},{NTY,NTT}
    };

static SZSOutputTripleType OutputTriples[] = {
    {LDa,"LDa","LogicalData"},
    {Sol,"Sol","Solution"},
    {Prf,"Prf","Proof"},
    {Der,"Der","Derivation"},
    {Ref,"Ref","Refutation"},
    {CRf,"CRf","CNFRefutation"},
    {Int,"Int","Interpretation"},
    {DIn,"DIn","DomainInterpretation"},
    {FIn,"FIn","FiniteInterpretation"},
    {IIn,"IIn","InfiniteInterpretation"},
    {HIn,"HIn","HerbrandInterpretation"},
    {Mod,"Mod","Model"},
    {DMo,"DMo","DomainModel"},
    {FMo,"FMo","FiniteModel"},
    {IMo,"IMo","InfiniteModel"},
    {HMo,"HMo","HerbrandModel"},
    {Sat,"Sat","Saturation"},
    {Lof,"Lof","ListOfFormulae"},
    {Lth,"Lth","ListOfTHF"},
    {Lfo,"Lfo","ListOfFOF"},
    {Lcn,"Lcn","ListOfCNF"},
    {NSo,"NSo","NoSolution"},
    {IPr,"IPr","IncompleteProof"},
    {IRf,"IRf","IncompleteRefutation"},
    {ICf,"ICf","IncompleteCNFRefutation"},
    {Ass,"Ass","Assurance"},
    {Non,"Non","None"}
};

static SZSOutputType OutputIsaPairs[][2] = {
    {Sol,LDa},{NSo,LDa},{Non,LDa},
    {Prf,Sol},{Int,Sol},{Lof,Sol},
    {Der,Prf},{Ref,Prf},
    {CRf,Ref},
    {DIn,Int},{Mod,Int},
    {FIn,DIn},{IIn,DIn},{HIn,DIn},{DMo,DIn},
    {FMo,FIn},
    {IMo,IIn},
    {HMo,HIn},
    {DMo,Mod},{Sat,Mod},
    {FMo,DMo},{IMo,DMo},{HMo,DMo},
    {Lth,Lof},{Lfo,Lof},{Lcn,Lof},
    {IPr,NSo},{Ass,NSo},
    {IRf,IPr},
    {ICf,IRf}
};
//-----------------------------------------------------------------------------
SZSResultType StringToSZSResult(char * SZSResult) {

    int Index;

    for (Index = 0;Index < sizeof(ResultTriples)/sizeof(SZSResultTripleType);
Index++) {
        if (!strcasecmp(SZSResult,ResultTriples[Index].TLAString) ||
!strcmp(SZSResult,ResultTriples[Index].UserString)) {
            return(ResultTriples[Index].TLA);
        }
    }

    CodingError("String not an SZSResultType");
    return(nonszsresult);
}
//-----------------------------------------------------------------------------
char * SZSResultToUserString(SZSResultType SZSResult) {

    int Index;

    for (Index = 0;Index < sizeof(ResultTriples)/sizeof(SZSResultTripleType);
Index++) {
        if (SZSResult == ResultTriples[Index].TLA) {
            return(ResultTriples[Index].UserString);
        }
    }

    CodingError("Not a SZSResultType to convert to user string");
    return(NULL);
}
//-----------------------------------------------------------------------------
char * SZSResultToString(SZSResultType SZSResult) {

    int Index;

    for (Index = 0;Index < sizeof(ResultTriples)/sizeof(SZSResultTripleType);
Index++) {
        if (SZSResult == ResultTriples[Index].TLA) {
            return(ResultTriples[Index].TLAString);
        }
    }

    CodingError("Not a SZSResultType to convert to string");
    return(NULL);
}
//-----------------------------------------------------------------------------
SZSOutputType StringToSZSOutput(char * SZSOutput) {

    int Index;

    for (Index = 0;Index < sizeof(OutputTriples)/sizeof(SZSOutputTripleType);
Index++) {
        if (!strcasecmp(SZSOutput,OutputTriples[Index].TLAString) ||
!strcmp(SZSOutput,OutputTriples[Index].UserString)) {
            return(OutputTriples[Index].TLA);
        }
    }

    CodingError("String not an SZSOutputType");
    return(nonszsoutput);
}
//-----------------------------------------------------------------------------
char * SZSOutputToUserString(SZSOutputType SZSOutput) {

    int Index;

    for (Index = 0;Index < sizeof(OutputTriples)/sizeof(SZSOutputTripleType);
Index++) {
        if (SZSOutput == OutputTriples[Index].TLA) {
            return(OutputTriples[Index].UserString);
        }
    }

    CodingError("Not a SZSOutputType to convert to user string");
    return(NULL);
}
//-----------------------------------------------------------------------------
char * SZSOutputToString(SZSOutputType SZSOutput) {

    int Index;

    for (Index = 0;Index < sizeof(OutputTriples)/sizeof(SZSOutputTripleType);
Index++) {
        if (SZSOutput == OutputTriples[Index].TLA) {
            return(OutputTriples[Index].TLAString);
        }
    }

    CodingError("Not a SZSOutputType to convert to string");
    return(NULL);
}
//-----------------------------------------------------------------------------
int SZSIsA(SZSResultType SZSResult,SZSResultType DesiredResult) {

    int Index;

    if (SZSResult == DesiredResult) {
        return(1);
    }
    for (Index = 0; Index < sizeof(ResultIsaPairs)/(2 * sizeof(SZSResultType));
Index++) {
        if (ResultIsaPairs[Index][0] == SZSResult && 
SZSIsA(ResultIsaPairs[Index][1],DesiredResult)) {
            return(1);
        }
    }
    return(0);
}
//-----------------------------------------------------------------------------
int SZSOutputIsA(SZSOutputType SZSOutput,SZSOutputType DesiredOutput) {

    int Index;

    if (SZSOutput == DesiredOutput) {
        return(1);
    }
    for (Index = 0; Index < sizeof(OutputIsaPairs)/(2 * sizeof(SZSOutputType));
Index++) {
        if (OutputIsaPairs[Index][0] == SZSOutput && 
SZSOutputIsA(OutputIsaPairs[Index][1],DesiredOutput)) {
            return(1);
        }
    }
    return(0);
}
//-----------------------------------------------------------------------------
void SystemOnTPTPFileName(char * Directory,char * BaseName,char * Extension,
String FileName) {

    String InternalFileName;
    int FD;

    if (Directory != NULL) {
        strcpy(InternalFileName,Directory);
        strcat(InternalFileName,"/");
    } else {
        strcpy(InternalFileName,"");
    }

    if (BaseName != NULL && strlen(BaseName) > 0) {
        strcat(InternalFileName,BaseName);
    } else {
        strcat(InternalFileName,"SoTXXXXXX");
    }
//----If ends with XXXXXX then use mkstemp to make unique name
    if (strstr(InternalFileName,"XXXXXX") != NULL) {
//----Playing safe - open and create the file rather than making a name
        if ((FD = mkstemp(InternalFileName)) == -1) {
            perror("Making unique filename");
            ReportError("OSError",
"Could not make a unique file name with mkstemp\n",1);
        } else {
            close(FD);
        }
    } else {
        if (Extension != NULL) {
            strcat(InternalFileName,Extension);
        } 
    }

//----Copy across at end to avoid clashes with same variable in call
    strcpy(FileName,InternalFileName);
}
//-----------------------------------------------------------------------------
int MakeProblemFile(char * FilesDirectory,char * BaseName,char * Extension,
String ProblemFileName,LISTNODE Head,StatusType AxiomsStatus,
ANNOTATEDFORMULA Conjecture,StatusType ConjectureStatus) {

    FILE * ProblemFileHandle;

//----Make a file to save the problem
    SystemOnTPTPFileName(FilesDirectory,BaseName,Extension,ProblemFileName);
    if ((ProblemFileHandle = OpenFileInMode(ProblemFileName,"w")) == NULL) {
        return(0);
    }
//----Why did I check for NULL here?
    if (Head != NULL) {
        PrintListOfAnnotatedTSTPNodesWithStatus(ProblemFileHandle,NULL,Head,
tptp,1,AxiomsStatus);
    }
    if (Conjecture != NULL) {
        PrintAnnotatedTSTPNodeWithStatus(ProblemFileHandle,Conjecture,
tptp,1,ConjectureStatus);
    }
    fclose(ProblemFileHandle);

    return(1);
}
//-----------------------------------------------------------------------------
int SystemOnTPTPAvailable(void) {

    String UNIXCommand;
    char * TPTPHome;

//----First look if user has a TPTP_HOME environment variable
    if ((TPTPHome = getenv("TPTP_HOME")) != NULL) {
//DEBUG printf("Using the TPTP_HOME environment variable\n");
        sprintf(UNIXCommand,"%s/%s",TPTPHome,SYSTEM_ON_TPTP);
//----If not, use the macro from compile time
    } else {
//DEBUG printf("Using the macro\n");
        sprintf(UNIXCommand,"%s/%s",TPTP_HOME,SYSTEM_ON_TPTP);
    }
//DEBUG printf("Checking %s\n",UNIXCommand);
    if (access(UNIXCommand,X_OK) == 0) {
//DEBUG printf("Access OK\n");
        return(1);
    } else {
//DEBUG printf("Access not OK\n");
        perror(UNIXCommand);
        return(0);
    }
}
//-----------------------------------------------------------------------------
int SystemOnTPTPGetResult(int QuietnessLevel,char * ProblemFileName,
char * ATPSystem,int TimeLimit,char * X2TSTPFlag,char * SystemOutputPrefix,
char * OptionalFlags,int KeepOutputFiles,char * FilesDirectory,
char * UsersOutputFileName,char * OutputFileName,char * PutResultHere,
char * PutOutputHere) {

    String UNIXCommand;
    char * TPTPHome;
    String InternalOutputFileName;
    FILE * OutputFileHandle;
    FILE * SystemPipe;
    int GotResult;
    int GotOutput;
    String SystemOutputLine;
    char * SaysPart;
    char * CPUPart;
    char * WCPart;
    char * QuietnessFlag;
    String ErrorMessage;

    if (QuietnessLevel < 0) {
        QuietnessFlag = "-q0";
        QuietnessLevel = -QuietnessLevel;
    } else {
        QuietnessFlag = "-q";
    }
//----First look if user has a TPTP_HOME environment variable
    if ((TPTPHome = getenv("TPTP_HOME")) != NULL) {
        sprintf(UNIXCommand,"%s/%s %s%d %s %s %d %s %s",TPTPHome,SYSTEM_ON_TPTP,
QuietnessFlag,QuietnessLevel,OptionalFlags,ATPSystem,TimeLimit,X2TSTPFlag,
ProblemFileName);
//----If not, use the macro from compile time
    } else {
        sprintf(UNIXCommand,"%s/%s -q%d %s %d %s %s",TPTP_HOME,SYSTEM_ON_TPTP,
QuietnessLevel,ATPSystem,TimeLimit,X2TSTPFlag,ProblemFileName);
    }
    if ((SystemPipe = popen(UNIXCommand,"r")) == NULL) {
        perror("Running SystemOnTPTP");
        sprintf(ErrorMessage,"Could not start %s",UNIXCommand);
        ReportError("OSError",ErrorMessage,0);
    }

//----Set to NULL to keep gcc happy (does not know about KeepOutputFiles)
    OutputFileHandle = NULL;
    if (KeepOutputFiles) {
        if (!strcmp(UsersOutputFileName,"stdout")) {
            OutputFileHandle = stdout;
        } else {
            SystemOnTPTPFileName(FilesDirectory,UsersOutputFileName,NULL,
InternalOutputFileName);
            if ((OutputFileHandle = OpenFileInMode(InternalOutputFileName,
"w")) == NULL) {
                pclose(SystemPipe);
                return(0);
            } else {
                if (OutputFileName != NULL) {
                    strcpy(OutputFileName,InternalOutputFileName);
                }
            }
        } 
    }

//----Read SystemOnTPTP output echoing to file and looking for RESULT and 
//----OUTPUT
    GotResult = 0;
    GotOutput = 0;
    while (fgets(SystemOutputLine,STRINGLENGTH,SystemPipe) != NULL) {
        if (KeepOutputFiles) {
            fputs(SystemOutputLine,OutputFileHandle);
        }
//DEBUG printf("Line is %s",SystemOutputLine);
        if (!GotResult && 
strstr(SystemOutputLine,"RESULT: ") == SystemOutputLine &&
(SaysPart = strstr(SystemOutputLine," says ")) != NULL &&
(CPUPart = strstr(SaysPart," - CPU =")) != NULL &&
(WCPart = strstr(CPUPart," WC =")) != NULL) {
            *CPUPart = '\0';
            strcpy(PutResultHere,SaysPart+6);
            *CPUPart = ' ';
            *WCPart = '\0';
            if (SystemOutputPrefix != NULL) {
                printf("%s%s\n",SystemOutputPrefix,SystemOutputLine);
                fflush(stdout);
            }
            *WCPart = ' ';
            GotResult = 1;
//DEBUG printf("Got the result %s\n",PutResultHere);
        }
        if (!GotResult && !strcmp(X2TSTPFlag,"-S") &&
strstr(SystemOutputLine,"% Result     : ") == SystemOutputLine &&
(SaysPart = strstr(SystemOutputLine," : ")) != NULL &&
(CPUPart = strstr(SaysPart+3," ")) != NULL) {
            *CPUPart = '\0';
            strcpy(PutResultHere,SaysPart+3);
            GotResult = 1;
//DEBUG printf("Got the TPTP result %s\n",PutResultHere);
        }
        if (PutOutputHere != NULL && !GotOutput && 
strstr(SystemOutputLine,"OUTPUT: ") == SystemOutputLine &&
(SaysPart = strstr(SystemOutputLine," says ")) != NULL &&
(CPUPart = strstr(SystemOutputLine," - CPU =")) != NULL &&
(WCPart = strstr(SystemOutputLine," WC =")) != NULL) {
            *CPUPart = '\0';
            strcpy(PutOutputHere,SaysPart+6);
            *CPUPart = ' ';
            *WCPart = '\0';
            if (SystemOutputPrefix != NULL) {
                printf("%s%s\n",SystemOutputPrefix,SystemOutputLine);
                fflush(stdout);
            }
            *WCPart = ' ';
            GotOutput = 1;
//DEBUG printf("Got the output %s\n",PutOutputHere);
        }
        if (PutOutputHere != NULL && !GotOutput && !strcmp(X2TSTPFlag,"-S") &&
strstr(SystemOutputLine,"% Output     : ") == SystemOutputLine &&
(SaysPart = strstr(SystemOutputLine," : ")) != NULL &&
(CPUPart = strstr(SaysPart+3," ")) != NULL) {
            *CPUPart = '\0';
            strcpy(PutOutputHere,SaysPart+3);
            GotOutput = 1;
//DEBUG printf("Got the TPTP output %s\n",PutOutputHere);
        }
    }

    pclose(SystemPipe);
    if (KeepOutputFiles && OutputFileHandle != stdout) {
        fclose(OutputFileHandle);
    }

    return(GotResult);
}
//-----------------------------------------------------------------------------
//----1 means positive result, -1 means negative result, 0 means no result
int SystemOnTPTP(LISTNODE Axioms,ANNOTATEDFORMULA Conjecture,
char * PositiveChecker,char * PositiveResult,int TestNegative,
char * NegativeChecker,char * NegativeResult,int TimeLimit,
char * SystemOutputPrefix,char * OptionalFlags,int KeepOutputFiles,
char * FilesDirectory,char * UsersOutputFileName,String OutputFileName) {

    String ProblemFileName;
    String CopyUsersOutputFileName;
    String SystemResult;
    int Correct;

    if (!MakeProblemFile(FilesDirectory,UsersOutputFileName,".p",
ProblemFileName,Axioms,axiom,Conjecture,conjecture)) {
        return(0);
    }

//----0 means no result yet
    Correct = 0;

//----Need to make a copy in case the same variable is used
//----Set to empty if nothing given, to cause use of mktemp
    if (UsersOutputFileName == NULL) {
        strcpy(CopyUsersOutputFileName,"");
    } else {
        strcpy(CopyUsersOutputFileName,UsersOutputFileName);
    }
    if (Correct == 0) {
        if (SystemOnTPTPGetResult(0,ProblemFileName,PositiveChecker,TimeLimit,
"",SystemOutputPrefix,OptionalFlags,KeepOutputFiles,FilesDirectory,
CopyUsersOutputFileName,OutputFileName,SystemResult,NULL)) {
            if (!strcmp(SystemResult,PositiveResult)) {
                Correct = 1;
//----Should not trust prover's disproofs
//            } else if (!strcmp(SystemResult,NegativeResult)) {
//                Correct = -1;
            }
        }
    }

//----Check if really not provable
    if (Correct == 0 && TestNegative) {
        PathBasename(OutputFileName,CopyUsersOutputFileName,NULL);
        strcat(CopyUsersOutputFileName,"_not");
        if (SystemOnTPTPGetResult(0,ProblemFileName,NegativeChecker,TimeLimit,
"",SystemOutputPrefix,OptionalFlags,KeepOutputFiles,FilesDirectory,
CopyUsersOutputFileName,OutputFileName,SystemResult,NULL)) {
            if (!strcmp(SystemResult,NegativeResult)) {
                Correct = -1;
//----Should not trust disprover's proofs
//            } else if (!strcmp(SystemResult,PositiveResult)) {
//                Correct = 1;
            }
        }
    }

    if (!KeepOutputFiles) {
        RemoveFile(ProblemFileName);
    }

    return(Correct);
}
//-----------------------------------------------------------------------------
SZSResultType SZSSystemOnTPTP(LISTNODE Axioms,ANNOTATEDFORMULA Conjecture,
char * System,SZSResultType DesiredResult,int QuietnessLevel,int TimeLimit,
char * X2TSTPFlag,char * SystemOutputPrefix,char * OptionalFlags,
int KeepOutputFiles,char * FilesDirectory,char * UsersOutputFileName,
String OutputFileName,SZSOutputType * SZSOutput) {

    StatusType ConjectureRole;
    String ProblemFileName;
    String CopyUsersOutputFileName;
    String SystemResult;
    String SystemOutput;
    SZSResultType SZSResult;
    int NegatedConjecture;

    SZSResult = NOS;
    if (SZSOutput != NULL) {
        *SZSOutput = Non;
    }

//----Negate conjecture to prove CTH. This is likely broken for full SZS
//----compliance, but'll do for now.
    NegatedConjecture = 0;
    if (Conjecture != NULL && SZSIsA(DesiredResult,CTH) && 
!SZSIsA(DesiredResult,THM)) {
        if (!Negate(Conjecture,1)) {
            CodingError("Trying to negate for CTH");
        }
        NegatedConjecture = 1;
        DesiredResult = THM;
    }

//----For SAT with a conjecture, the role must be axiom
    ConjectureRole = conjecture;
    if (Conjecture != NULL && SZSIsA(DesiredResult,SAT)) {
        ConjectureRole = axiom;
    }

//----Make the problem file
    if (!MakeProblemFile(FilesDirectory,UsersOutputFileName,".p",
ProblemFileName,Axioms,axiom,Conjecture,ConjectureRole)) {
        SZSResult = ERR;
    }

    if (SZSResult == NOS) {
//----Need to make a copy in case the same variable is used
//----Set to empty if nothing given, to cause use of mktemp
        if (UsersOutputFileName == NULL) {
            strcpy(CopyUsersOutputFileName,"");
        } else {
            strcpy(CopyUsersOutputFileName,UsersOutputFileName);
        }
        if (SystemOnTPTPGetResult(QuietnessLevel,ProblemFileName,System,
TimeLimit,X2TSTPFlag,SystemOutputPrefix,OptionalFlags,KeepOutputFiles,
FilesDirectory,CopyUsersOutputFileName,OutputFileName,SystemResult,
SystemOutput)) {
            SZSResult = StringToSZSResult(SystemResult);
//----Promote to desired result if it is one
            if (SZSIsA(SZSResult,DesiredResult)) {
                SZSResult = DesiredResult;
            } 
            if (SZSOutput != NULL) {
                *SZSOutput = StringToSZSOutput(SystemOutput);
            }
        } else {
            SZSResult = ERR;
        }
    }

    if (NegatedConjecture) {
        if (!Negate(Conjecture,1)) {
            CodingError("Trying to denegate for CTH");
        }
        if (SZSResult == THM) {
            SZSResult = CTH;
        }
    }

    RemoveFile(ProblemFileName);

    if (SZSOutput != NULL) {
        *SZSOutput = StringToSZSOutput(SystemOutput);
    }
    return(SZSResult);
}
//-----------------------------------------------------------------------------
SZSResultType SZSSystemOnTPTPWithAlternate(LISTNODE Axioms,
ANNOTATEDFORMULA Conjecture,char * System,SZSResultType DesiredResult,
int QuietnessLevel,char * OptionalFlags,int TimeLimit,char * X2TSTPFlag,
int SystemTrustedForAlternate,char * AlternateSystem,
SZSResultType AlternateDesiredResult, int AlternateTimeLimit,
char * SystemOutputPrefix,int KeepOutputFiles,char * FilesDirectory,
char * UsersOutputFileName,String OutputFileName,SZSOutputType * SZSOutput) {

    SZSResultType SZSResult;

    SZSResult = SZSSystemOnTPTP(Axioms,Conjecture,System,DesiredResult,
QuietnessLevel,TimeLimit,X2TSTPFlag,SystemOutputPrefix,OptionalFlags,
KeepOutputFiles,FilesDirectory,UsersOutputFileName,OutputFileName,SZSOutput);

//----Check if really not provable
    if (SZSResult != DesiredResult && (SystemTrustedForAlternate ||
AlternateSystem != NULL)) {
//----Check if the positive system is trusted
        if (SystemTrustedForAlternate && SZSIsA(SZSResult,
AlternateDesiredResult)) {
            SZSResult = AlternateDesiredResult;
        } 
        if (SZSResult != AlternateDesiredResult && AlternateSystem != NULL) {
            strcat(OutputFileName,"_not");
            SZSResult = SZSSystemOnTPTP(Axioms,Conjecture,AlternateSystem,
AlternateDesiredResult,QuietnessLevel,AlternateTimeLimit,X2TSTPFlag,
SystemOutputPrefix,OptionalFlags,KeepOutputFiles,FilesDirectory,OutputFileName,
OutputFileName,SZSOutput);
        }
    }

    return(SZSResult);
}
//-----------------------------------------------------------------------------
LISTNODE ApplyExternalProgram(LISTNODE Head,StatusType AsStatus,
ANNOTATEDFORMULA Conjecture,const char * ExecuteFormatString,
SIGNATURE Signature) {

    String ProblemFileName;
    String ExecuteCommand;
    FILE * ProcessHandle;
    LISTNODE AppliedHead;
    String ErrorMessage;

    if(!MakeProblemFile("/tmp",NULL,NULL,ProblemFileName,Head,AsStatus,
Conjecture,conjecture)) {
        return(NULL);
    }
    if (sprintf(ExecuteCommand,ExecuteFormatString,ProblemFileName) == -1) {
        RemoveFile(ProblemFileName);
        sprintf(ErrorMessage,"Cannot make command from %s",ExecuteFormatString);
        CodingError(ErrorMessage);
    }
    if ((ProcessHandle = popen(ExecuteCommand,"r")) == NULL) {
        perror(ExecuteCommand);
        sprintf(ErrorMessage,"Cannot execute %s",ExecuteCommand);
        ReportError("OSError",ErrorMessage,0);
        RemoveFile(ProblemFileName);
        return(NULL);
    }
    AppliedHead = ParseFILEOfFormulae(ProcessHandle,Signature,1,NULL);
    pclose(ProcessHandle);
    RemoveFile(ProblemFileName);
    return(AppliedHead);
}
//-----------------------------------------------------------------------------
