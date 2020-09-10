//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
  /*****
   * File - IDGraph.cpp
   * Author - Steven C. Trac
   * Description - 
   *   Interactive Derivation Graph

   284 to add nodes
    50 to add ranks
     3 to set roots
   185 to add edges
   192 to order ranks
     5 to set coordinates
    63 to spring embed
   ---
   782

   *****/
//*****************************************************************************
#include "IDGraph.h"
//*****************************************************************************
//IDGraph::IDGraph (LISTNODE head, ostream out): head(head), out(out) {
IDGraph::IDGraph (LISTNODE const &head) {
  this->head = head;
  thf_exist = false;
  fof_exist = false;
  cnf_exist = false;

  maxRank = -1;
  maxRow = -1;

  // set nodes, one for each formula, and set up/down list
  //cout << "add nodes" << endl;
  addNodes();
  //  time_t t;
  //  t = time(NULL);
  //  cout << "added nodes: " << t << endl;

  // set ranks of nodes
  //cout << "set ranks" << endl;
  setRanks();

  //  t = time(NULL);
  //  cout << "ranks set: " << t << endl;

  // find all roots
  //cout << "set roots" << endl;
  setRoots();

  //  t = time(NULL);
  //  cout << "roots set: " << t << endl;

  // set edges, and add virtual nodes when needed
  //cout << "add edges" << endl;
  addEdges();

  //  t = time(NULL);
  //  cout << "edges added: " << t << endl;


  
  /****
   * start phase 1, 5 pass algorithm:
   * 1) set rank (done)
   * 2) set order in each rank
   * 3) set initial x, final y (rank)
   * 4) call spring embedding
   * 5) generate bezier curve chains (do not do in CLayout, dont need chains just positions)
   ****/
  //cout << "rank" << endl;
  orderRanks();

  //  t = time(NULL);
  //  cout << "order ranks: " << t << endl;

  //cout << "set coordinates" << endl;
  setCoordinates();

  //  t = time(NULL);
  //  cout << "set coordinatess: " << t << endl;

  
  //cout << "spring embed" << endl;
  springEmbed();

  //  t = time(NULL);
  //  cout << "sprimg embedded: " << t << endl;


  // test
  /*
  for (int i = 0; i < node.size(); i++) {
    cout << i << "]: " << node[i]->getID() << " "
         << "rank: " << node[i]->getRank() << " "
         << "x: " << node[i]->getX() << " "
         << "y: " << node[i]->getY() << " "
         << "up: " << node[i]->getUp().size() << " "
         << "down: " << node[i]->getDown().size() << " "
         << "edge: " << node[i]->getEdge().size() << " "
         << "r_edge: " << node[i]->getREdge().size() << " "
         << endl;
  }

  cout << "done add " << endl;
  */
}

IDGraph::~IDGraph () {
  //cout << "edges: " << edge.size() << endl;
  for (int i = 0; i < (int)edge.size(); i++) {
    delete edge[i];
  }
  edge.clear();
  ////cout << "nodes: " << node.size() << endl;
  for (int i = 0; i < (int)node.size(); i++) {
    delete node[i];
  }
  node.clear();
}

void IDGraph::printGraph (ostream &out) {
  // print out name, x, y, up/down/edge/redge size and list
  for (int i = 0; i < (int)node.size(); i++) {
    IDNodeList up = node[i]->getUp();
    IDEdgeList edge = node[i]->getEdge();
    if (node[i]->isVirtual()) {
      out << "V" << node[i]->getPos() << "," << node[i]->getRank() << "," << (int)node[i]->getX() << "," << (int)node[i]->getY() << ",";
    } else {
      out << node[i]->getID() << "," << node[i]->getRank() << "," << (int)node[i]->getX() << "," << (int)node[i]->getY() << ",";
    }
    out << up.size() << ",";
    for (int i = 0; i < (int)up.size(); i++) {
      out << up[i]->getPos() << ",";
    }
    out << edge.size() << ",";
    for (int i = 0; i < (int)edge.size(); i++) {
      IDNode *node = edge[i]->getHead();
      out << node->getPos() << ",";
    }
    out << endl;
  }
}

void IDGraph::SVGPrintGraph (ostream &out) {
  int width = (maxRow + 12) * 100;
  int height = (maxRank + 2) * 200;
  //cout << "SVGPrintGraph" << endl;
  //cout << "maxRow: " << maxRow << ", width: " << width << endl;
  //cout << "maxRank: " << maxRank << ", height: " << height << endl;
  out << "<svg xmlns=\"http://www.w3.org/2000/svg\"" << endl
      << "     xmlns:xlink=\"http://www.w3.org/1999/xlink\"" << endl
      << "     viewBox=\"0 0 " << width << " " << height << "\"" <<  endl
      << "     width=\"1000\" height=\"400\" x=\"0\" y=\"0\"" << endl
      << "     preserveAspectRatio=\"1.0\"" << endl
      << "     version=\"1.1\"" << endl
      << "     baseProfile=\"full\">" << endl;
  /*
  out << "<script type=\"text/ecmascript\">" << endl
      << "<![CDATA[" << endl
      << "var g_element = new Array();" << endl
      << "var SVGDoc;" << endl
      << "var SVGRoot;" << endl
      << "function RunScript(LoadEvent) {" << endl
      << "	top.SVGsetDimension	= setDimension;" << endl
      << "	top.SVGsetScale		= setScale;" << endl
      << "      SVGDoc			= LoadEvent.target.ownerDocument;" << endl
      << "      g_element[0]		= SVGDoc.getElementById(\"layer1\");" << endl
      << "      g_element[1]		= SVGDoc.getElementById(\"layer2\");" << endl
      << "}" << endl
      << "function setDimension(w,h) {" << endl
      << "	SVGDoc.documentElement.setAttribute(\"width\", w);" << endl
      << "	SVGDoc.documentElement.setAttribute(\"height\", h);" << endl
      << "}" << endl
      << "function setScale(sw, sh) {" << endl
      << "	g_element[0].setAttribute(\"transform\", \"scale(\" + sw + \" \" + sh +\")\");" << endl
      << "	g_element[1].setAttribute(\"transform\", \"scale(\" + sw + \" \" + sh +\")\");" << endl
      << "}" << endl;

 

  cout << "function getFormula(id) {" << endl
      << "  switch(id) {" << endl;
  for (int i = 0; i < node.size(); i++) {
    if (!node[i]->isVirtual()) {      
      cout << "case \"" << node[i]->getID() << "\": return \"" << endl;
      PrintAnnotatedTSTPNode(stdout, node[i]->getF(), tptp, 1);
      cout << "\";" << endl;
    }
  }
  cout << "  default:" << endl
      << "    return id;" << endl
      << "  }" << endl
      << "}" << endl;



  out << "]]>" << endl
      << "</script>" << endl;

  */
  out << "  <g id=\"tree\" transform=\"scale(1, 1) translate(0, 200)\" >" << endl;
  out << "    <g id=\"edges\" fill=\"none\" stroke=\"black\" stroke-width=\"0.5\" >" << endl;
  
  // print edges
  /*
  for (int i = 0; i < node.size(); i++) {
    int x1 = (int)node[i]->getX();
    int y1 = (int)node[i]->getY();
    IDEdgeList e = node[i]->getEdge();
    for (int j = 0; j < e.size(); j++) {
      IDNODE head = e[j]->getHead();
      int x2 = (int)head->getX();
      int y2 = (int)head->getY();      
      SVGPrintEdge(out, x1, y1, x2, y2);
    }
  }
  */
  
  // print edges
  printEdges(out);

  out << "    </g>" << endl
      << "    <g id=\"nodes\" fill=\"white\" stroke=\"black\" stroke-width=\"0.1cm\" >" << endl;  

  // print nodes
  StatusType SubStatus;
  for (int i = 0; i < (int)node.size(); i++) {    
    if (!node[i]->isVirtual()) {
      char *id = node[i]->getID();
      SyntaxType type = node[i]->getType();
      int x = (int)node[i]->getX();
      int y = (int)node[i]->getY();
      
      // if false clause, draw square else draw based on status
      if (FalseAnnotatedFormula(node[i]->getF())) {
        SVGPrintSquare(out, id, x, y, type);
        continue;
      } 

      switch (GetRole(node[i]->getF(), &SubStatus)) {
      case axiom:
        SVGPrintTriangle(out, id, x, y, type);
        break;
      case conjecture:
        SVGPrintHouse(out, id, x, y, type, false);
        break;
      case negated_conjecture:
        SVGPrintHouse(out, id, x, y, type, true);
        break;
      case hypothesis:
        //        break;
      case lemma:
        //        break;
      case theorem:
        //        break;
      case plain:
      default:
        SVGPrintCircle(out, id, x, y, type);        
      }

      
    }
  }

  out << "    </g>" << endl
      << "  </g>" << endl
      << "</svg>" << endl;
}

//*****************************************************************************
void IDGraph::printEdges(ostream &out) {
  cout << "edges" << endl;
  for (int i = 0; i < (int)node.size(); i++) {
    if ((!node[i]->isVirtual() && node[i]->getRank() >= 0) ||
        (node[i]->isVirtual() && node[i]->getREdge().size() > 1)) {
      vector<IDNODE> path;
      node[i]->printEdges(out, path);
    }
  }
}

//*****************************************************************************

void IDGraph::addNodes () {
  IDNodeHashTable s2n;
  LISTNODE current = head;
  int c = 0;
  IDNODE n;
  int count = 0;
  int fcount = 0;
  while (current != NULL) {
    String temp;
    HashA h = HashA(GetName(current->AnnotatedFormula, temp));
    // make sure doesnt exist
    if (s2n.find(h) != s2n.end()) {
      cerr << "(Abort) Duplicate formulae: " << temp << endl;
      assert(s2n.find(h) == s2n.end()); 
    }
    n = new IDNode(current->AnnotatedFormula, c++);
    s2n[h] = n;
    node.push_back(n);
    // check if thf_exist
    if (!thf_exist) {
      if (GetSyntax(current->AnnotatedFormula) == tptp_thf) {
        thf_exist = true;
      }
    }
    // check if fof_exist
    if (!fof_exist) {
      if (GetSyntax(current->AnnotatedFormula) == tptp_fof) {
        fof_exist = true;
      }
    }
    if (!cnf_exist) {
      if (GetSyntax(current->AnnotatedFormula) == tptp_cnf) {
        cnf_exist = true;
      }
    }
    HashA check = HashA(node[node.size()-1]->getID());
    //cout << "checking: " << check.id << endl;
    assert(s2n.find(check) != s2n.end()); 
    current = current->Next;
  }
  c = 0;
  //  cout << "s2n size: " << s2n.size() << endl;
  //  cout << "n size: " << node.size() << endl;
  assert(s2n.size() == node.size());

  count = 0;
  fcount = 0;

  // set parents and ancestor lists
  for (int i = 0; i < (int)node.size(); i++) {
    count++;
    HashA check = HashA(node[i]->getID());
    //cout << "checking: " << check.id << endl;
    assert(s2n.find(check) != s2n.end()); 
    //    cout << "count: " << count << "name: " << node[i]->getID() << endl;

    //char parents[10000];
    //String parents;
    SuperString parents;
    //String parentt;
    //strcpy(parents,GetNodeParentNames(node[i]->getF(), parentt));

//----Check if there is a pparent specification
    SuperString PParents;
    char * Comma;
    if (GetInferenceInfoTerm(node[i]->getF(),"pparent",PParents) != NULL) {
//DEBUG printf("Found a pparent %s\n",PParents);
        strcpy(parents,strchr(PParents,'[')+1);
        *(strchr(parents,']')) = '\0';
        while ((Comma = strchr(parents,',')) != NULL) {
            *Comma = '\n';
        }
        strcat(parents,"\n");
//DEBUG printf("pparents are now %s\n",parents);
    } else {
//----Otherwise take the regular parents
        GetNodeParentNames(node[i]->getF(), parents);
    }
    //cout << "Parents: " << parents << endl;
    char *p;
    char *delim = "\n";
    //cout << c++ << ", parents: " << parents << endl;
    p = strtok(parents,delim);
    //p = strtok(parents,delim);
    while(p != NULL) {
      //cout << d++ << endl;
      //      ANNOTATEDFORMULA f = GetAnnotatedFormulaFromListByName(head, p);
      //if (f != NULL) { // make sure it exists
      //cout << "working on finding parent: [" << p << "]" << endl;
      HashA ap(p);
      if (s2n.find(ap) != s2n.end()) {
        IDNODE parent = s2n[HashA(p)];
        assert(parent != NULL);
        //cout << "i: " << i << " adding parent: " << parent->getID() << " to id: " << node[i]->getID() << endl;
          node[i]->addParent(parent);
      } else {
        //cout << "p does not exist: " << p << endl;
      }
      p = strtok(NULL,delim);
    }
  }
  assert(s2n.size() == node.size());
}

void IDGraph::setRoots () {
  for (int i = 0; i < (int)node.size(); i++) {
    if (node[i]->isRoot()) {
      root.push_back(node[i]);
    }
  }
  // max rank is one of the roots
  for (int i = 0; i < (int)root.size(); i++) {
    if (root[i]->getRank() > maxRank) {
      maxRank = root[i]->getRank();
      //cout << "Max rank set to: " << maxRank << endl;
    }
  }
}

void IDGraph::setRanks () {
  if (thf_exist) {
    int max = -1;
    // set dfs for all thf formulae
    for (int i = 0; i < (int)node.size(); i++) {
      node[i]->dfsRank(tptp_thf);
      if (node[i]->hasRank() && node[i]->getRank() > max) {
        max = node[i]->getRank();
      }
    }
    // get max thf rank and set first row of fof formulae to max + 1
    max++;
    for (int i = 0; i < (int)node.size(); i++) {
      bool all_thf = true;
      if (node[i]->getType() == tptp_fof) {
        IDNodeList up = node[i]->getUp();
        for (int j = 0; j < (int)up.size(); j++) {
          all_thf = all_thf & (up[j]->getType() == tptp_thf);
        }
        if (all_thf) {
          node[i]->setRank(max);
        }
      }
    }
  }
  if (fof_exist) {
    int max = -1;
    // set dfs for all fof formulae
    for (int i = 0; i < (int)node.size(); i++) {
      node[i]->dfsRank(tptp_fof);
      if (node[i]->hasRank() && node[i]->getRank() > max) {
        max = node[i]->getRank();
      }
    }
    // get max fof rank and set first row of cnf formulae to max + 1
    max++;
    for (int i = 0; i < (int)node.size(); i++) {
      bool all_fof = true;
      if (node[i]->getType() == tptp_cnf) {
        IDNodeList up = node[i]->getUp();
        for (int j = 0; j < (int)up.size(); j++) {
          all_fof = all_fof & (up[j]->getType() == tptp_fof);
        }
        if (all_fof) {
          node[i]->setRank(max);
        }
      }
    }
  }
  if (cnf_exist) {
    // set dfs for all cnf formulae
    for (int i = 0; i < (int)node.size(); i++) {
      node[i]->dfsRank(tptp_cnf);
    }
  }
}

void IDGraph::addEdges () {
  for (int i = 0; i < (int)node.size(); i++) {
    IDNodeList down = node[i]->getDown();
    IDNodeSet tails;
    //cout << "i : " << i << ", id: " << node[i]->getID() << endl;
    for (int j = 0; j < (int)down.size(); j++) {
      //cout << "  down j: " << j << ", id: " << down[j]->getID() << endl;
      //assert((tails.insert(down[j])).second);
      tails.insert(down[j]).second;
    }
    //assert(tails.size() == down.size());
    addEdge(node[i], tails);    
  }
}

void IDGraph::addEdge (IDNODE head, IDNodeSet &tails) {
  int rh = head->getRank();
  while (!tails.empty()) {
    int rt = (*tails.begin())->getRank();
//DEBUG cout << "rt " << rt << " rh " << rh << endl;
    assert((rt - rh) > 0);
    if ((rt - rh) == 1) {
      IDNODE tail = *tails.begin();
      tails.erase(*tails.begin());
      edge.push_back(tail->addEdge(head));
//DEBUG cout << "Adding Edge from : " << tail->getID() << " to " << head->getID() << endl;
    } else {
      break;
    }
  }
  if (!tails.empty()) {
    node.push_back(new IDNode(rh + 1, node.size()));
    //cout << "new node, node size: " << node.size() << endl;
    edge.push_back(node.back()->addEdge(head)); // connect nHead to head
    addEdge(node[node.size()-1], tails); // recurse 
  }
}

//*****************************************************************************
void IDGraph::orderRanks () {
  Order *order = new Order(node, root, maxRank);
  Order *best = new Order(order);
  int best_crossing = best->crossing();
  int order_crossing;
  int max = 24; // # of iterations
  /*
    if n < 100, 24 is fine
    if n around 200, do about 20
    if n around 500 do around 10
    if n around 1000 do around 5
    if n > 1000, do at least 4
  */
  int n = (int)node.size();
  max = max - (2 * n / 100);
  if (max < 0) {
    max = 4; // do at least 4 iterations
  }
  for (int i = 0; i < max; i++) {
    if (i % 4 == 0 || i % 4 == 1) {
      order->wmedian(i);
      order->transpose(i);
    } else {
      order->transpose(i);
    }
    order_crossing = order->crossing();
    if (order_crossing <= best_crossing) {
      delete best;
      best = new Order(order);
      //best_crossing = best->crossing();
      best_crossing = order_crossing;
      //      cout << "best: " << best_crossing << endl;
    }
  }
  rank = best->getRank();

  delete order;
  delete best;


  //cout << "max rank: " << maxRank << endl;
  // set max row
  for (int i = 0; i <= maxRank; i++) {
    if ((int)rank[i].size() > maxRow) {
      maxRow = rank[i].size();
    }
  }
}

//*****************************************************************************
void IDGraph::setCoordinates () {
  int width = (maxRow + 10) * 100;
  for (int i = 0; i <= maxRank; i++) {
    int splits = width / (rank[i].size() + 1);
    for (int j = 0; j < (int)rank[i].size(); j++) {
      rank[i][j]->setCoordinates((j+1) * splits, i * 200);
      if (j > 0) {
        rank[i][j-1]->setRight(rank[i][j]);
        rank[i][j]->setLeft(rank[i][j-1]);
      }
    }
  }
}

//*****************************************************************************
//*****************************************************************************
IDGraph::Order::Order (vector<IDNODE> const &node, vector<IDNODE> const &root, int const &maxRank) {
  max = maxRank;
  for (int i = 0; i <= max; i++) {
    vector<IDNODE> row;
    rank.push_back(row);
  }
  for (int i = 0; i < (int)node.size(); i++) {
    pos.push_back(-1);
  }
  for (int i = 0; i < (int)root.size(); i++) {
    setRank(root[i]);
  }
}

void IDGraph::Order::setRank (IDNODE n) {
  if (pos[n->getPos()] != -1) {
    return;
  }
  rank[n->getRank()].push_back(n);
  pos[n->getPos()] = rank[n->getRank()].size() - 1;
  IDEdgeList edge = n->getEdge();
  for (int i = 0; i < (int)edge.size(); i++) {
    IDNODE other = edge[i]->getHead();
    setRank(other);
  }
}

IDGraph::Order::Order (Order const *that) {
  this->max = that->max;
  for (int i = 0; i < (int)that->rank.size(); i++) {
    vector<IDNODE> row;
    for (int j = 0; j < (int)that->rank[i].size(); j++) {
      row.push_back(that->rank[i][j]);
    }
    this->rank.push_back(row);
  }
  this->pos = that->pos;
}

IDGraph::Order::~Order () {}

//*****************************************************************************
void IDGraph::Order::wmedian (int const &i) {
  if (i%2 == 0) {
    // traverse ranks bottom to top
    for (int r = 1; r <= max; r++) {
      NodeMedianSet median;
      for (int v = 0; v < (int)rank[r].size(); v++) {
        double value = median_value(v, r, -1);
        median.insert(NodeMedianPair(rank[r][v], value, v));
      }
      median_sort(median, r);
    }
  } else {
    // traverse ranks top to bottom
    for (int r = max - 1; r > -1; r--) {
      NodeMedianSet median;
      for (int v = 0; v < (int)rank[r].size(); v++) {
        double value = median_value(v, r, 1);
        median.insert(NodeMedianPair(rank[r][v], value, v));
      }
      median_sort(median, r);
    }
  }
}

//*****************************************************************************
void IDGraph::Order::median_sort (NodeMedianSet const &median, int const &r) {
  int c = 0;
  for (NodeMedianSet::iterator it = median.begin(); it != median.end(); it++) {
    rank[r][c] = (*it).node; 
    pos[((*it).node)->getPos()] = c++;
  }
}

//*****************************************************************************
IDGraph::NodeMedianList IDGraph::Order::adjacent (int const &v, int const &r, int const &adj) {
  NodeMedianSet adjacent;
  NodeMedianList adjv;
  IDEdgeList edge = (adj == -1) ? rank[r][v]->getEdge() : rank[r][v]->getREdge();
  for (int i = 0; i < (int)edge.size(); i++) {
    IDNODE node = (adj == -1) ? edge[i]->getHead() : edge[i]->getTail();
    adjacent.insert(NodeMedianPair(node, (double)pos[node->getPos()], pos[node->getPos()]));
  }
  for (NodeMedianSet::iterator it = adjacent.begin(); it != adjacent.end(); it++) {
    adjv.push_back(*it);
  }
  return adjv;
}
//*****************************************************************************
double IDGraph::Order::median_value (int const &v, int const &r, int const &adj) {
  NodeMedianList adjv = adjacent(v, r, adj);
  // store adjacent in a vector, easier manipulation
  int n = adjv.size();
  int m = n / 2;
  if (n == 0) {
    return -1.0;
  } else if (n % 2 == 1) {
    return adjv[m].median;
  } else if (n == 2) {
    return (adjv[0].median + adjv[1].median) / 2;
  } else {
    double left = adjv[m-1].median - adjv[0].median;
    double right = adjv[n-1].median - adjv[m].median;
    return (adjv[m-1].median * right + adjv[m].median * left) / (left + right);
  }
}

//*****************************************************************************
void IDGraph::Order::transpose (int const &i) {
  int adj = (i % 2 == 0) ? -1 : 1;

  bool improved = true;
  int t = 0;
  int MAX = 10;
  while (improved) {
    improved = false;
    if (i % 2 == 0) {
      for (int r = 0; r <= max; r++) {
        improved = improved || transpose(r, adj);
      }
    } else {
      for (int r = max; r >= 0; r--) {
        improved = improved || transpose(r, adj);
      }
    }
    //    cout << "t: " << t << endl;
    if (t++ > MAX) {
      improved = false;
      //      cout << "TO THE MAX! " << endl;
    }
  }
}

//*****************************************************************************
bool IDGraph::Order::transpose (int const &r, int const &adj) {
  bool improved = false;
  for (int i = 0; i < (int)rank[r].size() - 1; i++) {
    int v = i;
    int w = i + 1;
    // add crossings from prev rank and next rank
    if (crossing(v, w, r, adj) > crossing(w, v, r, adj)) {
      improved = true;
      // exchange i with i + 1
      IDNODE temp = rank[r][v];
      rank[r][v] = rank[r][w];
      rank[r][w] = temp;
      pos[rank[r][v]->getPos()] = v;
      pos[rank[r][w]->getPos()] = w;
    }
  }
  return improved;
}

//*****************************************************************************
int IDGraph::Order::crossing (int const &a, int const &b, int const &r, int const &adj) {
  int n[2];
  n[0] = a;
  n[1] = b;
  int cross = 0;
  OSTree<NodeMedianPair, NodeMedianPairPosCompare> adjRow;
  for (int i = 0; i < 2; i++) {
    NodeMedianList parent = adjacent(n[i], r, adj);
    for (int p = 0; p < (int)parent.size(); p++) {
      OSNode<NodeMedianPair> *pair = adjRow.insert(parent[p]);
      size_t rank = adjRow.rank(pair);
      cross += rank - 1;
    }
  }
  return cross;
}

//*****************************************************************************
int IDGraph::Order::crossing (int const &r, int const &adj) {
  int cross = 0;

  OSTree<NodeMedianPair, NodeMedianPairPosCompare> adjRow;
  for (int i = 0; i < (int)rank[r].size(); i++) {
    NodeMedianList parent = adjacent(i, r, adj);
    //NodeMedianList parent = adjacent(row[i], adj);
    for (int p = 0; p < (int)parent.size(); p++) {
      OSNode<NodeMedianPair> *pair = adjRow.insert(parent[p]);
      size_t rank = adjRow.rank(pair);
      cross += rank - 1;
    }
  }
  return cross;
}

//*****************************************************************************
int IDGraph::Order::crossing () {
  //  cout << "coutn crosses" << endl;
  int cross = 0;
  int adj = -1;
  for (int i = 1; i <= max; i++) {
    cross += crossing(i, adj);
  }
  //  cout << "coutn crosses ended!" << endl;
  return cross;
}

//*****************************************************************************
void IDGraph::Order::show () {
  return;
  for (int i = 0; i <= max; i++) {
        cout << "rank: " << i << "=> ";
        for (int j = 0; j < (int)rank[i].size(); j++) {
      if (rank[i][j]->isVirtual()) {
        cout << "V" << rank[i][j]->getPos() << " ";
      } else {
        cout << rank[i][j]->getID() << " ";
      }
    }
    cout << endl;
  }
}

void IDGraph::computeSpringForce (IDNODE n, vector<double> &f) {
  IDEdgeList e = n->getEdge(); 
  for (int i = 0; i < (int)e.size(); i++) {
    IDNODE m = e[i]->getHead(); // n--->m
    double dx = n->getX() - m->getX();
    double dy = n->getY() - m->getY();
    double distance = sqrt(dx * dx + dy * dy);
    double denom = (distance <= DIST_THRESHOLD) ? DIST_THRESHOLD : distance;
    double fx = kSpringConstant * (distance - lSpringLength) * dx / denom;
    f[m->getPos()] -= fx;
    f[n->getPos()] += fx;
  }
}

void IDGraph::computeGravityForce (IDNODE n, vector<double> &f) {
  Point gforce(0, -100);
  IDEdgeList e = n->getEdge(); 
  for (int i = 0; i < (int)e.size(); i++) {
    IDNODE m = e[i]->getHead(); // n--->m
    double dx = m->getX() - n->getX();
    double dy = m->getY() - n->getY();
    double distance = sqrt(dx * dx + dy * dy);
    double denom = (distance <= DIST_THRESHOLD) ? DIST_THRESHOLD : distance;
    double angle = e[i]->angle(gforce);
    double fangle = pow(denom, kAngleConstantA);
    double force = fangle * pow(angle, kAngleConstantB);
    double sign = e[i]->sign(gforce);
    double fx = force * -dy / denom * sign;
    f[m->getPos()] -= fx;
    f[n->getPos()] += fx;
  }
}

void IDGraph::computeRepulsiveForce (IDNODE n, IDNODE m, vector<double> &f) { 
  if (n->isVirtual() && m->isVirtual())
    return;
  double dx = m->getX() - n->getX();
  double dy = m->getY() - n->getY();
  double sqDistance = dx * dx + dy * dy;
  if (sqDistance < DIST_THRESHOLD) {
    sqDistance = DIST_THRESHOLD;
    dx = dy = sqrt(sqDistance/2);
  }
  double distance = sqrt(sqDistance);
  double force = -(kRepulsiveForce * kRepulsiveForce) / sqDistance;
  double fx = force * dx / distance;
  f[m->getPos()] -= fx;
  f[n->getPos()] += fx;
}

//*****************************************************************************
void IDGraph::adjustX () {
  for (int i = 0; i < (int)node.size(); i++) {
    //cout << "----looking at node: " << i << ": " << node[i]->getID() << endl;
    IDEdgeList redge = node[i]->getREdge();
    if (redge.size() == 1) {
      IDNODE check = redge[0]->getTail();
      if (node[i]->isVirtual()) {
        IDNODE next = (node[i]->getEdge())[0]->getHead();
        if (next->isVirtual()) {
          vector<IDNODE> nodes;
          double threshold = 50;
          double total = 0;
          do {
            if (fabs(next->getX() - node[i]->getX()) < threshold) {
              nodes.push_back(next);
              next = (next->getEdge())[0]->getHead();
              total += next->getX();              
            } else {
              break;
            }
          } while (next->isVirtual());
          double avg = total / nodes.size();
          int n = nodes.size() - 3;
          for (int j = 0; j < n; j++) {
            nodes[j]->setX(avg);
          }
          continue;
        }
      }
      if ((check->getEdge()).size() == 1 && !check->isVirtual()) {
        continue;
      }
    }
    
    vector<IDNODE> nodes;
    double x = 0;
    int count = 0;
    if ((node[i]->getEdge()).size() == 1 && !node[i]->isVirtual()) {
      IDNODE current = node[i];
      nodes.push_back(current);
      x += current->getX();
      count++;
      do {
        current = (current->getEdge())[0]->getHead();
        if ((current->getREdge()).size() == 1) {
          nodes.push_back(current);
        } else {
          break;
        }
        x += current->getX();
        count++;
      } while ((current->getEdge()).size() == 1 && (current->getREdge()).size() == 1);

      double avg = x / count;
      for (int j = 0; j < (int)nodes.size(); j++) {
        nodes[j]->setX(avg);
      }
    }
  }
}
//*****************************************************************************
void IDGraph::springEmbed () {
  // record the changes in x movement, display them
  vector<double> f;
  double leftBound = -200;
  //cout << "max row: " << maxRow << endl;
  double rightBound = (maxRow) * 200;
  for (int i = 0; i < (int)node.size(); i++) {
    f.push_back(0);
  }
  for (int i = 0; i < maxIterations; i++) {
    //cout << "iteration number: -------------- i: " << i << endl;
    for (int j = 0; j < (int)node.size(); j++) {
      f[j] = 0; // reset forces
    }
    //    cout << "compute force" << endl;
    for (int j = 1; j < (int)rank.size(); j++) {
      // compare rank[j] with rank[j-1]
      for (int k = 0; k < (int)rank[j].size(); k++) {
        // compute spring forces
        computeSpringForce(rank[j][k], f);
        // compute gravity forces
        computeGravityForce(rank[j][k], f);
        // compute repulsive forces between neighbors on a row
        if (k < (int)rank[j].size() - 1) {
          computeRepulsiveForce(rank[j][k], rank[j][k+1], f);        
        }
      }
    }   
    for (int j = 0; j < (int)node.size(); j++) {
      if (!node[j]->isVirtual()) {
        double dx[2];
        dx[0] = node[j]->getX() - leftBound;
        dx[1] = rightBound - node[j]->getX();
        for (int k = 0; k < 2; k++) {
          if (dx[k] < 500) {
            double sqDistance = dx[k] * dx[k];
            if (sqDistance < DIST_THRESHOLD) {
              sqDistance = DIST_THRESHOLD;
              dx[k] = sqrt(sqDistance/2);
            }
            double distance = sqrt(sqDistance);
            double force = -(kRepulsiveForce * kRepulsiveForce) / sqDistance;
            double fx = force * dx[k] / distance;
            f[node[j]->getPos()] += fx;
          }
        }        
      }
    }
    for (int j = 0; j < (int)node.size(); j++) {
      double dx = f[j] * dFactor;
      double dist = fabs(dx);
      if (dist > maxMovement) {
        double factor = maxMovement / dist;
        dx *= factor;
      }
      node[j]->setX(node[j]->getX() + dx);
      //cout << "force for ID: " << node[j]->getID() << ": [" << dx << " / " << maxMovement << "]" << endl;
    }
    if ((maxIterations - i) < 5) {
      adjustX();
    }
  }
}


//*****************************************************************************
//*****************************************************************************
