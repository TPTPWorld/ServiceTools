/*-----------------------------------------------------------------------

File  : ccl_clausecpos.h

Author: Stephan Schulz

Contents
 
  Positions of subterms in clauses (and in equations) using compact
  (i.e. single integer) positions.

  Copyright 2010 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Thu Feb 18 01:31:48 EET 2010
    New

-----------------------------------------------------------------------*/

#ifndef CLAUSECPOS

#define CLAUSECPOS

#include <ccl_clausepos.h>


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

typedef long CompactPos;


/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/


CompactPos  PackTermPos(TermPos_p pos);
CompactPos  PackClausePos(ClausePos_p pos);

void        UnpackTermPos(TermPos_p pos, Term_p t, CompactPos cpos);
void        UnpackClausePosInto(CompactPos cpos, Clause_p clause, 
                          ClausePos_p pos);
ClausePos_p UnpackClausePos(CompactPos cpos, Clause_p clause);



/*---------------------------------------------------------------------*/
/*                Inline Functions                                     */
/*---------------------------------------------------------------------*/


#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





