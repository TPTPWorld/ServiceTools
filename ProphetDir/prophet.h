#include <stdio.h>
#include <iostream>
//#include "../common/jjheader.h"
#include "jjheader.h"
#include "relevance.h"
#include "isodata.h"

typedef hash_map<SYMBOLNODE, COLLECTOR*, SNORDER > colhash;
typedef colhash::iterator chash;
typedef hash_map<PFORMULA*, COLLECTOR*, PFORDER > pfhash;
typedef pfhash::iterator phash;

class QE {
 public:
  colhash tqe;	//hash to QE vector for each symbol
  pfhash fqe;   //hash to QE vector for each formula

  QE(vector<PFORMULA*> &formulae, PFORMULA* presence);
  double compare(SYMBOLNODE s1, SYMBOLNODE s2);
  double innerProduct(COLLECTOR* c1, COLLECTOR* c2);
  double compare(PFORMULA* f1, PFORMULA* f2, PFORMULA* context);
  COLLECTOR* FQE(COLLECTOR &sfdata);
  COLLECTOR* TQE(vector<PFORMULA*> &formulae, SYMBOLNODE s, PFORMULA* presence);
};

class PROPHET {
 private:
  vector<PFORMULA*> formulae;
  vector<ANNOTATEDFORMULA> annotatedFormulae;
  PFORMULA* context;
  PFORMULA* presence;
  RelevanceMatrix *matrix;
  int coreSize;
  int finalClusters;
  SIGNATURE Signature;
  //context options
  int modification;
  bool countOnce;

  void StorUsefullData(ANNOTATEDFORMULA f, int j);
  void updateContext();

 public:
  PROPHET(FILE *source, bool countOnce, int modification, 
	  bool includeHypothesis);

  ~PROPHET();
  void compute(char* dirOpt, char* varOpt, char* rankerOpt);
  void clusterDirectly(int targetClusters);
  void clusterGreedy(bool useIndirect);	//2 clusters. 0=bad 1=good
  void clusterGoogle();
  void PrintFormulae();
};
