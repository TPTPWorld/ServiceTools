//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
  /* File - CLayout.cpp
   * Author - Steven C. Trac
   * Description - 
   *   Input: file name
   *   Output: stdout of svg
   */
//*****************************************************************************
#include "IDNode.h"
#include "IDGraph.h"
#include "PrintSVG.h"
#include "JJHeaders.h"

int DEFAULT_TIME_LIMIT = 600;

int main (int argc, char*argv[]) {  

  int OptionChar;
  int timelimit = -1;
  bool svg = false;

  LISTNODE Head;  
  SIGNATURE Signature;

  // check opts
  while ((OptionChar = getopt(argc,argv,"st:h")) != -1) {
    switch (OptionChar) {
    case 's':
      svg = true;
      break;
    case 't':
      timelimit = atoi(optarg);
      break;
    case 'h':
    case '?':
      cout << "Usage: " << argv[0] << "<options> <derivation file" << endl;
      cout << "<options> are ..." << endl;
      cout << "-s             - svg output" << endl;
      //      cout << "-t<time limit> - CPU limit for discharge attempts (" << DEFAULT_TIME_LIMIT << ")" << endl;
      cout << "-h             - print this help" << endl;
      cout << "<derivation file> is ... (--)" << endl;
      cout << "  Any normal file name" << endl;
      cout << "  -- for stdin" << endl;
      exit(EXIT_FAILURE);
      break;
    default:
      cout << "ERROR: Something wrong in getopt" << endl;
      exit(EXIT_FAILURE);
      break;
    }
  }

  //----Read from file or stdin
  Signature = NewSignature();
  SetNeedForNonLogicTokens(0);
  if (argv[optind] != NULL) {
    Head = ParseFileOfFormulae(argv[optind],NULL,Signature,1,NULL);
  } else {
    Head = ParseFILEOfFormulae(stdin,Signature,1,NULL);
  }

//----Remove nodes with type role
  LISTNODE * Target;
  LISTNODE Destroy;
  Target = &Head;
  while (*Target != NULL) {
    if (GetRole((*Target)->AnnotatedFormula,NULL) == type) {
        Destroy = *Target;
        *Target = (*Target)->Next;
        FreeAListNode(&Destroy);
    } else {
        Target = &((*Target)->Next);
    }
  }

  /*
  FILE *file = fopen("testfile", "w");
  PrintListOfAnnotatedTSTPNodes(file,Signature,Head,tptp,1);
  PrintListOfAnnotatedTSTPNodes(stdout,Signature,Head,tptp,1);
  */
  
  
  //  time_t before, after, difference;
  //  before = time(NULL);
  //  cout << "time before: " << before << endl;

  IDGraph *idv = new IDGraph(Head);

  //  after = time(NULL);
  //  cout << "time after: " << after << endl;
  //  difference = after - before;
  //  cout << "diff: " << difference << endl;



  //  ofstream out1("out1.svg");
  //  ofstream out2("out2.svg");
  //  idv->SVGPrintGraph(out1);
  //  idv->SVGPrintGraph(out2);

  //ofstream out("a.out");
  //idv->printGraph(out);
  if (svg) {
    idv->SVGPrintGraph(std::cout);
  } else {
    idv->printGraph(std::cout);
  }

  // work on freeing memory and memory leak checking later
  delete idv;
  FreeListOfAnnotatedFormulae(&Head);
  FreeSignature(&Signature);

  return(EXIT_SUCCESS);
}
