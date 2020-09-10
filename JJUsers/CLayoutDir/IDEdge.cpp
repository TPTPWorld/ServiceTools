//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
  /*****
   * File - IDEdge.cpp
   * Author - Steven C. Trac
   * Description - 
   *   Interactive Derivation Graph Edge
   *****/
//*****************************************************************************
#include "IDEdge.h"

double IDEdge::angle (const Point &gforce) {
  Point edge(head->getX() - tail->getX(), head->getY() - tail->getY());
  return acos((edge * gforce) / (edge.length() * gforce.length()));
}

double IDEdge::sign (const Point &gforce) {
  Point edge(head->getX() - tail->getX(), head->getY() - tail->getY());
  return ((edge.x * gforce.y - edge.y * gforce.x) > 0) ? -1 : 1;
}


//*****************************************************************************
//*****************************************************************************
