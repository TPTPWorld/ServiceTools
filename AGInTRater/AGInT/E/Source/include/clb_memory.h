/*-----------------------------------------------------------------------

File  : clb_memory.h

Author: Stephan Schulz

  This module implements simple general purpose memory management
  routines that is efficient for problems with a very regular memory
  access pattern (like most theorem provers). In addition to the
  groundwork it also implements secure versions of standard functions
  making use of memory allocation.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Aug 13 21:56:20 MET DST 1997
    New

-----------------------------------------------------------------------*/

#ifndef CLB_MEMORY

#define CLB_MEMORY

#ifdef USE_NEWMEM
#include "clb_newmem.h"
#else

#include "clb_verbose.h"
#include "clb_os_wrapper.h"

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

/* Administrate deallocated memory blocks */

typedef struct memcell
{
   struct memcell* next;
#ifndef NDEBUG
   unsigned long   test;
#endif
}MemCell, *Mem_p;

/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

#define MEM_ARR_SIZE 1024
#define MEM_FREE_PATTERN 0xFAFBFAFA
#define MEM_RSET_PATTERN 0x00000000

extern bool MemIsLow;
extern Mem_p free_mem_list[]; /* Exported for use by inline
                               * functions/Macros */

static __inline__ void* SizeMallocReal(size_t size);
static __inline__ void  SizeFreeReal(void* junk, size_t size);


/* For estimating the real memory consumption of a data type - the
   default may be way of for some memory managers, but should be
   reasonably ok for many situations. If CONSTANT_MEM_ESTIMATE is on,
   a very rough but machine-independent estimate is used. */

#ifdef CONSTANT_MEM_ESTIMATE
#define MEMSIZE(type) "There is a bug in the code! Everything has to work with constants."
#else
#define MEMSIZE(type) (sizeof(type)+sizeof(void*))
#endif

#ifdef USE_SYSTEM_MEM

#ifndef NDEBUG
#define SizeFree(junk, size) free(junk); junk=NULL
#define SizeMalloc(size)     malloc(size)
#define ENSURE_NULL(junk)    junk=NULL
#else
#define SizeFree(junk, size) free(junk)
#define SizeMalloc(size)     malloc(size)
#define ENSURE_NULL(junk) /* Only defined in debug mode */
#endif

#else

#ifndef NDEBUG
#define SizeFree(junk, size) SizeFreeReal(junk, size); junk=NULL
#define SizeMalloc(size)     SizeMallocReal(size)
#define ENSURE_NULL(junk)    junk=NULL
#else
#define SizeFree(junk, size) SizeFreeReal(junk, size);
#define SizeMalloc(size)     SizeMallocReal(size)
#define ENSURE_NULL(junk) /* Only defined in debug mode */
#endif

#endif

void  MemFlushFreeList(void);
void* SecureMalloc(size_t size);
void* SecureRealloc(void *ptr, size_t size);
char* SecureStrdup(const char* source);
char* SecureStrndup(const char* source, size_t n);
#define FREE(junk) assert(junk);free(junk); junk=NULL

long* IntArrayAlloc(int size);
#define IntArrayFree(array, size) SizeFree(array, size*sizeof(long))

#ifdef CLB_MEMORY_DEBUG
void MemDebugPrintStats(FILE* out);
extern long size_malloc_mem;
extern long size_malloc_count;
extern long size_free_mem;
extern long size_free_count;
extern long clb_free_count;
extern long secure_malloc_count;
extern long secure_malloc_mem;
extern long secure_realloc_count;
extern long secure_realloc_m_count;
extern long secure_realloc_f_count;
void MemFreeListPrint(FILE* out);
#undef FREE
#define FREE(junk) assert(junk); clb_free_count++; free(junk); junk=NULL
#endif

#ifdef CLB_MEMORY_DEBUG2
#undef FREE
#define FREE(junk) assert(junk); printf("\nBlock %p F:\n", junk);\
                   free(junk); junk=NULL
#endif

/*-------------------------------------------------------------------------
  If you want to have a special Allocator and Deallocator for a
  datatype just copy the following templates to your .h-file and fill
  them in... The allocated structures will not be initialized - you
  need to write a function built on top of the macros if you want more
  functionality in you Allocator. 

#define DataCellAlloc() (DataCell*)SizeMalloc(sizeof(DataCell))
#define DataCellFree(junk)         SizeFree(junk, sizeof(DataCell))

-------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
//
// Function: SizeMallocReal()
//
//   Returns a block of memory sized size using the internal
//   free-list. This block is freeable with free(), and in all
//   respects behaves like a normal malloc'ed block. 
//
// Global Variables: free_mem_list[] 
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

static __inline__ void* SizeMallocReal(size_t size)
{
   Mem_p  handle;
   size_t mem_index;
   
   mem_index = size - sizeof(MemCell);
   
   if((mem_index>=0) && (mem_index<MEM_ARR_SIZE) && free_mem_list[mem_index])
   {
      assert(free_mem_list[mem_index]->test == MEM_FREE_PATTERN);
      assert((free_mem_list[mem_index]->test = MEM_RSET_PATTERN, true));
      handle = free_mem_list[mem_index];
      free_mem_list[mem_index] = free_mem_list[mem_index]->next;
   } 
   else
   {
      handle = CPPCAST(Mem_p)SecureMalloc(size);
#ifndef NDEBUG
      if((mem_index>=0) && (mem_index<MEM_ARR_SIZE))
      {
	 assert((handle->test = MEM_RSET_PATTERN, true));
      }
#endif
   }
   #ifdef CLB_MEMORY_DEBUG 
   size_malloc_mem+=size;
   size_malloc_count++;
   #endif
#ifdef CLB_MEMORY_DEBUG2
   printf("\nBlock %p A: size %zd\n", handle, size);
#endif
   return handle;
}   


/*-----------------------------------------------------------------------
//
// Function: SizeFreeReal()
//
//  Returns a block sized size. Note: size has to be exact - you
//  should only give blocks to SizeFree() that have been allocated
//  with malloc(size) or SizeMalloc(size). Giving blocks that are to
//  big wastes memory, blocks that are to small will result in more
//  serious trouble (segmentation faults).
//
// Global Variables: free_mem_list[]
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

static __inline__ void SizeFreeReal(void* junk, size_t size)
{
   size_t mem_index;
   
   assert(junk!=NULL);

#ifdef CLB_MEMORY_DEBUG2
   printf("\nBlock %p D: size %zd\n", junk, size);
#endif

   mem_index = size - sizeof(MemCell);

   if(mem_index>=0 && mem_index<MEM_ARR_SIZE)
   {
      ((Mem_p)junk)->next = free_mem_list[mem_index];
      free_mem_list[mem_index] = (Mem_p)junk;
      assert(free_mem_list[mem_index]->test != MEM_FREE_PATTERN); 
      assert(free_mem_list[mem_index]->test = MEM_FREE_PATTERN);
   } 
   else
   {
      FREE(junk);
   }
#ifdef CLB_MEMORY_DEBUG 
   size_free_mem+=size;
   size_free_count++;
#endif
} 

#endif
#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/






