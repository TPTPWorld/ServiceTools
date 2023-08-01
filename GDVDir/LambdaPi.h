//-------------------------------------------------------------------------------------------------
int GetNNPPTag(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature);
int WriteLPPackageFile(OptionsType OptionValues);
int WriteLPProofFile(OptionsType OptionValues,LISTNODE Head,LISTNODE ProblemHead,
ANNOTATEDFORMULA RootAnnotatedFormula,ANNOTATEDFORMULA ProvedAnnotatedFormula,SIGNATURE Signature);
int WriteLPSignatureFile(OptionsType OptionValues,LISTNODE Head,LISTNODE ProblemHead,
ANNOTATEDFORMULA RootAnnotatedFormula,ANNOTATEDFORMULA ProvedAnnotatedFormula,SIGNATURE Signature);

#define LP_PACKAGE_FILENAME "lambdapi.pkg"
#define LP_SIGNATURE_FILENAME "Signature.lp"
#define LP_PROOF_FILENAME "Proof.lp"

String NNPPTag;
//-------------------------------------------------------------------------------------------------
