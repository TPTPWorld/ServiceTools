#include "prophet.h"

  QE::QE(vector<PFORMULA*> &formulae, PFORMULA* presence) {
    //for each term in context, compute it's QE
    maphash &data = presence->symbols.data;
    for (ihash j = data.begin(); j != data.end(); j++)
      tqe[j->first] = TQE(formulae, j->first, presence);    
    for (int i = 0; i < formulae.size(); i++) {
      fqe[formulae[i]] = FQE(formulae[i]->symbols);
    }
  }

  double QE::compare(SYMBOLNODE s1, SYMBOLNODE s2) {
    return innerProduct(tqe[s1], tqe[s2]);
  }

  double QE::innerProduct(COLLECTOR* c1, COLLECTOR* c2) {
    maphash &cd1 = c1->data;
    maphash &cd2 = c2->data;
    double res= 0;
    for (ihash j = cd1.begin(); j != cd1.end(); j++) {
      ihash i = cd2.find(j->first);
      if (i != cd2.end()) res += i->second * j->second;
    }
    return res;
  }

  double QE::compare(PFORMULA* f1, PFORMULA* f2, PFORMULA * context) {    
 
    maphash &fdata = f1->symbols.data;
    maphash &gdata = f2->symbols.data;
    //return l2(all) / l2(1-all)
    double totalmin = 0;
    double totalmax = 0;
    double totalave = 0;
    vector <double> interes(gdata.size(), 0);
    double simplemax = 0;    
    for (ihash i = fdata.begin(); i != fdata.end(); i++) {      
      double min = 1;
      double max = 0;  
      int ind = 0;
      //not good (may be affected by countOnce parameter). need
      //to either make sure it doesn't or compute presence/presence.total
      double r1 = context->symbols.data[i->first];
//      cout << "% " << i->first->NameSymbol << endl;
      for (ihash j = gdata.begin(); j != gdata.end(); j++, ind++) {      
//        cout << "% TO: " << j->first->NameSymbol << endl;
        double enrpos = i->second / (i->second + j->second);
        double enrneg = j->second / (i->second + j->second);
	double entropy = -(enrpos * log10(enrpos)/log10(2.0) +
			   enrneg * log10(enrneg)/log10(2.0));
        double r2 = context->symbols.data[j->first];
        double ratio = j->second / f2->symbols.total;	//should be .unique
//        double res = ratio * compare(i->first, j->first);
	double comp = compare(i->first, j->first);
	double res = r1 * entropy * comp;
//        cout <<"% " << entropy << " * " << r1 << " * " << comp << " = " << res << endl;
	interes[ind] += res;
        if (res > max) max = res;
        if (res < min) min = res;
      } 
      simplemax += max;
//      cout << "% simplemax: " << simplemax << endl;
      totalmax += (1-max)*(1-max);
      totalmin += min*min;
    } 
/*
    int ind = 0;
    double res = 0;
    cout << " --- " << endl;
    for (ihash i = fdata.begin(); i != gdata.end(); i++, ind++) {      
      res += interes[ind] * i->second / f1->symbols.total;
      cout << "res = " << res << endl;
    }
    return res / f2->symbols.total;
*/
    return simplemax /  f1->symbols.unique;
//    if (totalmax < 0.00001) return 1;
//    return sqrt(totalmin) / sqrt(totalmax);

/*
    //normalize vector of relationship of each symbol to target; take centroid
    //normalize vector of centroids; take centroid;
    double sum = 0, s = 0;
    double max = 0;
    for (ihash i = fdata.begin(); i != fdata.end(); i++) {      
      for (ihash j = gdata.begin(); j != gdata.end(); j++) {      
        double res = compare(i->first, j->first);
        if (res > max) max = res;
      } 
      s += max;
    } 
    return s / fdata.size();
*/
//    return innerProduct(fqe[f1], fqe[f2]);    
  }

  COLLECTOR* QE::FQE(COLLECTOR &sfdata) {
    maphash &fdata = sfdata.data;
    COLLECTOR* formQE = new COLLECTOR();
    for (ihash j = fdata.begin(); j != fdata.end(); j++) {      
      COLLECTOR* ft = tqe[j->first];
      double ratio = j->second / sfdata.total;  //FIX:: try with .unique 
						//also try global frequency
      for (ihash i = ft->data.begin(); i != ft->data.end();i++)
        formQE->add(i->first, i->second * ratio);
    }
    double Fsize = fdata.size();
    double L2 = 0;
    for (ihash j = formQE->data.begin(); j != formQE->data.end(); j++) {      
      j->second = j->second / Fsize;
      L2 += pow(j->second, 2);
    }
    L2 = sqrt(L2);
    for (ihash j = formQE->data.begin(); j != formQE->data.end(); j++) {
      j->second /= L2;
    }
    return formQE;
  }

  COLLECTOR* QE::TQE(vector<PFORMULA*> &formulae, SYMBOLNODE s, PFORMULA* presence){
    COLLECTOR* termQE = new COLLECTOR();
    //find all formulae with j
    int Fsize = 0;
    for (int i = 0; i < formulae.size(); i++){
      maphash &fdata = formulae[i]->symbols.data;
      if (fdata.find(s) != fdata.end()) {
	Fsize++;
	//create an array, normalize it, add to C(q) array
	COLLECTOR v;
	//adding frequency of t in f
	double N = (double) formulae.size();
	for (ihash k = fdata.begin(); k != fdata.end(); k++) {
          double dfi = presence->symbols.data.find(k->first)->second;
  	  v.add(k->first, (k->second/formulae[i]->symbols.total)*log10(N/dfi));
//  	  v.add(k->first, k->second/formulae[i]->symbols.total);
        }          
	//add here multiplication by log(N/dfi)
	
	//compute L2 normalization
	double L2 = 0;
	for (ihash k = v.data.begin(); k != fdata.end(); k++) {
	  L2 += pow(k->second, 2);
	}
	L2 = sqrt(L2);
	//normilize with L2 and add to C(q)
	for (ihash k = v.data.begin(); k != fdata.end(); k++) {
	  termQE->add(k->first, k->second / L2);
	}	  
      }	
    }
    //cetroid of each symbol in this set + normalize L2
    double L2 = 0;
    for (ihash k = termQE->data.begin(); k != termQE->data.end(); k++) {
      k->second = k->second / Fsize;
      L2 += pow(k->second, 2);
    }
    L2 = sqrt(L2);
    for (ihash k = termQE->data.begin(); k != termQE->data.end(); k++) {
      k->second = k->second / L2;
    }
    return termQE;
  }


//-------------------------------------------------------------------

void PROPHET::StorUsefullData(ANNOTATEDFORMULA f, int j) {
  char irel[100];
  char iclst[300];
  //FIX: finalClusters is total # of clusters - get it
  int finalClusters = 0;
  if (matrix->irelevance != NULL) {
    sprintf(irel, "relevance(%.2f)", matrix->irel(j));
    AddUsefulInformationToAnnotatedFormula(f,Signature,irel); 
  }
  sprintf(iclst,"cluster(%d, %.2f, %d, %d)", matrix->cluster[j],
	  matrix->center[j], matrix->cluster_size[j], finalClusters);
  AddUsefulInformationToAnnotatedFormula(f,Signature,iclst);
}

void PROPHET::PrintFormulae() {
  //storing final information
  for (unsigned i = 0; i < formulae.size(); i++)
    for (unsigned j = 0; j < formulae[i]->list.size(); j++) {
      ANNOTATEDFORMULA f = formulae[i]->list[j];
      StorUsefullData(f, i);
      PrintAnnotatedTSTPNode(stdout,f,tptp,1);
    }
}

PROPHET::PROPHET(FILE* fp, bool countOnce, int modification, 
		 bool includeHypothesis) {
  //parse the file and retrieve basic symbol information
  Signature = NewSignature();
  READFILE Stream = new ReadFile;
  InitializeStream(Stream);
  Stream->FileHandle = fp;
  PFORMULA* core = new PFORMULA();
  context = new PFORMULA();
  presence = new PFORMULA();
  coreSize = 0;
  finalClusters = 0;
  while(!CheckTokenType(Stream, endeof)) {
    if (!Stream->FileHandle) continue;       
    ANNOTATEDFORMULA f = ParseAndUseAnnotatedFormula(Stream, Signature);
    annotatedFormulae.push_back(f);
    if (f->Syntax != tptp_fof && f->Syntax != tptp_cnf)
      continue;
    StatusType st = f->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Status;
    if ((includeHypothesis && st == hypothesis) || 
	st == conjecture || st == negated_conjecture) {      
      core->add(f);
      coreSize++;
    } else {
      formulae.push_back(new PFORMULA(f));
      presence->add(f, countOnce);
    }
  }
  //modifying context 
  this->modification = modification;
  this->countOnce = countOnce;
  if (modification > 0)
    updateContext();
  formulae.push_back(core);
  matrix = new RelevanceMatrix(formulae.size());
  delete Stream;
}

void PROPHET::updateContext() {
    double ratio;
    if (countOnce)
      ratio = formulae.size();
    else
      ratio = presence->symbols.total;
    maphash &data = presence->symbols.data;
    double biggest = 0;
    for (ihash j = data.begin(); j != data.end(); j++) {
      double newratio = ((double)j->second / (double)ratio);
      if (modification == 1) {			//applyRatio
	context->symbols.set(j->first, 1 - newratio);
	if (1-newratio > biggest) biggest = 1-newratio;
      } else if (modification == 2) {		//applyLOG
	context->symbols.set(j->first, -log10(newratio));
      } else if (modification == 3) { 		//applyJiaLOG
	context->symbols.set(j->first, 1.0 + 2.0 / log10(j->second + 1));
      }
    }
/*
    if (modification == 1) {
      biggest = 1,0 / biggest;
      for (ihash j = data.begin(); j != data.end(); j++)
	context->symbols.set(j->first, j->second * biggest);
    }
*/
}

PROPHET::~PROPHET() {
  delete context;
  delete presence;
  for (unsigned j = 0; j < annotatedFormulae.size(); j++)
    FreeAnnotatedFormula(&annotatedFormulae[j]);
}
  
void PROPHET::compute(char* dirOpt, char* varOpt, char* rankerOpt) {
  //compute the relevance matrices
  matrix->computeDirect(formulae, context, dirOpt, varOpt);
  //cout << "composing indirect relevance" << endl;
  if (rankerOpt != NULL)
    matrix->computeIndirect(rankerOpt);
}

void PROPHET::clusterDirectly(int targetClusters){
  matrix->computeClusters(targetClusters);
  vector<int> clusterSize;		//clusterSize[i] == size of cluster i
  vector<double> clusterWeight;
  int size = matrix->size;
  for (unsigned i = 0; i < size; i++) {
    //count how many members in each cluster, and the weight of the cluster
    if (matrix->cluster[i] > clusterSize.size()) {
      clusterSize.resize(matrix->cluster[i], 0);
      clusterWeight.resize(matrix->cluster[i], 0);
    }
    //don't cont core as a formula (added later)
    if (i < size - 1) {
      clusterSize[matrix->cluster[i] - 1] += 1;
      clusterWeight[matrix->cluster[i] - 1] += matrix->irelevance[size-1][i];
    }
  }
  //modifing last cluster - adding size and weight of core
  clusterSize[matrix->cluster[size-1] - 1] += coreSize;
  clusterWeight[matrix->cluster[size -1] - 1] += coreSize;
  //  cout << "CCS: " << clusterWeight[graph[size - 1].cluster - 1] << endl;
  //assigning each formula it's cluster size and cluster center
  for (int i = 0; i < size; i++) {
    matrix->cluster_size[i] = clusterSize[matrix->cluster[i] - 1];
    matrix->center[i]= clusterWeight[matrix->cluster[i]-1]/matrix->cluster_size[i];
  }
  finalClusters = clusterSize.size();
}

void PROPHET::clusterGoogle() {
  //adding to presence missing symbols from the 'core'
  for (unsigned j = 0; j < formulae.back()->list.size(); j++) {      
    ANNOTATEDFORMULA f = formulae.back()->list[j];
    presence->add(f, true);
  }
  //creating table of symbols  
  maphash &data = presence->symbols.data;
  QE ce(formulae, presence);
  for (ihash j = data.begin(); j != data.end(); j++) {
    for (ihash i = data.begin(); i != data.end(); i++) {
	cout << j->first->NameSymbol << " " << i->first->NameSymbol << " " << ce.compare(j->first, i->first) << endl;
    }
  }
  for (unsigned i = 0; i < formulae.size(); i++) {
//    for (unsigned j = 0; j < formulae.size(); j++) { 
      int j = formulae.size() - 1;
      formulae[i]->print();
      formulae[j]->print();
      cout << "relevance: " << ce.compare(formulae[i], formulae[j], context) << endl << " ---- " << endl;
//    }
  }
}

void PROPHET::clusterGreedy(bool indirect) {
  double rr = 0.3;
  double p = 0.6;
  double c = 2.0;
  double KF = 1;
  //add conjecture to "New"
  bool changed ;  
  double av = 0;
  QE ce(formulae, presence);
  double biggest = 0;
  matrix->irelevance = matrix->createArray();
  for (int i = 0; i < matrix->size; i++) {
    for (int j = 0; j < matrix->size; j++) {
       matrix->irelevance[i][j] = -1;
    }
  }
// /*   --- turn this off for google opetation;
  if (indirect) {
    matrix->irelevance = matrix->createArray();
    for (int i = 0; i < matrix->size; i++) {
      for (int j = 0; j < matrix->size; j++) {
	//av += matrix->irelevance[i][j];
        //double res = ce.compare(formulae[i], formulae[j]);
        double res = matrix->relevance[i][j];
        matrix->irelevance[i][j] = res;
        if (res > biggest) biggest = res;
	//cout << biggest << endl;
	av += res;
      }
    }
/*
    av = 0; 
    for (int i = 0; i < matrix->size; i++) {
      for (int j = 0; j < matrix->size; j++) {
        matrix->irelevance[i][j] /= biggest;
        av += matrix->irelevance[i][j];
      }
    }
*/
    double el = matrix->size;
    el *= el;
    av /= el;
    cout << "% average: " << av << endl;
  }
// */

  double SF = av+0.15;
  rr = av+0.1;
  //rr = 0.6;
  //rr = (av + biggest) / 2.0;
  cout << "%rr: " << rr << " SF: " << SF << " KF: " << KF << endl;
  cout << "%biggest " << biggest << endl;
  
  PFORMULA* selected = new PFORMULA();
  for (int i = 0; i < matrix->size; i++)
    matrix->cluster[i] = 0; 
  matrix->cluster[matrix->size - 1] = 1;
  for (unsigned j = 0; j < formulae[matrix->size - 1]->list.size(); j++)
    selected->add(formulae[matrix->size - 1]->list[j]);
  
  String FormulaName;
  //		cout << "%  (j /\\ i) / j	(j /\\ i) / i" << endl;
  do {
    //	cout << "% P: " << p << endl;
    	cout << "% R: " << rr << endl;
    changed = false;
    for (int i = 0; i < matrix->size; i++) {
      if (matrix->cluster[i] > 0)
	continue;
      //computing relevance of i to core 
      if (indirect) {
	GetName(annotatedFormulae[i], FormulaName);
	//	cout <<"% " << i << " " << FormulaName << endl;
        for (int j = 0; j < matrix->size; j++) {
	  if (matrix->cluster[j] != 1)
	    continue;
	  /*
	    formulae[j]->print();
	    formulae[i]->print();
	    cout << "% direct " << matrix->relevance[j][i] << " " 
	    << matrix->relevance[i][j] << endl;
	    cout <<"% dynamic "<<matrix->link(formulae[j],formulae[i],context,selected) << " "
	    << matrix->link(formulae[i], formulae[j], context, selected) << endl;
	    cout <<"% indirect "<<matrix->irelevance[j][i]<<" "<<matrix->irelevance[i][j]<< endl;
            cout <<"% googlish "<<ce.compare(formulae[i], formulae[j]) << endl; 
	    cout << endl; 
	  */
	  
	  //	  if (matrix->link(formulae[j], formulae[i], context, selected) * KF >= rr ||	 //(j/\i)/j
	  //	      matrix->link(formulae[i], formulae[j], context, selected) * SF >= rr) {	 //(j/\i)/i
	  //if ((matrix->relevance[i][j] * SF >= rr ||
	  //     matrix->relevance[j][i] * KF >= rr)) {	//1-p
	  //	    cout << "% passed!" << endl;
	  if (matrix->irelevance[i][j] * SF >= rr ||
	      matrix->irelevance[j][i] * KF >= rr) {           
          //if (ce.compare(formulae[i], formulae[j]) >= rr ||
/*   <<<--- this portion is how it should be for google option
	  if (matrix->irelevance[i][j] == -1)
 	    matrix->irelevance[i][j] = ce.compare(formulae[i], formulae[j], context);
	  if (matrix->irelevance[i][j] >= rr) {
*/
	      //matrix->relevance[j][i] >= rr) {
	    matrix->cluster[i] = 2;
	    break;
          }
	}
      } else {
        FORMULA_PAIR fp(formulae[i], formulae.back());
        fp.formulaWeightInterBySource(context);
	matrix->cluster[i] = 2 * (p <= fp.similarityByRatio(0));
      }
    }
    int sel = 0;
    for (int i = 0; i < matrix->size; i++)
      if (matrix->cluster[i] == 2) {
	sel++;
	//New == VNew
	changed = true;
	matrix->cluster[i] = 1;
	for (unsigned j = 0; j < formulae[i]->list.size(); j++) {
	  if (indirect) {
            //update context - remove the formula (uncomment for dynamic version)
	    presence->remove(formulae[i]->list[j]);
	    selected->add(formulae[i]->list[j]);
	    updateContext();
          } else {
	    //merge the newly chosen formula with the target group
	    formulae.back()->add(formulae[i]->list[j]);
          }
        }
      }
    cout << "% selected: " << sel << endl;
    p = p + (1.0-p) / c;
    rr = 1 - (1.0-rr) / c;
  } while (changed);
  finalClusters = 2;
  int finalChosen=0;
  unsigned i;
  if (indirect) {
    i = 0;
  } else {
    i = matrix->size - 1;
  }
  for (; i < formulae.size(); i++) {
    if (matrix->cluster[i] == 0) 
      continue;    
    for (unsigned j = 0; j < formulae[i]->list.size(); j++) {      
      finalChosen++;
      ANNOTATEDFORMULA f = formulae[i]->list[j];
      StorUsefullData(f, i);
      PrintAnnotatedTSTPNode(stdout,f,tptp,1);
    }
  }
  cout << "% chosen " << finalChosen << " out of " << formulae.size() << endl;
}

int main(int argc, char *argv[]) { 
  /******************* analysing command line parameters ******************/
  //default - options 1
  char *file_name = NULL, *rankerOpt = "kdt", *varOpt = "ignore",
    *dirOpt = "source", *symbolsOpt = "join", *solutionFile = NULL,
    *weightOpt = "formula", *clusterOpt = "direct";
  char *modeOpt = "prophet";
  int targetClusters = 7;
  bool textDebug = false, graphDebug = false, fullg = false;
  
  bool countOnce = false;
  int modification = 1;
  bool includeHypothesis = true;
  bool useIndirect = true;
  for (int i = 1; i < argc; i++) {
    if (strcmp(argv[i], "-p")==0) { file_name = argv[++i]; continue; }
    if (strcmp(argv[i], "-i")==0) { rankerOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-v")==0) { varOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-d")==0) { dirOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-s")==0) { symbolsOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-w")==0) { weightOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-n")==0) { targetClusters = atoi(argv[++i]);continue;}
    if (strcmp(argv[i], "-c")==0) { clusterOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-m")==0) { modeOpt = argv[++i]; continue; }
    if (strcmp(argv[i], "-GRAPH")==0) { 
      solutionFile = argv[i++];
      graphDebug = true; 
      continue; 
    }
    if (strcmp(argv[i], "-FULLG")==0) { 
      solutionFile = argv[i++];
      graphDebug = true;
      fullg= true;
      continue;
    }
    if (strcmp(argv[i], "-TEXT")==0) { textDebug = true; continue; }
//----If none of those then it must be the filename
    file_name = argv[i];
  }

  if (strcmp(weightOpt, "formulaG")==0) {
    countOnce = true;
  } else if (strcmp(weightOpt, "formula")==0) {
    countOnce = true;
    modification = 1;		//     applyRatio = true;
  } else if (strcmp(weightOpt, "global")==0) {
    modification = 1;		//     applyRatio = true;
  } else if (strcmp(weightOpt, "flog") == 0) {
    countOnce = true;
    modification = 2;				//	applyLOG = true;
  }
  
  if (strcmp(modeOpt, "google")==0){
    countOnce = true;
    modification = 2;
  }

  if (strcmp(modeOpt, "jia")==0){
    countOnce = false;
    modification = 3;
    includeHypothesis = false;
    useIndirect = false;
    clusterOpt = "greedy";
  }
 
  if (strcmp(symbolsOpt, "split")==0 && strcmp(clusterOpt, "direct")==0) {
    cout << "Prophet 2.0. Predicting the future, for low fee." << endl;
    cout << "Look into prophet.man to find out how to talk to the Prophet."
       << endl << "Amen, brother." << endl;
    printf ("ERROR: '-s split' and '-c direct' cannot be used in conjunction\n");
    return 0;
  }

  if (file_name == NULL) {
    file_name = "--";
  }
  FILE * fp;
  if (!strcmp(file_name,"--")) {
    fp = stdin;
  } else {
    fp = fopen(file_name, "r");
  }
  if (fp == NULL) {
    cout << "Prophet 2.0. Predicting the future, for low fee." << endl;
    cout << "Look into prophet.man to find out how to talk to the Prophet."
       << endl << "Amen, brother." << endl;
    printf ("ERROR: the file \"%s\" does not exist, aborting\n", file_name);
    return 0;
  }

  
  //our implementation of relevance
  //cout << "reading..." << endl;
  PROPHET prophet(fp, countOnce, modification, includeHypothesis);
  fclose(fp);
  //cout << "% starting comparisons" << endl;
  if (useIndirect) 
    prophet.compute(dirOpt, varOpt, rankerOpt);
  cout << "% SZS status Success for " << file_name << endl;
  cout << "% SZS output start ListOfFormulae for " << file_name << endl;
  //clustering  
  if (strcmp(clusterOpt, "indirect")==0) {
    //prophet.clusterIndirectly(gSize, targetClusters);
    prophet.PrintFormulae();
  }
  else if (strcmp(clusterOpt, "direct")==0) {
    prophet.clusterDirectly(targetClusters);
    prophet.PrintFormulae();
  }
  else if (strcmp(clusterOpt, "greedy")==0) {
    prophet.clusterGreedy(useIndirect);
  } 
  else if (strcmp(clusterOpt, "google")==0) {
    //prophet.clusterGoogle();         
    prophet.clusterGreedy(useIndirect);      
  }
  cout << "% SZS output end ListOfFormulae for " << file_name << endl;
  
  return (EXIT_SUCCESS);

}
