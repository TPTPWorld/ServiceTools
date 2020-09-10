/*-----------------------------------------------------------------------

File  : clb_intmap.h

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Definitions and functions for a data type that maps natural numbers
  (including 0) to void* pointers, supporting assignments, retrieval,
  deletion, and iteration.

  Copyright 2004 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Dec 18 15:51:13 CET 2004
    New

-----------------------------------------------------------------------*/

#ifndef CLB_INTMAP

#define CLB_INTMAP

#include <limits.h>
#include <clb_numtrees.h>
#include <clb_pdarrays.h>


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

typedef enum
{
   IMEmpty,
   IMSingle,
   IMArray,
   IMTree
}IntMapType;

#define MAX_TREE_DENSITY 8
#define MIN_TREE_DENSITY 4
#define IM_ARRAY_SIZE MAX_TREE_DENSITY

/* This is the main thing - a datatype that keeps key/value pairs and
 * allows inserting, updating, deleting, and ordered iteration. I
 * expect additons to be frequent and deletions to be rare. Element
 * access and iteration are the most frequent operations. We want this
 * time- and space efficient for many different key distributions. */

typedef struct intmap_cell
{
   IntMapType type;
   long entry_no;        /* How many key/value pairs? May be slightly
                          * larger than the real value, as keys
                          * associated to NULL are indistinguishable
                          * from unassociated keys. */
   long max_key;         /* Largest key (may be only key). Again, this
                          * may be an overestimate, as we do not
                          * always correct this if a key is deleted
                          * from an array. */
   union 
   {
      void*     value;   /* For IMSingle */
      PDArray_p array;   /* For IMArray  */
      NumTree_p tree;    /* For IMTree   */
   }values;
}IntMapCell, *IntMap_p;



typedef struct intmap_iter_cell
{
   IntMap_p map;
   long     lower_key;
   long     upper_key;
   union
   {
      bool      seen;      /* For IMSingle */
      long      current;   /* For IMArray  */
      PStack_p  tree_iter; /* For IMTree */
   }admin_data;   
}IntMapIterCell, *IntMapIter_p;


typedef long (*IntMapFreeFunc)(void *junk_node);

/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

#define IntMapCellAlloc() (IntMapCell*)SizeMalloc(sizeof(IntMapCell))
#define IntMapCellFree(junk) SizeFree(junk, sizeof(IntMapCell))

IntMap_p IntMapAlloc();
void     IntMapFree(IntMap_p map);

void*    IntMapGetVal(IntMap_p map, long key);
void**   IntMapGetRef(IntMap_p map, long key);
void     IntMapAssign(IntMap_p map, long key, void* value);
void*    IntMapDelKey(IntMap_p map, long key);


#define IntMapIterCellAlloc() (IntMapIterCell*)SizeMalloc(sizeof(IntMapIterCell))
#define IntMapIterCellFree(junk) SizeFree(junk, sizeof(IntMapIterCell))

#ifdef CONSTANT_MEM_ESTIMATE
#define INTMAPCELL_MEM 20
#else
#define INTMAPCELL_MEM MEMSIZE(IntMapCell)
#endif

#define IntMapDStorage(map) (((map)->type == IMArray)?\
                             PDArrayStorage((map)->values.array):\
                             (((map)->type == IMTree)?\
                              ((map)->entry_no*NUMTREECELL_MEM):0))

#define IntMapStorage(map) (INTMAPCELL_MEM+IntMapDStorage(map))

IntMapIter_p IntMapIterAlloc(IntMap_p map, long lower_key, long upper_key); 
void         IntMapIterFree(IntMapIter_p junk);
static __inline__ void* IntMapIterNext(IntMapIter_p iter, long *key);

void     IntMapDebugPrint(FILE* out, IntMap_p map);
long     IntMapRecFree(IntMap_p map, IntMapFreeFunc free_func);




/*---------------------------------------------------------------------*/
/*                      Inline Functions                               */
/*---------------------------------------------------------------------*/



/*-----------------------------------------------------------------------
//
// Function: IntMapIterNext()
//
//   Return the next value/key pair in the map (or NULL/ndef) if the
//   iterator is exhausted.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

static __inline__ void* IntMapIterNext(IntMapIter_p iter, long *key)
{
   void* res = NULL;
   long  i;
   NumTree_p handle;

   assert(iter);
   assert(key);

   switch(iter->map->type)
   {
   case IMEmpty:
         break;
   case IMSingle:
         if(!iter->admin_data.seen)
         {
            iter->admin_data.seen = true;
            *key = iter->map->max_key;
            res = iter->map->values.value;
         }
         break;
   case IMArray: 
         for(i=iter->admin_data.current; i<= iter->upper_key; i++)
         {
            res = PDArrayElementP(iter->map->values.array, i);
            if(res)
            {
               *key = i;
               break;
            }
         }
         iter->admin_data.current = i+1;
         break;
   case IMTree:
         while((handle = NumTreeTraverseNext(iter->admin_data.tree_iter)))
         {               
            if(handle)
            {
               if(handle->key > iter->upper_key)
               {
                  /* Overrun limit */
                  break;
               }
               if(handle->val1.p_val)
               {
                  /* Found real value */
                  *key = handle->key;
                  res = handle->val1.p_val;
                  break;
               }
            }
         }
         break;
   default:
         assert(false && "Unknown IntMap type.");
         break;
   }
   return res;
}


#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





