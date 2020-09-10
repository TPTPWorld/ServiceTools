/*-----------------------------------------------------------------------

File  : clb_pdgarrays.h

Author: Stephan Schulz

Contents
 
  Dynamic arrays of pointers and long integers, indexed by values in Z
  (i.e. both positive and negative indices are allowed. You can define
  the growth behaviour by specifying a value. If it is
  GROW_EXPONENTIAL, arrays will always grow by a factor that is the
  lowest power of two that will make the array big enough. Otherwise
  it will grow by the smallest multiple of the value specified that
  creates the requested position. 

  Copyright 1998, 1999, 2004, 2010 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Mar  6 16:38:39 CET 2010
    New from clb_pdarrays.h

-----------------------------------------------------------------------*/

#ifndef CLB_GPDARRAYS

#define CLB_GPDARRAYS

#include <clb_pdarrays.h>


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

typedef struct pdarraycell
{
   bool   integer; 
   long   lower;
   long   upper;
   long   grow;
   IntOrP *array;
}GPDArrayCell, *GPDArray_p; 


/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

#define GPDArrayCellAlloc() (GPDArrayCell*)SizeMalloc(sizeof(GPDArrayCell))
#define GPDArrayCellFree(junk) SizeFree(junk, sizeof(GPDArrayCell))
#define GPDARRAYSIZE(arr) ((arr)->upper - (arr)->lower)

#ifdef CONSTANT_MEM_ESTIMATE
#define GPDARRAYCELL_MEM 20
#else
#define GPDARRAYCELL_MEM MEMSIZE(GPDArrayCell)
#endif
#define GPDArrayStorage(arr) (GPDARRAYCELL_MEM+INTORP_MEM+(GPDARRAYSIZE(arr)*INTORP_MEM))


GPDArray_p GPDArrayAlloc(long grow);
GPDArray_p GPDIntArrayAlloc(long grow);
void       GPDArrayFree(GPDArray_p junk);
GPDArray_p GPDArrayCopy(GPDArray_p array);

void      GPDArayEnlarge(GPDArray_p array, long idx);
static __inline__ IntOrP*   GPDArrayElementRef(GPDArray_p array, long idx);

void      GPDArrayElementDeleteP(GPDArray_p array, long idx);
void      GPDArrayElementDeleteInt(GPDArray_p array, long idx);

#define   GPDArrayAssign(array, idx, value) \
          *GPDArrayElementRef((array), (idx)) = (value)
#define   GPDArrayAssignP(array, idx, value) \
          GPDArrayElementRef((array), (idx))->p_val = (value)
#define   GPDArrayAssignInt(array, idx, value) \
          GPDArrayElementRef((array), (idx))->i_val = (value)

#define   GPDArrayElement(array, idx) \
	  *GPDArrayElementRef((array), (idx))
#define   GPDArrayElementP(array, idx) \
	  (GPDArrayElementRef((array), (idx))->p_val)
#define   GPDArrayElementInt(array, idx) \
	  (GPDArrayElementRef((array), (idx))->i_val)

long      GPDArrayMembers(GPDArray_p array);
void      GPDArrayElementDelete(GPDArray_p array, long idx);
long      GPDArrayElementIncInt(GPDArray_p array, long idx, long value);

/*---------------------------------------------------------------------*/
/*                     Inline functions                                */
/*---------------------------------------------------------------------*/

	  
/*-----------------------------------------------------------------------
//
// Function: GPDArrayElementRef()
//
//   Return a reference to an element in a dynamic array. This
//   reference is only good until the next call to this function! User
//   programs are expected to use this function only extremely rarely
//   and with special care. Use GPDArrayElement()/GPDArrayAssign()
//   instead. 
//
// Global Variables: -
//
// Side Effects    : May enlarge and move array.
//
/----------------------------------------------------------------------*/

static __inline__ IntOrP* GPDArrayElementRef(GPDArray_p array, long idx)
{
   assert(array);
   
   if(  !(idx < array->size))
   {
      GPDArayEnlarge(array, idx);
   }
   return &(array->array[idx]);
}

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





