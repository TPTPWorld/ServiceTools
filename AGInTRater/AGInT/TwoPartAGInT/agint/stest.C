//Author: Yury Puzis
//Date: 01/19/2006

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <assert.h>
#include <fstream.h>
#include "agint.h"

#define FILTERS_NUMBER 8

using namespace std;

char** readData(char* filename, int &n) {
  n = 0;
  char *s = new char[100];
  FILE * f = fopen(filename, "r");
  if (f == NULL) { 
    cerr << "Error, cannot open file " << filename << endl; 
    exit(1); 
  }
  while(fgets(s, 100, f))
    if (strcmp(s, "theory(equality)")!=1 && strcmp(s, "theory(equality:s)")!=1)
      n++;
  rewind(f);
  char **S = new char*[n];
  n = 0;
  while(fgets(s, 100, f)) {
    if (strcmp(s,"theory(equality)")!=1 && strcmp(s,"theory(equality:s)")!=1){
      S[n++] = s;
      s = new char[100];
    }
  }
  fclose(f);
  return S;
}

int getAppearence(char** S, String FormulaName, int size) {
  int n = 0; 
  for (int i = 0; i < size; i++)
    if (strcmp(S[i], FormulaName)==1) n++;
  return n;
}

int countAppearence(String FormulaName, char* filename) {
  fstream file_op(filename,ios::in);
  char s[100];
  int n = 0;
  while(file_op >> s)
    if (strcmp(FormulaName, s)) n++;
  file_op.close();
  return n;
}

void replaceScore(SIGNATURE Signature, ANNOTATEDFORMULA f, 
		  char* PrincipalSymbol, double score) {
  RemoveUsefulInformationFromAnnotatedFormula(f, PrincipalSymbol);
  char intinfo[100];
  if (score > -1)
    sprintf(intinfo,"%s(%.2f)", PrincipalSymbol, score);
  else
    sprintf(intinfo,"%s(ignored)", PrincipalSymbol);
  AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
}

int main(int argc, char *argv[]) {

  if (argc != 4) {
    cout << "Parameters:\n	file with candidate interesting theorems\n"
	 << "	good temporal file\n	bad temporal file\n";
    exit(0);
  }    

  //open jjparser
  SIGNATURE Signature = NewSignature();
  SetNeedForNonLogicTokens(1);
  LISTNODE Head;
  assert(Head = ParseFileOfFormulae(argv[1], NULL, Signature, 1, NULL));
  int formnum = ListCount(Head,cnf_nodes) + ListCount(Head,fof_nodes);
  String FormulaName;
  String strVal;
  double fdata[formnum][FILTERS_NUMBER];
  double imax[FILTERS_NUMBER];
  double imin[FILTERS_NUMBER];
  ANNOTATEDFORMULA f;

  for (int i = 0; i < FILTERS_NUMBER; i++) {
    imax[i] = 0;
    imin[i] = -1;
  }

  int GoodSize = 0;
  char** GoodData = readData(argv[2], GoodSize);
  int BadSize = 0;
  char** BadData = readData(argv[3], BadSize);

  //proccess all the formulas
  for(int j = 0; j < formnum; j++) {
    int a = j + 1;
    f = GetAnnotatedFormulaFromListByNumber(Head, a);
    if (f->Syntax != tptp_cnf && f->Syntax != tptp_fof)
      continue;
    GetName(f, FormulaName);
    //compute usefulness
    int coolChildren = getAppearence(GoodData,FormulaName,GoodSize);
    int badChildren = getAppearence(BadData,FormulaName,BadSize);
    if (coolChildren + badChildren > 0)
      fdata[j][0] = (double) coolChildren /(double) (coolChildren+badChildren);
    else 
      fdata[j][0] = 0.0;
    //extract the other measures from the formula to compute scaling cap
    GetUsefulInfoTerm(f,"obviousness",1,strVal);  	//high
    fdata[j][1] = Name2int(strVal);
    GetUsefulInfoTerm(f,"complexity",1,strVal);		//low
    fdata[j][2] = Name2int(strVal);
    GetUsefulInfoTerm(f,"intensity",1,strVal);		//high
    fdata[j][3] = Name2double(strVal);
    GetUsefulInfoTerm(f,"surprisingness",1,strVal);	//high
    fdata[j][4] = Name2double(strVal);
    GetUsefulInfoTerm(f,"adaptivity",1,strVal);		//low
    fdata[j][5] = Name2double(strVal);
    GetUsefulInfoTerm(f,"focus",1,strVal);		//high
    fdata[j][6] = Name2double(strVal);
    GetUsefulInfoTerm(f,"weight",1,strVal);		//low
    fdata[j][7] = Name2int(strVal);
    //update max val info
    for (int i = 0; i < FILTERS_NUMBER; i++) {
      if (imax[i] < fdata[j][i]) imax[i] = fdata[j][i];
      if (imin[i] == -1 || imin[i] > fdata[j][i]) imin[i] = fdata[j][i];
    }
  }

  //elems = number of scores that are above 0
  int elems = 0;
  for (int i = 0; i < FILTERS_NUMBER; i++)
    if (imax[i] != imin[i]) elems++;

  double max_int = 0;
  double min_int = -1;
  //finding out how to scale interestingness
  for(int a = 0; a < formnum; a++) {
    double interesting = 0;
    for (int i = 0; i < FILTERS_NUMBER; i++)
      if (imax[i] != imin[i]) {
        fdata[a][i] = (fdata[a][i] - imin[i]) / (imax[i] - imin[i]);
        if (i == 2 || i == 7 || i == 4)  //reverse the low=better measures
	  fdata[a][i] = 1 - fdata[a][i];
//DEBUG fprintf(stderr,"-2.interesting %f a %d i %d fdata[a][i] %f\n",interesting,a,i,fdata[a][i]);
        interesting += fdata[a][i];
      } else {
        fdata[a][i] = -1;
      }
//DEBUG fprintf(stderr,"0.interesting %f min_int %f max_int %f\n",interesting,min_int,max_int);
    interesting = (elems > 0) ? interesting/elems : 0.0;
    if (interesting > max_int) max_int = interesting;
    if (min_int == -1 || interesting < min_int) min_int = interesting;
//DEBUG fprintf(stderr,"1.interesting %f min_int %f max_int %f\n",interesting,min_int,max_int);
  }

  int j = 0;
  for (LISTNODE JJformula = Head; JJformula; JJformula = JJformula->Next){
    //extract, recompute, and delete the usefullness info
    double interesting = 0;
    f = JJformula->AnnotatedFormula;    

    if (f->Syntax != tptp_cnf && f->Syntax != tptp_fof)
      continue;

    for (int i = 0; i < FILTERS_NUMBER; i++)
      if (imax[i] != imin[i] && fdata[j][i] != -1)
        interesting += fdata[j][i];
//DEBUG fprintf(stderr,"2. interesting %f min_int %f max_int %f\n",interesting,min_int,max_int);
    interesting = (elems > 0) ? interesting/elems : 0.0;
    if (max_int != min_int)
      interesting = (interesting - min_int) / (max_int - min_int);
    else 
      interesting = max_int;

//DEBUG fprintf(stderr,"3. interesting %f min_int %f max_int %f\n",interesting,min_int,max_int);
    //replace old scores by scaled ones
    replaceScore(Signature, f, "obviousness", fdata[j][1]);
    replaceScore(Signature, f, "complexity", fdata[j][2]);
    replaceScore(Signature, f, "intensity", fdata[j][3]);
    replaceScore(Signature, f, "surprisingness", fdata[j][4]);
    replaceScore(Signature, f, "adaptivity", fdata[j][5]);
    replaceScore(Signature, f, "focus", fdata[j][6]);
    replaceScore(Signature, f, "weight", fdata[j][7]);

    //add new info
    char intinfo[100];
    if (fdata[j][0] > -1) {
      sprintf(intinfo, "usefulness(%.2f)", fdata[j][0]);      
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
    } else
      AddUsefulInformationToAnnotatedFormula(f,Signature,"usefulness(ignored)");
     
    /* 
      sprintf(intinfo, "max(%.2f)", max_int);      
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "min(%.2f)", min_int);      
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
     */
    sprintf(intinfo,"interesting(%.2f)", interesting);
    AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);

    //output formula
    PrintAnnotatedTSTPNode(stdout, f, tptp, 1);
    j++;
  }

  FreeListOfAnnotatedFormulae(&Head);
  assert(Head == NULL);

  //this file is no longer needed - delete
  unlink(argv[2]);
  unlink(argv[3]);

  return(EXIT_SUCCESS);

}
