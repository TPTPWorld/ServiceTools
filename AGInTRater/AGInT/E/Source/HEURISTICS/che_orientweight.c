/*-----------------------------------------------------------------------

File  : che_refinedweight.c

Author: Stephan Schulz

Contents
 
  Functions realising clause evaluation with orient clause weights.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Jun 17 00:11:03 MET DST 1998
    New

-----------------------------------------------------------------------*/

#include "che_orientweight.h"



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
// Function: ClauseOrientWeightInit() 
//
//   Return an initialized WFCB for ClauseOrientWeight evaluation.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

WFCB_p ClauseOrientWeightInit(ClausePrioFun prio_fun, int fweight,
			       int vweight, OCB_p ocb, double
			       unorientable_literal_multiplier, double
			       max_literal_multiplier, double
			       pos_multiplier)
{
   OrientWeightParam_p data = OrientWeightParamCellAlloc();
   
   data->fweight                = fweight;
   data->vweight                = vweight;
   data->pos_multiplier         = pos_multiplier;
   data->unorientable_literal_multiplier = unorientable_literal_multiplier;
   data->max_literal_multiplier = max_literal_multiplier;
   data->ocb                    = ocb;

   return WFCBAlloc(ClauseOrientWeightCompute, prio_fun,
		    ClauseOrientWeightExit, data);
}


/*-----------------------------------------------------------------------
//
// Function: ClauseOrientWeightParse()
//
//   Parse a orient clauseweight-definition.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

WFCB_p ClauseOrientWeightParse(Scanner_p in, OCB_p ocb, ProofState_p
				state)
{
   ClausePrioFun prio_fun;
   int fweight, vweight;
   double pos_multiplier, max_literal_multiplier,
      unorientable_literal_multiplier;

   AcceptInpTok(in, OpenBracket);
   prio_fun = ParsePrioFun(in);
   AcceptInpTok(in, Comma);
   fweight = ParseInt(in);
   AcceptInpTok(in, Comma);
   vweight = ParseInt(in);
   AcceptInpTok(in, Comma);
   unorientable_literal_multiplier = ParseFloat(in);
   AcceptInpTok(in, Comma);
   max_literal_multiplier = ParseFloat(in);
   AcceptInpTok(in, Comma);
   pos_multiplier = ParseFloat(in);
   AcceptInpTok(in, CloseBracket);
   
   return ClauseOrientWeightInit(prio_fun, fweight, vweight, ocb,
				 unorientable_literal_multiplier,
				 max_literal_multiplier,
				 pos_multiplier);
}

/*-----------------------------------------------------------------------
//
// Function: ClauseOrientWeightCompute()
//
//   Compute an evaluation for a clause.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

double ClauseOrientWeightCompute(void* data, Clause_p clause)
{
   OrientWeightParam_p local = data;

   ClauseCondMarkMaximalTerms(local->ocb, clause);
   return ClauseOrientWeight(clause, 
			     local->unorientable_literal_multiplier,
			     local->max_literal_multiplier,
			     local->pos_multiplier,
			     local->vweight,
			     local->fweight, 
			     false);
}


/*-----------------------------------------------------------------------
//
// Function: OrientLMaxWeightInit() 
//
//   Return an initialized WFCB for OrientLMaxWeight evaluation.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

WFCB_p OrientLMaxWeightInit(ClausePrioFun prio_fun, int fweight,
			       int vweight, OCB_p ocb, double
			       unorientable_literal_multiplier, double
			       max_literal_multiplier, double
			       pos_multiplier)
{
   OrientWeightParam_p data = OrientWeightParamCellAlloc();
   
   data->fweight                = fweight;
   data->vweight                = vweight;
   data->pos_multiplier         = pos_multiplier;
   data->unorientable_literal_multiplier = unorientable_literal_multiplier;
   data->max_literal_multiplier = max_literal_multiplier;
   data->ocb                    = ocb;

   return WFCBAlloc(OrientLMaxWeightCompute, prio_fun,
		    ClauseOrientWeightExit, data);
}


/*-----------------------------------------------------------------------
//
// Function: OrientLMaxWeightParse()
//
//   Parse a orient clauseweight-definition.
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

WFCB_p OrientLMaxWeightParse(Scanner_p in, OCB_p ocb, ProofState_p
				state)
{
   ClausePrioFun prio_fun;
   int fweight, vweight;
   double pos_multiplier, max_literal_multiplier,
      unorientable_literal_multiplier;
   
   AcceptInpTok(in, OpenBracket);
   prio_fun = ParsePrioFun(in);
   AcceptInpTok(in, Comma);
   fweight = ParseInt(in);
   AcceptInpTok(in, Comma);
   vweight = ParseInt(in);
   AcceptInpTok(in, Comma);
   unorientable_literal_multiplier = ParseFloat(in);
   AcceptInpTok(in, Comma);
   max_literal_multiplier = ParseFloat(in);
   AcceptInpTok(in, Comma);
   pos_multiplier = ParseFloat(in);
   AcceptInpTok(in, CloseBracket);
   
   return OrientLMaxWeightInit(prio_fun, fweight, vweight, ocb,
			       unorientable_literal_multiplier,
			       max_literal_multiplier,
			       pos_multiplier);
}

/*-----------------------------------------------------------------------
//
// Function: OrientLMaxWeightCompute()
//
//   Compute an evaluation for a clause.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

double OrientLMaxWeightCompute(void* data, Clause_p clause)
{
   OrientWeightParam_p local = data;
   double              res = 0, tmp;
   Eqn_p               handle;

   ClauseCondMarkMaximalTerms(local->ocb, clause);
   for(handle = clause->literals; handle; handle = handle->next)
   {
      tmp = EqnMaxWeight(handle, local->fweight, local->vweight);
      if(EqnIsPositive(handle))
      {
	 tmp = tmp*local->pos_multiplier;
      }
      if(EqnIsMaximal(handle))
      {
	 tmp = tmp*local->max_literal_multiplier;
      }
      if(!EqnIsOriented(handle))
      {
	 tmp = tmp*local->unorientable_literal_multiplier;
      }
      res += tmp;
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: ClauseOrientWeightExit()
//
//   Free the data entry in a clauseweight WFCB.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

void ClauseOrientWeightExit(void* data)
{
   OrientWeightParamCellFree(data);
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


