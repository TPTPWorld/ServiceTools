/*-----------------------------------------------------------------------

File  : ccl_rewrite.h

Author: Stephan Schulz

Contents
 
  Functions for rewriting terms and clauses with clause sets.

  Copyright 1998--2002 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Tue May 26 19:47:52 MET DST 1998
    New

-----------------------------------------------------------------------*/

#ifndef CCL_REWRITE

#define CCL_REWRITE

#include <cte_replace.h>
#include <ccl_pdtrees.h>
#include <ccl_clausefunc.h>


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

/* Collect all necessary information for rewriting into one structure */ 

typedef struct rw_desc_cell
{
   OCB_p        ocb;
   TB_p         bank;
   ClauseSet_p  *demods;
   SysDate      demod_date;
   RewriteLevel level;
   bool         prefer_general;
   bool         sos_rewritten; /* Return value! */
}RWDescCell, *RWDesc_p;




/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/


#define RWDescCellAlloc()    (RWDescCell*)SizeMalloc(sizeof(RWDescCell))
#define RWDescCellFree(junk) SizeFree(junk, sizeof(RWDescCell))


extern long RewriteAttempts;
extern long RewriteSucesses;
extern long RewriteUnboundVarFails;
extern bool RewriteStrongRHSInst;


Term_p TermComputeLINormalform(OCB_p ocb, TB_p bank, Term_p term,
			       ClauseSet_p *demodulators,
			       RewriteLevel level, 
                               bool prefer_general,
                               bool restricted_rw);

bool ClauseComputeLINormalform(OCB_p ocb, TB_p bank, Clause_p
			       clause, ClauseSet_p *demodulators,
			       RewriteLevel level, bool
			       prefer_general);

long ClauseSetComputeLINormalform(OCB_p ocb, TB_p bank, ClauseSet_p
				  set, ClauseSet_p *demodulators,
				  RewriteLevel level, bool
				  prefer_general);

bool FindRewritableClauses(OCB_p ocb, ClauseSet_p set,
			   PStack_p results, Clause_p
			   new_demod, SysDate nf_date);


#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





