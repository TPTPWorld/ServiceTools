/*-----------------------------------------------------------------------

File  : cte_match_mgu_1-1.h

Author: Stephan Schulz

Contents
 
  Interface to simple, non-indexed 1-1 match and unification
  routines on shared terms (and unshared terms with shared
  variables).

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Mar 11 16:17:33 MET 1998
    New

-----------------------------------------------------------------------*/

#ifndef CTE_MATCH_MGU_1_1

#define CTE_MATCH_MGU_1_1

#include <cte_subst.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/




/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

bool SubstComputeMatch(Term_p matcher, Term_p to_match, Subst_p subst,
		       TermEqualTestFun EqualTest);
bool SubstComputeMgu(Term_p t1, Term_p t2, Subst_p subst);

#define VerifyMatch(matcher, to_match) \
        TermStructEqualDeref((matcher), (to_match), \
			     DEREF_ONCE, DEREF_NEVER)

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





