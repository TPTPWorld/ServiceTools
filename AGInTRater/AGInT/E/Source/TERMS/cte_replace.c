/*-----------------------------------------------------------------------

File  : cte_replace.c

Author: Stephan Schulz

Contents
 
  Functions for replacing and rewriting of terms.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Mon Jan 26 19:16:16 MET 1998
    new

-----------------------------------------------------------------------*/

#include "cte_replace.h"



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
// Function: TermAddRWLink()
//
//   Add a rewrite link from term to replace, induced by demod. Note:
//   If demod is REWRITE_AT_SUBTERM, actual rewriting happened at a
//   subterm.
//
// Global Variables: -
//
// Side Effects    : As described
//
/----------------------------------------------------------------------*/

void TermAddRWLink(Term_p term, Term_p replace, long demod, bool sos,
                   RWResultType type)
{
   assert(term);
   assert(replace);
   assert(term!=replace);
   
   TermCellSetProp(term, TPIsRewritten);   

   if(type==RWAlwaysRewritable)
   {
      TermCellSetProp(term, TPIsRRewritten);
   }
   
   TermRWReplaceField(term) = replace;
   TermRWDemodField(term)   = demod;

   if(sos)
   {
      TermCellSetProp(term, TPIsSOSRewritten);
   }
}


/*-----------------------------------------------------------------------
//
// Function: TermFollowRWChain()
//
//   Return the last term in an existing rewrite link chain.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

Term_p TermFollowRWChain(Term_p term)
{
   assert(term);

   /* printf("Starting chain\n"); */
   while(TermIsRewritten(term))
   {
      term = TermRWReplaceField(term);
      /* printf("Following chain\n"); */
      assert(term);
   }
   return term;
}


/*-----------------------------------------------------------------------
//
// Function: TermComputeRWSequence()
//
//   Given two terms from and two, connected by a rewrite chain, push
//   a sequence of clause idents onto the stack such that they
//   represent a rewrite chain transforming to into from. Returns true
//   if the chain has length 0.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

bool TermComputeRWSequence(PStack_p stack, Term_p from, Term_p to)
{
   bool   res = false;
   long   demod_id;
   Term_p tmp;

   while(from != to)
   {
      assert(TermIsRewritten(from));
      demod_id = TermRWDemod(from) ;
      tmp = TermRWReplaceField(from);
      if(demod_id == REWRITE_AT_SUBTERM)
      {
	 int i;
	 assert(from->f_code == tmp->f_code);
	 assert(from->arity&&from->args&&tmp->args);

	 for(i=0; i<from->arity; i++)
	 {
	    TermComputeRWSequence(stack, from->args[i], tmp->args[i]);
	 }
      }
      else
      {
	 PStackPushInt(stack, demod_id);
      }
      from = tmp;
      assert(from);
      res = true;
   }
   return res;
}

/*-----------------------------------------------------------------------
//
// Function: TBTermPosReplace()
//
//   Create a new term by replacing the subterm designated by pos with
//   repl and insert it into the term bank. Return pointer to the new
//   term. The superterm is implicit in the position (or, in the case
//   of the empty position, is unnecessary). Does not free any terms -
//   if necessary, this is the responsibility of the calling
//   functions.
//
//   Note that this function may dereference terms more than once,
//   which will lead to strange behaviour if instantiated variables
//   appear in the term...---> This has been fixed. Each term in repl
//   and its superterms should now be dereferenced only once.
//
// Global Variables: -
//
// Side Effects    : Memory management, changes term bank
//
/----------------------------------------------------------------------*/

Term_p TBTermPosReplace(TB_p bank, Term_p repl, TermPos_p pos,
			DerefType deref)
{
   Term_p        handle, old;
   int           subscript;
   PStackPointer i;
   PStack_p      store = PStackAlloc();


   assert(bank);
   assert(repl);
   assert(pos);
   
   i = PStackGetSP(pos);
   
   while(i)
   {
      i--;
      subscript = PStackElementInt(pos, i);
      assert(i);
      i--;
      
      old = PStackElementP(pos, i);
      handle = TermTopCopy(old);
      assert(handle->arity > subscript);
      handle->args[subscript] = repl;
      PStackPushP(store, handle);
      repl = handle;
   }
   repl = TBInsertNoProps(bank, repl, deref);

   while(!PStackEmpty(store))
   {
      handle = PStackPopP(store);
      TermTopFree(handle);
   }
   PStackFree(store);

   return repl;
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


