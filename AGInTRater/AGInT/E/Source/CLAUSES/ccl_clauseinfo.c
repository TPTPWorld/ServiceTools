/*-----------------------------------------------------------------------

File  : ccl_clauseinfo.c

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Datatype and basic functions for storing and handling clause
  information that few clauses carry (probably just input
  clauses). This is not stored in the clause (or formula) data types,
  because it would eat  up to much memory (remember, there are
  millions of clauses)

  Copyright 2004 by the author.

  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Fri Sep  3 12:21:57 CEST 2004
    New

-----------------------------------------------------------------------*/

#include "ccl_clauseinfo.h"


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
// Function: ClauseInfoAlloc()
//
//   Allocate an initialized clause info cell. Strings are copied and
//   local to the cell!
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

ClauseInfo_p ClauseInfoAlloc(char* name, char* source, 
                             long line, long column)
{
   ClauseInfo_p handle = ClauseInfoCellAlloc();

   handle->name = NULL;
   handle->source = NULL;
   if(name)
   {
      handle->name = SecureStrdup(name);
   }
   if(source)
   {
      handle->source= SecureStrdup(source);
   }
   handle->line = line;
   handle->column = column;
   
   return handle;
}

/*-----------------------------------------------------------------------
//
// Function: ClauseInfoFree()
//
//   Free a clauseinfocell (and all stored information). This is
//   explicitely designed to handle the NULL case silently and
//   gracefully, so we can call it even for clauses which do not have
//   an info field.
//
// Global Variables: -
//
// Side Effects    : Memory operations
//
/----------------------------------------------------------------------*/

void ClauseInfoFree(ClauseInfo_p info)
{
   if(info)
   {
      if(info->name)
      {
         FREE(info->name);
      }
      if(info->source)
      {
         FREE(info->source);
      }
      ClauseInfoCellFree(info);
   }
}


/*-----------------------------------------------------------------------
//
// Function: ClauseSourceInfoPrint()
//
//   Print the source part of a clause info cell in TSTP or PCL (or
//   weird) format.
//
// Global Variables: -
//
// Side Effects    : Output
//
/----------------------------------------------------------------------*/

void ClauseSourceInfoPrint(FILE* out, ClauseInfo_p info, char *inf_lit, char* delim)
{
   DStr_p source_accu = DStrAlloc();
   char *source = "unknown";
   char *name;
   char buffer[100]; /* At most 2 longs and some filler */

   if(info->source)
   {
      DStrAppendStr(source_accu, delim);
      DStrAppendStr(source_accu, info->source);
      DStrAppendStr(source_accu, delim);
      source = DStrView(source_accu);
   }
   name = info->name;
   if(!name)
   {
      if(info->line < 0)
      {
         name = "unknown";
      }
      else
      {
         assert(info->column >= 0);        
         sprintf(buffer, "at_line_%ld_column_%ld", info->line, info->column);
         name = buffer;
      }
   }
   fprintf(out, "%s(%s, %s)", inf_lit, source, name);
   DStrFree(source_accu);
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


