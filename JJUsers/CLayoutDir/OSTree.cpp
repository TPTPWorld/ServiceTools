//-*-C++-*-
//*****************************************************************************
//*****************************************************************************
#ifndef OS_TREE_CPP
#define OS_TREE_CPP
//*****************************************************************************
#include "OSTree.h"
//*****************************************************************************
template <typename T>
OSNode<T>::OSNode (T data, Color color) : data(data), color(color) {}

template <typename T>
OSNode<T>::~OSNode () {
  if (left != NULL) 
    delete left;
  if (right != NULL)
    delete right;
}

template <typename T>
T OSNode<T>::getData () const { return data; }

template <typename T>
size_t OSNode<T>::getSize () const { 
  return size;
}

template <typename T>
void OSNode<T>::setSize (size_t newSize) {
  size = newSize;
}

template <typename T>
void OSNode<T>::updateSize () {
  size = 1;
  if (left != NULL)
    size += left->getSize();
  if (right != NULL) 
    size += right->getSize();
}
//*****************************************************************************

// Constructors
template <typename T, typename C>
OSTree<T,C>::OSTree () : root(NULL) {}

// Destructors
template <typename T, typename C>
OSTree<T,C>::~OSTree () { 
  if (root != NULL) 
    delete root; 
  root = NULL;
}

// Accessor Methods
template <typename T, typename C>
Color OSTree<T,C>::colorOf (OSNode<T> *node) const {
  if (node == NULL)
    return BLACK;
  return node->color;
}

template <typename T, typename C>
size_t OSTree<T,C>::sizeOf (OSNode<T> *node) const {
  if (node == NULL)
    return 0;
  return node->size;
}

template <typename T, typename C>
void OSTree<T,C>::setColor (OSNode<T> * node, Color color) {
  assert(node != NULL || color == BLACK);
  if (node == NULL)
    return;
  node->color = color;
}

//template <typename T, typename C>
//OSNode<T> * OSTree<T,C>::getPredecessorOf (OSNode<T> *) const {}


template <typename T, typename C>
OSNode<T> * OSTree<T,C>::getSuccessorOf (OSNode<T> *x) const {
  assert(x != NULL);
  OSNode<T> *y;
  
  if ((y = x->right) != NULL) { // assignment to y is intentional 
  while(y->left != NULL) { // returns the minium of the right subtree of x 
      y = y->left;
    }
    return y;
  } 
  y = x->parent;
  while(y != NULL && x == y->right) { 
    x = y;
    y = y->parent;
  }
  return y;
}

template <typename T, typename C>
void OSTree<T,C>::showTree () {
  showTree(root);
}

template <typename T, typename C>
void OSTree<T,C>::showTree (OSNode<T> *node) {
  if (node != NULL) {
    showTree(node->left);
    cout << *node << endl;
    showTree(node->right);
  }
}


//template <typename T, typename C>
//OSNode<T> * OSTree<T,C>::search (T t) {}

//template <typename T, typename C>
//void OSTree<T,C>::checkAssumptions () {}


// Mutator Methods
template <typename T, typename C>
OSNode<T> * OSTree<T,C>::insert (T node) {
  //  assert(node != NULL);
  OSNode<T> *y;
  OSNode<T> *x;
  OSNode<T> *newNode = new OSNode<T>(node, RED);
  x = newNode;
  insertHelp(x);
  
  while (x != root && colorOf(x->parent) == RED) {
    if (x->parent == x->parent->parent->left) {
      y = x->parent->parent->right;
      if (colorOf(y) == RED) {

        /*
         * case 1: x's uncle is red: recolor
         *          (Cb)                     x(Cr)     
         *         /   \     	              /   \     
         *      (Br)     (Dr)	           (Bb)     (Db)
         *      / \     / \     ===>      / \     / \  
         *   x(Ar) 'c  'd  'e	         (Ar) 'c  'd  'e
         *    / \            	         / \            
         *  'a  'b           	       'a  'b           
         */
        
        setColor(x->parent, BLACK);
        setColor(y, BLACK);
        setColor(x->parent->parent, RED);
        x = x->parent->parent;
      } else {
        if (x == x->parent->right) {
          // case 2: x is a right child: rotate to get to case 3
          x = x->parent;
          leftRotate(x);
          // now x is a left child
        }
        // case 3: x is a left child: recolor and rotate grandparent
        setColor(x->parent, BLACK);
        setColor(x->parent->parent, RED);
        rightRotate(x->parent->parent);
      }
    } else {
      // Right case: x's parent is a right child	
      // symmetric with left case
      y = x->parent->parent->left;
      if (colorOf(y) == RED) {
        // case 1: x's uncle is red: recolor
        setColor(x->parent, BLACK);
        setColor(y,BLACK);
        setColor(x->parent->parent, RED);
        x = x->parent->parent;
      } else {
        if (x == x->parent->left) {
	  // case 2: x is a left child: rotate to get to case 3
          x = x->parent;
          rightRotate(x);
          // now x is a right child
        }
        // case 3: x is a right child: recolor and rotate grandparent
        setColor(x->parent, BLACK);
        setColor(x->parent->parent, RED);
        leftRotate(x->parent->parent);
      }
    }
  }
  setColor(root, BLACK);
  return newNode;
}

template <typename T, typename C>
void OSTree<T,C>::remove (OSNode<T> * z) {
  assert(z != NULL);
  OSNode<T> *x;
  OSNode<T> *y;
  OSNode<T> *w;

  if (z->left == NULL || z->right == NULL) {
    y = z;
  } else {
    y = getSuccessorOf(z);
  }
  if (y->left != NULL) {
    x = y->left;    
  } else {
    x = y->right;
  }
  if (x != NULL) {
    x->parent = y->parent;
  }
  if (y->parent == NULL) {
    root = x;
  } else {
    if (y == y->parent->left) {
      y->parent->left = x;
    } else {
      y->parent->right = x;
    }
    w = y->parent;
    while (w != NULL) {
      w->setSize(w->getSize() - 1);
      w = w->parent;
    }
  }
  if (y != z) {
    // copy y fields to z
    z->data = y->data;
    z->size = y->size;
    setColor(z, colorOf(y));
  }
  if (colorOf(y) == BLACK) {
    removeHelp(x);
  }
  delete y;
}

// Helper Methods
template <typename T, typename C>
void OSTree<T,C>::leftRotate (OSNode<T> *x) {
  assert(x != NULL);
  OSNode<T> *y;
  
  y = x->right;
  x->right = y->left;
  if (y->left != NULL) {
    y->left->parent = x;
  }
  y->parent = x->parent;
  if (x->parent == NULL) {
    root = y;
  } else {
    if (x == x->parent->left) {
      x->parent->left = y;
    } else {
      x->parent->right = y;
    }
  }
  y->left = x;
  x->parent = y;
  y->setSize(x->getSize());
  x->updateSize();
}

template <typename T, typename C>
void OSTree<T,C>::rightRotate (OSNode<T> *y) {
  assert(y != NULL);
  OSNode<T> *x;
  x = y->left;
  y->left = x->right;
  if (x->right != NULL) {
    x->right->parent = y;
  }
  x->parent = y->parent;
  if (y->parent == NULL) {
    root = x;
  } else {
    if (y == y->parent->left) {
      y->parent->left = x;
    } else {
      y->parent->right = x;
    }
  }
  x->right = y;
  y->parent = x;
  x->setSize(y->getSize());
  y->updateSize();
}

template <typename T, typename C>
void OSTree<T,C>::insertHelp (OSNode<T> *z) {
  assert(z != NULL);
  OSNode<T> *x;
  OSNode<T> *y;
  
  z->left = z->right = NULL;

  y = NULL;
  x = root;
  while (x != NULL) {
    x->setSize(x->getSize() + 1);
    y = x;
    if (C()(z->getData(), x->getData())) {
      x = x->left;
    } else {
      x = x->right;
    }
  }
  z->parent = y;
  if (y == NULL) {
    root = z;
  } else {
    if (C()(z->getData(), y->getData())) {
      y->left = z;     
    } else {
      y->right = z;
    }
  }
  z->setSize(1);
}

template <typename T, typename C>
void OSTree<T,C>::removeHelp (OSNode<T> *x, OSNode<T> *p) {
  assert(p != NULL);
  OSNode<T> *w;
  while (x != root && colorOf(x) == BLACK) {
    if (x == p->left) {
      w = p->right;
      if (colorOf(w) == RED) {
        setColor(w, BLACK);
        setColor(p, RED);
        rotateLeft(p);
        w = p->right;
      }
      if (colorOf(w->left) == BLACK && colorOf(w->right == BLACK)) {
        setColor(w, RED);
        x = p;
        p = p->parent;
      } else {
        if (colorOf(w->right) == BLACK) {
          setColor(w->left, BLACK);
          setColor(w, RED);
          rotateRight(w);
          w = p->right;
        }
        setColor(w, colorOf(p));
        setColor(p, BLACK);
        setColor(w->right, BLACK);
        rotateLeft(p);
        x = root;
      }
    } else {
      w = p->left;
      if (colorOf(w) == RED) {
        setColor(w, BLACK);
        setColor(p, RED);
        rotateRight(p);
        w = p->left;
      }
      if (colorOf(w->right) == BLACK && colorOf(w->left == BLACK)) {
        setColor(w, RED);
        x = p;
        p = p->parent;
      } else {
        if (colorOf(w->left) == BLACK) {
          setColor(w->right, BLACK);
          setColor(w, RED);
          rotateLeft(w);
          w = p->left;
        }
        setColor(w, colorOf(p));
        setColor(p, BLACK);
        setColor(w->left, BLACK);
        rotateRight(p);
        x = root;
      }      
    }
  }
  setColor(x, BLACK);
}

template <typename T, typename C>
OSNode<T> * OSTree<T,C>:: select (size_t i) const {
  return select(root, i);
}

template <typename T, typename C>
OSNode<T> * OSTree<T,C>:: select (OSNode<T> *x, size_t i) const {
  assert(x != NULL);
  size_t r = sizeOf(x->left) + 1;
  if (i == r) {
    return x;
  } else if (i < r) {
    return select(x->left, i);
  } else {
    return select(x->right, i - r);
  }
}

template <typename T, typename C>
size_t OSTree<T,C>::rank (OSNode<T> *x) const {
  assert(x != NULL);
  size_t r = sizeOf(x->left) + 1;
  OSNode<T> *y = x;
  while (y != root) {
    if (y == y->parent->right)
      r += sizeOf(y->parent->left) + 1;
    y = y->parent;
  }
  return r;
}
//*****************************************************************************
#endif
//*****************************************************************************
//*****************************************************************************
