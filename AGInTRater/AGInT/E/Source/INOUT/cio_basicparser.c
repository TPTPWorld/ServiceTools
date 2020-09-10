/*-----------------------------------------------------------------------

File  : cio_basicparser.c

Author: Stephan Schulz

Contents
 
  Parsing routines for useful C build-in Datatypes not covered by the
  scanner. 

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Jul  5 02:28:25 MET DST 1997
    New

-----------------------------------------------------------------------*/


#include <stdlib.h>
#include "cio_basicparser.h"


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
// Function: ParseInt()
//
//   Parses a (possibly negative) Integer, defined as an optional "-",
//   followed by a sequence of digits. Returns the value or gives an
//   error on overflow.
//
// Global Variables: -
//
// Side Effects    : Input is read (and checked)
//
/----------------------------------------------------------------------*/

long ParseInt(Scanner_p in)
{
   long value;
   
   if(TestInpTok(in, Hyphen))
   {
      NextToken(in);
      CheckInpTokNoSkip(in, PosInt);
      if((AktToken(in)->numval-1) > LONG_MAX)
      {
	 AktTokenError(in, "Long integer underflow", false);
      }
      value = -AktToken(in)->numval;
      NextToken(in);
   }
   else
   {
      CheckInpTok(in, PosInt);
      if(AktToken(in)->numval > LONG_MAX)
      {
	 AktTokenError(in, "Long integer overflow", false);
      }
      value = AktToken(in)->numval;
      NextToken(in);
   }
   return value;
}


/*-----------------------------------------------------------------------
//
// Function: ParseFloat()
//
//   Parse a float in x.yEz format (optional negative and so on...)
//
// Global Variables: -
//
// Side Effects    : Input, may cause error
//
/----------------------------------------------------------------------*/

#ifndef ALLOW_COMMA_AS_DECIMAL_DOT
#define DECIMAL_DOT Fullstop
#else
#define DECIMAL_DOT Fullstop|Comma
#endif

double ParseFloat(Scanner_p in)
{
   double value;

   DStrReset(in->accu);
   
   if(TestInpTok(in, Hyphen|Plus))
   {
      DStrAppendDStr(in->accu, AktToken(in)->literal);
      NextToken(in);
      CheckInpTokNoSkip(in, PosInt);
   }
   else
   {
      CheckInpTok(in, PosInt);
   }
   DStrAppendDStr(in->accu, AktToken(in)->literal);
   NextToken(in);

   /* Parsed [-]123 so far */

   if(TestInpNoSkip(in)&&TestInpTok(in, DECIMAL_DOT))
   {
      DStrAppendChar(in->accu, '.');
      AcceptInpTokNoSkip(in, DECIMAL_DOT);
      DStrAppendDStr(in->accu,  AktToken(in)->literal);
      AcceptInpTokNoSkip(in, PosInt);
   }

   /* Parsed -123.1123 so far */

   if(TestInpNoSkip(in)&&TestInpId(in, "e|E"))
   {
      DStrAppendDStr(in->accu,  AktToken(in)->literal);
      NextToken(in); /* Skip E */      
      DStrAppendDStr(in->accu,  AktToken(in)->literal);
      AcceptInpTokNoSkip(in, Hyphen|Plus); /* Eat - */
      DStrAppendDStr(in->accu,  AktToken(in)->literal);
      AcceptInpTokNoSkip(in, PosInt);
   }
   errno = 0;
   value = strtod(DStrView(in->accu), NULL);
   
   if(errno)
   {
      TmpErrno = errno;      
      AktTokenError(in, "Cannot translate double", true);
   }
   return value;
}


/*-----------------------------------------------------------------------
//
// Function: ParseNumString()
//
//   Parse a (possibly signed) number and return the most specific
//   type compatible with it. The number is not evaluated, but
//   it's ASCII representation is stored in in->accu.
//
// Global Variables: -
//
// Side Effects    : Reads input, DStr handling may cause memory
//                   operations. 
//
/----------------------------------------------------------------------*/

StrNumType ParseNumString(Scanner_p in)
{
   StrNumType res = SNInteger;
   DStr_p accumulator = in->accu;

   DStrReset(accumulator);

   if(TestInpTok(in, Hyphen|Plus))
   {
      DStrAppendDStr(accumulator, AktToken(in)->literal);
      NextToken(in);
      CheckInpTokNoSkip(in, PosInt);
   }
   else
   {
      CheckInpTok(in, PosInt);
   }
   DStrAppendDStr(accumulator, AktToken(in)->literal);
   NextToken(in);

   if(TestInpTokNoSkip(in, DECIMAL_DOT) && 
      TestTok(LookToken(in,1), PosInt) &&
      !(LookToken(in,1)->skipped))
   {
      DStrAppendChar(accumulator, '.');
      AcceptInpTokNoSkip(in, DECIMAL_DOT);
      DStrAppendDStr(accumulator,  AktToken(in)->literal);
      AcceptInpTokNoSkip(in, PosInt);
      res = SNFloat;
   }
   if(TestInpNoSkip(in))
   {
      if(TestInpId(in, "e|E"))
      {
         DStrAppendStr(accumulator,  "e");
         NextToken(in); /* Skip E */      
         DStrAppendDStr(accumulator,  AktToken(in)->literal);
         AcceptInpTokNoSkip(in, Hyphen|Plus); /* Eat - */
         DStrAppendDStr(accumulator,  AktToken(in)->literal);
         AcceptInpTokNoSkip(in, PosInt);
         res = SNFloat;
      } 
      else if(TestInpIdnum(in, "e|E"))
      {
         DStrAppendDStr(accumulator,  AktToken(in)->literal);
         AcceptInpTokNoSkip(in, Idnum); 
         res = SNFloat;
      }
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: DDArrayParse()
//
//   Parse a coma-delimited list of double values into array. If
//   brackets is true, expect the list to be enclosed into (). Return
//   the number of values parsed.
//
// Global Variables: -
//
// Side Effects    : Reads input
//
/----------------------------------------------------------------------*/

long DDArrayParse(Scanner_p in, DDArray_p array, bool brackets)
{
   long i=0;

   if(brackets)
   {
      AcceptInpTok(in, OpenBracket);
   }

   if(TestInpTok(in, Hyphen|Plus|PosInt))
   {
      DDArrayAssign(array, i, ParseFloat(in));
      i++;
      
      while(TestInpTok(in, Comma))
      {
	 NextToken(in); /* We know it's a comma */
	 DDArrayAssign(array, i, ParseFloat(in)); 
	 i++;
      }
   }
   if(brackets)
   {
      AcceptInpTok(in, CloseBracket);
   }
   return i;
}


/*-----------------------------------------------------------------------
//
// Function: ParseFilename()
//
//   Parse a filename and return 
//   it. Note that we only allow reasonably "normal" filenames or
//   strings, i.e. not spaces, non-printables, most meta-charachters,
//   or quotes. 
//
// Global Variables: -
//
// Side Effects    : Read input, allocates space (which must be freed
//                   by the caller)
//
/----------------------------------------------------------------------*/

#define PLAIN_FILE_TOKENS String|Name|PosInt|Fullstop|Plus|Hyphen

char* ParseFilename(Scanner_p in)
{
   bool first_tok = true;

   DStrReset(in->accu);
   
   while((first_tok || TestInpNoSkip(in)) && 
	 TestInpTok(in, PLAIN_FILE_TOKENS|Slash))
   {
      DStrAppendDStr(in->accu, AktToken(in)->literal);
      NextToken(in);
      first_tok = false;
   }
   return SecureStrdup(DStrView(in->accu));
}


/*-----------------------------------------------------------------------
//
// Function: ParsePlainFileName()
//
//   Parse a local file name (without /) and return it. The caller has
//   to free the allocated memory!
//
// Global Variables: -
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

char* ParsePlainFilename(Scanner_p in)
{
   bool first_tok = true;
   DStrReset(in->accu);

   while((first_tok || TestInpNoSkip(in)) && 
	 TestInpTok(in, PLAIN_FILE_TOKENS|Slash))
   {
      DStrAppendDStr(in->accu, AktToken(in)->literal);
      NextToken(in);
      first_tok = false;
   }
   return SecureStrdup(DStrView(in->accu));
}


/*-----------------------------------------------------------------------
//
// Function: ParseSkipParenthesizedExpr()
//
//   Skip any expression containing balanced (), [], {}. Print error
//   on missmatch. Note that no full syntax check is performed, we are
//   only interested in the different braces.
//
// Global Variables: -
//
// Side Effects    : Input
//
/----------------------------------------------------------------------*/

void ParseSkipParenthesizedExpr(Scanner_p in)
{
   PStack_p paren_stack = PStackAlloc();
   TokenType tok;

   CheckInpTok(in, OpenBracket|OpenCurly|OpenSquare);
   PStackPushInt(paren_stack, AktTokenType(in));
   NextToken(in);
   while(!PStackEmpty(paren_stack))
   {
      if(TestInpTok(in, OpenBracket|OpenCurly|OpenSquare))
      {
         PStackPushInt(paren_stack, AktTokenType(in));         
         NextToken(in);
      }
      else if(TestInpTok(in, CloseBracket|CloseCurly|CloseSquare))
      {
         tok = PStackPopInt(paren_stack);
         switch(tok)
         {
         case OpenBracket:
               AcceptInpTok(in,CloseBracket);
               break;
         case OpenCurly:
               AcceptInpTok(in, CloseCurly);
               break;
         case OpenSquare:
               AcceptInpTok(in,CloseSquare);
               break;
         default:
               assert(false && "Impossible value on parentheses stack");
               break;
         }
      }
      else
      {
         NextToken(in);
      }
   }
   PStackFree(paren_stack);
}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


