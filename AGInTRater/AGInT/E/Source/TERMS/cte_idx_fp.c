/*-----------------------------------------------------------------------

File  : ctr_idx_fp.c

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Compute and handle term fingerprints for indexing.

  Copyright 2010 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Feb 24 01:28:18 EET 2010
    New

-----------------------------------------------------------------------*/

#include "cte_idx_fp.h"



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
// Function: IndexFP4Create()
//
//   Create a fingerprint structure with samples at positions epsilon,
//   1, 2, 1.2 (or epsilon, 0, 1, 0.1 to use E's internal numbering). 
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

IndexFP_p IndexFP4Create(Term_p t)
{
   IndexFP_p res = SizeMalloc(sizeof(FunCode)*5);

   res[0] = 5;
   res[1] = t->f_code;
   if(TermIsVar(t))
   {
      res[2] = BELOW_VAR;
      res[3] = BELOW_VAR;
      res[4] = BELOW_VAR;
   }
   else if(t->arity == 0)
   {
      res[2] = 0;
      res[3] = 0;
      res[4] = 0;
   }
   else 
   {
      if(t->arity>=2)
      {
         res[3] = t->args[1]->f_code;
      }
      else
      {
         res[3] = 0;
      }
      res[2] = t->args[0]->f_code;
      if(TermIsVar(t->args[0]))
      {
         res[4] = BELOW_VAR;
      }
      else if(t->args[0]->arity == 0)
      {
         res[4] = 0;
      }
      else
      {
         res[4] = t->args[0]->args[0]->f_code;
      }
   }
   return res;
}
   

/*-----------------------------------------------------------------------
//
// Function: IndexFPFree()
//
//   Free an IndexFP data-structure (i.e. a self-describing FunCode
//   array). 
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

void IndexFPFree(IndexFP_p junk)
{
   SizeFree(junk, sizeof(FunCode)*junk[0]);
}


/*-----------------------------------------------------------------------
//
// Function: IndexFPPrint()
//
//   Print a term fingerprint.
//
// Global Variables: -
//
// Side Effects    : Output
//
/----------------------------------------------------------------------*/

void IndexFPPrint(FILE* out, IndexFP_p fp)
{
   int i, limit=fp[0];
   
   if(limit>=2)
   {
      fprintf(stdout, "<%ld", fp[1]);
      for(i=2; i<limit; i++)
      {
         fprintf(stdout, ",%ld", fp[i]);
      }      
      fprintf(stdout, ">");
   }   
   else
   {
      fprintf(stdout, "<>");
   }
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


