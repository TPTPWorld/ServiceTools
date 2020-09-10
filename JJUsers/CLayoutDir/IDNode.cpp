//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
  /*****
   * File - IDNode.cpp
   * Author - Steven C. Trac
   * Description - 
   *   Interactive Derivation Graph Node
   *****/
//*****************************************************************************
#include "IDNode.h"
//*****************************************************************************
IDNode::IDNode (ANNOTATEDFORMULA const &formula, int const &pos) {
  this->x = 0;
  this->y = 0;
  this->virt = false;
  this->formula = formula;
  this->rank = -1; // start at -1 for dfsRank
  this->pos = pos;
  this->left = NULL;
  this->right = NULL;
}

IDNode::IDNode (int const &rank, int const &pos) {
  this->x = 0;
  this->y = 0;
  this->virt = true;
  this->formula = NULL;
  this->rank = rank; // start at -1 for dfsRank
  this->pos = pos;
  this->left = NULL;
  this->right = NULL;
}

IDNode::~IDNode () {
  this->x = 0;
  this->y = 0;
  this->virt = false;
  this->rank = 0;
  this->pos = 0;
  this->formula = NULL;
  up.clear();
  down.clear();
  edge.clear();
  r_edge.clear();
  this->right = NULL;
  this->left = NULL;
}
//*****************************************************************************
void IDNode::addParent (IDNODE that) {
  this->up.push_back(that);
  that->down.push_back(this);
}

//*****************************************************************************
void IDNode::dfsRank (SyntaxType syntax) {
  if (hasRank() || getType() != syntax) {
    return;
  }
  if (up.empty()) {
    rank = 0;
  } else {
    for (int i = 0; i < (int)up.size(); i++) {
      up[i]->dfsRank(syntax);
      if (up[i]->getRank() > rank) {
        rank = up[i]->getRank();
      }
    }
    rank++;
  }
}

//*****************************************************************************
IDEDGE IDNode::addEdge (IDNODE that) {
  assert((this->getRank() - that->getRank()) == 1);
  IDEDGE e = new IDEdge(this, that); 
  this->edge.push_back(e);
  that->r_edge.push_back(e);
  //  cout << " new edge: " << new_edge++ << endl;
  return e;
}

//*****************************************************************************
void IDNode::setCoordinates (double const &x, double const &y) {
  this->x = x;
  this->y = y;
}

//*****************************************************************************
void IDNode::setX (double xx) {
  double max = 100;
  double diffX = x - xx;
  double diff;
  double half;
  if (diffX > 0) {
    if (left != NULL) {
      diff = x - left->getX();
      half = (diff - max) / 2 - 1;
      diff = diff - diffX;
      if (diff <= max) {
        x -= half;
      } else {
        x = xx;
      }
    } else {
      x = xx;
    }
  } else if (diffX < 0) {
    diffX = fabs(diffX);
    if (right != NULL) {
      diff = fabs(x - right->getX());
      half = (diff - max) / 2 - 1;
      diff = diff - diffX;
      if (diff <= max) {
        x += half;
      } else {
        x = xx;
      } 
    } else {
      x = xx;
    }
  }
}

//*****************************************************************************
void IDNode::printEdges (ostream &out, vector<IDNODE> &path) {
  path.push_back(this);
  for (int i = 0; i < (int)edge.size(); i++) {
    IDNODE next = edge[i]->getHead();
    if ((!next->isVirtual()) ||
        (next->isVirtual() && next->getREdge().size() > 1)) {
      path.push_back(next);
      printBezierCurve(out, path);
      path.pop_back();
    } else {
      // recurse
      next->printEdges(out, path);      
    }
  }
  path.pop_back();
}

void IDNode::printBezierCurve(ostream &out, const vector<IDNODE> &path) {
  int diff = 20;
  vector<Point> points;
  for (int i = 0; i < (int)path.size(); i++) {
    points.push_back(Point(path[i]->getX(), path[i]->getY()));
  }
  assert(points.size() > 1);
  if (points.size() == 2) {
    Point p1 = points[0];
    Point p2 = points[1];
    Point p3 = Point((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
    points.pop_back();
    points.push_back(p3);
    points.push_back(p2);
  }
  
  while (points.size() > 4) {
    if (points.size() == 5) {
      Point p2 = points[2];
      Point p4 = points[4];
      double y = (p2.y + p4.y) / 2;      
      for (int i = 0; i < 3; i++) {
        points.pop_back();
      }
      points.push_back(p2);
      points.push_back(Point(p2.x, y - diff));
      points.push_back(Point(p4.x, y + diff));
      points.push_back(p4);
    }
    Point p1 = points[0];
    Point p2 = points[1];
    Point p3 = points[2];
    for (int i = 0; i < 3; i++) {
      points.erase(points.begin());
    }
    Point next = points[0];
    Point p4 = Point((p3.x + next.x)/2, (p3.y + next.y)/2);
    SVGPrintCubicBezierCurve(out, 
                             (int)p1.x, (int)p1.y,
                             (int)p2.x, (int)p2.y,
                             (int)p3.x, (int)p3.y,
                             (int)p4.x, (int)p4.y);    
    points.insert(points.begin(), p4);
  }
  if (points.size() < 4) {
    assert(points.size() == 3);
    Point p1 = points[0];
    Point p4 = points[2];
    double y = (p1.y + p4.y) / 2;
    Point p2 = Point(p1.x, y - diff);
    Point p3 = Point(p4.x, y + diff);
    SVGPrintCubicBezierCurve(out, 
                             (int)p1.x, (int)p1.y,
                             (int)p2.x, (int)p2.y,
                             (int)p3.x, (int)p3.y,
                             (int)p4.x, (int)p4.y);    
  } else {
    Point p1 = points[0];
    Point p2 = points[1];
    Point p3 = points[2];
    Point p4 = points[3];
    SVGPrintCubicBezierCurve(out, 
                             (int)p1.x, (int)p1.y,
                             (int)p2.x, (int)p2.y,
                             (int)p3.x, (int)p3.y,
                             (int)p4.x, (int)p4.y);    
  }
}

//*****************************************************************************
//*****************************************************************************
bool IDNodeCompare::operator() (IDNode *n1, IDNode *n2) const {
  if (n1->getRank() == n2->getRank()) {
    return n1 < n2;
  }
  return n1->getRank() < n2->getRank();
}


//*****************************************************************************
//*****************************************************************************

//*****************************************************************************
//*****************************************************************************
