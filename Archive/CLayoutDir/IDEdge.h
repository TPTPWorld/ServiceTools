//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
#ifndef IDEDGE_H
#define IDEDGE_H
//*****************************************************************************
  /*****
   * File - IDEdge.h
   * Author - Steven C. Trac
   * Description - 
   *   IDV Graph Edges file
   *****/
//*****************************************************************************
#include <math.h>
#include <vector>
using namespace std;
//*****************************************************************************
class IDEdge;
//*****************************************************************************
typedef IDEdge * IDEDGE;
typedef vector<IDEDGE> IDEdgeList;
//*****************************************************************************
#include "IDNode.h"
#include "Point.h"
//*****************************************************************************

class IDEdge {
 private:
  IDNode *tail, *head; // tail ---> head (upward)

 public:
  IDEdge (IDNode *tail, IDNode *head): tail(tail), head(head) {}
  ~IDEdge () {
    tail = NULL;
    head = NULL;
  }
  IDNODE getTail () { return tail; }
  IDNODE getHead () { return head; }

  double angle (const Point &gforce);
  double sign (const Point &gforce);

};

//*****************************************************************************
#endif
//*****************************************************************************
//*****************************************************************************
