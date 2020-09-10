/*-----------------------------------------------------------------------

File  : clb_gpdarrays.c

Author: Stephan Schulz

Contents
 
  Funktions realising the generalized dynamic array type.

  Copyright 2010 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Mar  6 16:59:32 CET 2010
    New

-----------------------------------------------------------------------*/

#include "clb_gpdarrays.h"



/*---------------------------------------------------------------------*/
/*                        Global Variables                             */
/*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*/
/*                      Forward Declarations                           */
/*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*/
/*                         Internal Functions                          */
/*---------------------------------------------------------------------*/



/*---------------------------------------------------------------------*/
/*                         Exported Functions                          */
/*---------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
//
// Function: GPDArrayAlloc()
//
//   Return an initialized generalized dynamic array where all
//   elements are interpreted as pointers and initialized to NULL.
//
// Global Variables: -
//
// Side Effects    : Memory Operations
//
/----------------------------------------------------------------------*/

GGPDArray_p GGPDArrayAlloc(long grow)
{
   GGPDArray_p handle = GPDArrayCellAlloc();
   int i;
   
   assert(init_size > 0);
   assert(grow >= 0);

   handle->integer = false;
   handle->size  = init_size;
   handle->grow  = grow;
   handle->array = SizeMalloc(handle->size*sizeof(IntOrP));
   for(i=0; i<handle->size; i++)
   {
      handle->array[i].p_val = NULL;
   }
   return handle;
}

/*-----------------------------------------------------------------------
//
// Function: PDIntArrayAlloc()
//
//   Return an initialized dynamic array of size init_size where all
//   elements are interpreted as (long) integers and initialized to 0.
//
// Global Variables: -
//
// Side Effects    : Memory Operations
//
/----------------------------------------------------------------------*/

GPDArray_p PDIntArrayAlloc(long init_size, long grow)
{
   GPDArray_p handle = GPDArrayCellAlloc();
   int i;
   
   assert(init_size > 0);
   assert(grow >= 0);

   handle->integer = true;
   handle->size  = init_size;
   handle->grow  = grow;
   handle->array = SizeMalloc(handle->size*sizeof(IntOrP));
   for(i=0; i<handle->size; i++)
   {
      handle->array[i].i_val = 0;
   }
   return handle;
}


/*-----------------------------------------------------------------------
//
// Function: GPDArrayFree()
//
//   Free a GPDArray. Leaves elements untouched.
//
// Global Variables: -
//
// Side Effects    : Memory Operations
//
/----------------------------------------------------------------------*/

void GPDArrayFree(GPDArray_p junk)
{
   assert(junk);
   assert(junk->size > 0);
   assert(junk->array);

   SizeFree(junk->array, junk->size*sizeof(IntOrP));
   GPDArrayCellFree(junk);
}

/*-----------------------------------------------------------------------
//
// Function: PDArayEnlarge()
//
//   Enlarge array enough to accomodate index.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

void PDArayEnlarge(GPDArray_p array, long idx)
{
   IntOrP *tmp;
   int    old_size, i;
   
   old_size = array->size;
   tmp      = array->array;
   if(array->grow)
   {
      array->size = ((idx/array->grow)+1)*array->grow;
   }
   else
   {
      while(array->size <= idx)
      {
	 array->size = array->size*2;
      }
   }
   array->array = SizeMalloc(array->size * sizeof(IntOrP));
   memcpy(array->array, tmp, old_size*sizeof(IntOrP));
   SizeFree(tmp, old_size * sizeof(IntOrP));
   for(i=old_size; i<array->size; i++)
   {
      if(array->integer)
      {
	 array->array[i].i_val = 0;
      }
      else
      {
	 array->array[i].p_val = NULL;
      }
   }
}

/*-----------------------------------------------------------------------
//
// Function: GPDArrayCopy()
//
//   Copy a GPDArray with contents. Use with care, as some data
//   structures may not be copyable very well (e.g. pointers to the
//   same array, registered references, ...)
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

GPDArray_p GPDArrayCopy(GPDArray_p array)
{
   GPDArray_p handle = GPDArrayAlloc(array->size, array->grow);
   long i;

   for(i=0; i<array->size; i++)
   {
      handle->array[i] = array->array[i];
   }
   return handle;
}


/*-----------------------------------------------------------------------
//
// Function: GPDArrayElementDeleteP()
//
//   If idx is within the currently allocated array, set the value
//   to NULL. Otherwise do nothing.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

void GPDArrayElementDeleteP(GPDArray_p array, long idx)
{
   if(idx < array->size)
   {
      GPDArrayAssignP(array, idx, NULL);
   }
}

/*-----------------------------------------------------------------------
//
// Function: GPDArrayElementDeleteInt()
//
//   If idx is within the currently allocated array, set the value
//   to 0. Otherwise do nothing.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

void GPDArrayElementDeleteInt(GPDArray_p array, long idx)
{
   if(idx < array->size)
   {
      GPDArrayAssignInt(array, idx, 0);
   }
}

/*-----------------------------------------------------------------------
//
// Function: GPDArrayElementIncInt()
//
//   Increment entry indexed in array by value. Return new value.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/
 
long GPDArrayElementIncInt(GPDArray_p array, long idx, long value)
{
   IntOrP *ref = GPDArrayElementRef(array, idx);

   ref->i_val += value;

   return ref->i_val;
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


