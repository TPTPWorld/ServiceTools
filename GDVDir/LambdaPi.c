//-------------------------------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdarg.h>

#include "DataTypes.h"
#include "Utilities.h"
#include "FileUtilities.h"
#include "List.h"
#include "Signature.h"
#include "Tokenizer.h"
#include "Parsing.h"
#include "Examine.h"
#include "Modify.h"
#include "PrintLP.h"

#include "GDV.h"
#include "LambdaPi.h"
//-------------------------------------------------------------------------------------------------
int WriteLPPackageFile(OptionsType OptionValues) {

    String FileName;
    FILE * Handle;

    strcpy(FileName,OptionValues.KeepFilesDirectory);
    strcat(FileName,"/");
    strcat(FileName,LP_PACKAGE_FILENAME);
    if ((Handle = OpenFileInMode(FileName,"w")) == NULL) {
        QPRINTF(OptionValues,2)("FAILURE: Could not open LP signature file\n");
        return(0);
    }
    fprintf(Handle,"package_name = %s\n",OptionValues.LambdaPiDirectory);
    fprintf(Handle,"root_path = %s\n",OptionValues.LambdaPiDirectory);
    fclose(Handle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
int WriteLPSignatureFile(OptionsType OptionValues,SIGNATURE Signature) {

    String FileName;
    FILE * Handle;

    strcpy(FileName,OptionValues.KeepFilesDirectory);
    strcat(FileName,"/");
    strcat(FileName,LP_SIGNATURE_FILENAME);
    if ((Handle = OpenFileInMode(FileName,"w")) == NULL) {
        QPRINTF(OptionValues,2)("FAILURE: Could not open LP signature file\n");
        return(0);
    }
    fprintf(Handle,"require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;\n");
    fprintf(Handle,"require open Logic.Zenon.zen;\n");
    LPPrintSignatureList(Handle,Signature->Functions,"κ");
    LPPrintSignatureList(Handle,Signature->Predicates,"Prop");
    fclose(Handle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
int InitializeLPProofFile(OptionsType * OptionValues) {

    String FileName;

//----The LambdaPiDirectory here has to start from the directory holding this example. 
//----I'll assume it's one up from the specified Directory
    strcpy(OptionValues->LambdaPiDirectory,OptionValues->KeepFilesDirectory);
    *strrchr(OptionValues->LambdaPiDirectory,'/') = '.';
    strcpy(OptionValues->LambdaPiDirectory,strrchr(OptionValues->LambdaPiDirectory,'/')+1);

    strcpy(FileName,OptionValues->KeepFilesDirectory);
    strcat(FileName,"/");
    strcat(FileName,LP_PROOF_FILENAME);
    if ((OptionValues->LambdaPiProofHandle = OpenFileInMode(FileName,"w")) == NULL) {
        QPRINTF((*OptionValues),2)("FAILURE: Could not open LP proof file\n");
        return(0);
    }
    strcpy(FileName,LP_SIGNATURE_FILENAME);
    *strstr(FileName,".lp") = '\0';
    fprintf(OptionValues->LambdaPiProofHandle,
"require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND ;\n");
    fprintf(OptionValues->LambdaPiProofHandle,"require open Logic.Zenon.zen ;\n");
    fprintf(OptionValues->LambdaPiProofHandle,"require open %s.%s ;\n",
OptionValues->LambdaPiDirectory,FileName);
    fflush(OptionValues->LambdaPiProofHandle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
int WriteLPProblemFormulae(OptionsType OptionValues) {

    LISTNODE ProblemHead,Types;
    SIGNATURE Signature;

    Signature = NewSignature();
    if ((ProblemHead = ParseFileOfFormulae(OptionValues.ProblemFileName,NULL,Signature,1,
NULL)) == NULL) {
        QPRINTF(OptionValues,2)("FAILURE: Could not read problem file\n");
        return(0);
    }
//----Convert CNF problem into FOF for semantic checking
    FOFifyList(ProblemHead,universal);
//----Remove non-logical formulae
    Types = GetListOfAnnotatedFormulaeWithRole(ProblemHead,type,Signature);
    FreeListOfAnnotatedFormulae(&Types,Signature);

    PrintListOfAnnotatedTSTPNodes(OptionValues.LambdaPiProofHandle,Signature,ProblemHead,
lambdapi,1);
    FreeListOfAnnotatedFormulae(&ProblemHead,Signature);
    FreeSignature(&Signature);

    fflush(OptionValues.LambdaPiProofHandle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
