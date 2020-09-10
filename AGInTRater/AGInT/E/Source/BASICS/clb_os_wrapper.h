/*-----------------------------------------------------------------------

File  : clb_os_wrapper.h

Author: Stephan Schulz (schulz@eprover.org)

Contents
 
  Functions wrapping some OS functions in a convenient manner. 

  Copyright 2007 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1>     New

-----------------------------------------------------------------------*/

#ifndef CLB_OS_WRAPPERS

#define CLB_OS_WRAPPERS

#include <assert.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>

#include "clb_error.h"


/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

typedef enum
{
   RLimFailed,
   RLimReduced,
   RLimSuccess
}RLimResult;


/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

RLimResult SetSoftRlimit(int resource, rlim_t limit);
void       SetSoftRlimitErr(int resource, rlim_t limit, char* desc);
void       SetMemoryLimit(rlim_t mem_limit);
rlim_t     GetSoftRlimit(int resource);
void       IncreaseMaxStackSize(char *argv[], rlim_t stacksize);

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





