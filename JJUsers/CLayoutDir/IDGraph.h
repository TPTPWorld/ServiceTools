//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
#ifndef IDGRAPH_H
#define IDGRAPH_H
//*****************************************************************************
  /*****
   * File - IDGraph.h
   * Author - Steven C. Trac
   * Description - 
   *   Interactive Derivation Graph
   *****/
//*****************************************************************************
#include <vector>
#include <set>
#include <math.h>
//#include <ext/hash_map>
#include <fstream>
#include <ostream>
#include <assert.h>
#include <string>
//*****************************************************************************
#include "PrintSVG.h"
#include "JJHeaders.h"
#include "IDNode.h"
#include "IDEdge.h"
#include "OSTree.h"
//*****************************************************************************
using namespace std;
//*****************************************************************************

class IDGraph {
private:
  static const double DIST_THRESHOLD = 1e-6;
  static const int maxIterations  = 10;
  static const double kRepulsiveForce = 11;  // Strength of node repulsions
  static const double kSpringConstant = 1;       // Main Spring Constant
  static const double lSpringLength   = 1;   // (Desired) Length of Spring
  static const double dFactor         = .005;   // Displacement factor (adjustable);
  static const double kAngleConstantB = 1;   // angle ^ B for gravity force
  static const double kAngleConstantA = 1.3;   // distance ^ A for gravity force
  static const double maxMovement     = 100; // max movement at each iteration
  
  LISTNODE head;
  vector<IDNODE> node;
  vector<IDEdge*> edge;

  int nR;         // number of ranks in node
  int maxRow;     // find the row with max nodes, for display
  int maxRank;    // max rank of all nodes
  vector<vector<IDNODE> > rank;
  vector<IDNODE> root;

  bool thf_exist;
  bool fof_exist;
  bool cnf_exist;

  /** private methods **/
  void addNodes ();
  void setRanks ();
  void setRoots ();
  void addEdges ();
  void addEdge (IDNODE head, IDNodeSet &tails);
  void orderRanks ();
  void setCoordinates ();
  void printEdges (ostream &);

  class NodeMedianPair {
  public:
    IDNODE node;
    double median;
    int pos;
    NodeMedianPair (IDNODE node, double median, int pos): node(node), median(median), pos(pos) {}
  };
  class NodeMedianPairCompare {
  public:
    bool operator() (NodeMedianPair const &n1, NodeMedianPair const &n2) const {
      if (n1.median == n2.median) {
        assert(n1.pos != n2.pos);
        return n1.pos < n2.pos; // position compare for tie breaker
      }
      return n1.median < n2.median;
    }
  };
  class NodeMedianPairPosCompare {
  public:
    bool operator() (NodeMedianPair const &n1, NodeMedianPair const &n2) const {
      return n1.pos >= n2.pos;
    }
  };
  typedef set<NodeMedianPair, NodeMedianPairCompare> NodeMedianSet;
  typedef vector<NodeMedianPair> NodeMedianList;
  
  class Order {
  public:
    vector<vector<IDNODE> > rank;
    vector<int> pos; // position of node[i] in its rank
    int max;
    
    /** Constructors **/
    Order (vector<IDNODE> const &, vector<IDNODE> const &, int const &);
    Order (Order const *order);
    ~Order ();

    /** Accessor methods **/
    vector<vector<IDNODE> > getRank() { return rank; }
    void show ();

    /** Mutator methods **/
    void setRank (IDNODE n);
    void wmedian (int const &i);
    void median_sort (NodeMedianSet const &, int const &);
    //    NodeMedianList adjacent (IDNODE, int const &adj);
    NodeMedianList adjacent (int const &v, int const &r, int const &adj);
    double median_value (int const &v, int const &r, int const &adj);
    void transpose (int const &i);
    bool transpose (int const &r, int const &adj);
    int crossing (int const &a, int const &b, int const &rank, int const &adj);
    int crossing (int const &r, int const &adj);
    int crossing ();
  };

  void computeSpringForce (IDNODE, vector<double> &f);
  void computeGravityForce (IDNODE, vector<double> &f);
  void computeRepulsiveForce (IDNODE, IDNODE, vector<double> &f);
  void adjustX ();

public:
  //  IDGraph (LISTNODE head, ostream out);

  IDGraph (LISTNODE const &head);
  ~IDGraph ();

  void springEmbed ();

  void SVGPrintGraph (ostream &out);
  void printGraph (ostream &out);



};


//*****************************************************************************
#endif
//*****************************************************************************
//*****************************************************************************
