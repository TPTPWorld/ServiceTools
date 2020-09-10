/*-----------------------------------------------------------------------

File  : clb_error.c

Author: Stephan Schulz

Contents
 
  Routines for handling errors, warnings, and system stuff.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sun Jul  6 23:33:59 MET DST 1997
    New

-----------------------------------------------------------------------*/

#include <sys/types.h>
#include <sys/uio.h>
#include "clb_error.h"


/*---------------------------------------------------------------------*/
/*                        Global Variables                             */
/*---------------------------------------------------------------------*/

/* Space for building error messages */

char ErrStr[MAX_ERRMSG_LEN];

/* Saving errno from the system call originating it */

int TmpErrno;

/* The name of the program */

char* ProgName = "Unknown program";


/* The empty string as a global, external variable that cannot easily
 * be optimize away. See InitError() for more explanation. */

char* EmptyString = "";


/*---------------------------------------------------------------------*/
/*                      Forward Declarations                           */
/*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*/
/*                         Internal Functions                          */
/*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*/
/*                         Exported Functions                          */
/*---------------------------------------------------------------------*/

/* Handle various versions of sysconf() pagesize (usually from
 * unistd.h) */

#ifdef _SC_PAGESIZE
#define E_SC_PAGE_SIZE _SC_PAGESIZE
#elif defined(_SC_PAGE_SIZE)
#define E_SC_PAGE_SIZE _SC_PAGE_SIZE
#endif

/*-----------------------------------------------------------------------
//
// Function: GetSystemPageSize()
//
//   Find and return the system page size (in bytes), if
//   possible. Return -1 otherwise. 
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

long GetSystemPageSize(void)
{
   long res = -1;

#ifdef E_SC_PAGE_SIZE
   errno = 0;
   res = sysconf(E_SC_PAGE_SIZE);
   if(errno)
   {
      assert(res==-1);
      Warning("sysconf() call to get page size failed!\n");
      res = -1;
   }
#endif
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: GetSystemPhysMemory()
//
//   Try to find the phyical memory installed in the machine. Return
//   it (in MB) or -1 if no information can be obtained.
//
// Global Variables: -
//
// Side Effects    : No persistent ones
//
/----------------------------------------------------------------------*/

#define MEM_PHRASE "Primary memory available: "

long GetSystemPhysMemory(void)
{
   long res = -1;

#if defined(E_SC_PAGE_SIZE) && defined(_SC_PHYS_PAGES)
   {
      long long tmpres = 0, pages, pagesize;

      pagesize = GetSystemPageSize();
      pages = sysconf(_SC_PHYS_PAGES);
      if((pagesize !=-1) && (pages != -1))
      {
         tmpres = pagesize * pages;
         res = tmpres / MEGA;
      }
   }
#endif
   if(res==-1)
   {
      FILE* pipe;
      char line[220];
      int limit = strlen(MEM_PHRASE);
      char *convert;
      double resmult = 0.0;

      pipe = popen("hostinfo", "r");
      if(pipe)
      {
         while(fgets(line, 220, pipe))
         {
            if(strncmp(MEM_PHRASE, line, limit)==0)
            {               
               resmult = strtod(line+limit, &convert);
               if(strstr(convert, "kilobyte"))
               {  /* Past-proof, of course */
                  res = resmult/1024;
               }
               else if(strstr(convert, "megabyte"))
               {
                  res = resmult;
               }
               else if(strstr(convert, "gigabyte"))
               {
                  res = resmult*1024;
               }
               else if(strstr(convert, "terabyte"))
               { /* Future-proof */
                  res = resmult*(1024*1024);
               }
               else
               {
                  res = -1;
               }
               break;
            }
         }
   
         pclose(pipe);
      }      
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: InitError()
//
//   Initialize the error handling module. Currently only stores the
//   name under which the program has been called. Copies only the
//   pointer, not the pointed-to value!
//
// Global Variables: ProgName
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/

void InitError(char* progname)
{
   ProgName = progname;
}


/*-----------------------------------------------------------------------
//
// Function: Error()
//
//   Print an error message to stderr and exit the program with the
//   given return code.
//
// Global Variables: ProgName
//
// Side Effects    : Terminates the program.
//
/----------------------------------------------------------------------*/

VOLATILE void Error(char* message, ErrorCodes ret)
{
   WRITE_STR(STDERR_FILENO, ProgName);
   WRITE_STR(STDERR_FILENO, ": ");
   WRITE_STR(STDERR_FILENO, message);
   WRITE_STR(STDERR_FILENO, "\n");
   exit(ret);
}


/*-----------------------------------------------------------------------
//
// Function: SysError()
//
//   Print a user error message and a system error message to stderr
//   and exit the program with an appropriate return code. The value
//   of errno is restored from TmpErrno.
//
// Global Variables: ProgName, TmpErrno
//
// Side Effects    : Terminates the program.
//
/----------------------------------------------------------------------*/

VOLATILE void SysError(char* message, ErrorCodes ret)
{
   WRITE_STR(STDERR_FILENO, ProgName);
   WRITE_STR(STDERR_FILENO, ": ");
   WRITE_STR(STDERR_FILENO, message);
   WRITE_STR(STDERR_FILENO, "\n");
   errno = TmpErrno;
   perror(ProgName);
   exit(ret);
}


/*-----------------------------------------------------------------------
//
// Function: Warning()
//
//   Print a warning to stderr
//
// Global Variables: ProgName
//
// Side Effects    : Output
//
/----------------------------------------------------------------------*/

void Warning(char* message)
{
   WRITE_STR(STDERR_FILENO, ProgName);
   WRITE_STR(STDERR_FILENO, ": Warning: ");
   WRITE_STR(STDERR_FILENO, message);
   WRITE_STR(STDERR_FILENO, "\n");
}



/*-----------------------------------------------------------------------
//
// Function: GetTotalCPUTime()
//
//   Return the total CPU time use by the process s far, in floating
//   point seconds - or -1.0 if this cannot be determined.
//
// Global Variables: -
//
// Side Effects    : May terminate with error.
//
/----------------------------------------------------------------------*/

double GetTotalCPUTime(void)
{
   double res = -1;
   
   struct rusage usage;

   if(!getrusage(RUSAGE_SELF, &usage))
   {
      res = (usage.ru_utime.tv_sec+usage.ru_stime.tv_sec)+
         ((usage.ru_utime.tv_usec+usage.ru_stime.tv_usec)/1000000.0);
   }
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: PrintRusage()
//
//   Print resource usage to given stream.
//
// Global Variables: -
//
// Side Effects    : Output
//
/----------------------------------------------------------------------*/

void PrintRusage(FILE* out)
{
   struct rusage usage;
   
   if(getrusage(RUSAGE_SELF, &usage))
   {
      TmpErrno = errno;
      SysError("Unable to get resource usage information",
	       SYS_ERROR);
   }
   fprintf(out, 
	   "\n# -------------------------------------------------\n");
   fprintf(out, 
	   "# User time                : %.3f s\n",
	   (usage.ru_utime.tv_sec)+(usage.ru_utime.tv_usec)/1000000.0);
   fprintf(out, 
	   "# System time              : %.3f s\n",
	   (usage.ru_stime.tv_sec)+(usage.ru_stime.tv_usec)/1000000.0);
   fprintf(out, 
	   "# Total time               : %.3f s\n",
	   (usage.ru_utime.tv_sec+usage.ru_stime.tv_sec)+
	   ((usage.ru_utime.tv_usec+usage.ru_stime.tv_usec)/1000000.0));
   fprintf(out, 
	   "# Maximum resident set size: %ld pages\n",
	   usage.ru_maxrss);
}


/*-----------------------------------------------------------------------
//
// Function: StrideMemory()
//
//   Write an arbitrary value into memory each E_PAGE_SIZE
//   bytes. It's used for preallocated memory reserves. Normally,
//   allocated pages need not really be available unless written to if
//   overallocation is being used. This should ensure that allocated
//   pages are backed by real memory in such (broken!) cases.  
//
// Global Variables: 
//
// Side Effects    : 
//
/----------------------------------------------------------------------*/

void StrideMemory(char* mem, long size)
{
   char* stride;
   static long e_page_size = 0;

   if(!e_page_size)
   {
      e_page_size = GetSystemPageSize();
   }
   if(e_page_size==-1)
   {
      Warning("Could not determine page size, guessing 4096!");
      e_page_size=4096;
   }
   
   for(stride = mem; stride < mem+size; stride+=e_page_size) 
   {
      *stride = 'S'; /* Arbitrary value*/
   }
}

/*-----------------------------------------------------------------------
//
// Function: CheckLetterString()
//
//   Return true if all letters in to_check also appear in options,
//   false otherwise.
//
// Global Variables: -
//
// Side Effects    : -
//
/----------------------------------------------------------------------*/
  
bool CheckLetterString(char* to_check, char* options)
{
   char *current, *control;
   bool found;

   for(current = to_check; *current; current++)
   {
      found = false;
      for(control = options; *control; control++)
      {
	 if(*current == *control)
	 {
	    found = true;
	    break;
	 }	 
      }
      if(!found)
      {
	 return false;
      }
   }
   return true;
}



/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


