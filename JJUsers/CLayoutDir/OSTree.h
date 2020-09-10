//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
#ifndef OS_TREE_H
#define OS_TREE_H
//*****************************************************************************
#include <assert.h>
#include <string>
#include <vector>
#include <iostream>
//*****************************************************************************
using namespace std;
//*****************************************************************************

enum Color {RED, BLACK};

template<typename T, typename C> class OSTree;

template <typename T>
class OSNode {
  template<typename TT, typename C> friend class OSTree;
private:
  T data;
  Color color;
  size_t size;
  
public:
  // Constructors
  OSNode () {}
  OSNode (T t, Color color); // create a leaf consisting of this data item
  OSNode (const OSNode<T> *t); // copy constructor

  // Desctructor
  ~OSNode ();

  // Constant member functions
  //  size_t depth () const;
  //  size_t height () const;
  size_t getSize () const;
  void setSize (size_t);
  void updateSize ();
  void show () { data.show(); }
  T getData() const;

  OSNode<T> *left;
  OSNode<T> *right;
  OSNode<T> *parent;
};

template <typename T, typename C>
class OSTree {
  
 private:
  OSNode<T> *root;

  void leftRotate (OSNode<T> *);
  void rightRotate (OSNode<T> *);
  void insertHelp (OSNode<T> *);
  void removeHelp (OSNode<T> *, OSNode<T> *);

  size_t sizeOf (OSNode<T> *) const;
  Color colorOf (OSNode<T> *) const;
  void setColor (OSNode<T> *, Color c);
  
 public:
  OSTree ();

  
  ~OSTree ();
  
  void remove (OSNode<T> *);
  OSNode<T> * insert (T);
  //  OSNode<T> * getPredecessorOf (OSNode<T> *) const;
  OSNode<T> * getSuccessorOf (OSNode<T> *) const;
  //  OSNode<T> * search (T t);
  //  void checkAssumptions ();
  void showTree (OSNode<T> *);
  void showTree ();

  OSNode<T> * select (size_t i) const;
  OSNode<T> * select (OSNode<T> *, size_t i) const;
  size_t rank (OSNode<T> *) const;
};

#include "OSTree.cpp"

//*****************************************************************************
#endif
//*****************************************************************************
//*****************************************************************************
