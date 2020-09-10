/*-----------------------------------------------------------------------

File  : cto_ocb.c

Author: Stephan Schulz

Contents
 
  Functions for describing orderings, precedences and so on.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Thu Apr 30 03:11:31 MET DST 1998
    New

-----------------------------------------------------------------------*/

#include "cto_ocb.h"



/*---------------------------------------------------------------------*/
/*                        Global Variables                             */
/*---------------------------------------------------------------------*/

char* TONames[]=
{
   "NoOrdering",
   "Auto",
   "Auto071",
   "AutoDev",
   "Optimize",
   "KBO",
   "KBO6",
   "LPO",
   "LPOCopy",
   "LPO4",
   "LPO4Copy",
   "RPO"
};


/*---------------------------------------------------------------------*/
/*                      Forward Declarations                           */
/*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*/
/*                         Internal Functions                          */
/*---------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
//
// Function: ocb_trans_compute()
//
//   Given the relations between f1 and f2, and f2 and f3, compute the
//   relation between f1 and f3. Return true, if it can be set, false
//   otherwise. 
//
// Global Variables: -
//
// Side Effects    : Changes ocb->precedences
//
/----------------------------------------------------------------------*/

bool ocb_trans_compute(OCB_p ocb, FunCode f1, FunCode f2, FunCode f3)
{
   CompareResult rel12, rel23;
   bool          res = true;

   rel12 = OCBFunCompare(ocb, f1, f2);
   rel23 = OCBFunCompare(ocb, f2, f3);

   switch(rel12)
   {
   case to_uncomparable:
	 break;
   case to_equal:
	 if(rel23 != to_uncomparable)
	 {
	    res = OCBPrecedenceAddTuple(ocb, f1, f3, rel23);
	 }
	 break;
   case to_greater:
	 if(rel23 == to_equal || rel23 == to_greater)
	 {
	    res = OCBPrecedenceAddTuple(ocb, f1, f3, to_greater);
	 }
	 break;
   case to_lesser:
	 if(rel23 == to_equal || rel23 == to_lesser)
	 {
	    res = OCBPrecedenceAddTuple(ocb, f1, f3, to_lesser);
	 }
	 break;
   default:
	 assert(false);
	 break;
   }
   return res;
}

/*-----------------------------------------------------------------------
//
// Function: alloc_precedence()
//
//   Initialize handle->precedence or handle->prec_weights according
//   to the value of prec_by_weight.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

static void alloc_precedence(OCB_p handle, bool prec_by_weight)
{
   if(prec_by_weight)
   {
      handle->precedence = NULL;
      handle->prec_weights =
	 SizeMalloc(sizeof(long)*(handle->sig_size+1));
   }
   else
   {	    
      handle->precedence = SizeMalloc(sizeof(CompareResult)
				      *handle->sig_size
				      *handle->sig_size);
      handle->prec_weights = NULL;
   }
}



/*---------------------------------------------------------------------*/
/*                         Exported Functions                          */
/*---------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
//
// Function: OCBAlloc()
//
//   Allocate an initialized order control block.
//
// Global Variables: -
//
// Side Effects    : Memory management
//
/----------------------------------------------------------------------*/

OCB_p OCBAlloc(TermOrdering type, bool prec_by_weight, Sig_p sig)
{
   OCB_p handle;
   int   i,j;

   handle = OCBCellAlloc();

   handle->type  = type;
   handle->sig   = sig;
   handle->min_constant  = 0;
   handle->sig_size = sig->f_count;
   handle->statestack = PStackAlloc();
   handle->var_weight = 1;
   handle->no_lit_cmp = false;   
   switch(type)
   {
   case KBO:
   case KBO6:
	 handle->weights    = SizeMalloc(sizeof(long)*(handle->sig_size+1));
	 alloc_precedence(handle, prec_by_weight);
	 break;
   case LPO:
   case LPOCopy:
   case LPO4:
   case LPO4Copy:
	 handle->weights    = NULL;
	 alloc_precedence(handle, prec_by_weight);
	 break;
   case RPO:
	 handle->weights    = NULL;
	 alloc_precedence(handle, prec_by_weight);
	 break; 
   default:
	 assert(false);
	 break;
   }

   if(handle->weights)
   {
      for(i=1; i<=handle->sig_size; i++)
      {
	 *OCBFunWeightPos(handle,i) = 1;
      }
   }
   if(handle->precedence)
   {
      for(i=1; i<=handle->sig_size; i++)
      {
	 for(j=1; j<=handle->sig_size; j++)
	 {
	    *OCBFunComparePos(handle, i,j) = 
	       ((i==j) ? to_equal : to_uncomparable);
	 }
      }
   }
   handle->kbobalance = KBOLinAlloc();
   return handle;
}


/*-----------------------------------------------------------------------
//
// Function: OCBFree()
//
//   Free the memory taken by an order control block. Note: The
//   signature is not considered part of the ocb and is not free'd.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

void OCBFree(OCB_p junk)
{
   assert(junk);

   if(junk->weights)
   {
      assert(junk->type == KBO || junk->type==KBO6);
      SizeFree(junk->weights, sizeof(long)*(junk->sig_size+1));
      junk->weights = NULL;
   }
   if(junk->precedence)
   {
      assert(!junk->prec_weights);
      assert(junk->type == KBO || 
             junk->type == KBO6 || 
             junk->type == LPO || 
             junk->type == LPOCopy || 
             junk->type == LPO4 || 
             junk->type == LPO4Copy || 
             junk->type == RPO);
      SizeFree(junk->precedence, sizeof(CompareResult) 
	       * junk->sig_size * junk->sig_size);
      junk->precedence = NULL;
   }
   if(junk->prec_weights)
   {
      assert(!junk->precedence);
      assert(junk->type == KBO || 
             junk->type == KBO6 || 
             junk->type == LPO ||
             junk->type == LPOCopy ||
             junk->type == LPO4 ||
             junk->type == LPO4Copy || 
             junk->type == RPO);
      SizeFree(junk->prec_weights, sizeof(long)*(junk->sig_size+1));
      junk->prec_weights = NULL;
   }
   PStackFree(junk->statestack);
   KBOLinFree(junk->kbobalance);
   OCBCellFree(junk);
}


/*-----------------------------------------------------------------------
//
// Function: OCBDebugPrint()
//
//   Print an OCB in debug-friendly form (not suitable for
//   re-parsing, revealing a lot of internal information).
//
// Global Variables: -
//
// Side Effects    : Output
//
/----------------------------------------------------------------------*/

void OCBDebugPrint(FILE* out, OCB_p ocb)
{
   long i,j;

   fprintf(out, "# ==============OCB-Debug-Information============\n");
   fprintf(out, "# ===============================================\n");
   if(ocb->sig)
   {
      SigPrint(out, ocb->sig);
   }
   else
   {
      fprintf(out, "# No sig!\n");
   } 
   fprintf(out, "# -----------------------------------------------\n");
   if(ocb->weights)
   {
      fprintf(out, "# Weights:");
      for(i=1; i<=ocb->sig_size;i++)
      {
	 if(!((i-1)%8))
	 {
	    fprintf(out, "\n# ");
	 }
	 fprintf(out, " (%ld = %ld) ", i, OCBFunWeight(ocb, i));
      }
      fprintf(out, "\n\n");
   }
   else
   {
      fprintf(out, "# No weights!\n");
   } 
   fprintf(out, "# -----------------------------------------------\n");
   if(ocb->precedence)
   {
      fprintf(out, "# Precedence Matrix:\n#       ");
      for(j=1; j<=ocb->sig_size; j++)
      {
	 fprintf(out, " %2ld ", j);
      }
      fprintf(out, "\n");
      for(i=1; i<=ocb->sig_size; i++)
      {
	 fprintf(out, "# %2ld  | ", i);
	 fflush(stdout);
	 for(j=1; j<=ocb->sig_size; j++)
	 {
	    char* symb;

	    symb = POCompareSymbol[OCBFunCompare(ocb, i, j)];
	    fprintf(out, " %s", symb);
	    fflush(stdout);
	 }
	 fprintf(out, "\n");
      }
   }
   else
   {
      fprintf(out, "# No precedence!\n");
   } 
   fprintf(out, "# ===============================================\n");
}


/*-----------------------------------------------------------------------
//
// Function: OCBPrecedenceAddTuple()
//
//   Add a new binary relation to the precedence stored in the ocb and
//   compute the new transitive closure of the to_greater, to_smaller
//   and to_equal. Store updated cell in ocb->statestackcell. Return
//   the new stackpointer if everything went fine, undo all changes
//   and return 0 otherwise.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

PStackPointer OCBPrecedenceAddTuple(OCB_p ocb, FunCode f1, FunCode f2,
			   CompareResult relation)
{
   FunCode       i;
   PStackPointer res = 0, old;

   assert(ocb);
   assert(ocb->precedence);
   assert(f1<=ocb->sig_size);
   assert(f2<=ocb->sig_size);
   assert(relation!=to_uncomparable);

   old = PStackGetSP(ocb->statestack);

   if(OCBFunCompare(ocb, f1, f2)==relation)
   {
      res = old;
   }
   else if(OCBFunCompare(ocb, f1, f2)!=to_uncomparable)
   {
      res = 0;
   }
   else
   {
      PStackPushInt(ocb->statestack, f1);
      PStackPushInt(ocb->statestack, f2);
      *OCBFunComparePos(ocb, f1, f2) = relation;
      *OCBFunComparePos(ocb, f2, f1) = POInverseRelation(relation);

      for(i=1; i<=ocb->sig_size; i++)
      {
	 res = ocb_trans_compute(ocb, f1, f2, i);
	 if(!res)
	 {
	    break;
	 }
	 res = ocb_trans_compute(ocb, i, f1, f2);
	 if(!res)
	 {
	    break;
	 }
      }
      if(!res)
      { /* Error case, undo changes */
	 f2 = PStackPopInt(ocb->statestack);
	 f1 = PStackPopInt(ocb->statestack);
	 *OCBFunComparePos(ocb, f1, f2) = to_uncomparable;
	 *OCBFunComparePos(ocb, f2, f1) = to_uncomparable;
      }
   }
   return res;
}

/*-----------------------------------------------------------------------
//
// Function: OCBPrecedenceBacktrack()
//
//   Backtrack the precedence matrix to a given state. Return true if
//   the stack is non-empty afterwards, false otherwise.
//
// Global Variables: -
//
// Side Effects    : Changes the matrix
//
/----------------------------------------------------------------------*/

bool OCBPrecedenceBacktrack(OCB_p ocb, PStackPointer state)
{
   FunCode f1,f2;
   
   while(state!=PStackGetSP(ocb->statestack))
   {
      assert(!PStackEmpty(ocb->statestack));
      f2 = PStackPopInt(ocb->statestack);
      assert(!PStackEmpty(ocb->statestack));
      f1 = PStackPopInt(ocb->statestack);

      assert(OCBFunCompare(ocb, f1, f2) != to_uncomparable);
      *OCBFunComparePos(ocb, f1, f2) = to_uncomparable;
      assert(OCBFunCompare(ocb, f2, f1) != to_uncomparable);
      *OCBFunComparePos(ocb, f2, f1) = to_uncomparable;
   }
   return !PStackEmpty(ocb->statestack);
}


/*-----------------------------------------------------------------------
//
// Function: OCBFindMinConst()
//
//   Find a minimal (by precedence) function symbol constant in
//   ocb->sig. Store it in ocb->min_constant. If no constant
//   exists, create one. 
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

FunCode OCBFindMinConst(OCB_p ocb)
{
   FunCode i, cand=0;

   assert(ocb && ocb->sig);
   if(!ocb->min_constant)
   {
      for(i=ocb->sig->internal_symbols+1; i<=ocb->sig->f_count; i++)
      {
         if(SigIsFunConst(ocb->sig, i) && 
            !SigIsSpecial(ocb->sig, i) &&
            (!cand || (OCBFunCompare(ocb, i, cand)==to_greater)))
         {
            cand = i;
         }
      }
      if(cand)
      {
         cand = SigGetNewSkolemCode(ocb->sig, 0);
      }
      ocb->min_constant = cand;
   }
   assert(ocb->min_constant);
   return ocb->min_constant;
}


/*-----------------------------------------------------------------------
//
// Function: OCBTermMaxFunCode()
//
//   Return the (or rather a) maximal function symbol (according to
//   ocb->precedence) from term. Follows bindings exactly once
//   (i.e. assumes that substitutions are matches).
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

FunCode OCBTermMaxFunCode(OCB_p ocb, Term_p term)
{
   int       i;
   FunCode   res = 0, tmp ;
   DerefType deref = DEREF_ONCE;

   assert(ocb->precedence||ocb->prec_weights);

   term = TermDeref(term, &deref);
   
   if(TermIsVar(term))
   {
      return res;
   }
   res = term->f_code;

   for(i=1; i<term->arity; i++)
   {
      tmp = OCBTermMaxFunCode(ocb, term->args[i]);
      if(OCBFunCompare(ocb, tmp, res) == to_greater)
      {
	 res = tmp;
      }
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: OCBFunCompareMatrix()
//
//   Return comparison result of two symbols in precedence via the
//   full precedence matrix. Symbols
//   not covered by the ocb are smaller than all others. Equal symbols
//   are not allowed (captured at OCBFunCompare).
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

CompareResult OCBFunCompareMatrix(OCB_p ocb, FunCode f1, FunCode f2)
{
   assert(ocb->precedence);
   assert(f1!=f2);

   if(f1<=ocb->sig_size)
   {
      if(f2<=ocb->sig_size)
      {
	 return *(OCBFunComparePos(ocb, f1, f2));
      }
      return to_greater;
   }
   if(f2<=ocb->sig_size)
   {
      return to_lesser;
   }
   assert((f1>ocb->sig_size) && (f1>ocb->sig_size));
   return Q_TO_PART(f2-f1);
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


