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
#include "PrintSVG.h"

//*****************************************************************************

//*****************************************************************************
char * SyntaxToColorString (SyntaxType syntax) {
  switch (syntax) {
  case tptp_fof:
    return("black");
  case tptp_cnf:
    return("orange");
  default:
    return("black");
  }
}

//*****************************************************************************
void SVGPrintCircle (ostream &out, char * id, int x, int y, SyntaxType syntax) {
  // indent
  out << "      ";
  out << "<circle";
  out << " id=\"" << id << "\"";
  out << " cx=\"" << x << "\"";
  out << " cy=\"" << y << "\"";
  out << " r=\"" << SVG_SHAPE_SIZE << "\"";
  out << " stroke =\"" << SyntaxToColorString(syntax) << "\"";
  out << " onmouseover =\"displayFormula('" << id << "', 1)\"";
  out << " onmouseout =\"displayFormula('" << id << "', 0)\"";
  out << "/>" << endl;
}

void SVGPrintTriangle (ostream &out, char * id, int x, int y, SyntaxType syntax) {
  out << "      ";
  out << "<polygon";
  out << " id=\"" << id << "\"";
  out << " points=\"";
  out << " " << x - SVG_SHAPE_SIZE << ", " << y - SVG_SHAPE_SIZE;
  out << " " << x + SVG_SHAPE_SIZE << ", " << y - SVG_SHAPE_SIZE;
  out << " " << x                  << ", " << y + SVG_SHAPE_SIZE << "\"";
  out << " stroke =\"" << SyntaxToColorString(syntax) << "\"";
  out << " onmouseover =\"displayFormula(id)\"";
  out << "/>" << endl;
}

void SVGPrintSquare (ostream &out, char * id, int x, int y, SyntaxType syntax) {
  out << "      ";
  out << "<polygon";
  out << " id=\"" << id << "\"";
  out << " points=\"";
  out << " " << x - SVG_SHAPE_SIZE << ", " << y - SVG_SHAPE_SIZE;
  out << " " << x - SVG_SHAPE_SIZE << ", " << y + SVG_SHAPE_SIZE;
  out << " " << x + SVG_SHAPE_SIZE << ", " << y + SVG_SHAPE_SIZE;
  out << " " << x + SVG_SHAPE_SIZE << ", " << y - SVG_SHAPE_SIZE << "\"";
  out << " stroke =\"" << SyntaxToColorString(syntax) << "\"";
  out << " onmouseover =\"displayFormula(id)\"";
  out << "/>" << endl;
}

void SVGPrintHouse (ostream &out, char * id, int x, int y, SyntaxType syntax, bool inverted) {

  int scale = (inverted) ? 1 * SVG_SHAPE_SIZE : -1 * SVG_SHAPE_SIZE;
  out << "      ";
  out << "<polygon";
  out << " id=\"" << id << "\"";
  out << " points=\"";
  out << " " << x + scale << ", " << y + scale;
  out << " " << x + scale << ", " << y;
  out << " " << x                  << ", " << y - scale;
  out << " " << x - scale << ", " << y;
  out << " " << x - scale << ", " << y + scale << "\"";
  out << " stroke =\"" << SyntaxToColorString(syntax) << "\"";
  out << " onmouseover =\"displayFormula(id)\"";
  out << "/>" << endl;
}


//*****************************************************************************
void SVGPrintEdge (ostream &out, int x1, int y1, int x2, int y2) {
  out << "      ";
  out << "<line"
      << " x1=\"" << x1 << "\""
      << " y1=\"" << y1 << "\""
      << " x2=\"" << x2 << "\""
      << " y2=\"" << y2 << "\""
      << "/>" << endl;
}

//*****************************************************************************
void SVGPrintQuadraticBezierCurve (ostream &out, int x1, int y1, int x2, int y2,
                               int x3, int y3) {
  out << "      ";
  out << "<path d=\""
      << "M "
      << x1 << " "
      << y1 << " "
      << "Q "
      << x2 << " "
      << y2 << " "
      << x3 << " "
      << y3 << "\" />" << endl;
  
}

//*****************************************************************************
void SVGPrintCubicBezierCurve (ostream &out, int x1, int y1, int x2, int y2,
                              int x3, int y3, int x4, int y4) {
  out << "      ";
  out << "<path d=\""
      << "M "
      << x1 << " "
      << y1 << " "
      << "C "
      << x2 << " "
      << y2 << " "
      << x3 << " "
      << y3 << " "
      << x4 << " "
      << y4 << "\" />" << endl;
}



//*****************************************************************************
/*
  // draw triangle
void SVGPrintTriangle (int x, int y, char *name) {
  cout << "<polygon points=\"0,0 100,0 50,100\" id=\"" << name << "\" "
       << "transform=\"translate(" << x << "," << y << ")\" />" << endl;
}
*/

  /*
  // draw house
  void drawHouse (int x, int y, char *name);
  
  // draw inverted house
  void drawInvertedHouse (int x, int y, char *name);

  // draw trapezoid
  void drawTrapezoid (int x, int y, char *name);
  */
