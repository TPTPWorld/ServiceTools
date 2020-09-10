//Author: Yury Puzis
//Date: 01/19/2006

#ifndef _AGINT_H
#define _AGINT_H

//#define DEBUG
//#define DEBUG2

#include <iostream>
#include <assert.h>
#include <set>
#include <ext/hash_map>
#include <vector>
#include "jjheader.h"

using namespace std;
using __gnu_cxx::hash_map;

#define jjnext AnnotatedFormula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula
#define jjnextf AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula

class StringHash {
private:
//----Fucking static length of formula names - was 30!
  char value[1024];
public:
  int hash;
  StringHash() : hash(0) { }
  StringHash(char *name);
  bool operator== (const StringHash &sh) const {
    return (strcmp(value, sh.value) == 0);
  }
  int operator() (const StringHash &sh) const {
    return sh.hash;
  }
};

struct LData {
  int complexity;
  int NumOfSymbols;
  double intensity;
  double surprisingness;
  double adaptivity;
  double focus;

  void clear() {
    complexity = NumOfSymbols = 0;
    intensity = surprisingness = adaptivity = focus = 0;
  }
};

class FLEMMA {
 public:
  int id;
  set<FLEMMA*> leafParents;  
  vector< pair<int, int> > symbolQuantity;
  int NumOfInferences;
  int badChildren;
  int goodChildren;
    
  ~FLEMMA() { }
  FLEMMA(int id = 0) : id(id), symbolQuantity(0), NumOfInferences(0),
		       badChildren(0), goodChildren(0) { }

  void getLeafAncesstorsString(char* str);
};

class FLEMMA_COLLECTION {
 private:
  void HashSignature(SYMBOLNODE treeRoot);
  void parseFormula(FORMULA f, bool *AV);
  void parseLiteral(TERM t, bool *AV);
  int findLocation(SYMBOLNODE tnode);
  int TreeSize(SYMBOLNODE treeRoot);
  void RewriteSignature(SYMBOLNODE treeRoot, vector< pair<int, int> > &fsig);
  int hash(char *str);
  int getUnique(SYMBOLNODE treeRoot);
  int getOccurences(SYMBOLNODE treeRoot);
  FLEMMA* hashLemma(char* NameString);  
  
  double* CoOccurence;
  SIGNATURE Signature;
  char** hash_data;
  int hash_size;
  int symbolsNumber;
  int nextid;
  String NameString;

  //map from lemma hash value to it's data
  hash_map<StringHash, FLEMMA*, StringHash> Lemmas;		
  //vector that assiciates id(s) with hashes
  vector<int> hashes;

 public:
  FLEMMA_COLLECTION(SIGNATURE AxSignature, LISTNODE AxHead, 
		    SIGNATURE Signature);

  ~FLEMMA_COLLECTION();

  FLEMMA* add(ANNOTATEDFORMULA f, LData &ld);

  FLEMMA* get(char* fname) { return Lemmas[StringHash(fname)]; }

  void markGoodBad(ANNOTATEDFORMULA f, bool good);
  
};

class SlidingWindow {
private:
  int size;
  bool upper;

public:
  double* data;  
  bool pass(double val);  
  void update(double val);
  void print();
  double best();

  SlidingWindow(int size, bool upper, double def);
  ~SlidingWindow();
};

void InitializeStream(READFILE Stream);

int Name2int(char* NameString);

double Name2double(char* str);
  

#endif
