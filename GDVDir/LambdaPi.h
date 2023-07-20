//-------------------------------------------------------------------------------------------------
int WriteLPPackageFile(OptionsType OptionValues);
int WriteLPProofFile(OptionsType OptionValues,LISTNODE Head,LISTNODE ProblemHead,
SIGNATURE Signature,ANNOTATEDFORMULA * RootAnnotatedFormula);
int WriteLPSignatureFile(OptionsType OptionValues,LISTNODE Head,LISTNODE ProblemHead,
ANNOTATEDFORMULA RootAnnotatedFormula,SIGNATURE Signature);

#define LP_PACKAGE_FILENAME "lambdapi.pkg"
#define LP_SIGNATURE_FILENAME "Signature.lp"
#define LP_PROOF_FILENAME "Proof.lp"
//-------------------------------------------------------------------------------------------------
