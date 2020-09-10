#include "relevance.h"

void InitializeStream(READFILE Stream) {
  Stream->FileName = NULL;
  Stream->FileHandle = stdin;
  Stream->Line = 1;
  Stream->Character = 0;
  Stream->StringFileContent = NULL;
  Stream->Overshot = 0;
  Stream->StringOffset = 0;
  Stream->CurrentCharacter = 0;
  Stream->CurrentToken = NULL;
  Stream->Auxilliary = NULL;
  Stream->NeedNonLogicTokens = 0;
}

void PFORMULA::print() {
  for (int i = 0; i < list.size(); i++)
    PrintAnnotatedTSTPNode(stdout,list[i],tptp,1);
  cout << endl;
}

void PFORMULA::add(ANNOTATEDFORMULA f, bool countOnce) {
  analyze(f, countOnce, 1);
}

void PFORMULA::remove(ANNOTATEDFORMULA f, bool countOnce) {
  analyze(f, countOnce, -1);
}

void PFORMULA::analyze(ANNOTATEDFORMULA f, bool countOnce, int val) {
  list.push_back(f);
  sethash *counted = NULL;
  if (countOnce)
    counted = new sethash();
  collect(f->AnnotatedFormulaUnion.AnnotatedTSTPFormula.FormulaWithVariables->Formula, counted, val);
  for (ihash j = variables.data.begin(); j != variables.data.end(); j++)
    totalvars += (int)j->second;
  uniquevars = variables.data.size();
  if (countOnce)
    delete counted;
}

void PFORMULA::collect(FORMULA Formula, sethash *counted, int val) {
  SYMBOLNODE s;
  switch (Formula->Type) {
  case quantified:
    collect(Formula->FormulaUnion.QuantifiedFormula.Formula, counted, val);
    break;
  case binary:
    collect(Formula->FormulaUnion.BinaryFormula.LHS, counted, val);
    collect(Formula->FormulaUnion.BinaryFormula.RHS, counted, val);
    break;
  case unary:
    collect(Formula->FormulaUnion.UnaryFormula.Formula,counted, val);
    break;
  case atom:
    s = Formula->FormulaUnion.Atom->TheSymbol.NonVariable;
    if (counted == NULL || counted->insert(s).second == true) {
      symbols.add(s, val);
    }
    collect(Formula->FormulaUnion.Atom, counted, val);
    break;
  default:
    printf("ERROR: Not a known formula type in collect predicates\n");
    exit(-1);
    break;
  }
}

void PFORMULA::collect(TERM Term, sethash *counted, int val) {
  if (Term->Type == predicate || Term->Type == function) {
    if (Term->Type == function) {
      SYMBOLNODE s = Term->TheSymbol.NonVariable;
      if (counted == NULL || counted->insert(s).second == true) {
        symbols.add(s, val);
      }
    }
    for (int index = 0; index < Term->TheSymbol.NonVariable->Arity; index++)
      collect(Term->Arguments[index], counted, val);
  } else if (Term->Type == variable) {
    variables.add(Term->TheSymbol.Variable->VariableName, 1);
  }
}

//=====================================================================

void COLLECTOR::add(SYMBOLNODE s, double quantity) {
  ihash i = data.find(s);
  if (i == data.end()) {
    data[s] = quantity;
    unique++;
  } else {
    i->second += quantity;
  }
  total += quantity;
}

void COLLECTOR::set(SYMBOLNODE s, double value) {
  ihash i = data.find(s);
  if (i == data.end()) {
    data[s] = value;
    unique++;
    total += value;
  } else {
    total = total - i->second + value;
    i->second = value;
  }
}

//=====================================================================

void FORMULA_PAIR::formulaWeightInterBySource(PFORMULA *context, PFORMULA* selected) {
  left = right = 0;
  for (ihash j = f->symbols.data.begin(); j != f->symbols.data.end(); j++) {
	//in f and g
    if (g->symbols.data.find(j->first) != g->symbols.data.end()) {
      //right.push_back(context->symbols.data[j->first]);
      right += context->symbols.data[j->first];
//      cout << "% right = " << right << endl;
    } else {	//in f but not in g
      left += context->symbols.data[j->first];
      //left.push_back(context->symbols.data[j->first]);
//      cout << "% left = " << left << endl;
    }
  }
//  cout << endl;
}

void FORMULA_PAIR::formulaWeightInterByUnion (PFORMULA* context, PFORMULA* selected) {
  formulaWeightInterBySource(context);
  for (ihash j = g->symbols.data.begin(); j != g->symbols.data.end(); j++)
	//in g but not in f
    if (f->symbols.data.find(j->first) == f->symbols.data.end())
      left += context->symbols.data[j->first];    
}

//puts universals into intersection, rest in union. will put 1 for each
//var OR the contextual fraction (depends how the rest is handled)
void FORMULA_PAIR::variableWeightUniversalIntersection(PFORMULA* context) {
  double fiu = f->uniquevars;
  double fju = g->uniquevars;
  double diff = fabs((double)fiu - (double)fju);
  double same = ((double)fiu + (double)fju - diff) / 2.0;
  double coeff = context->uniquevars;
  right += same * coeff;
  left += same * (1 - coeff) + diff;
  //right.push_back(same * coeff);
  //left.push_back(same * (1 - coeff) + diff);
}

void FORMULA_PAIR::variableWeightUniversalUnion() {
  //left.push_back((double)f->uniquevars + (double)g->uniquevars);
  left += (double)f->uniquevars + (double)g->uniquevars;
}

//returns sum of left divided by sum of right
double FORMULA_PAIR::similarityByRatio(double defaultRelevance) {
/*
  double denominator = 0, numerator = 0;
  unsigned int ls = left.size();
  unsigned int rs = right.size();
  for (unsigned int i = 0; i < ls; i++) denominator += left[i];
  for (unsigned int i = 0; i < rs; i++) numerator += right[i];
  denominator += numerator;
*/ 
  if (left + right == 0) return defaultRelevance;
  return right/(left + right);
/*
  //  cout << "num: " << numerator << " / den: " << denominator << endl;
  if (denominator == 0) return defaultRelevance;
  return numerator/denominator;
*/
}

//=====================================================================
RelevanceMatrix::~RelevanceMatrix() {
  if (relevance) {
    for (int i = 0; i < size; i++)
      free(relevance[i]);
    free(relevance);
  }
  if (irelevance) {
    for (int i = 0; i < size; i++)
      free(irelevance[i]);
    free(irelevance);
  }

  delete [] next;
  delete [] cluster;
  delete [] center;
  delete [] cluster_size;

}

double **RelevanceMatrix::createArray() {
  double **temp = (double **) malloc(sizeof(double*)*size);
  for(int i = 0; i<size; i++) temp[i] = (double *) malloc(sizeof(double)*size);
  return temp;
}

RelevanceMatrix::RelevanceMatrix(int size) : size(size) {
  //0. initialize all the variables
  relevance = NULL;
  irelevance = NULL;

  next = new int[size];
  cluster = new int[size];
  center = new double[size];
  cluster_size = new int[size];

  for (int i = 0; i < size; i++) {
    cluster_size[i] = 0;
    cluster[i] = 0;
    center[i] = 0;
  }
}

void RelevanceMatrix::computeDirect(vector<PFORMULA *> &formulae, 
			       PFORMULA*context, char* dirOpt, char* varOpt) {
  
  relevance = createArray();

  intVarOpt = 0;
  if (varOpt == NULL)
    intVarOpt = 0;
  else if (strcmp(varOpt, "similar")==0)
    intVarOpt = 1;
  else if (strcmp(varOpt, "unique")==0)
    intVarOpt = 2;

  intDirOpt = 0;
  if (strcmp(dirOpt, "union")==0)
     intDirOpt = 1;
  else if (strcmp(dirOpt, "source")==0)
     intDirOpt = 2;
  else if (strcmp(dirOpt, "JiaSource")==0)
     intDirOpt = 3;

  //2. compute weight of symbols in both formulas using the designated function
  //   use designated similarity function to compute direct relevance
  FORMULA_PAIR fp;
  for (int i = 0; i < size; i++) {
    fp.f = formulae[i];
    for (int j = 0; j < size; j++) {
      //relevance of formula to itself is always 1
      if (i == j) {
	relevance[i][j] = 1;
	continue;
      }
      relevance[i][j] = computeSingleDirect(formulae[i], formulae[j], context);
/*
      fp.g = formulae[j];
      fp.left = fp.right = 0;
      //fp.left.clear();
      //fp.right.clear();
      
      //factor in variables
      switch (intVarOpt) {
      case 1: fp.variableWeightUniversalIntersection(context);
	      break;
      case 2: fp.variableWeightUniversalUnion();
	      break;
      default: ;
      }
      
      //factor in symbols
      switch (intDirOpt) {
      case 1: 
	fp.formulaWeightInterByUnion(context);
 	break;
      case 2:
	fp.formulaWeightInterBySource(context);
	break;
      case 3: break;
      default: ;
      }
      relevance[j][i] = fp.similarityByRatio(0);      
*/
    }
  }
}

double RelevanceMatrix::computeSingleDirect(PFORMULA* f1, PFORMULA* f2, PFORMULA* context, PFORMULA* selected) {
  FORMULA_PAIR fp;
  fp.f = f1;
  fp.g = f2;
  fp.left = fp.right = 0;
  //factor in variables
  switch (intVarOpt) {
  case 1: fp.variableWeightUniversalIntersection(context);
    break;
  case 2: fp.variableWeightUniversalUnion();
    break;
  default: ;
  }
  //factor in symbols
  switch (intDirOpt) {
  case 1: 
    fp.formulaWeightInterByUnion(context, selected);
    break;
  case 2:
    fp.formulaWeightInterBySource(context, selected);
    break;
  case 3: break;
  default: ;
  }
  return fp.similarityByRatio(0);      
}

//computes indirect connection of every formula to every formula
void RelevanceMatrix::computeIndirect(char* options) {
  int steps[size];
  int UnMarked[size];
  irelevance = createArray();

  int rel_type;
  switch (options[0]) {
  case 'k': rel_type = 1; break;
  case 'm': rel_type = 2; break;
  case 'p': rel_type = 3; break;
  }
    
  for (int seed = 0; seed < size; seed++) {
    ///    cout << "Seed : " << seed << endl;
    for (int i = 0; i < size; i++) {
      next[i] = -1;
      steps[i] = 1;
      UnMarked[i] = i;
    }

    int Marked[size], last_marked = 0, cur_steps = 1, stored_index, M;
    int stored_loc;
    double stored_ratio;
    //the "core" is the formula at index seed. also, the 'seed' row is the
    //location where indirect relevance to this "core" is stored"
    Marked[0] = seed;
    next[seed] = -2;
    UnMarked[seed] = UnMarked[size-1];

    //set relevance of the core to itself to 1 (important for dijkstra!)
    irelevance[seed][seed] = 1;
    double cur_dist;
    int unmarked_left = size - 1;

    //building a graph and finding Dijkstra's path to core formulas
    do {
      stored_index = -1;
      stored_ratio = -1;
      stored_loc = -1;
      M = Marked[last_marked];
      double irsm = irelevance[seed][M];
      for (int unmarked_loc = 0; unmarked_loc < unmarked_left; unmarked_loc++){
	int unmarked = UnMarked[unmarked_loc];
	switch (rel_type) {
	case 1:  
	  cur_steps = steps[M] + 1;
	case 2: 
	  if (relevance[unmarked][M] < irsm)
	    cur_dist = relevance[unmarked][M];
	  else
	    cur_dist = irsm;
	  //if newly proposed distance is better, choose it
	  if (irelevance[seed][unmarked]/(double)steps[unmarked] < 
	      cur_dist/(double)cur_steps) {
	    irelevance[seed][unmarked] = cur_dist;
	    steps[unmarked] = cur_steps;
	    next[unmarked] = M;
	  }
	  break;
	case 3: 
	  cur_dist = relevance[unmarked][M] * irsm;
	  //if newly proposed distance is better, choose it
	  if (irelevance[seed][unmarked] < cur_dist) {
	    irelevance[seed][unmarked] = cur_dist;
	    steps[unmarked] = 1;
	    next[unmarked] = M;
	  }
	}	
	//if the new-found path is longest of the found so far, remember it
	if (stored_ratio < irelevance[seed][unmarked]/(double)steps[unmarked]){
	  stored_index = unmarked;
	  stored_loc = unmarked_loc;
	  stored_ratio = 
	    irelevance[seed][stored_index]/(double)steps[stored_index];
	}
      }
      //mark the best so far as 'accepted'
      if (stored_index > -1) {
	Marked[++last_marked] = stored_index;
	unmarked_left--;
	UnMarked[stored_loc] = UnMarked[unmarked_left];
	//	if (seed == size - 1) {
	//	  cout << "storing " << stored_index << " with " << next[stored_index] << "  rel: " << irelevance[seed][stored_index] << "  and steps: " << steps[stored_index] << endl;
	//	}
      }
    } while (last_marked + 1 < size);
    
    //calculate the final relevance from the graph
    for (int i = 0; i < size; i++) {  
      if (next[i] == -2) continue;
      //the formula is in core, 1.00 by default
      double rel, temp_rel;
      int steps = 0;
      switch (options[1]) {
      case 'k': case 'p': case 'm': rel = 1; break;
      default: rel = 0;
      }
      int closest = i;
      while (next[closest] > -1) {      
	steps++;
	temp_rel = relevance[closest][next[closest]];
	switch (options[1]) {
	  //maximum
	case 'x':if (rel < temp_rel) rel = temp_rel;
	  break;
	  //minimum by distance
	case 'k':
	  //minimum
	case 'm':if (rel > temp_rel) rel = temp_rel;
	  break;
	  //product
	case 'p': rel *= temp_rel;
	  break;
	  //norm
	case 'n': rel += pow(temp_rel, 2);
	  break;
	  //first relevance
	case 'f':
	  //distance
	case 'd': if (rel == 0) rel = temp_rel;
	  break;
	}
	closest = next[closest];
      }
      //there is no path to the core, the formula is completely detached
      if (next[closest] == -1) {
	irelevance[seed][i] = 0;      
	continue;
      }
      if (steps == 0) steps = 1;
      switch (options[1]) {
      case 'n': 
	irelevance[seed][i] = sqrt(rel)/sqrt((double)2.9);
	continue;
      case 'k':
      case 'd': 
	irelevance[seed][i] = rel/(double)steps;
	continue;
      case 'f':
	//	if (seed == size - 1)
	//	  cout << "ass " << i << " -- " << rel << endl;
	irelevance[seed][i] = rel;	
	continue;
      default:
	irelevance[seed][i] = rel;
      }
    }
  }

}

void RelevanceMatrix::computeInnerProduct() {
  irelevance = createArray();
  double biggest = 0;
  for (int i = 0; i < size; i++) {
    irelevance[i][i] = 1;
    for (int j = i+1; j < size; j++) {     
      irelevance[j][i] = computeSingleInnerProductRaw(i, j);
      irelevance[i][j] = computeSingleInnerProductCol(i, j);
      if (i !=j && irelevance[i][j] > biggest) biggest = irelevance[i][j];
      if (i !=j && irelevance[j][i] > biggest) biggest = irelevance[j][i];
    }
  }
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      if (i != j) irelevance[i][j] /= biggest;
//      cout << relevance[i][j] << " " << irelevance[i][j] << endl;
    }
  }
//  cout << "----" << endl;
}

double RelevanceMatrix::computeSingleInnerProductRaw(int r1, int r2) {
  double res=0;
  for (int i = 0; i < size; i++)
    res += relevance[r1][i] * relevance[r2][i];
  return res;
}
double RelevanceMatrix::computeSingleInnerProductCol(int c1, int c2) {
  double res=0;
  for (int i = 0; i < size; i++)
    res += relevance[i][c1] * relevance[i][c2];
  return res;
}


/*
  1. cluster formulas
  2. if number of clusters is too small or too big, change threshhold, loop
  3. sort formulas by formula number
*/
void RelevanceMatrix::computeClusters(int targetClusters){
  int prevClusters = -1;
  double storeRES = 100, storeMRR = 0;
  double RES = 1;    //Required Edge Strenght
  double MRR = 0.05; //Maximal Relevance Range

  //loop until currentClusters is targetClusters or it is same as prev step.
  int clusterNumber;
  double X = 0.0;
  do {
/*    cout << "RES: " << RES << " MRR: " << MRR << " simulation: " \
	 << (1.0 - RES)/2.0 << "   Clusters: " << clusterNumber << endl;
*/
    for (int i = 0; i < size; i++)
      cluster[i] = -1;
    clusterNumber = formClusters(size - 1, RES, MRR);
    if (prevClusters == -1 || 
	(prevClusters > clusterNumber && clusterNumber != 1 && clusterNumber >= targetClusters)) {
      prevClusters = clusterNumber;
      storeRES = RES;
      storeMRR = MRR;
    }
    X += 0.1;
    RES = pow(M_E, -X);
 //   MRR += 0.025;
 //  MRR += 0.0040;
 //   MRR += 0.0070;
   MRR += 0.0010;
  } while (clusterNumber > targetClusters && MRR <= 1 && RES >= 0 && X < 3.0);
  //after finished, recluster using best values of RES and MRR
  RES = storeRES;
  MRR = storeMRR;
/*
  RES = 0.000001;
*/
  for (int i = 0; i < size; i++) 
    cluster[i] = -1;
  formClusters(size - 1, RES, MRR);
}

int RelevanceMatrix::formClusters(int seedFormula, double RES, double MRR) {
  cluster[seedFormula] = 1;
  int clusterNumber = 1;
  //stores unclustered members of the latest cluster under construction
  multimap<int, int> degreeMemory;
  for(int i = 0; i < size; i++) {
    if (i == seedFormula)
      continue;
    int dm = 0;
    for (int j = 0; j < size; j++) {
      if (ilinked(j, i, RES))
	dm++;
    }
    degreeMemory.insert(make_pair(dm, i));
  }
//  for (map<int, int>::iterator i = degreeMemory.begin(); i != degreeMemory.end(); i++)
//   cout << i->first << " " << i->second  << endl;
  //latest cluster data
  int currentCluster[size];
  int currentClusterSize = 1;
  double currentClusterVolume = 1;
  double currentClusterCenter = 1;
  currentCluster[0] = seedFormula;
  //loop until no more clusters can be created
  for (int clustered = 1; clustered < size; ) {
    //    cout << "clustered: " << clustered << endl;
    map<int, int>::iterator i = degreeMemory.end();
    i--;
//    cout << "best degree ---" << i->first << " (node: " << i->second << ")" << endl;
//    for (map<int, int>::iterator i = degreeMemory.begin(); i != degreeMemory.end(); i++)
//      cout << i->first << " " << i->second  << endl;
    bool formedClique = false;
    int safe_i = degreeMemory.size() - 1;
    //loop while there are nodes of uppermost degree
    for (int bestDegree = i->first; bestDegree == i->first, safe_i > -1;
	 i--, safe_i--) {
//      cout << "<<< " << i->second << " >>>" << endl;
      //if it is too far from current cluster center, drop it
      //conservative approach - not members -> center, but center -> members
      double i_to_seed_direct =  irel(i->second);
//      cout << i_to_seed_direct << endl;
      if (currentClusterSize > 0 &&
	  (i_to_seed_direct > currentClusterCenter + MRR ||
	   i_to_seed_direct < currentClusterCenter - MRR)) {
//	cout << "skipped on MRR " << i_to_seed_direct << endl;
	continue;
      }
      //if this one forms clique with current cluster - exit. its good.
      formedClique = true;
      for (int j = 0; j < currentClusterSize; j++) {
        if (!ilinked(currentCluster[j], i->second, RES)) {
//	  cout << i->second << " (" << i->first << ") " << " didnt formed clique with " << clusterNumber << endl;
	  formedClique = false;
	  break;
	}
      }
      if (formedClique || i == degreeMemory.begin())
	break;
    }
//    cout << "done looping " << safe_i << endl;
    if (formedClique) {
//      cout << "formed "<< i->second << " " << i->first << endl;
//      cout << "put " << i->second << " into " << clusterNumber << endl;
      cluster[i->second] = clusterNumber;
      clustered++;
      currentCluster[currentClusterSize] = i->second;
      currentClusterSize++;
      currentClusterVolume += irel(i->second);
      currentClusterCenter = currentClusterVolume / (double)currentClusterSize;
      degreeMemory.erase(i);
    } else {
//      cout << "c size: " << currentClusterSize << endl;
      currentClusterSize = 0;
      currentClusterVolume = 0;
      currentClusterCenter = 0;
      clusterNumber++;
    }
  }
  return clusterNumber;
}
