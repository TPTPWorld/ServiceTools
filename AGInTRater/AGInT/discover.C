//Author: Yury Puzis
//Date: 01/19/2006

#include "agint.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fstream.h>
#include <iostream>
#include <assert.h>

#define FILTERS_NUMBER 8

using namespace std;

bool passFilters(SyntaxType s, int p, int cf, int ff) {
  return ((s == tptp_cnf && p >= cf) || (s == tptp_fof && p >= ff));
}

void replaceScore(SIGNATURE Signature, ANNOTATEDFORMULA f, 
		  char* PrincipalSymbol, double score, char* intinfo) {
  if (score > -1)
    sprintf(intinfo,"%s(%.2f)", PrincipalSymbol, score);
  else
    sprintf(intinfo,"%s(ignored)", PrincipalSymbol);
  //RemoveUsefulInformationFromAnnotatedFormula(f, Signature, PrincipalSymbol);
  //AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
  UpdateUsefulInformationInAnnotatedFormula(f, Signature, intinfo);
}

//both terms have to have same SYMBOLNODES and then check the args
bool same(TERM s1, TERM s2) {
  if (s1->Type == variable && s2->Type==variable){
    //same variable
    if (s1->TheSymbol.Variable->VariableName == 
	s2->TheSymbol.Variable->VariableName) {
      return true;
    }
  } else if((s1->Type == function || s1->Type == predicate) 
	    && s2->Type == s1->Type
	    && s1->TheSymbol.NonVariable == s2->TheSymbol.NonVariable) {
    for (int i = 0; i < s1->TheSymbol.NonVariable->Arity; i++)
      if (!same(s1->Arguments[i], s2->Arguments[i]))
	return false;
    return true;
  }
  return false;
}

//true if can find f somehwere
bool canFind(FORMULA f, TERM seeked_f) {
  switch (f->Type) {
  case binary:   
    return (canFind(f->FormulaUnion.BinaryFormula.LHS, seeked_f) ||
            canFind(f->FormulaUnion.BinaryFormula.RHS, seeked_f));
  case atom:
    return same(f->FormulaUnion.Atom, seeked_f);
  default:
    return false;
  }
}

bool preProccess(FORMULA f_root, FORMULA f, bool sign) {
  char* s;
  //make sure the formula is not a tautology
  switch (f->Type) {
  case binary:   
    return (preProccess(f_root, f->FormulaUnion.BinaryFormula.LHS, true) &&
            preProccess(f_root, f->FormulaUnion.BinaryFormula.RHS, true));    
  case quantified:
  case unary:
    //if there is a positive literal that looks the same, it is tautology
    if (canFind(f_root,f->FormulaUnion.UnaryFormula.Formula->FormulaUnion.Atom))
      return false;
    return preProccess(f_root, f->FormulaUnion.UnaryFormula.Formula, false);
  case atom:
    //catch the tautologies. ignore redundancies
    s = f->FormulaUnion.Atom->TheSymbol.NonVariable->NameSymbol;
    if ((sign && strcmp(s, "$true") ==0) || (strcmp(s, "$false") == 0))
      return false;
    if (sign && strcmp(s, "$equal")==0) {      
      TERM t = f->FormulaUnion.Atom;
      if (same(t->Arguments[0], t->Arguments[1]))
	return false;
    }
    //the X3 != X2 case
    if (!sign && strcmp(s, "$equal") == 0) {
      TERM t = f->FormulaUnion.Atom;
      if (t->Arguments[0]->Type == variable && t->Arguments[1]->Type==variable)
        return false;
    }
    return true;
  default:
    cerr << "pp type: " << f->Type << endl;
    assert(false);
  }
}

bool preProccess(FORMULA f) {
  return preProccess(f, f, true);
}

FILE *open_file(char* name) {
  FILE *f = fopen(name, "w");
  if (f == NULL) {
    cerr << "Error, cannot open file" << name << endl;
    exit(1);
  }
  return f;
}

//   returns number of formulae that passed the filter
void analyzeStream(SIGNATURE Signature, char *tfile, char** RankName,
		   FLEMMA_COLLECTION &lc, SlidingWindow &obviousness,
		   SlidingWindow &complexity, SlidingWindow &intensity,
		   SlidingWindow &surprisingness, SlidingWindow &adaptivity,
		   SlidingWindow &focus, SlidingWindow &weight, 
		   bool noFilter, int cnf_filters, int fof_filters) {
  
  FILE *temp_out = open_file(tfile);
  READFILE Stream = new ReadFile;
  InitializeStream(Stream);
  LData ld;
  SuperString intinfo1, intinfo2;
  String intinfo;

  //start processing the theorems one by one
  while(!CheckTokenType(Stream, endeof)) {
    if (!Stream->FileHandle) continue;       

    //cout << "% " <<  CurrentToken(Stream)->NameToken << endl;

//----Beware, the lc points to this Signature, and relies on that. No
//----mutation of this Signature, or use of any other
    ANNOTATEDFORMULA f = ParseAndUseAnnotatedFormula(Stream, Signature);

    #ifdef DEBUG
    cerr << "---" << endl;
    PrintAnnotatedTSTPNode(stderr,f,tptp,1);
    cerr << "---" << endl;
    #endif

    //analize the formula
    ld.clear();
    FLEMMA* newL = lc.add(f, ld);
 
    #ifdef DEBUG2
	cerr << "% complex : " << ld.complexity      << endl;
        cerr << complexity.best() << endl;
	if (complexity.pass((double)ld.complexity))
  	  cerr << "% pass" << endl;
	cerr << "% obviouse: " << newL->NumOfInferences << endl;
        cerr << obviousness.best() << endl;
	if (obviousness.pass((double)newL->NumOfInferences))
	  cerr << "% pass" << endl;
	cerr << "% weight: " << ld.NumOfSymbols << endl;
        cerr << weight.best() << endl;
	if (weight.pass((double)ld.NumOfSymbols))
	  cerr << "% pass" << endl;
	cerr << "% surprise: " << ld.surprisingness  << endl;
	cerr << surprisingness.best() << endl;
	if (surprisingness.pass(ld.surprisingness))
	  cerr << "% pass" << endl;
	cerr << "% intense : " << ld.intensity       << endl;
	cerr << intensity.best() << endl;
	if (intensity.pass(ld.intensity))
	  cerr << "% pass" << endl;
	cerr << "% focus:    " << ld.focus           << endl;
	cerr << focus.best() << endl;
	if (focus.pass(ld.focus))
	  cerr << "% pass" << endl;
	cerr << "% adaptive: " << ld.adaptivity      << endl;
	cerr << adaptivity.best() << endl;
	if (adaptivity.pass(ld.adaptivity))
	  cerr << "% pass" << endl;
	cerr << endl;
    #endif

    //only use filters if noFilter is false
    int passall = FILTERS_NUMBER;

    if (noFilter == false) {
      passall = complexity.pass((double)ld.complexity)
              + obviousness.pass((double)newL->NumOfInferences) 
  	      + weight.pass((double)ld.NumOfSymbols) 
 	      + surprisingness.pass(ld.surprisingness)
	      + intensity.pass(ld.intensity);
      if (f->Syntax == tptp_cnf) {
   	passall += adaptivity.pass(ld.adaptivity) + focus.pass(ld.focus);
      }
    }
          
    if ((f->Syntax == tptp_cnf || f->Syntax == tptp_fof)
	&& DerivedAnnotatedFormula(f)  //new formula
        && newL->NumOfInferences > 0	 //not an axiom
	&& (f->Syntax == tptp_fof || preProccess(f->jjnextf))   //not tautology
        && passFilters(f->Syntax, passall, cnf_filters, fof_filters)) {
	
      #ifdef DEBUG
      cerr << "% === PASSED! ===(" << passall << ")" << endl;
      #endif
      
      //update the sliding window information
      if (noFilter == false) {
        obviousness.update(newL->NumOfInferences);
        complexity.update(ld.complexity);
        intensity.update(ld.intensity);
        surprisingness.update(ld.surprisingness);
        adaptivity.update(ld.adaptivity);
        focus.update(ld.focus);
        weight.update(ld.NumOfSymbols);
      }
      
      replaceScore(Signature,f,"obviousness",newL->NumOfInferences,intinfo);
      replaceScore(Signature,f,"complexity",ld.complexity,intinfo);
      replaceScore(Signature,f,"intensity",ld.intensity,intinfo);
      replaceScore(Signature,f,"surprisingness",ld.surprisingness,intinfo);
      replaceScore(Signature,f,"adaptivity",ld.adaptivity,intinfo);
      replaceScore(Signature,f,"focus",ld.focus,intinfo);
      replaceScore(Signature,f,"weight",ld.NumOfSymbols,intinfo);

      //storing leaf ancesstors
      RemoveUsefulInformationFromAnnotatedFormula(f, Signature, "ancestors");
      newL->getLeafAncesstorsString(intinfo2);
      if (intinfo2[0] != '\0') {
        sprintf(intinfo1, "ancestors(%s)", intinfo2);
	AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo1);
      }

      PrintAnnotatedTSTPNode(temp_out, f, tptp, 1);
      
      #ifdef DEBUG
      cerr << "**********" << endl;
      PrintAnnotatedTSTPNode(stderr,f,tptp,1);
      cerr << "**********" << endl;
      #endif
    } else {
      #ifdef DEBUG
      replaceScore(Signature,f,"obviousness",newL->NumOfInferences,intinfo);
      replaceScore(Signature,f,"complexity",ld.complexity,intinfo);
      replaceScore(Signature,f,"intensity",ld.intensity,intinfo);
      replaceScore(Signature,f,"surprisingness",ld.surprisingness,intinfo);
      replaceScore(Signature,f,"adaptivity",ld.adaptivity,intinfo);
      replaceScore(Signature,f,"focus",ld.focus,intinfo);
      replaceScore(Signature,f,"weight",ld.NumOfSymbols,intinfo);
      RemoveUsefulInformationFromAnnotatedFormula(f, Signature, "ancestors");
      newL->getLeafAncesstorsString(intinfo2);
      if (intinfo2[0] != '\0') {
        sprintf(intinfo1, "ancestors(%s)", intinfo2);
	AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo1);
      }
      PrintAnnotatedTSTPNode(stderr, f, tptp, 1);
      cerr << "---- FAILED ----(" << passall << ")" << endl;
      #endif

      lc.markGoodBad(f, false);
    }

    //clean up the formula from memory
    FreeAnnotatedFormula(&f);
  }

  fclose(temp_out);
  delete Stream;
}

/* load the entire list again, and make sure that 
   all formulas can pass the min requirments
   returns number of formulae that passed the filter
*/
void analyzeAgain(SIGNATURE Signature, LISTNODE * target, FLEMMA_COLLECTION &lc,
		 SlidingWindow &obviousness, SlidingWindow &complexity,
		 SlidingWindow &intensity, SlidingWindow &surprisingness,
		 SlidingWindow &adaptivity, SlidingWindow &focus, 
		 SlidingWindow &weight, int cnf_filters, int fof_filters) {

  String strVal;
  ANNOTATEDFORMULA f;

  while (*target != NULL) {
    //need to declare it here to reset the content of the variable
    f = (*target)->AnnotatedFormula;
    #ifdef DEBUG
    cerr << endl << "analyse again ---" << endl;
    PrintAnnotatedTSTPNode(stderr,f,tptp,1);
    cerr << "analyse again ---" << endl;
    #endif

    int vals = 0;
    GetUsefulInfoTerm(f,"complexity",1,strVal); 
    vals += complexity.pass((double)Name2int(strVal));
    GetUsefulInfoTerm(f,"obviousness",1,strVal);
    vals += obviousness.pass((double)Name2int(strVal));
    GetUsefulInfoTerm(f,"weight",1,strVal);
    vals += weight.pass(Name2double(strVal));    
    GetUsefulInfoTerm(f,"intensity",1,strVal);
    vals += intensity.pass(Name2double(strVal));
    GetUsefulInfoTerm(f,"surprisingness",1,strVal);
    vals += surprisingness.pass(Name2double(strVal));
    
    if (f->Syntax == tptp_cnf) {
      GetUsefulInfoTerm(f,"adaptivity",1,strVal);
      vals += adaptivity.pass(Name2double(strVal));
      GetUsefulInfoTerm(f,"focus",1,strVal);
      vals += focus.pass(Name2double(strVal));
    }

    if (passFilters(f->Syntax, vals, cnf_filters, fof_filters)) {
      #ifdef DEBUG
      PrintAnnotatedTSTPNode(stderr, f, tptp, 1);
      cerr << "---- PASSED in analyse again (" << vals << ") ----" << endl;
      #endif

      target = &((*target)->Next);
    } else {
      #ifdef DEBUG
      PrintAnnotatedTSTPNode(stderr,f,tptp,1);
      cerr << "---- FAILED in analyse again (" << vals << ") ----" << endl;
      #endif

      lc.markGoodBad(f, false);
      FreeAListNode(target);
    }
  }

}

void outputInteresting(SIGNATURE Signature, LISTNODE AxHead, FLEMMA_COLLECTION &lc, char** RankName){

  String FormulaName;
  String strVal;
  double imax[FILTERS_NUMBER+1];
  double imin[FILTERS_NUMBER+1];
  //index of interesting value is always the last in list
  int InterInd = FILTERS_NUMBER;
  ANNOTATEDFORMULA f;
  int formnum = 0;

  for (int i = 0; i < FILTERS_NUMBER+1; i++) {
    imax[i] = 0;
    imin[i] = -1;
  }

  //formulae that reached this point are definately selected
  //mark them as good children
  for (LISTNODE target = AxHead; target != NULL; target = target->Next) {
    f = target->AnnotatedFormula;
    if (f->Syntax == tptp_cnf || f->Syntax == tptp_fof) {
      lc.markGoodBad(f, true);
      formnum++;
    }
  }

  double fdata[formnum][FILTERS_NUMBER+1];

  //proccess all the formulas
  int j = 0;
  for (LISTNODE target = AxHead; target != NULL; target = target->Next) {
    f = target->AnnotatedFormula;
    if (f->Syntax == tptp_cnf || f->Syntax == tptp_fof) {
      GetName(f, FormulaName);
      //compute usefulness. if there are no children, ignore for this formula
      FLEMMA* curl = lc.get(FormulaName);
      int totc = curl->goodChildren + curl->badChildren;
      #ifdef DEBUG
      cerr << FormulaName << " " << curl->goodChildren << " " << curl->badChildren << endl;
      #endif
      fdata[j][0] = (totc > 0) ? (double)curl->goodChildren/(double)totc : - 1;
      //extract the other measures from the formula to compute scaling cap
      for (int p = 1; p < FILTERS_NUMBER; p++) {
        GetUsefulInfoTerm(f, RankName[p], 1, strVal);
        fdata[j][p] = Name2double(strVal);
      }
      fdata[j][8] = 0;					//interestingness
      //update max val info
      for (int i = 0; i < FILTERS_NUMBER; i++) {
        if (imax[i] < fdata[j][i]) imax[i] = fdata[j][i];
        if (imin[i] == -1 || imin[i] > fdata[j][i]) imin[i] = fdata[j][i];
      }
    }
    j++;
  }

  //finding out how to scale interestingness
  for(int a = 0; a < formnum; a++) {
    //double interesting = 0;
    int elems = 0;
    for (int i = 0; i < FILTERS_NUMBER; i++) {
      if (fdata[a][i] == -1)
        continue;
      if (imax[i] != imin[i]) {
        fdata[a][i] = (fdata[a][i] - imin[i]) / (imax[i] - imin[i]);
        if (i == 2 || i == 7 || i == 4)  //reverse the low=better measures
	  fdata[a][i] = 1 - fdata[a][i];
        fdata[a][InterInd] += fdata[a][i];        
	elems++;
      } else {
        fdata[a][i] = -1;
      }
    }
    fdata[a][InterInd] = (elems > 0) ? fdata[a][InterInd]/(double)(elems) : 0.0;
    if (imax[InterInd] < fdata[a][InterInd]) 
      imax[InterInd] = fdata[a][InterInd];
    if (imin[InterInd] == -1 || imin[InterInd] > fdata[a][InterInd]) 
      imin[InterInd] = fdata[a][InterInd];
  }

  j = 0;
  char intinfo[100];
  for (LISTNODE JJformula = AxHead; JJformula; JJformula = JJformula->Next){
    f = JJformula->AnnotatedFormula;    
    if (f->Syntax != tptp_cnf && f->Syntax != tptp_fof)
      continue;
//----Scale interestingness scores between minimal and maximal
    double mmdiff = imax[InterInd] - imin[InterInd];
    fdata[j][InterInd] = (mmdiff > 0) ? 
      (fdata[j][InterInd] - imin[InterInd])/mmdiff : imax[InterInd];

    //replace old scores by scaled ones
    for (int p = 0; p <= InterInd; p++) {
      replaceScore(Signature, f, RankName[p], fdata[j][p], intinfo);
    }

    //output formula
    PrintAnnotatedTSTPNode(stdout, f, tptp, 1);
    j++;
  }
}

int main(int argc, char *argv[]) {
  if (argc != 3 && argc != 4) {
    cout << "Usage: discover axiom_file agression [filters %] < formulae\n"
         << "Note 1: suggested agression level is 5 is for streams, 15 for static data\n"
         << "        0 sets the filtering agression level to minimum (no filtering)\n"
	 << "Note 2: filters % is the % of all filters that each formula has to pass\n"	
         << "        default is 45% (2 out of 7 for cnf and 1 out of 5 for fof)\n"
         << "Output: list of most interesting formulae with interestingness value\n";
    exit(0);
  }	
  SIGNATURE Signature = NewSignature(), AxSignature = NewSignature();

  //create filters
  int winsize = atoi(argv[2]);
  int filters = 45;
  if (argc == 4)
    filters = atoi(argv[3]);
  int init_cnf_filters = 7;
  int init_fof_filters = 5;
  int fof_filters = (init_fof_filters * filters) / 100;
  int cnf_filters = (init_cnf_filters * filters) / 100;

//  cout << "% FOF need to pass " << fof_filters << " out of 5" << endl;
//  cout << "% CNF need to pass " << cnf_filters << " out of 7" << endl;

  SlidingWindow obviousness(winsize, false, 2.0), 
    complexity(winsize, true, 14.0), intensity(winsize, false, 0.0), 
    surprisingness(winsize, false, 0.0), adaptivity(winsize, true, 10.0), 
    focus(winsize, false, 0.0), weight(winsize, true, 14.0);

  char* RankName[] = {
    "usefulness",
    "obviousness",
    "complexity",
    "intensity",
    "surprisingness",
    "adaptivity",
    "focus",
    "weight",
    "interesting"
  };

  //open temporary files
  char tfile[] = "/tmp/AGINT_XXXXXX";
  if (mkstemp(tfile) == -1) {
    cerr << "Error: cannot create a temporary file!" << endl;
    exit(1);
  }

  //suck everything out of the pipe and store candidates in tfile
  LISTNODE AxHead = ParseFileOfFormulae(argv[1], NULL, AxSignature, 1, NULL);
  FLEMMA_COLLECTION lc(AxSignature, AxHead, Signature);  
  FreeListOfAnnotatedFormulae(&AxHead);
  analyzeStream(Signature, tfile, RankName, lc, obviousness, complexity, 
	intensity, surprisingness, adaptivity, focus, weight, (winsize == 0),
	cnf_filters, fof_filters);
  
  #ifdef DEBUG
  cerr << "PASSED PASSED PASSED" << endl;
  PrintListOfAnnotatedTSTPNodes(stderr,Signature,AxHead,tptp,1);
  cerr << "END OF PASSED" << endl;
  #endif

  //read the accepted formulae from the file
  AxHead = ParseFileOfFormulae(tfile, NULL, Signature, 1, NULL);

  //recheck every entry in tfile and store or fail
  if (winsize > 0 && AxHead != NULL) {
    analyzeAgain(Signature, &AxHead, lc, obviousness, complexity, intensity,
	surprisingness, adaptivity, focus, weight, cnf_filters, fof_filters);
  }

  //compute interestingness but only if there are any formulae left
  if (AxHead != NULL) {
    outputInteresting(Signature, AxHead, lc, RankName);
  } else {
    cout << "% no interesting formulae detected!" << endl;
  }

  //clean up memory
  if (unlink(tfile) == -1) {
    perror("unlinking AGINT file");
  }
  FreeListOfAnnotatedFormulae(&AxHead);
  assert(AxHead == NULL);
  exit(0);  
}
