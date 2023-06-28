//-----------------------------------------------------------------------------
int WriteLPPackageFile(OptionsType OptionValues);
int WriteLPSignatureFile(OptionsType OptionValues,SIGNATURE Signature);
int InitializeLPProofFile(OptionsType * OptionValues);
int WriteLPProblemFormulae(OptionsType OptionValues);

#define LP_PACKAGE_FILENAME "lambdapi.pkg"
#define LP_SIGNATURE_FILENAME "Signature.lp"
#define LP_PROOF_FILENAME "Proof.lp"
//-----------------------------------------------------------------------------
