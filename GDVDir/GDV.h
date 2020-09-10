//-----------------------------------------------------------------------------
#define MAX_PARENTS 64
//-----------------------------------------------------------------------------
typedef struct {
    int AutoMode;
    int ForceContinue;
    int Quietness;
    int VerifyLeaves;
    int VerifyUserSemantics;
    int VerifyDAGInferences;
    int NoExpensiveChecks;
    int GenerateDefinitions;
    int DerivationExtract;
    String ProblemFileName;
    int CheckParentRelevance;
    int CheckRefutation;
    String THFTheoremProver;
    String THFModelFinder;
    String THFUnsatisfiabilityChecker;
    String THFCounterSatisfiableProver;
    String TFFTheoremProver;
    String TFFModelFinder;
    String TFFUnsatisfiabilityChecker;
    String TFFCounterSatisfiableProver;
    String TheoremProver;
    String ModelFinder;
    String Saturator;
    String UnsatisfiabilityChecker;
    String CounterSatisfiableProver;
    int TimeLimit;
    int KeepFiles;
    String KeepFilesDirectory;
    String DerivationFileName;
} OptionsType;

typedef ANNOTATEDFORMULA ANNOTATEDFORMULAArray[MAX_PARENTS];
//-----------------------------------------------------------------------------
#define QPRINTF(Q,P) if ((P) >= (Q.Quietness)) printf
#define QDO(Q,P,D) if ((P) >= (Q.Quietness)) D
//-----------------------------------------------------------------------------
#define OTTER "Otter---"
#define PARADOX "Paradox---"
#define SPASS "SPASS---"
#define SNARK "SNARK---"
#define CVC4_MODELFINDER "CVC4---TFN-1.5.1"
#define ISABELLE "Isabelle---2016"
#define NITPICK "Nitpick---2016"
#define SATALLAX "Satallax---"

#define DEFAULT_THF_THEOREM_PROVER ISABELLE
#define DEFAULT_THF_MODEL_FINDER NITPICK
#define DEFAULT_THF_UNSATISFIABILITY_CHECKER ISABELLE
#define DEFAULT_THF_COUNTERSATISFIABLE_PROVER NITPICK
#define DEFAULT_TFF_THEOREM_PROVER SNARK
#define DEFAULT_TFF_MODEL_FINDER CVC4_MODELFINDER
#define DEFAULT_TFF_UNSATISFIABILITY_CHECKER SNARK
#define DEFAULT_TFF_COUNTERSATISFIABLE_PROVER CVC4_MODELFINDER
#define DEFAULT_THEOREM_PROVER OTTER
#define DEFAULT_MODEL_FINDER PARADOX
#define DEFAULT_SATURATOR SPASS
#define DEFAULT_UNSATISFIABILITY_CHECKER OTTER
#define DEFAULT_COUNTERSATISFIABLE_PROVER PARADOX
#define DEFAULT_TIME_LIMIT 30

#define DEFAULT_KEEP_FILES_DIRECTORY "/tmp"
//-----------------------------------------------------------------------------
int GlobalInterrupted;
//-----------------------------------------------------------------------------
