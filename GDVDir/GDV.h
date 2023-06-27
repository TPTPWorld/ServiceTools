//-----------------------------------------------------------------------------
#define MAX_PARENTS 64
//-----------------------------------------------------------------------------
typedef struct {
//----Options for processing
    int Quietness;
    int AutoMode;
    int ForceContinue;
    int NoExpensiveChecks;
    int TimeLimit;
    int KeepFiles;
    String KeepFilesDirectory;
//----What to do
    String DerivationFileName;
    String ProblemFileName;
    int VerifyLeaves;        //----Verify leaves can be derived from input
    int VerifyUserSemantics; //----Check if the leaf axioms are satisfiable
    int VerifyDAGInferences; //----System-specific rules, e.g., E's apply_def, splitting, and
                             //----then the standard inference checking
    int GenerateObligations; //----Only (and always) generate obligations, don't call ATP
    int GenerateDefinitions; //----Something special for E's psuedo splitting
    int GenerateLambdaPiFiles; //----To product LambdaPi signature and proof structure
    String LambdaPiDirectory;  //----The project directory for LambdaPi stuff
    FILE * LambdaPiProofHandle;  //----To carry around the file handle if generating proof header
    int DerivationExtract;   //----Not a full derivation, so parents can be missing
    int CheckParentRelevance;
    int CheckRefutation;
//----ATP systems
    String TheoremProver;
    String CounterSatisfiableProver;
    String ModelFinder;
    String UnsatisfiabilityChecker;
    String Saturator;
    String TFFTheoremProver;
    String TFFCounterSatisfiableProver;
    String TFFModelFinder;
    String TFFUnsatisfiabilityChecker;
    String THFTheoremProver;
    String THFModelFinder;
    String THFUnsatisfiabilityChecker;
    String THFCounterSatisfiableProver;
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
#define E "E---2.6"
#define CVC5_MODELFINDER "cvc5---SAT-1.0"
#define ISABELLE "Isabelle---2016"
#define NITPICK "Nitpick---2016"
#define SATALLAX "Satallax---"

#define DEFAULT_THF_THEOREM_PROVER ISABELLE
#define DEFAULT_THF_MODEL_FINDER NITPICK
#define DEFAULT_THF_UNSATISFIABILITY_CHECKER ISABELLE
#define DEFAULT_THF_COUNTERSATISFIABLE_PROVER NITPICK
#define DEFAULT_TFF_THEOREM_PROVER E
#define DEFAULT_TFF_MODEL_FINDER CVC5_MODELFINDER
#define DEFAULT_TFF_UNSATISFIABILITY_CHECKER E
#define DEFAULT_TFF_COUNTERSATISFIABLE_PROVER CVC5_MODELFINDER
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
