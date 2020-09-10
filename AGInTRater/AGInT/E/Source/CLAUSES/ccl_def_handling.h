/*-----------------------------------------------------------------------

File  : ccl_def_handling.h

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Datatypes for handling clausal definitons as used (up to now
  implicietely) in splitting, i.e. data structures associating a
  clause with a fresh constant predicate symbol or literal.

  Copyright 2006 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sun Jun  4 16:02:41 EEST 2006
    New

-----------------------------------------------------------------------*/

#ifndef CCL_DEF_HANDLING

#define CCL_DEF_HANDLING

#include <ccl_subsumption.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/


typedef struct def_store_cell
{
   TB_p        terms;       /* Where to build new literals. */
   ClauseSet_p def_clauses; /* The clauses we have definitions for. */ 
   NumTree_p   def_assocs;  /* Association of clause id and new symbol. */
}DefStoreCell, *DefStore_p;




/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

#define DefStoreCellAlloc()    (DefStoreCell*)SizeMalloc(sizeof(DefStoreCell))
#define DefStoreCellFree(junk) SizeFree(junk, sizeof(DefStoreCell))

DefStore_p DefStoreAlloc(TB_p terms); /* FVIindex will be added
                                       * seperately */
void       DefStoreFree(DefStore_p junk);

Eqn_p      GenDefLit(TB_p bank, FunCode pred, bool positive,
                     PStack_p split_vars);

Clause_p GetDefinition(DefStore_p store, Eqn_p litlist, 
                       FunCode *def_pred, bool fresh, long *apply_id);

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





