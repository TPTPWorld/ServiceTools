#include <stdio.h>
#include <iostream>
#include <assert.h>
//#include "../common/jjheader.h"
#include "jjheader.h"
#include <map>
#include <vector>
#include <ext/hash_map>
#include <ext/hash_set>
#include <math.h>

using namespace std;
using __gnu_cxx::hash_map;
using __gnu_cxx::hash_set;

class SNORDER {
 public:
  SNORDER() { }
  bool operator () (const SYMBOLNODE s1, const SYMBOLNODE s2) const {
    return s1 < s2;
  }
  int operator () (const SYMBOLNODE s1) const {
    return (int)s1;
  }
};

typedef hash_map<SYMBOLNODE, double, SNORDER > maphash;
typedef maphash::iterator ihash;
typedef hash_set<SYMBOLNODE, SNORDER > sethash;

class COLLECTOR {
 public:
  maphash data;
  double total;
  int unique;

  void add(SYMBOLNODE s, double quantity);
  void set(SYMBOLNODE s, double value);
};

class PFORMULA {
 public:
  int id;
  //hash of all the symbols and vars
  COLLECTOR symbols;
  COLLECTOR variables;
  //list of formulae that are associated with this PFORMULA
  vector<ANNOTATEDFORMULA> list;
  //variables info
  int totalvars;
  int uniquevars;

  PFORMULA() : totalvars(0), uniquevars(0) {   }
  PFORMULA(ANNOTATEDFORMULA f) : totalvars(0), uniquevars(0) {  add(f); }
  ~PFORMULA() { }

  void add(ANNOTATEDFORMULA f, bool countOnce = false);
  void remove(ANNOTATEDFORMULA f, bool countOnce = false);
  void print();

 protected:

  void analyze(ANNOTATEDFORMULA f, bool countOnce, int val);
  void collect(FORMULA Formula, sethash *counted, int val);
  void collect(TERM Term, sethash *counted, int val);
};

class PFORDER {
 public:
  PFORDER() { }
  bool operator () (const PFORMULA* s1, const PFORMULA* s2) const {
    return s1 < s2;
  }
  int operator () (const PFORMULA* s1) const {
    return (int)s1;
  }
};

class FORMULA_PAIR {
 public:
  //vector<double> left, right;
  PFORMULA* f;
  PFORMULA* g;
  double left;
  double right;

  FORMULA_PAIR() : f(0), g(0), left(0), right(0) { }
  FORMULA_PAIR(PFORMULA* f, PFORMULA* g) : f(f) , g(g), left(0), right(0) {  }

  double similarityByRatio(double defaultRelevance);

  void formulaWeightInterBySource (PFORMULA *context, PFORMULA* selected = NULL);
  void formulaWeightInterByUnion (PFORMULA* context, PFORMULA* selected = NULL);

  void variableWeightUniversalIntersection(PFORMULA* context);
  void variableWeightUniversalUnion();
};

class RelevanceMatrix {
 public:
  double **relevance;
  double **irelevance;
  int* cluster;                     //cluster number
  double* center;                    //center of the cluster
  int * cluster_size;
  int* next;                        //next step in indirect path
  int size;
  //options
  int intVarOpt;
  int intDirOpt;

  RelevanceMatrix(int size);
  ~RelevanceMatrix();

  void computeDirect(vector<PFORMULA *> &formulae, PFORMULA* context,
	 	  char* dirOpt, char* varOpt);
  double computeSingleDirect(PFORMULA* f1, PFORMULA* f2, PFORMULA* context, PFORMULA* selected = NULL);
  void computeIndirect(char* options);
  void computeClusters(int targetClusters);
  void computeInnerProduct();
  double computeSingleInnerProductRaw(int r1, int r2);
  double computeSingleInnerProductCol(int c1, int c2);

  double link(PFORMULA* f1, PFORMULA* f2, PFORMULA* context, PFORMULA* selected) {
    //on the fly computation
    //if the are the same the relevance is 1 and any threshold is smaller or equal
    if (f1 == f2)
      return 1;
    return computeSingleDirect(f1, f2, context, selected);
  }
  bool linked(int i, int j, double threshhold) {
	//     (relevance[i][j] >= threshhold && relevance[j][i] >= threshhold) 
	return (relevance[i][j] + relevance[j][i] >= 2 * threshhold ); 
  }
  bool ilinked(int i, int j, double threshhold) {
	//     (irelevance[i][j] >= threshhold && irelevance[j][i] >= threshhold) 
	return (irelevance[i][j] + irelevance[j][i] >= 2 * threshhold ); 
  }
  double rel(int index) { return relevance[size - 1][index]; }
  double irel(int index) { return irelevance[size - 1][index]; }

  double **createArray();
 private:

  //formula to start from forming the first cluster (normaly the core)
  int formClusters(int seedFotmula, double RES, double MRR);
};

void InitializeStream(READFILE Stream);
