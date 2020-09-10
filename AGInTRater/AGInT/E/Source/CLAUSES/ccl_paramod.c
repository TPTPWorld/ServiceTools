/*-----------------------------------------------------------------------

File  : ccl_paramod.c

Author: Stephan Schulz

Contents
 
  Paramodulation and stuff...

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Mon May 25 23:53:05 MET DST 1998
    New

-----------------------------------------------------------------------*/

#include "ccl_paramod.h"
#include "ccl_clausecpos.h"


/*---------------------------------------------------------------------*/
/*                        Global Variables                             */
/*---------------------------------------------------------------------*/

/* If true, do overlap non-equational literals as well - default for
   proof mode, but (probably) unecessary for SETHEO preprocessing in
   METOP */

bool ParamodOverlapNonEqLiterals = true;
bool ParamodOverlapIntoNegativeLiterals = true;

/*---------------------------------------------------------------------*/
/*                      Forward Declarations                           */
/*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*/
/*                         Internal Functions                          */
/*---------------------------------------------------------------------*/


/*-----------------------------------------------------------------------
//
// Function: check_paramod_ordering_constraint()
//
//   Given two clause positions and an OCB, return true if the clause
//   resulting from the described paramod-inference shall be
//   kept for further processing. Formally, if sigma(from->clause) >
//   sigma(into->clause), the paramodulant can be discarded. However,
//   this check ist pretty expensive, and does not always improve
//   performance. This function discards some of the unnecessary
//   clauses, trying to capture only the bad cases and to minimize
//   real ordering comparisons.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

#ifdef NEVER_DEFINED

#define PARAMOD_FROM_LENGTH_LIMIT 2 /* This should come from
				       ProofControl as soon as
				       implemented */

static bool check_paramod_ordering_constraint(OCB_p ocb, ClausePos_p
					      from_pos, ClausePos_p
					      into_pos)
{
   bool res = false;
   int from_length = ClauseLiteralNumber(from_pos->clause);

   /* Accept inferences with short clauses */
   
   if(from_length>=PARAMOD_FROM_LENGTH_LIMIT)
   {
      res = true;
   }
   /* In some cases we _know_ that from_pos is smaller */
   else if(from_length == 1 && !TermPosIsTopPos(into_pos->pos)&&
	   EqnIsOriented(from_pos->literal))
   {
      res = true;
   }
   else
   {
      res = ClauseNotGreaterEqual(ocb, from_pos->clause, 
				    into_pos->clause); 
   }
   return res;
}

#endif

/*-----------------------------------------------------------------------
//
// Function: clause_pos_find_first_neg_max_lside()
//
//   Find the first maximal negative side in the list at pos->literal.
//
// Global Variables: -
//
// Side Effects    : Changes pos->literal, pos->side
//
/----------------------------------------------------------------------*/

static Term_p clause_pos_find_first_neg_max_lside(ClausePos_p pos)
{
   Eqn_p handle;
   Term_p res = NULL;

   for(handle = pos->literal; handle; handle = handle->next)
   {
      if(EqnIsMaximal(handle) &&
	 EqnIsNegative(handle))
      {
         break;
      }
   }
   pos->literal = handle;
   if(handle)
   {
      pos->side = LeftSide;
      PStackReset(pos->pos);
      res = ClausePosGetSide(pos);
   }
   return res;
}


/*---------------------------------------------------------------------*/
/*                         Exported Functions                          */
/*---------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
//
// Function: ComputeOverlap()
//
//   Given an equation and a term position, overlap the designated
//   side of the equation into the subterm, i.e. given s[t], u=v,
//   return sigma(s[v]) if sigma = mgu(t,u) and sigma(u) !< sigma(v). 
//
//   If the operation is successful, subst will contain the mgu, and
//   the pointer to the new term, inserted into bank, will be
//   returned. Otherwise, subst will be unchanged and NULL will be
//   returned. 
//
// Global Variables: -
//
// Side Effects    : Memory operations, changes substitution, may
                     change term bank.
//
/----------------------------------------------------------------------*/

Term_p ComputeOverlap(TB_p bank, OCB_p ocb, ClausePos_p from, Term_p
		      into, TermPos_p pos,  Subst_p subst, VarBank_p
		      freshvars)
{
   Term_p        new_rside = NULL, sub_into, max_side, rep_side;
   PStackPointer oldstate;
   bool          unify_success;
 
   assert(from->side == LeftSide || !EqnIsOriented(from->literal));
   assert(EqnIsPositive(from->literal));
   assert(TermPosIsTopPos(from->pos));

   sub_into = TermPosGetSubterm(into, pos);

   assert(!TermIsVar(sub_into));

   max_side = ClausePosGetSide(from);
   rep_side = ClausePosGetOtherSide(from);

   oldstate = PStackGetSP(subst);
   
   unify_success = SubstComputeMgu(max_side, sub_into, subst);

   if(unify_success)
   {
      if(!EqnIsOriented(from->literal)
	 && TOGreater(ocb, rep_side, max_side, DEREF_ALWAYS,
		      DEREF_ALWAYS))
      {
	 SubstBacktrackToPos(subst, oldstate);	 
      }
      else
      {
	 /* We need to get consistent variables _before_ inserting the
	    newly generated term into the term bank ! */
	 SubstNormTerm(into, subst, freshvars);
	 SubstNormTerm(rep_side, subst, freshvars);
	 new_rside = TBTermPosReplace(bank, rep_side, pos,
				      DEREF_ALWAYS);
      }
   }
   return new_rside;
}


/*-----------------------------------------------------------------------
//
// Function: EqnOrderedParamod()
//
//   Overlap the equation described by into from the one described by
//   into and compute the critical pair, if one exists. Return a
//   pointer to a critical pair, if it exists, NULL othewise. If a cp
//   exists, subst will contain the substitution.
//
// Global Variables: -
//
// Side Effects    : As for ComputeOverlap()
//
/----------------------------------------------------------------------*/

Eqn_p  EqnOrderedParamod(TB_p bank, OCB_p ocb, ClausePos_p from,
			 ClausePos_p into, Subst_p subst, VarBank_p
			 freshvars) 
{
   Term_p        new_lside, new_rside, lside, rside;   
   PStackPointer oldstate;
   Eqn_p         new_cp = NULL;

   assert(from->side == LeftSide || !EqnIsOriented(from->literal));
   assert(EqnIsPositive(from->literal));
   assert(TermPosIsTopPos(from->pos));
   assert(into->side == LeftSide || !EqnIsOriented(into->literal));   
   //assert(from->literal->bank != into->literal->bank);
   
   lside = ClausePosGetSide(into);
   rside = ClausePosGetOtherSide(into);
   oldstate = PStackGetSP(subst);
   
   new_lside = ComputeOverlap(bank, ocb, from, lside, into->pos,
			      subst, freshvars);
   if(new_lside)
   {      
      if((!EqnIsOriented(into->literal))
	 && TOGreater(ocb, rside, lside, DEREF_ALWAYS, DEREF_ALWAYS))
      {
	 SubstBacktrackToPos(subst, oldstate);
      }
      else
      {
	 SubstNormTerm(rside, subst, freshvars);
	 new_rside = TBInsert(bank, rside, DEREF_ALWAYS);

	 /* Optimize away trivial paramods... */
	 if(!EqnIsPositive(into->literal) || 
	    !TBTermEqual(new_lside, new_rside))
	 {
	    new_cp = EqnAlloc(new_lside, new_rside, bank,
			      EqnIsPositive(into->literal));
	    EqnSetProp(new_cp, EPIsPMIntoLit);
	 }
      }
   }
   return new_cp;
}


/*-----------------------------------------------------------------------
//
// Function: ClauseOrderedParamod()
//
//   Given two clauses, try to perform an ordered paramodulation
//   step. Return the clause if it works, NULL otherwise.
//
// Global Variables: -
//
// Side Effects    : May create new clause and change bank
//
/----------------------------------------------------------------------*/

Clause_p ClauseOrderedParamod(TB_p bank, OCB_p ocb, ClausePos_p from,
			      ClausePos_p into, VarBank_p freshvars)
{
   Clause_p  new_clause = NULL;
   Eqn_p     new_literals, into_copy, from_copy;
   Subst_p   subst;
   
   assert(EqnIsMaximal(from->literal));
   assert(!EqnIsOriented(from->literal)||(from->side==LeftSide));
   assert(!TermIsVar(ClausePosGetSide(from))||
	  EqnIsEquLit(into->literal)||!TermPosIsTopPos(into->pos));

   /*{
      ClausePos_p tmp1, tmp2;
      CompactPos  ctmp1, ctmp2;

      printf("\nO:");
      ClausePosPrint(stdout, from);
      printf("(%ld)->(%ld)", PackClausePos(from),PackClausePos(into));
      ClausePosPrint(stdout, into);
      printf("\n");

      ctmp1 = PackClausePos(from);
      ctmp2 = PackClausePos(into);
      tmp1 = UnpackClausePos(ctmp1, from->clause);
      tmp2 = UnpackClausePos(ctmp2, into->clause);

      printf("T:");
      ClausePosPrint(stdout, tmp1);
      printf("(%ld)->(%ld)", ctmp1, ctmp2);
      ClausePosPrint(stdout, tmp2);
      printf("\n");

      ClausePosFree(tmp1);
      ClausePosFree(tmp2);
      }*/

   subst = SubstAlloc();
   VarBankResetVCount(freshvars);
   new_literals = EqnOrderedParamod(bank, ocb, from, into, subst,
				    freshvars);
   if(new_literals)
   {
      if(((EqnIsPositive(into->literal)&&
	   EqnListEqnIsStrictlyMaximal(ocb, 
				       into->clause->literals,
				       into->literal))
	  ||
	  (EqnIsNegative(into->literal)/* &&
	   EqnListEqnIsMaximal(ocb, 
			       into->clause->literals,
			       into->literal)*/))
	 &&
	 EqnListEqnIsStrictlyMaximal(ocb, 
				     from->clause->literals,
				     from->literal)
	 /* &&
	 check_paramod_ordering_constraint(ocb, from, into)*/) 
      {
	 NormSubstEqnListExcept(into->clause->literals, into->literal,
				subst, freshvars);
	 NormSubstEqnListExcept(from->clause->literals, from->literal,
				subst, freshvars);
	 new_literals->next = NULL;
	 
	 into_copy = EqnListCopyOptExcept(into->clause->literals,
				       into->literal);
	 from_copy = EqnListCopyOptExcept(from->clause->literals,
				       from->literal);

	 EqnListDelProp(into_copy, EPFromClauseLit);         
	 EqnListSetProp(from_copy, EPFromClauseLit);         
         EqnSetProp(new_literals, EPFromClauseLit);

	 into_copy = EqnListAppend(&into_copy, from_copy);
	 EqnListDelProp(into_copy, EPIsPMIntoLit);
	 new_literals =  EqnListAppend(&new_literals, into_copy);

	 EqnListRemoveResolved(&new_literals);
	 EqnListRemoveDuplicates(new_literals, TBTermEqual);
	 new_clause = ClauseAlloc(new_literals);
      }
      else
      {
	 EqnFree(new_literals);
      }
   }
   SubstDelete(subst);
   
   return new_clause;
}


/*-----------------------------------------------------------------------
//
// Function: ClauseOrderedSimParamod()
//
//   Perform a simultaneous ordered simultaneous paramod step (if
//   necessary).
//
// Global Variables: - (but reads term property TPPotentialParamod)
//
// Side Effects    : Memory operations, changes fresh variable counter
//
/----------------------------------------------------------------------*/

Clause_p ClauseOrderedSimParamod(TB_p bank, OCB_p ocb, ClausePos_p
                                 from,ClausePos_p into, VarBank_p
                                 freshvars)
{
   Clause_p  new_clause = NULL;
   Term_p    rhs_instance, from_term, into_term;
   Eqn_p     into_copy, from_copy;
   Subst_p   subst;
   bool      unify_success;
   
   assert(EqnIsMaximal(from->literal));
   assert(!EqnIsOriented(from->literal)||(from->side==LeftSide));
   assert(!TermIsVar(ClausePosGetSide(from))||
	  EqnIsEquLit(into->literal)||!TermPosIsTopPos(into->pos));
   
   into_term = ClausePosGetSubterm(into);

   if(!TermCellQueryProp(into_term, TPPotentialParamod))
   {
      return NULL;
   }
   from_term = ClausePosGetSide(from);
   subst = SubstAlloc();
   VarBankResetVCount(freshvars);
   unify_success = SubstComputeMgu(from_term, into_term, subst);
   if(!unify_success ||
      (!EqnIsOriented(from->literal) && 
       TOGreater(ocb, ClausePosGetOtherSide(from), from_term, 
                 DEREF_ALWAYS, DEREF_ALWAYS)))
   {
      /* Fail because of into-position invariant property of into-term
       * - either we don't unify, or the intantiated from-term is no
       longer maximal in its literal */ 
      TermCellDelProp(into_term, TPPotentialParamod);
   }
   else if(!EqnIsOriented(into->literal) && 
           TOGreater(ocb, ClausePosGetOtherSide(into), ClausePosGetSide(into), 
                     DEREF_ALWAYS, DEREF_ALWAYS))
   {
      /* Do nothing - we fail because of an into-property that is not
         invariant over positions (the instantiated into-position is no
         longer in a maximal term in the literal) */
   }
   else if(!EqnListEqnIsStrictlyMaximal(ocb, 
                                        from->clause->literals,
                                        from->literal))
   {
      /* Fail because of into-position invariant property of into-term
       * - the unifier causes the from-literal to be no longer
       strictly maximal */ 
      TermCellDelProp(into_term, TPPotentialParamod);
   }
   else if(!((EqnIsPositive(into->literal)&&
              EqnListEqnIsStrictlyMaximal(ocb, 
                                          into->clause->literals,
                                          into->literal))
             ||
             (EqnIsNegative(into->literal) && 
              EqnListEqnIsMaximal(ocb, 
                                  into->clause->literals,
                                  into->literal)))
      )
   {
      /* Do nothing - we fail because of an into-property that is not
         invariant over positions - the instantiated into-literal is
         no longer (strictly) maximal */
   }
   else
   { /* Now we build the new clause! */
      /* _all_ instances of into_term are handled */
      TermCellDelProp(into_term, TPPotentialParamod);

      NormSubstEqnListExcept(into->clause->literals, NULL, subst, freshvars);
      NormSubstEqnListExcept(from->clause->literals, NULL, subst, freshvars);
      rhs_instance = TBInsertNoProps(bank,
                                     ClausePosGetOtherSide(from),
                                     DEREF_ALWAYS);
      into_copy = EqnListCopyRepl(into->clause->literals, 
                                  bank, into_term, rhs_instance);
      if(EqnListFindTrue(into_copy))
      {
         EqnListFree(into_copy);
      }
      else
      {
         from_copy = EqnListCopyOptExcept(from->clause->literals,
                                          from->literal);
         if(EqnListFindTrue(into_copy))
         {
            EqnListFree(into_copy);
            EqnListFree(from_copy);
         }
         else
         {
            EqnListDelProp(into_copy, EPFromClauseLit);         
            EqnListSetProp(from_copy, EPFromClauseLit);         
            
            into_copy = EqnListAppend(&into_copy, from_copy);

            EqnListRemoveResolved(&into_copy);
            EqnListRemoveDuplicates(into_copy, TBTermEqual);
            new_clause = ClauseAlloc(into_copy);
         }
      }      
   }
   
   SubstDelete(subst);
   return new_clause;
}


/*-----------------------------------------------------------------------
//
// MACRO: IS_NO_PARAMOD_POS
//
//   Check wether a position is a valid paramod-position. Ugly!
//
// Global Variables: Reads local scope variable pos, no_top amd res.
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

#define IS_NO_PARAMOD_POS \
   (TermIsVar(res)|| /* No paramod into variables */ \
  /* Only overlap positive root positions once */\
  (EqnIsPositive(pos->literal) && no_top && TermPosIsTopPos(pos->pos))||\
  /* Don't overlap variable into predicate position */\
    (TermIsVar(ClausePosGetSide(from_pos)) &&\
     !EqnIsEquLit(pos->literal) &&\
     TermPosIsTopPos(pos->pos)))

/*-----------------------------------------------------------------------
//
// Function: ClausePosFirstParamodInto()
//
//   Find the first potential paramod-position in clause. If no_top is
//   true, do not select top positions of terms. Returns the term at
//   the selected position, or NULL if no position exists. If
//   successful and simu_paramod is true, also resets
//   TPPotentialParamod in this and potentially following positions.
//
// Global Variables: ParamodOverlapIntoNegativeLiterals,
//                   ParamodOverlapNonEqLiterals
//
// Side Effects    : Changes pos
//
/----------------------------------------------------------------------*/

Term_p ClausePosFirstParamodInto(Clause_p clause, ClausePos_p pos,
				 ClausePos_p from_pos, bool no_top,
                                 bool simu_paramod)
{
   Term_p res;
   
   pos->clause = clause;
   pos->literal = clause->literals;
   
   if(EqnIsEquLit(from_pos->literal))
   {
      res = ClausePosFindFirstMaximalSubterm(pos);
   }
   else
   {  /* We don't need to try subterms, they won't unify anyways. We
	 also don't need positive literals, because at best we would
	 get a tautology. */
      res = clause_pos_find_first_neg_max_lside(pos);
   }
   if(res)
   {
      if(IS_NO_PARAMOD_POS)
      {
         res = ClausePosNextParamodInto(pos, from_pos, no_top);
      }
   }
   if(simu_paramod&&res)
   {
      /* Hack: We only need to reset this from here on! Previous
       * position will not be tested anyways */
      EqnListTermSetProp(pos->literal, TPPotentialParamod);
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: ClausePosNextParamodInto()
//
//   Given a position, find the next potential paramod-position. Avoid
//   top-positions if no_top is true. Returns the term at
//   the selected position, or NULL if no position exists.
//
// Global Variables: ParamodOverlapIntoNegativeLiterals,
//                   ParamodOverlapNonEqLiterals
//
// Side Effects    : Changes pos
//
/----------------------------------------------------------------------*/

Term_p ClausePosNextParamodInto(ClausePos_p pos, ClausePos_p from_pos, bool
				no_top)
{
   Term_p res;
   
   if(EqnIsEquLit(from_pos->literal))
   {
      res = ClausePosFindNextMaximalSubterm(pos);
   }
   else
   {  /* We don't need to try subterms, they won't unify anyways. We
	 also don't need positive literals, because at best we would
	 get a tautology. */
      pos->literal = pos->literal->next;
      res = clause_pos_find_first_neg_max_lside(pos);
   }
   while(res && (IS_NO_PARAMOD_POS))
   {  
      if(EqnIsEquLit(from_pos->literal))
      {
	 res = ClausePosFindNextMaximalSubterm(pos);
      }
      else
      {  /* See above - same reasoning */
	 pos->literal = pos->literal->next;
	 res = clause_pos_find_first_neg_max_lside(pos);
      }
   }
   return res;   
}


/*-----------------------------------------------------------------------
//
// Function: ClausePosFirstParamodFromSide()
//
//   Given a clause and a position, set the position to the first
//   side that can be used for paramodulation. Does not check strategy
//   for efficiency reasons ClausePos*ParamodPair() should ensure that
//   this is only called in cases were it makes sense.
//
// Global Variables: ParamodOverlapIntoNegativeLiterals,
//                   ParamodOverlapNonEqLiterals
//
// Side Effects    : Changes pos
//
/----------------------------------------------------------------------*/

Term_p ClausePosFirstParamodFromSide(Clause_p from, ClausePos_p
				     from_pos)
{
   Term_p res = NULL;
   
   from_pos->clause = from;
   from_pos->literal = from->literals;
   res = ClausePosFindFirstMaximalSide(from_pos, true);
   while(res  &&
	 ((!(ParamodOverlapNonEqLiterals ||
	    EqnIsEquLit(from_pos->literal)))
	  ||
	  EqnIsSelected(from_pos->literal)))
   {
      res = ClausePosFindNextMaximalSide(from_pos, true);
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: ClausePosNextParamodFromSide()
//
//   Given a position, set the position to the next side that can be
//   used for paramodulation. Does not check strategy for efficiency
//   reasons. ClausePos*ParamodPair() should ensure that this is only
//   called in cases were it makes sense.
//
// Global Variables: ParamodOverlapIntoNegativeLiterals,
//                   ParamodOverlapNonEqLiterals
//
// Side Effects    : Changes pos
//
/----------------------------------------------------------------------*/

Term_p ClausePosNextParamodFromSide(ClausePos_p from_pos)
{
   Term_p res;

   res = ClausePosFindNextMaximalSide(from_pos, true);
   while(res  &&
	 ((!(ParamodOverlapNonEqLiterals ||
	    EqnIsEquLit(from_pos->literal)))
	  ||
	  EqnIsSelected(from_pos->literal)))
   {
      res = ClausePosFindNextMaximalSide(from_pos, true);
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function:  ClausePosFirstParamodPair()
//
//   Given two clauses, create the first possible paramod-position
//   from a literal in from into a literal in into. Return term
//   paramodualated into, or NULL if no position exists.
//
// Global Variables: -
//
// Side Effects    : Changes from_pos, into_pos.
//
/----------------------------------------------------------------------*/

Term_p ClausePosFirstParamodPair(Clause_p from, ClausePos_p
				 from_pos, Clause_p into,
				 ClausePos_p into_pos, bool no_top,
                                 bool simu_paramod)
{
   Term_p res;

   res = ClausePosFirstParamodFromSide(from, from_pos);
   assert(TermPosIsTopPos(from_pos->pos));
   
   while(res)	
   {
      res = ClausePosFirstParamodInto(into, into_pos,
				      from_pos, no_top, simu_paramod);
      if(res)
      {
	 break;
      }
      res = ClausePosNextParamodFromSide(from_pos);	    
      assert(TermPosIsTopPos(from_pos->pos));
   }
   assert(TermPosIsTopPos(from_pos->pos));
   
   return res;
}

/*-----------------------------------------------------------------------
//
// Function:  ClausePosNextParamodPair()
//
//   Given two clause positions, compute the next possible
//   paramod-position from a literal in from into a literal in
//   into. Return term paramodualated into, or NULL if no position
//   exists.
//
// Global Variables: -
//
// Side Effects    : Changes from_pos, into_pos.
//
/----------------------------------------------------------------------*/

Term_p ClausePosNextParamodPair(ClausePos_p from_pos, ClausePos_p
				into_pos, bool no_top, bool simu_paramod)
{
   Term_p res;

   res = ClausePosNextParamodInto(into_pos, from_pos, no_top);   
   if(!res)
   {
      res = ClausePosNextParamodFromSide(from_pos);
      assert(TermPosIsTopPos(from_pos->pos));
      while(res)
      {
	 res = ClausePosFirstParamodInto(into_pos->clause, into_pos,
					 from_pos, no_top, simu_paramod);
	 if(res)
	 {
	    break;
	 }
	 res = ClausePosNextParamodFromSide(from_pos);
	 assert(TermPosIsTopPos(from_pos->pos));
      }
   }   
   assert(TermPosIsTopPos(from_pos->pos));
   return res;
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


