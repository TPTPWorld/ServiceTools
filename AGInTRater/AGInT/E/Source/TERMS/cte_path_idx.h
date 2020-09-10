/*-----------------------------------------------------------------------

File  : cte_path_idx.h

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Compute a fingerprint of a term suitable for path indexing. A
  fingerprint is a vector of individual samples for positions p, where
  the result is t|p->f_code if p is a position in t, -LONG_MAX if
  p<=q, t|q=Xn, 0 otherwise.

  Copyright 2010 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Feb 20 19:19:23 EET 2010
    New

-----------------------------------------------------------------------*/

#ifndef CTE_IDX_FP

#define CTE_IDX_FP

#include <cte_termtypes.h>


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

#ifdef NEVER_DEFINED

typedef struct path_index_cell
{
   IntMap_p           f_alternatives;   /* Function symbols */
   PDArray_p          v_alternatives;   /* Variables */

   
}


typedef struct path_index_term_cell
{
   Term_p term;
   void*  payload;
}PathIndexTermCell;

#endif

/* Fingerprints of n elements are FunCode (long) arrays, with the
 * first element containing the lenghts (inclusive), the others the
 * results of the sampling */

typedef FunCode IndexFP, *IndexFP_p;


/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

IndexFP_p IndexFP4Create(Term_p t);
void      IndexFPFree(IndexFP_p junk);
void      IndexFPPrint(FILE* out, IndexFP_p fp);


#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





