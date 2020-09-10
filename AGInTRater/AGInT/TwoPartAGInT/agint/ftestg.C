//Author: Yury Puzis
//Date: 01/19/2006

#include "agint.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fstream.h>
#include <map>

using namespace std;

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
    cout << "pp type: " << f->Type << endl;
    assert(false);
  }
}

bool preProccess(FORMULA f) {
  return preProccess(f, f, true);
}

FILE *open_file(char* name) {
  FILE *f = fopen(name, "w");
  if (f == NULL) {
    cerr << "Error, cannot open " << name << endl;
    exit(1);
  }
  return f;
}

LISTNODE analyzeStream(SIGNATURE Signature, FILE *bad_out, 
		   FLEMMA_COLLECTION &lc, SlidingWindow &obviousness,
		   SlidingWindow &complexity, SlidingWindow &intensity,
		   SlidingWindow &surprisingness, SlidingWindow &adaptivity,
		   SlidingWindow &focus, SlidingWindow &weight) {
  
  LISTNODE PassedNodes;
  LISTNODE * AddHere;
  READFILE Stream = new ReadFile;
  InitializeStream(Stream);
  SuperString ParentNames;
  LData ld;
  
  PassedNodes = NULL;
  AddHere = &PassedNodes;
  //start processing the theorems one by one
  while(!CheckTokenType(Stream, endeof)) {
    if (!Stream->FileHandle) continue;       

    //cout << "% " <<  CurrentToken(Stream)->NameToken << endl;
    
    ANNOTATEDFORMULA f = ParseAndUseAnnotatedFormula(Stream, Signature);

    #ifdef DEBUG
    cerr << "---" << endl;
    PrintAnnotatedTSTPNode(stderr,f,tptp,1);
    cerr << "---" << endl;
    #endif

    //analize the formula
    GetParentNames(f, ParentNames);
    ld.clear();
    FLEMMA* newL = lc.add(f, ld, ParentNames);
 
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

    int passall = 	
           complexity.pass((double)ld.complexity)
         + obviousness.pass((double)newL->NumOfInferences) 
	 + weight.pass((double)ld.NumOfSymbols) 
	 + surprisingness.pass(ld.surprisingness)
	 + intensity.pass(ld.intensity);
    if (f->Syntax == tptp_cnf) 
 	passall += adaptivity.pass(ld.adaptivity)
	 	 + focus.pass(ld.focus);
          
    if ((f->Syntax == tptp_cnf || f->Syntax == tptp_fof)
	&& DerivedAnnotatedFormula(f)  //new formula
        && newL->NumOfInferences > 0	 //not an axiom
	&& (f->Syntax == tptp_fof || preProccess(f->jjnextf))   //not tautology
	&& ((f->Syntax == tptp_cnf && passall > 3 ) ||
	    (f->Syntax == tptp_fof && passall > 2))) {
	
      #ifdef DEBUG
      cerr << "% === PASSED! ===(" << passall << ")" << endl;
      #endif
      
      //update the sliding window information
      obviousness.update(newL->NumOfInferences);
      complexity.update(ld.complexity);
      intensity.update(ld.intensity);
      surprisingness.update(ld.surprisingness);
      adaptivity.update(ld.adaptivity);
      focus.update(ld.focus);
      weight.update(ld.NumOfSymbols);
      
      //output the formula
      SuperString intinfo;
      sprintf(intinfo, "obviousness(%d)", newL->NumOfInferences);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "complexity(%d)", ld.complexity);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "intensity(%.2f)", ld.intensity);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "surprisingness(%.2f)", ld.surprisingness);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "adaptivity(%.2f)", ld.adaptivity);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "focus(%.2f)", ld.focus);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "weight(%d)", ld.NumOfSymbols);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      //storing leaf ancesstors
      SuperString intinfo2;
      newL->getLeafAncesstorsString(intinfo2);
      sprintf(intinfo, "ancestors(%s)", intinfo2);
      if (intinfo[0] != '\0')
	  AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      AddListNode(AddHere,NULL,f);
      AddHere = &((*AddHere)->Next);
      #ifdef DEBUG
      cerr << "**********" << endl;
      PrintAnnotatedTSTPNode(stderr,f,tptp,1);
      cerr << "**********" << endl;
      #endif
    } else {
      #ifdef DEBUG
      //output the formula
      SuperString intinfo;
      sprintf(intinfo, "obviousness(%d)", newL->NumOfInferences);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "complexity(%d)", ld.complexity);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "intensity(%.2f)", ld.intensity);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "surprisingness(%.2f)", ld.surprisingness);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "adaptivity(%.2f)", ld.adaptivity);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "focus(%.2f)", ld.focus);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      sprintf(intinfo, "weight(%d)", ld.NumOfSymbols);
      AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      //storing leaf ancesstors
      SuperString intinfo2;
      newL->getLeafAncesstorsString(intinfo2);
      sprintf(intinfo, "ancestors(%s)", intinfo2);
      if (intinfo[0] != '\0')
	  AddUsefulInformationToAnnotatedFormula(f, Signature, intinfo);
      PrintAnnotatedTSTPNode(stderr, f, tptp, 1);
      cerr << "---- FAILED ----(" << passall << ")" << endl;
      #endif
      //send names of parents to the "bad" file
      fputs(ParentNames, bad_out);
      fflush(bad_out);
    }

    //clean up the formula from memory
    FreeAnnotatedFormula(&f);
  }

  delete Stream;
  return(PassedNodes);
}

void analyzeAgain(LISTNODE AxHead, FILE* good_out, FILE *bad_out,
		  SlidingWindow &obviousness, SlidingWindow &complexity,
		  SlidingWindow &intensity, SlidingWindow &surprisingness,
		  SlidingWindow &adaptivity, SlidingWindow &focus,
		  SlidingWindow &weight) {

  SuperString ParentNames;
  //load the entire list again, and make sure that all formulas can
  //pass the min requirments

  int formnum = ListCount(AxHead,cnf_nodes) + ListCount(AxHead,fof_nodes);
  String strVal;
  int dropped = 0;    
  for(int a = 1; a <= formnum; a++) {
    ANNOTATEDFORMULA f = GetAnnotatedFormulaFromListByNumber(AxHead, a);
    #ifdef DEBUG
    cerr << "analyse again ---" << endl;
    PrintAnnotatedTSTPNode(stderr,f,tptp,1);
    cerr << "analyse again ---" << endl;
    #endif
    GetParentNames(f, ParentNames);
    GetUsefulInfoTerm(f,"complexity",1,strVal); 
    int vals = 0;
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
    } else
      vals += 2;
    
    if (vals <= 3) {
      dropped++;
      //write formula's parents to "bad" file
      fputs(ParentNames, bad_out);
      fflush(bad_out);
      #ifdef DEBUG
      PrintAnnotatedTSTPNode(stderr,f,tptp,1);
      cerr << "---- FAILED in analyse again (" << vals << ") ----" << endl;
      #endif
    } else {
      PrintAnnotatedTSTPNode(stdout, f, tptp, 1);
      printf("\n");
      fflush(stdout);
    //send names of parents to the "good" file
      fputs(ParentNames, good_out);
      fflush(good_out);    
      #ifdef DEBUG
      PrintAnnotatedTSTPNode(stderr,f,tptp,1);
      cerr << "---- PASSED in analyse again (" << vals << ") ----" << endl;
      #endif
    }
  }  
}

//call ftest <axiom file> 
int main(int argc, char *argv[]) {

  if (argc != 5) {
    cout << "Parameters:\n	axioms file\n" 
         << "	agression level (5 is for streams, 15 for static data)\n"
	 << "	good temporal file\n	bad temporal file\n";
    exit(EXIT_SUCCESS);
  }	
  SIGNATURE Signature = NewSignature(), AxSignature = NewSignature();
  LISTNODE PassedFirstTime;

  //create filters
  int winsize = atoi(argv[2]);
  SlidingWindow obviousness(winsize, false, 2.0), 
    complexity(winsize, true, 14.0), intensity(winsize, false, 0.0), 
    surprisingness(winsize, false, 0.0), adaptivity(winsize, true, 10.0), 
    focus(winsize, false, 0.0), weight(winsize, true, 14.0);

  FILE *good_out = open_file(argv[3]);
  FILE *bad_out = open_file(argv[4]);

  //Get the axiom base from the named file
  LISTNODE AxHead = ParseFileOfFormulae(argv[1], NULL, AxSignature, 1, NULL);
  FLEMMA_COLLECTION lc(AxSignature, AxHead, Signature);  
  FreeListOfAnnotatedFormulae(&AxHead);

  //suck everything out of the pipe and keep candidates
  PassedFirstTime = analyzeStream(Signature, bad_out, lc, obviousness, 
        complexity, intensity, surprisingness, adaptivity, focus, weight);

  #ifdef DEBUG
  cerr << "PASSED PASSED PASSED" << endl;
  PrintListOfAnnotatedTSTPNodes(stderr,Signature,PassedFirstTime,tptp,1);
  cerr << "END OF PASSED" << endl;
  #endif
  if (PassedFirstTime != NULL) {
    analyzeAgain(PassedFirstTime, good_out, bad_out, obviousness, complexity, 
		 intensity, surprisingness, adaptivity, focus, weight);
  } else {
    cout << "% no interesting formulae detected!" << endl;
  }

  //close files
  fclose(good_out);
  fclose(bad_out);
  //clean up memory
  FreeListOfAnnotatedFormulae(&AxHead);
  exit(EXIT_SUCCESS);  
}
