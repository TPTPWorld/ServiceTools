#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "DataTypes.h"
#include "Utilities.h"
#include "Parsing.h"
#include "List.h"
#include "Tree.h"
#include "Tokenizer.h"
#include "ParseTPTP.h"
#include "Signature.h"
#include "PrintTSTP.h"
#include "Examine.h"
#include "ListStatistics.h"
#include "Modify.h"
#include "Interpret.h"
#include "ParseTSTP.h"
#include "Statistics.h"
#include "TreeStatistics.h"

typedef struct formula{
    char *formula_Name;
    int parentNum;
    char * parent_Names[30];
    struct formula *next;
} FormulaInfo;

/* Usage: YuTV filename output_filename flags[-l|-e|-g|-m]*/
/* -g generate gif file*/
/* -m generate client-side map file*/

/* check FalseAnnotatedFormula, JJParser and makefile */
//-----------------------------------------------------------------------------
void RunDOT(char *TSTPFile,char *OutputFile,char Flag[],int FlagNumber) {

    FILE *FileHandle;
    int NumberOfParents;
    int ParentNumber;
    int EqualityEdge;
    char *GraphName;
    char *CurrentName[100];
    String ParentNames;
    String FormulaName;
    LISTNODE ListHead;
    LISTNODE ListNode;
    SIGNATURE Signature;
    ANNOTATEDFORMULA CurrentFormula;
    char * SplitPart;
    char * EdgeColor;
    char * EdgeArrow;
    String UsefulInfo;
    StatusType Status,SubStatus;
    int Flag_l=0;
    int Flag_e=0;
    int Flag_g=0;
    int Flag_m=0;
    char Command[100];
    char * NodeShape;
    char * NodeColor;
    char * NodeURL;
    int Index;

    for (Index = 0; Index < FlagNumber; Index++) {
        switch (Flag[Index]) {
            case 'g': 
                Flag_g = 1;
                break;
            case 'm': 
                Flag_m = 1;
                break;
            case 'l': Flag_l = 1;
                      break;
            case 'e': Flag_e = 1;
                      break;
        }
    }
    if(Flag_m) strcpy(Command,"dot -Tcmap ");
    else if(Flag_g) strcpy(Command,"dot -Tgif ");
    else strcpy(Command,"dot -Tdot ");
    if (strcmp(OutputFile,"--")) {
        strcat(Command,"-o ");
        strcat(Command,OutputFile);
    }
//DEBUG  printf("%s\n",Command);
    if ((FileHandle = popen(Command,"w")) == NULL) {
        perror("Starting DOT");
        exit(EXIT_FAILURE);
    }

    Signature = NewSignature();
    SetNeedForNonLogicTokens(0);
    SetAllowFreeVariables(1);
    ListHead = ParseFileOfFormulae(TSTPFile,NULL,Signature,1,NULL);
    GraphName = strtok(TSTPFile,".");
    fprintf(FileHandle,"graph \"%s\" { \n",GraphName);

//----For each node of the derivation
    for (ListNode = ListHead; ListNode != NULL; ListNode = ListNode->Next) {
        CurrentFormula = ListNode->AnnotatedFormula;
//DEBUG printf("-------- Looking at a node---------\n");
//DEBUG PrintAnnotatedTSTPNode(stdout,ListNode->AnnotatedFormula,tptp,1);
        GetName(CurrentFormula,FormulaName);
        Status = GetRole(CurrentFormula,&SubStatus);
        GetParentNames(CurrentFormula,ParentNames);
//DEBUG printf("The parents are %s\n",ParentNames);
        NumberOfParents = 0;
        EqualityEdge = 0;
        CurrentName[NumberOfParents] = strtok(ParentNames,"\n");
        while (CurrentName[NumberOfParents] != NULL) {
            ParentNumber = 0;
//----Check for duplicate parent
            while (ParentNumber < NumberOfParents && 
strcmp(CurrentName[ParentNumber],CurrentName[NumberOfParents])) {
                ParentNumber++;
            }
            if (ParentNumber == NumberOfParents) {
//----Check if equality theory node is needed
                if (strstr(CurrentName[NumberOfParents],"theory(") == 
CurrentName[NumberOfParents]) {
                    if (Flag_e) {
                        EqualityEdge = 1;
                    } else {
                        NumberOfParents++;
                    }
                } else {
                    NumberOfParents++;
                }
            }
            CurrentName[NumberOfParents] = strtok(NULL,"\n");
        }

//----Print edges for each parent
        for (ParentNumber = 0; ParentNumber < NumberOfParents; ParentNumber++) {
//----Extract split information
            if (GetInferenceInfoTerm(CurrentFormula,"split",UsefulInfo) != 
NULL) {
//DEBUG printf(" Useful info is %s \n",UsefulInfo);
                SplitPart = strtok(UsefulInfo,"(");
                SplitPart = strtok(NULL,"(");
                SplitPart = strtok(NULL,"(");
                SplitPart = strtok(SplitPart,")");
//----Set the node label
                if (Flag_l) {
                    fprintf(FileHandle," \"%s\" [label=\"%s\\n%s\"];",
FormulaName,FormulaName,SplitPart);
                }
//----Draw the split edge
                if (strstr(SplitPart,"a")) {
                    EdgeColor = "red";
                } else {
                    EdgeColor = "blue";
                }
            } else {
                EdgeColor = "black";
            }
            if (EqualityEdge) {
                EqualityEdge = 0;
                EdgeArrow ="dot";
            } else {
                EdgeArrow = "none";
            }
            fprintf(FileHandle," \"%s\" -- \"%s\" [color=%s,arrowhead=%s];\n",
CurrentName[ParentNumber],FormulaName,EdgeColor,EdgeArrow);
        }

//----Choose the node shape
        NodeShape = "ellipse";
//----Make false clause in square node
        if (FalseAnnotatedFormula(CurrentFormula)){
            NodeShape = "box";
        } 
        else {
            switch (Status){
                case axiom:
                case initial:
                    NodeShape = "invtriangle";
                    break;
                case conjecture:
                    NodeShape = "house";
                    break;
                case negated_conjecture:
                    NodeShape = "invhouse";
                    break;
                case definition:
                    NodeShape = "invtrapezium";
                    break;
                case hypothesis:
                    NodeShape = "invtrapezium";
                    break;
                case lemma:
                    NodeShape = "hexagon";
                    break;
                case theorem:
                    NodeShape = "house";
                    break;
                case derived:
                    NodeShape = "ellipse";
                    break;
               default: 
                    break;
            }
        }
//----Set node style according to FOF or CNF
        if (GetSyntax(CurrentFormula) == tptp_fof) {
            NodeColor = "black";
        } else {
            NodeColor = "darkorange";
        }
//----Add URL attribute if the output is a map file
        if(Flag_m) {
            NodeURL="NoURL";
            fprintf(FileHandle,"%s [URL=%s];\n",FormulaName,NodeURL);
        } else {
            fprintf(FileHandle,"%s [color=%s, shape=%s];\n",FormulaName,
NodeColor,NodeShape);
        }
    }

    fprintf(FileHandle,"} \n");
    pclose(FileHandle);
    FreeListOfAnnotatedFormulae(&ListHead);
    assert(ListHead == NULL);
}
//-----------------------------------------------------------------------------
int main(int argc,char *argv[]) {

    int ArgNumber;
    int FlagNumber;
    char *TSTPFile;
    char *OutputFile;
    char Flag;
    char Flags[20];

    if (argc <= 1) {
        printf("Usage: YuTV TSTPFile OutputFile [-g|-m][-el]\n");
        exit(EXIT_FAILURE);
    }

    TSTPFile = argv[1];
    OutputFile = argv[2];

//----Process the flags
    FlagNumber = 0;
    if (argc > 1) {
        for (ArgNumber = 3; ArgNumber < argc; ArgNumber++) {
            if (*argv[ArgNumber] =='-' && strlen(argv[ArgNumber]) == 2) {
                Flag = *(argv[ArgNumber]+1);
                switch(Flag){
                    case 'g':
                    case 'm':
                    case 'l':
                    case 'e':
                        Flags[FlagNumber++] = Flag;
                    break;
                    default:
                        printf("Wrong flag input!\n"); 
                        exit(EXIT_FAILURE);
                    break;
                }
            } else { 
                printf("Wrong flag input!\n"); 
                exit(EXIT_FAILURE);
            }
        }
    }
    
    RunDOT(TSTPFile,OutputFile,Flags,FlagNumber);

    return(EXIT_SUCCESS);
}
//-----------------------------------------------------------------------------
