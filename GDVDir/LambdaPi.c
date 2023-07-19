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
#include "Tree.h"
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
int WriteLPProofFile(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature,
ANNOTATEDFORMULA * RootAnnotatedFormula) {

    String FileName;
    FILE * Handle;
    ROOTLIST RootListHead;

    strcpy(FileName,OptionValues.KeepFilesDirectory);
    strcat(FileName,"/");
    strcat(FileName,LP_PROOF_FILENAME);
    if ((Handle = OpenFileInMode(FileName,"w")) == NULL) {
        QPRINTF((OptionValues),2)("FAILURE: Could not open LP proof file\n");
        return(0);
    }
    strcpy(FileName,LP_SIGNATURE_FILENAME);
    *strstr(FileName,".lp") = '\0';
    fprintf(Handle,
"require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen ;\n");
    fprintf(Handle,"require %s.%s ;\n",OptionValues.LambdaPiDirectory,FileName);
    RootListHead = BuildRootList(Head,Signature);
    fprintf(Handle,"\nrule %s.conjecture_0000 ↪ %s.%s ;\n",FileName,FileName,
GetName(RootListHead->TheTree->AnnotatedFormula,NULL));
    *RootAnnotatedFormula = RootListHead->TheTree->AnnotatedFormula;
    FreeRootList(&RootListHead,1,Signature);
    fflush(Handle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
void WriteLPFormulaeWithRole(FILE * Handle,LISTNODE Head,StatusType Role,SIGNATURE Signature) {

    LISTNODE RoleList;

    RoleList = GetListOfAnnotatedFormulaeWithRole(Head,Role,Signature);
    PrintListOfAnnotatedTSTPNodes(Handle,Signature,RoleList,lambdapi,1);
    FreeListOfAnnotatedFormulae(&RoleList,Signature);
}
//-------------------------------------------------------------------------------------------------
int WriteLPSignatureFile(OptionsType OptionValues,LISTNODE Head,LISTNODE ProblemHead,
ANNOTATEDFORMULA RootAnnotatedFormula,SIGNATURE Signature) {

    String FileName;
    FILE * Handle;
    LISTNODE TypeFormulae,MoreTypeFormulae;

    strcpy(FileName,OptionValues.KeepFilesDirectory);
    strcat(FileName,"/");
    strcat(FileName,LP_SIGNATURE_FILENAME);
    if ((Handle = OpenFileInMode(FileName,"w")) == NULL) {
        QPRINTF(OptionValues,2)("FAILURE: Could not open LP signature file\n");
        return(0);
    }
    fprintf(Handle,"require open Logic.Zenon.FOL ;\n");
    fprintf(Handle,"\n//----Symbol signatures\n");
    if (Signature->Types == NULL) {
        TypeFormulae = NULL;
    } else {
        TypeFormulae = GetListOfAnnotatedFormulaeWithRole(ProblemHead,type,Signature);
        MoreTypeFormulae = GetListOfAnnotatedFormulaeWithRole(Head,type,Signature);
        TypeFormulae = AppendListsOfAnnotatedTSTPNodes(TypeFormulae,MoreTypeFormulae);
    }
    LPPrintSignatureList(Handle,Signature->Types,TypeFormulae,"SET??");
    LPPrintSignatureList(Handle,Signature->Functions,TypeFormulae,"κ");
    LPPrintSignatureList(Handle,Signature->Predicates,TypeFormulae,"Prop");
    FreeListOfAnnotatedFormulae(&TypeFormulae,Signature);
    fprintf(Handle,"\n//----The problem formulae\n");
    if (ProblemHead != NULL) {
        WriteLPFormulaeWithRole(Handle,ProblemHead,axiom_like,Signature);
        WriteLPFormulaeWithRole(Handle,ProblemHead,negated_conjecture,Signature);
        WriteLPFormulaeWithRole(Handle,ProblemHead,conjecture,Signature);
    }
    fprintf(Handle,"symbol conjecture_0000 : ϵ ");
    LPPrintFormula(Handle,RootAnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.
FormulaWithVariables->Formula);
    fprintf(Handle," ;\n");
//----Print all the derivation formulae
    fprintf(Handle,"\n//----Derivation formulae\n");
    PrintListOfAnnotatedTSTPNodes(Handle,Signature,Head,lambdapi,1);
    fclose(Handle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
