/*-----------------------------------------------------------------------

File  : cte_simplesorts.h

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Data structure and function interfaces for managing simple, disjoint
  sorts.

  Copyright 2007 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Sep 15 01:33:52 EDT 2007
    New

-----------------------------------------------------------------------*/

#ifndef CTE_SIMPLESORTS

#define CTE_SIMPLESORTS

#include <clb_stringtrees.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

/* Build-in sorts for the many-sorted logic E is being moved to. Note
 * that the system relys on the fact that the system-defined sorts are
 * inserted in a specific order. */

typedef enum 
{
   STNoSort = 0,      
   STBool,           /* Boolean sort, will replace/extend the
                        predicate bit */
   STIndividuals,    /* Default sort, "individuums" */
   STInteger,        /* Integer numbers */
   STReal            /* Reals */
}SortType;


/* Datatype for representing the sort system. Currenlty associates
 * sort types with encodings and tracks the default sort. */

typedef struct sort_table
{
   SortType  default_type;  /* Sort of undeclared function
                             * symbols. STIndividuals by default, but
                             * can be changed */ 
   StrTree_p sort_index;    /* Associates a sort name with the type */
   PStack_p  back_index;    /* Back-Association from type to
                               string. Position i on the stack
                               contains the key of sort i in the
                               sort_index. */
}SortTableCell, *SortTable_p;



/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

#define SortTableCellAlloc()    (SortTableCell*)SizeMalloc(sizeof(SortTableCell))
#define SortTableCellFree(junk) SizeFree(junk, sizeof(SortTableCell))

SortTable_p SortTableAlloc(void);
void        SortTableFree(SortTable_p junk);
SortType    SortTableInsert(SortTable_p table, char* sort_name);
SortTable_p DefaultSortTableAlloc(void);
char*       SortTableGetRep(SortTable_p table, SortType sort);
void        SortTablePrint(FILE* out, SortTable_p table);




#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





