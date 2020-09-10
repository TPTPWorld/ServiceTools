//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
#ifndef IDNODE_H
#define IDNODE_H
//*****************************************************************************
   /*****
   * File - IDNode.h
   * Author - Steven C. Trac
   * Description - 
   *   Interactive Derivation Graph Nodes
   *****/
//*****************************************************************************
#include <string>
#include <cstring>
#include <iostream>
#include <set>
#include <ext/hash_map>
#include <assert.h>
#include <math.h>
//*****************************************************************************
#include "JJHeaders.h"
//*****************************************************************************
using namespace std;
using __gnu_cxx::hash_map;
const size_t RND = 3608578767u;
//*****************************************************************************
class IDNode;
class HashA;
class IDNodeCompare {
public:
  bool operator() (IDNode *n1, IDNode *n2) const;
};
//*****************************************************************************
typedef IDNode * IDNODE;
typedef vector<IDNODE> IDNodeList;
typedef hash_map<HashA, IDNODE, HashA> IDNodeHashTable;
typedef set<IDNODE, IDNodeCompare> IDNodeSet;
//*****************************************************************************
#include "Point.h"
#include "IDEdge.h"
#include "PrintSVG.h"
#include "JJHeaders.h"
//*****************************************************************************
class IDNode {
private:
  double x;  // x coordinate of node
  double y;  // y coordinate of node
  bool virt; // virt is true of virtual node
  
  ANNOTATEDFORMULA formula;
  
  IDNodeList up;     // ancestor nodes
  IDNodeList down;   // descendant nodes
  int rank;          // rank of node
  int pos;           // pos of node inside a node list
  IDEdgeList edge;   // edge list up
  IDEdgeList r_edge; // edge list down
  IDNode *left, *right; // left and right of this node on a row

public:
  /** Constructor **/
  IDNode (ANNOTATEDFORMULA const &formula, int const &pos);
  IDNode (int const &rank, int const &pos);
  ~IDNode ();
  
  /** Accessor methods **/
  char * getID () { 
    if (virt) {
      return "V";
    }
    return formula->AnnotatedFormulaUnion.AnnotatedTSTPFormula.Name;
    //    String temp;
    //    return GetName(formula, temp); 
  }
  ANNOTATEDFORMULA getF () { return formula; }
  SyntaxType getType () { 
    if (virt) {
      return nontype;
    }
    return GetSyntax(formula); 
  }

  bool isRoot () { return down.empty(); }
  bool isVirtual () { return virt; }
  IDNodeList getUp () { return up; }
  IDNodeList getDown () { return down; }
  int getRank () { return rank; }
  bool hasRank () { return rank != -1; }
  IDEdgeList getEdge () { return edge; }
  IDEdgeList getREdge () { return r_edge; }
  int getPos () { return pos; }
  double getX () { return x; }
  double getY () { return y; }
 
  /** Mutator methods **/
  void addParent (IDNODE node);
  void setRank (int rank) { this->rank = rank; }
  void dfsRank (SyntaxType syntax);
  IDEDGE addEdge (IDNODE that);
  void setCoordinates (double const &, double const &);
  void printEdges (ostream &, vector<IDNODE> &);
  void printBezierCurve (ostream &, const vector<IDNODE> &);
  void setX (double xx);
  void setLeft (IDNode *left) { this->left = left; }
  void setRight (IDNode *right) { this->right = right; }

};

//*****************************************************************************
class HashA {
private:

public:
  char id[SUPERSTRINGLENGTH];
  HashA () {}
  /*
  HashA (ANNOTATEDFORMULA f) {
    String temp;
    strcpy(this->id, GetName(f, temp));
  }
  */
  HashA (char *id) {
    strcpy(this->id, id);
  }
  bool operator== (const HashA &that) const {    
    return strcmp(this->id,that.id) == 0;
  }
  int operator() (const HashA &that) const {
    const char *str = that.id;
    unsigned long hash = 5381;
    int c;
    
    while ((c = *str++)) 
      hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
  return hash;
  }
};

//*****************************************************************************
#endif
//*****************************************************************************
//*****************************************************************************
