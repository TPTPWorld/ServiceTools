/*-----------------------------------------------------------------------

File  : ekb_insert.c

Author: Stephan Schulz

Contents
 
  Insert an new training example file into a knowledge base.

  Copyright 1998, 1999-2006 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Wed Jul 28 16:21:33 MET DST 1999
    New
<2> Sun May  7 20:48:22 CEST 2006
    Changed semantics for more efficiency (suggested and prototyped by
    Josef Urban, <urban@ktilinux.ms.mff.cuni.cz>

-----------------------------------------------------------------------*/

#include <cio_commandline.h>
#include <cio_output.h>
#include <cio_fileops.h>
#include <cle_kbinsert.h>
#include <e_version.h>

/*---------------------------------------------------------------------*/
/*                  Data types                                         */
/*---------------------------------------------------------------------*/

#define NAME    "ekb_insert"

typedef enum
{
   OPT_NOOPT=0,
   OPT_HELP,
   OPT_VERSION,
   OPT_VERBOSE,
   OPT_KB,
   OPT_NAME
}OptionCodes;



/*---------------------------------------------------------------------*/
/*                        Global Variables                             */
/*---------------------------------------------------------------------*/

OptCell opts[] =
{
   {OPT_HELP, 
    'h', "help", 
    NoArg, NULL,
    "Print a short description of program usage and options."},

   {OPT_VERSION,
    'V', "version",
    NoArg, NULL,
    "Print the version number of the program."},

   {OPT_VERBOSE, 
    'v', "verbose", 
    OptArg, "1",
    "Verbose comments on the progress of the program."},

   {OPT_NAME,
    'n', "name",
    ReqArg, NULL,
    "Give the name of the new problem. If not given, the program will "
    "take the name of the first input file, or, if <stdin> is read, a"
    " name of the form '__problem__i', where i is magically computed "
    " from the existing knowledge base."},

   {OPT_KB,
    'k',"knowledge-base",
    ReqArg, NULL,
    "Select the knowledge base. If not given, select E_KNOWLEDGE."},
    
   {OPT_NOOPT,
    '\0', NULL,
    NoArg, NULL,
    NULL}
};

char* ex_name = NULL;
char* kb_name = "E_KNOWLEDGE";

/*---------------------------------------------------------------------*/
/*                      Forward Declarations                           */
/*---------------------------------------------------------------------*/

CLState_p process_options(int argc, char* argv[]);
void print_help(FILE* out);

/*---------------------------------------------------------------------*/
/*                         Internal Functions                          */
/*---------------------------------------------------------------------*/


int main(int argc, char* argv[])
{
   CLState_p       state;
   DStr_p          name, store_file;
   FILE            *out;
   ExampleSet_p    proof_examples;
   AnnoSet_p       clause_examples;
   TB_p            annoterms;
   Sig_p           reserved_symbols;
   Scanner_p       in;
   char            defaultname[30];
   int             i;

   assert(argv[0]);

   InitIO(NAME);
#ifdef STACK_SIZE
   IncreaseMaxStackSize(argv, STACK_SIZE);
#endif
   
   state = process_options(argc, argv);

   name = DStrAlloc();
   
   /* Step 1: Read existing files: problems, clausepatterns, signature
    */
   proof_examples = ExampleSetAlloc();
   in = CreateScanner(StreamTypeFile, 
		      KBFileName(name, kb_name, "problems"),
		      true, NULL);
   ExampleSetParse(in, proof_examples);
   DestroyScanner(in);
   
   reserved_symbols = SigAlloc();
   
   in = CreateScanner(StreamTypeFile, 
		      KBFileName(name, kb_name, "signature"),
		      true, NULL);
   SigParse(in, reserved_symbols, true);
   DestroyScanner(in);

   in = CreateScanner(StreamTypeFile, 
		      KBFileName(name, kb_name, "clausepatterns"),
		      true, NULL);
   annoterms = TBAlloc(reserved_symbols);
   clause_examples = AnnoSetParse(in, annoterms, KB_ANNOTATION_NO);
   DestroyScanner(in);

   VERBOUT("Old knowledge base files parsed successfully\n");
   
   if(state->argc ==  0)
   {
      CLStateInsertArg(state, "-");
   }  

   /* Loop over all new examples and integrate them */

   for(i=0; state->argv[i]; i++)
   {
      
      /* Step 2: Determine name and check validity */

      if(!ex_name && state->argv[i] && (strcmp(state->argv[i], "-")!= 0))
      {
	 ex_name = FileFindBaseName(state->argv[i]);
      }

      if(!ex_name)
      {
	 sprintf(defaultname, "__problem__%ld",
		 proof_examples->count+1);
	 ex_name = defaultname;
      }

      if(ExampleSetFindName(proof_examples, ex_name))
      {
	 DStr_p error = DStrAlloc();

	 DStrAppendStr(error, "Example name '");
	 DStrAppendStr(error, ex_name);
	 DStrAppendStr(error, "' already in use");
	 Error(DStrView(error), USAGE_ERROR);

	 DStrFree(error);
      }

      VERBOUTARG("New example will use name ", ex_name);

      /* Step 3: Copy input file into files-directory */
   
      store_file = DStrAlloc();
      DStrAppendStr(store_file, KBFileName(name, kb_name, "FILES/"));
      DStrAppendStr(store_file, ex_name);
   
      CopyFile(DStrView(store_file), state->argv[i]);

      /* Step 4: Integrate new examples into existing structures */
   
      in = CreateScanner(StreamTypeFile, DStrView(store_file), true, NULL);
   
      KBParseExampleFile(in, ex_name, proof_examples, clause_examples,
			 reserved_symbols);
      DestroyScanner(in);
      DStrFree(store_file);
      ex_name = NULL;
   }      

   /* Step 5: Write everything back: problems, clausepatterns */

   out = OutOpen(KBFileName(name, kb_name, "clausepatterns"));
   AnnoSetPrint(out, clause_examples);
   OutClose(out);
   
   out = OutOpen(KBFileName(name, kb_name, "problems"));
   ExampleSetPrint(out, proof_examples); 
   OutClose(out);

   /* Finally clean up */

   DStrFree(name);
   AnnoSetFree(clause_examples);
   annoterms->sig = NULL;
   TBFree(annoterms);
   SigFree(reserved_symbols);
   ExampleSetFree(proof_examples);
   CLStateFree(state);

   ExitIO();
#ifdef CLB_MEMORY_DEBUG
   MemFlushFreeList();
   MemDebugPrintStats(stdout);
#endif
   
   return 0;
}


/*-----------------------------------------------------------------------
//
// Function: process_options()
//
//   Read and process the command line option, return (the pointer to)
//   a CLState object containing the remaining arguments.
//
// Global Variables: 
//
// Side Effects    : Sets variables, may terminate with program
//                   description if option -h or --help was present
//
/----------------------------------------------------------------------*/

CLState_p process_options(int argc, char* argv[])
{
   Opt_p handle;
   CLState_p state;
   char*  arg;
   
   state = CLStateAlloc(argc,argv);
   
   while((handle = CLStateGetOpt(state, &arg, opts)))
   {
      switch(handle->option_code)
      {
      case OPT_VERBOSE:
	    Verbose = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_HELP: 
	    print_help(stdout);
	    exit(NO_ERROR);
	    break;
      case OPT_VERSION:
	    printf(NAME " " VERSION "\n");
	    exit(NO_ERROR);
	    break;	    
      case OPT_KB:
	    kb_name = arg;
	    break;
      case OPT_NAME:
	    ex_name = arg;
	    break;	     
     default:
	 assert(false);
	 break;
      }
   }
   return state;
}

void print_help(FILE* out)
{
   fprintf(out, "\n\
\n"
NAME " " VERSION "\n\
\n\
Usage: ekb_insert [options] [names]\n\
\n\
Insert example files into an E knowledge base. Each non-option argument\n\
is considered as one individual example file.\n\n"); 
   PrintOptions(stdout, opts, "Options\n\n");
   fprintf(out, "\n\
Copyright (C) 1999-2006 by Stephan Schulz, " STS_MAIL "\n\
\n\
This program is a part of the support structure for the E equational\n\
theorem prover. You can find the latest version of the E distribution\n\
as well as additional information at\n\
" E_URL "\
\n\n\
This program is free software; you can redistribute it and/or modify\n\
it under the terms of the GNU General Public License as published by\n\
the Free Software Foundation; either version 2 of the License, or\n\
(at your option) any later version.\n\
\n\
This program is distributed in the hope that it will be useful,\n\
but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n\
GNU General Public License for more details.\n\
\n\
You should have received a copy of the GNU General Public License\n\
along with this program (it should be contained in the top level\n\
directory of the distribution in the file COPYING); if not, write to\n\
the Free Software Foundation, Inc., 59 Temple Place, Suite 330,\n\
Boston, MA  02111-1307 USA\n\
\n\
The original copyright holder can be contacted as\n\
\n\
Stephan Schulz\n\
Technische Universitaet Muenchen\n\
Fakultaet fuer Informatik\n\
Arcisstrasse 20\n\
D-80290 Muenchen\n\
Germany\n\
");

}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


