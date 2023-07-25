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
#include "Interpret.h"
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
int WriteLPProofFile(OptionsType OptionValues,LISTNODE Head,LISTNODE ProblemHead,
ANNOTATEDFORMULA DerivationRoot,ANNOTATEDFORMULA ProvedAnnotatedFormula,SIGNATURE Signature) {

    String FileName;
    FILE * Handle;
    LISTNODE ProblemConjectures;

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
    fprintf(Handle,"require %s.%s as %s;\n",OptionValues.LambdaPiDirectory,FileName,FileName);
//----See if a real conjecture to use instead of derivation root
    if (ProvedAnnotatedFormula != NULL) {
        fprintf(Handle,"require %s.%s_thm ;\n",OptionValues.LambdaPiDirectory,
GetName(DerivationRoot,NULL));
//----Print the final rule
        fprintf(Handle,"\n//----Conjecture rule\n");
        if (FalseAnnotatedFormula(DerivationRoot)) {
            fprintf(Handle,"rule %s ↪ nnpp %s \n",GetName(ProvedAnnotatedFormula,NULL),
GetName(DerivationRoot,NULL));
        } else {
            fprintf(Handle,"\nrule %s.%s ↪ %s.%s ;\n",FileName,
GetName(ProvedAnnotatedFormula,NULL),FileName,GetName(DerivationRoot,NULL));
        }
        FreeListOfAnnotatedFormulae(&ProblemConjectures,Signature);
    } else {
//----Case without conjecture
        fprintf(Handle,"require %s.%s_thm ;\n",OptionValues.LambdaPiDirectory,
GetName(DerivationRoot,NULL));
        fprintf(Handle,"\nrule %s.conjecture_0000 ↪ %s.%s ;\n",FileName,FileName,
GetName(DerivationRoot,NULL));
    }
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
ANNOTATEDFORMULA DerivationRoot,ANNOTATEDFORMULA ProvedAnnotatedFormula,SIGNATURE Signature) {

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

//----Print the signatures
    fprintf(Handle,"\n//----Symbol signatures\n");
//----Get all TFF type formulae
    if (Signature->Types == NULL) {
        TypeFormulae = NULL;
    } else {
        TypeFormulae = GetListOfAnnotatedFormulaeWithRole(ProblemHead,type,Signature);
        MoreTypeFormulae = GetListOfAnnotatedFormulaeWithRole(Head,type,Signature);
        TypeFormulae = AppendListsOfAnnotatedTSTPNodes(TypeFormulae,MoreTypeFormulae);
    }
    LPPrintSignatureList(Handle,Signature->Types,TypeFormulae,"TYPE");
    LPPrintSignatureList(Handle,Signature->Functions,TypeFormulae,"κ");
    LPPrintSignatureList(Handle,Signature->Predicates,TypeFormulae,"Prop");
    FreeListOfAnnotatedFormulae(&TypeFormulae,Signature);

//----Print the problem formulae
    fprintf(Handle,"\n//----The problem formulae\n");
    if (ProblemHead != NULL) {
        WriteLPFormulaeWithRole(Handle,ProblemHead,axiom_like,Signature);
        WriteLPFormulaeWithRole(Handle,ProblemHead,negated_conjecture,Signature);
        WriteLPFormulaeWithRole(Handle,ProblemHead,conjecture,Signature);
    }
    if (FalseAnnotatedFormula(DerivationRoot)) {
        if (ProvedAnnotatedFormula != NULL) {
            fprintf(Handle,"symbol Prf problem_conjecture_nnpp ≔ Prf (¬ ");
            LPPrintFormula(Handle,
ProvedAnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula);
            fprintf(Handle,") → Prf problem_conjecture_nnpp ;\n");
        } else {
            fprintf(Handle,"symbol conjecture_0000 : ϵ (⊥) ;\n");
        }
    }

//----Print all the derivation formulae
    fprintf(Handle,"\n//----Derivation formulae\n");
    PrintListOfAnnotatedTSTPNodes(Handle,Signature,Head,lambdapi,1);

    fclose(Handle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
