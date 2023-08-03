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
int GetNNPPTag(OptionsType OptionValues,LISTNODE Head,SIGNATURE Signature) {

    extern String NNPPTag;
    char * AllParentNames;
    StringParts ParentNames;
    int NumberOfParents;
    LISTNODE ParentAnnotatedFormulae;
    LISTNODE Target;

//----If in the LambdaPi world, find the negated conjecture
    Target = Head;
    strcpy(NNPPTag,"");
    while (Target != NULL && !strcmp(NNPPTag,"")) {
        if (GetRole(Target->AnnotatedFormula,NULL) == negated_conjecture) {
//----This is all copied from DerivedVerification, but I have to get the negated conjecture name 
//----in advance for the LambdaPi stuff
            AllParentNames = GetNodeParentNames(Target->AnnotatedFormula,NULL);
            NumberOfParents = Tokenize(AllParentNames,ParentNames,"\n");
            NumberOfParents = UniquifyStringParts(ParentNames);
            GetNodesForNames(Head,ParentNames,NumberOfParents,&ParentAnnotatedFormulae,Signature);
            if (ParentAnnotatedFormulae != NULL && ParentAnnotatedFormulae->Next == NULL &&
GetRole(ParentAnnotatedFormulae->AnnotatedFormula,NULL) == conjecture) {
                sprintf(NNPPTag,"nnpp(%s)",GetName(Target->AnnotatedFormula,NULL));
            }
        }
        Target = Target->Next;
    }
//----Free the parents list
    Free((void **)&AllParentNames);
    FreeListOfAnnotatedFormulae(&ParentAnnotatedFormulae,Signature);
    return(1);
}
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
    fprintf(Handle,"require open %s.%s ;\n",OptionValues.LambdaPiDirectory,FileName);
//----See if a real conjecture to use instead of derivation root
    if (ProvedAnnotatedFormula != NULL) {
        fprintf(Handle,"require %s.%s_thm ;\n",OptionValues.LambdaPiDirectory,
GetName(DerivationRoot,NULL));
//----Print the final rule
        fprintf(Handle,"\n//----Conjecture rule\n");
        if (FalseAnnotatedFormula(DerivationRoot)) {
            fprintf(Handle,"rule %s ↪ nnpp ",GetName(ProvedAnnotatedFormula,NULL));
            LPPrintFormula(Handle,
ProvedAnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula);
            fprintf(Handle," %s ;\n",GetName(DerivationRoot,NULL));
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
    LISTNODE TypeFormulae,MoreTypeFormulae,NegatedConjectures,OneNegatedConjecture;
    String NegatedNegatedConjectureName,NegatedConjectureName,SZSStatus;

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

//----Print all the derivation formulae
    fprintf(Handle,"\n//----Derivation formulae\n");
    if (FalseAnnotatedFormula(DerivationRoot)) {
        if (ProvedAnnotatedFormula != NULL) {
            fprintf(Handle,"symbol ϵ problem_conjecture_nnpp ≔ ϵ (¬ ");
            LPPrintFormula(Handle,
ProvedAnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula);
            fprintf(Handle,") → ϵ problem_conjecture_nnpp ;\n");
//----Need negated negated conjecture in signature
            if ((NegatedConjectures = GetListOfAnnotatedFormulaeWithRole(Head,negated_conjecture,
Signature)) != NULL) {
                OneNegatedConjecture = NegatedConjectures;
                while (OneNegatedConjecture != NULL && StringToSZSResult(GetInferenceStatus(
OneNegatedConjecture->AnnotatedFormula,SZSStatus)) != CTH) {
                    OneNegatedConjecture = OneNegatedConjecture->Next;
                }
                if (OneNegatedConjecture != NULL) {
                    Negate(OneNegatedConjecture->AnnotatedFormula,0);
                    GetName(OneNegatedConjecture->AnnotatedFormula,NegatedConjectureName);
                    strcpy(NegatedNegatedConjectureName,NegatedConjectureName);
                    strcat(NegatedNegatedConjectureName,"_neg");
                    SetName(OneNegatedConjecture->AnnotatedFormula,NegatedNegatedConjectureName);
                    fprintf(Handle,"symbol %s : ϵ (",NegatedNegatedConjectureName);
                    LPPrintFormula(Handle,OneNegatedConjecture->AnnotatedFormula->
AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula);
                    fprintf(Handle,") ;\n");
                    Negate(NegatedConjectures->AnnotatedFormula,1);
                    SetName(NegatedConjectures->AnnotatedFormula,NegatedConjectureName);
                }
                FreeListOfAnnotatedFormulae(&NegatedConjectures,Signature);
            }
        } else {
            fprintf(Handle,"symbol conjecture_0000 : ϵ (⊥) ;\n");
        }
    }
    PrintListOfAnnotatedTSTPNodes(Handle,Signature,Head,lambdapi,1);

    fclose(Handle);
    return(1);
}
//-------------------------------------------------------------------------------------------------
