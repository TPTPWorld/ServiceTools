/*-----------------------------------------------------------------------

File  : ccl_formulaset.h

Author: Stephan Schulz

Contents
 
  Data type for (wrapped) formula sets. 

  Copyright 1998-2009 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Thu Jun 11 16:24:27 CEST 2009
    New (factored out from ccl_wrapped_formulas.h)

-----------------------------------------------------------------------*/

#ifndef CCL_FORMULASETS

#define CCL_FORMULASETS

#include <clb_plist.h>
#include <ccl_formula_wrapper.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

typedef struct formula_set_cell
{
   WFormula_p anchor;
   long       members;
}FormulaSetCell, *FormulaSet_p;


/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/


#define FormulaSetCellAlloc()    (FormulaSetCell*)SizeMalloc(sizeof(FormulaSetCell))
#define FormulaSetCellFree(junk) SizeFree(junk, sizeof(FormulaSetCell))

FormulaSet_p FormulaSetAlloc();
void         FormulaSetFreeFormulas(FormulaSet_p set);
void         FormulaSetFree(FormulaSet_p set);
void         FormulaSetGCMarkCells(FormulaSet_p set);
void         FormulaSetMarkPolarity(FormulaSet_p set);
void         FormulaSetInsert(FormulaSet_p set, WFormula_p newform);
long         FormulaSetInsertSet(FormulaSet_p set, FormulaSet_p from);
WFormula_p   FormulaSetExtractEntry(WFormula_p form);
#define      FormulaSetCardinality(set) ((set)->members)
#define      FormulaSetEmpty(set)\
             ((set)->anchor->succ == (set)->anchor)
WFormula_p   FormulaSetExtractFirst(FormulaSet_p set);
void         FormulaSetDeleteEntry(WFormula_p form);

void         FormulaSetPrint(FILE* out, FormulaSet_p set, 
                             bool fullterms);
long         FormulaSetSplitConjectures(FormulaSet_p set, 
                                        PList_p conjectures, 
                                        PList_p rest);

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





