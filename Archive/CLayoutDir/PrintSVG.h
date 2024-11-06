//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
  /* File - PrintSVG.h
   * Author - Steven C. Trac
   * Description - 
   *    SVG output of different shapes.
   *    All shape sizes are predefined, all we need is x, y
   */
//*****************************************************************************
#include <iostream>
//*****************************************************************************
#include "IDVTypes.h"
//#include "DataTypes.h"
#include "DataTypes.h"
//*****************************************************************************
#define SVG_SHAPE_SIZE 50
//*****************************************************************************
using namespace std;
//*****************************************************************************
/**** Print helper methods ****/

// given a color, return string of that color
char * SyntaxToColorString (SyntaxType syntax);


/**** Print methods ****/
// print svg circle
void SVGPrintCircle (ostream &out, char * id, int x, int y, SyntaxType syntax);


// print svg triangle
void SVGPrintTriangle (ostream &out, char * id, int x, int y, SyntaxType syntax);

// print svg square
void SVGPrintSquare (ostream &out, char * id, int x, int y, SyntaxType syntax);

// print svg house
void SVGPrintHouse (ostream &out, char * id, int x, int y, SyntaxType syntax,
                     bool inverted);
  
// print svg inverted house
//void SVGPrintInvertedHouse (int x, int y, char *name);

// print svg trapezoid
//void svgTrapezoid (int x, int y, char *name);

void SVGPrintEdge (ostream &out, int x1, int y1, int x2, int y2);

void SVGPrintQuadraticBezierCurve (ostream &out, int x1, int y1, int x2, int y2,
                               int x3, int y3);

void SVGPrintCubicBezierCurve (ostream &out, int x1, int y1, int x2, int y2,
                              int x3, int y3, int x4, int y4);

//*****************************************************************************
//*****************************************************************************
