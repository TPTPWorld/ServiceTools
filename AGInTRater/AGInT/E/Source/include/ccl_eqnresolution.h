/*-----------------------------------------------------------------------

File  : ccl_eqnresolution.h

Author: Stephan Schulz

Contents
 
  Routines for performing (ordered) equality resolution.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Fri Jun  5 18:36:46 MET DST 1998
    New

-----------------------------------------------------------------------*/

#ifndef CCL_EQNRESOLUTION

#define CCL_EQNRESOLUTION

#include <ccl_clausesets.h>


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/



/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

extern   bool EqResOnMaximalLiteralsOnly;

Clause_p ComputeEqRes(TB_p bank, ClausePos_p pos, VarBank_p
		      freshvars);
Eqn_p    ClausePosFirstEqResLiteral(Clause_p clause, ClausePos_p
					pos);
Eqn_p    ClausePosNextEqResLiteral(ClausePos_p pos);


#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/









