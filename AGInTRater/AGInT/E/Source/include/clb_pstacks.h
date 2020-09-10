/*-----------------------------------------------------------------------

File  : clb_pstacks.h

Author: Stephan Schulz

Contents
 
  Soemwhat efficient unlimited growth stacks for pointers/long ints.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Dec  3 16:22:48 MET 1997
    New

-----------------------------------------------------------------------*/

#ifndef CLB_PSTACKS

#define CLB_PSTACKS

#include <clb_memory.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/


/* Generic stack data type, can take (long) integers or pointers */

typedef int PStackPointer;

typedef struct pstackcell
{
   int           size;    /* ...of allocated memory */
   PStackPointer current; /* First unused address, 0 for empty stack */  
   IntOrP        *stack;  /* Stack area */
}PStackCell, *PStack_p;


#define PSTACK_DEFAULT_SIZE 128 /* Stacks grow exponentially (and never
			 	   shrink unless explicitly freed) -
				   take care */


#define PStackCellAlloc() (PStackCell*)SizeMalloc(sizeof(PStackCell))
#define PStackCellFree(junk)         SizeFree(junk, sizeof(PStackCell))

static __inline__ PStack_p PStackAlloc(void);
static __inline__ void     PStackFree(PStack_p junk);
static __inline__ PStack_p PStackCopy(PStack_p stack);
#define  PStackEmpty(stack) ((stack)->current == 0)
static __inline__ void     PStackReset(PStack_p stack);

static __inline__ void     PStackPushInt(PStack_p stack, long val);
static __inline__ void     PStackPushP(PStack_p stack, void* val);
#define  PStackGetSP(stack) ((stack)->current)

static __inline__ IntOrP   PStackPop(PStack_p stack);
#define  PStackPopInt(stack) (PStackPop(stack).i_val)
#define  PStackPopP(stack)   (PStackPop(stack).p_val)
static __inline__ void     PStackDiscardTop(PStack_p stack);

static __inline__ IntOrP   PStackTop(PStack_p stack);
#define  PStackTopInt(stack) (PStackTop(stack).i_val)
#define  PStackTopP(stack)   (PStackTop(stack).p_val)
static __inline__ IntOrP   PStackBelowTop(PStack_p stack);
#define  PStackBelowTopInt(stack) (PStackBelowTop(stack).i_val)
#define  PStackBelowTopP(stack)   (PStackBelowTop(stack).p_val)


static __inline__ IntOrP   PStackElement(PStack_p stack, PStackPointer pos);
#define  PStackElementInt(stack,pos) (PStackElement(stack,pos).i_val)
#define  PStackElementP(stack,pos) (PStackElement(stack,pos).p_val)

void     PStackSort(PStack_p stack, ComparisonFunctionType cmpfun);


/*---------------------------------------------------------------------*/
/*                  Implementations as inline functions                */
/*---------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
//
// Function: push()
//
//   Implement push operation for pstacks. If the stack area needs to
//   grow, Realloc is emulated in terms of
//   SizeMalloc()/SizeFree(). This is because stacks are allocated and
//   deallocated a lot, and usually in the same sizes, so it pays off
//   to optimize this behaviour.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

static __inline__ void push(PStack_p stack, IntOrP val)
{
   if(stack->current == stack->size)
   {
      IntOrP *tmp;
      int    old_size;

      /* Emulate Realloc-Functionality for use of SizeMalloc() */
      old_size = stack->size;
      stack->size = stack->size*2;
      tmp = CPPCAST(IntOrP*)SizeMalloc(stack->size * sizeof(IntOrP));
      memcpy(tmp, stack->stack, old_size*sizeof(IntOrP));
      SizeFree(stack->stack, old_size * sizeof(IntOrP));
      stack->stack = tmp;
   }
   stack->stack[stack->current] = val;
   stack->current++;
}


/*-----------------------------------------------------------------------
//
// Function: PStackAlloc()
//
//   Allocate an empty stack.
//
// Global Variables: -
//
// Side Effects    : Memory oprations
//
/----------------------------------------------------------------------*/

static __inline__ PStack_p PStackAlloc(void)
{
   PStack_p handle;
   
   handle = PStackCellAlloc();
   handle->size = PSTACK_DEFAULT_SIZE;
   handle->current = 0;
   handle->stack = CPPCAST(IntOrP*)SizeMalloc(handle->size * sizeof(IntOrP));
   
   return handle;
}


/*-----------------------------------------------------------------------
//
// Function: PStackFree()
//
//   Free a stack.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

static __inline__ void  PStackFree(PStack_p junk)
{
   assert(junk);
   assert(junk->stack);
   
   SizeFree(junk->stack, junk->size * sizeof(IntOrP));
   PStackCellFree(junk);
}


/*-----------------------------------------------------------------------
//
// Function: PStackCopy()
//
//   Copy a PStack with contents. Use with care, as some data
//   structures may not be copyable very well (e.g. pointers to the
//   same array, registered references, ...)
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

static __inline__ PStack_p PStackCopy(PStack_p stack)
{
   PStack_p handle = PStackAlloc();
   PStackPointer i;

   for(i=0; i<PStackGetSP(stack); i++)
   {
      push(handle, PStackElement(stack,i));
   }
   return handle;
}


/*-----------------------------------------------------------------------
//
// Function: PStackReset()
//
//   Reset a PStack to empty state.
//
// Global Variables: -
//
// Side Effects    : Changes stackpointer.
//
/----------------------------------------------------------------------*/

static __inline__ void PStackReset(PStack_p stack)
{
   stack->current = 0;
}

/*-----------------------------------------------------------------------
//
// Function: PStackPushInt()
//
//   Push a (long) int onto the stack
//
// Global Variables: -
//
// Side Effects    : By push()
//
/----------------------------------------------------------------------*/

static __inline__ void PStackPushInt(PStack_p stack, long val)
{
   IntOrP help;
   help.i_val = val;
   
   push(stack, help);
}

/*-----------------------------------------------------------------------
//
// Function: PStackPushP()
//
//   Push a pointer onto the stack
//
// Global Variables: -
//
// Side Effects    : by push()
//
/----------------------------------------------------------------------*/

static __inline__ void PStackPushP(PStack_p stack, void* val)
{
   IntOrP help;
   help.p_val = val;
   
   push(stack, help);
}


/*-----------------------------------------------------------------------
//
// Function: PStackPop()
//
//   Implement pop operation for non-empty pstacks.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

static __inline__ IntOrP PStackPop(PStack_p stack)
{
   assert(stack->current);
   
   stack->current--;
   return stack->stack[stack->current];
}


/*-----------------------------------------------------------------------
//
// Function: PStackDiscardTop()
//
//   Do a PStackPop without returning result, to avoid warnings.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

static __inline__ void PStackDiscardTop(PStack_p stack)
{
   assert(stack->current);
   
   stack->current--;
}


/*-----------------------------------------------------------------------
//
// Function: PStackTop()
//
//   Implement Top operation for non-empty pstacks.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

static __inline__ IntOrP PStackTop(PStack_p stack)
{
   assert(stack->current);
   
   return stack->stack[stack->current-1];
}


/*-----------------------------------------------------------------------
//
// Function: PStackBelowTop()
//
//   Return second item on the stack (asserts that stack has >=2
//   elements). 
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

static __inline__ IntOrP PStackBelowTop(PStack_p stack)
{
   assert(stack->current>=2);
   
   return stack->stack[stack->current-2];
}


/*-----------------------------------------------------------------------
//
// Function: PStackElement()
//
//   Return element at position pos.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

static __inline__ IntOrP PStackElement(PStack_p stack, PStackPointer pos)
{
   assert(pos<stack->current);
   assert(pos>=0);

   return stack->stack[pos];
}

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





