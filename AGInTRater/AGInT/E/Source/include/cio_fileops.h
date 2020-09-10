/*-----------------------------------------------------------------------

File  : cio_fileops.h

Author: Stephan Schulz

Contents
 
  Simple operations on files.

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Jul 28 12:43:28 MET DST 1999
    New

-----------------------------------------------------------------------*/

#ifndef CIO_FILEOPS

#define CIO_FILEOPS

#include  <cio_output.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/




/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/


void FileOpenErrorPrint(char* name);
FILE* InputOpen(char *name, bool fail);
void  InputClose(FILE* file);
long  ConcatFiles(char* target, char** sources);
long  CopyFile(char* target, char* source);
void  FileRemove(char* name);
void  FilePrint(FILE* out, char* name);
#define FileNameIsAbsolute(name) ((name)[0]=='/')
char* FileNameDirName(char* name);
char* FileFindBaseName(char *file);
char* FileNameBaseName(char* name);

#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/





