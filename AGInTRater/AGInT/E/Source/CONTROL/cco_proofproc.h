/*-----------------------------------------------------------------------

File  : cco_proofproc.h

Author: Stephan Schulz

Contents
 
  Top level proof procedure

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Mon Jun  8 04:19:50 MET DST 1998
    New

-----------------------------------------------------------------------*/

#ifndef CCO_PROOFPROC

#define CCO_PROOFPROC

#include <che_heuristics.h>
#include <che_axiomscan.h>
#include <che_to_autoselect.h>
#include <cco_clausesplitting.h>
#include <cco_forward_contraction.h>
#include <cio_signals.h>
#include <ccl_fcvindexing.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/



/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

/* Collect term cells from temporary clause copies if their number
   reaches this. 10000 is big enough that it nearly never happens, 500
   is big enough that it rarely happens, but that the bank remains
   small enough. */
#define TMPBANK_GC_LIMIT 256

void     ProofControlInit(ProofState_p state, ProofControl_p control,
			  HeuristicParms_p params, 
                          FVIndexParms_p fvi_params, 
                          PStack_p wfcb_defs, 
                          PStack_p hcb_defs);
void     ProofStateInit(ProofState_p state, ProofControl_p control);
void     ProofStateResetProcessedSet(ProofState_p state,  
                                     ProofControl_p control, 
                                     ClauseSet_p set);
void     ProofStateResetProcessed(ProofState_p state,
                                  ProofControl_p control);
Clause_p ProcessClause(ProofState_p state, ProofControl_p control);
Clause_p Saturate(ProofState_p state, ProofControl_p control, long
		  step_limit, long proc_limit, long unproc_limit, long
		  total_limit);



#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





