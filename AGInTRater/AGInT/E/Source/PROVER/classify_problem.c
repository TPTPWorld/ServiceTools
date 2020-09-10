/*-----------------------------------------------------------------------

File  : classify_problem.c

Author: Stephan Schulz

Contents
 
  Read a specification and print classification and feature vector.

  Copyright 1998-2005 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Sat Dec 12 22:39:18 MET 1998
    New
<2> Thu May 12 12:35:46 CEST 2005
    Added TSTP support

-----------------------------------------------------------------------*/

#include <cio_commandline.h>
#include <cio_output.h>
#include <ccl_unfold_defs.h>
#include <ccl_formulafunc.h>
#include <che_clausesetfeatures.h>
#include <e_version.h>

/*---------------------------------------------------------------------*/
/*                  Data types                                         */
/*---------------------------------------------------------------------*/

#define NAME "classify_problem"

typedef enum
{
   OPT_NOOPT=0,
   OPT_HELP,
   OPT_VERSION,
   OPT_VERBOSE,
   OPT_OUTPUT,
   OPT_PARSE_FEATURES,
   OPT_TPTP_PARSE,
   OPT_TPTP_PRINT,
   OPT_TPTP_FORMAT,
   OPT_TSTP_PARSE,
   OPT_TSTP_PRINT,
   OPT_TSTP_FORMAT,
   OPT_GEN_TPTP_HEADER,
   OPT_NO_PREPROCESSING,
   OPT_EQ_UNFOLD_LIMIT,
   OPT_EQ_UNFOLD_MAXCLAUSES,
   OPT_NO_EQ_UNFOLD,
   OPT_DEF_CNF,
   OPT_MASK,
   OPT_NGU_ABSOLUTE,
   OPT_NGU_FEW_LIMIT,
   OPT_NGU_MANY_LIMIT,
   OPT_NGU_FEW_COUNT,
   OPT_NGU_MANY_COUNT,
   OPT_GPC_ABSOLUTE,
   OPT_GPC_FEW_LIMIT,
   OPT_GPC_MANY_LIMIT,
   OPT_GPC_FEW_COUNT,
   OPT_GPC_MANY_COUNT,
   OPT_AXIOM_MANY_LIMIT,
   OPT_AXIOM_SOME_LIMIT,
   OPT_LIT_MANY_LIMIT,
   OPT_LIT_SOME_LIMIT,
   OPT_TERM_MEDIUM_LIMIT,
   OPT_TERM_LARGE_LIMIT,
   OPT_FAR_SUM_MEDIUM_LIMIT,
   OPT_FAR_SUM_LARGE_LIMIT,
   OPT_MAX_DEPTH_MEDIUM_LIMIT,
   OPT_MAX_DEPTH_DEEP_LIMIT,
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
    '\0', "version",
    NoArg, NULL,
    "Print the version number of the program."},

   {OPT_VERBOSE, 
    'v', "verbose", 
    OptArg, "1",
    "Verbose comments on the progress of the program. This differs "
    "from the output level (below) in that technical information is "
    "printed to stderr, while the output level determines which "
    "logical manipulations of the clauses are printed to stdout."},

   {OPT_OUTPUT,
    'o', "output-file",
    ReqArg, NULL,
   "Redirect output into the named file."},

   {OPT_PARSE_FEATURES,
    'p', "parse-features",
    NoArg, NULL,
    "Parse precomputed feature lines, not real formulae. This "
    "conflicts with the '--generate-tptp-header' option, as not "
    "all information needed for this is stored in feature lines."},
   {OPT_TPTP_PARSE,
    '\0', "tptp-in",
    NoArg, NULL,
    "Parse TPTP format instead of lop (does not understand includes, "
    "as TPTP includes are a brain-dead design)."},

   {OPT_TPTP_PRINT,
    '\0', "tptp-out",
    NoArg, NULL,
    "Print TPTP format instead of lop. Implies --eqn-no-infix and "
    "will ignore --full-equational-rep."},

   {OPT_TPTP_FORMAT,
    '\0', "tptp-format",
    NoArg, NULL,
    "Equivalent to --tptp-in and --tptp-out."},

   {OPT_TSTP_PARSE,
    '\0', "tstp-in",
    NoArg, NULL,
    "Parse TSTP format instead of E-LOP (not all all optional "
    "extensions are currently supported)."},
   
   {OPT_TSTP_PRINT,
    '\0', "tstp-out",
    NoArg, NULL,
    "Print proof protocol in TSTP (v.0.3) syntax (default is PCL). Only "
    "effective for output levels greater than 1."},

   {OPT_TSTP_FORMAT,
    '\0', "tstp-format",
    NoArg, NULL,
    "Equivalent to --tstp-in and --tstp-out."},

   {OPT_GEN_TPTP_HEADER,
    'H', "generate-tptp-header",
    NoArg, NULL,
    "Generate the statistics (\"Syntax\") part of a TPTP header for "
    "the problem."},

   {OPT_NO_PREPROCESSING,
    '\0', "no-preprocessing",
    NoArg, NULL,
    "Do not perform preprocessing on the initial clause set. "
    "Preprocessing currently removes tautologies and orders terms, "
    "literals and clauses in a certain (\"canonical\") way before "
    "anything else happens. It also unfolds equational definitons (and "
    "removes them)."},

   {OPT_EQ_UNFOLD_LIMIT,
    '\0', "eq-unfold-limit",
    ReqArg, NULL,
    "During preprocessing, limit unfolding (and removing) of "
    "equational definitions to those where the expanded definiton "
    "is at most the given limit bigger (in terms of standard "
    "weight) than the defined term.."},

   {OPT_EQ_UNFOLD_MAXCLAUSES,
    '\0', "eq-unfold-maxclauses",
    ReqArg, NULL,
    "During preprocessing, don't try unfolding of equational "
    "definitions if the problem has more than this limit of clauses."},

   {OPT_NO_EQ_UNFOLD,
    '\0', "no-eq-unfolding",
    NoArg, NULL,
    "During preprocessing, abstain from unfolding (and removing) "
    "equational definitions."},

   {OPT_DEF_CNF,
    '\0', "definitional-cnf",
    OptArg, TFORM_RENAME_LIMIT_STR,
    "Use the experimental new clausification algorithm that possibly "
    "introduces definitions for subformula to avoid exponential blow-up."
    " The optional argument is a fudge factor that determines when a "
    "definition is introduced. 0 disables definitions, the default works"
    " well."},
  
   {OPT_MASK,
    'c', "class-mask",
    ReqArg, NULL,
    "Provide a mask for the class description. A mask is a 12 letter "
    "string, with positions corresponding to the class "
    "descriptors. Any dash ('-') in the string masks out the "
    "corresponding position in the class descriptor."},

   {OPT_NGU_ABSOLUTE,
    'a', "ngu-absolute",
    OptArg, "true",
    "Use absolute values (not percentages) to determine if there are few, "
    "some, or many non-ground unit clauses."},

   {OPT_NGU_FEW_LIMIT,
    'f', "ngu-few-limit",
    ReqArg, NULL,
    "Set the limit (either an absolute integer value or a fraction "
    "between 0 and 1) for the size of the set of non-ground units "
    "to consist of 'few' clauses."},
   
   {OPT_NGU_MANY_LIMIT,
    'm', "ngu-many-limit",
    ReqArg, NULL,
    "Set the limit (either an absolute integer value or a fraction "
    "between 0 and 1) for the size of the set of non-ground units "
    "to consist of 'many' clauses."},

   {OPT_GPC_ABSOLUTE,
    '\0', "gpc-absolute",
    OptArg, "true",
    "Use absolute values (not percentages) to determine if there are few, "
    "some, or many non-ground unit clauses."},

   {OPT_GPC_FEW_LIMIT,
    '\0', "gpc-few-limit",
    ReqArg, NULL,
    "Set the limit (either an absolute integer value or a fraction "
    "between 0 and 1) for the size of the set of ground positive clauses "
    "to consist of 'few' clauses."},
   
   {OPT_GPC_MANY_LIMIT,
    '\0', "gpc-many-limit",
    ReqArg, NULL,
    "Set the limit (either an absolute integer value or a fraction "
    "between 0 and 1) for the size of the set of ground positive clauses "
    "to consist of 'many' clauses."},

   {OPT_AXIOM_SOME_LIMIT,
    '\0', "ax-some-limit",
    ReqArg, NULL,
    "Set the mimumum number of clauses for a specification to be "
    "considered to be medium size with respect to this measure."},

   {OPT_AXIOM_MANY_LIMIT,
    '\0', "ax-many-limit",
    ReqArg, NULL,
    "Set the mimumum number of clauses for a specification to be "
    "considered to be large size with respect to this measure."},

   {OPT_LIT_SOME_LIMIT,
    '\0', "lit-some-limit",
    ReqArg, NULL,
    "Set the mimumum number of literals for a specification to be "
    "considered to be medium size with respect to this measure."},

   {OPT_LIT_MANY_LIMIT,
    '\0', "lit-many-limit",
    ReqArg, NULL,
    "Set the mimumum number of literals for a specification to be "
    "considered to be large size with respect to this measure."},

   {OPT_TERM_MEDIUM_LIMIT,
    '\0', "term-medium-limit",
    ReqArg, NULL,
    "Set the mimumum number of subterms for a specification to be "
    "considered to be medium size with respect to this measure."},

   {OPT_TERM_LARGE_LIMIT,
    '\0', "term-large-limit",
    ReqArg, NULL,
    "Set the mimumum number of subterms for a specification to be "
    "considered to be large size with respect to this measure."},

   {OPT_FAR_SUM_MEDIUM_LIMIT,
    '\0', "farity-medium-limit",
    ReqArg, NULL,
    "Set the mimumum sum of function symbol arities for a specification to be "
    "considered to be medium size with respect to this measure."},

   {OPT_FAR_SUM_LARGE_LIMIT,
    '\0', "farity-large-limit",
    ReqArg, NULL,
    "Set the mimumum sum of function symbol arities for a specification to be "
    "considered to be large size with respect to this measure."},

   {OPT_MAX_DEPTH_MEDIUM_LIMIT,
    '\0', "max-depth-medium-limit",
    ReqArg, NULL,
    "Set the mimumum maximal clause depth for medium depth specifications."},

   {OPT_MAX_DEPTH_DEEP_LIMIT,
    '\0', "max-depth-deep-limit",
    ReqArg, NULL,
    "Set the mimumum maximal clause depth for deep depth specifications."},

   {OPT_NOOPT,
    '\0', NULL,
    NoArg, NULL,
    NULL}
};

char     *outname = NULL, 
         *mask = "aaaaa----aaaa";
IOFormat parse_format     = LOPFormat;
bool     tptp_header      = false,
         no_preproc       = false,
         parse_features   = false;
long     eqdef_maxclauses = DEFAULT_EQDEF_MAXCLAUSES;
int      eqdef_incrlimit  = DEFAULT_EQDEF_INCRLIMIT;


/*---------------------------------------------------------------------*/
/*                      Forward Declarations                           */
/*---------------------------------------------------------------------*/

CLState_p process_options(int argc, char* argv[], SpecLimits_p limits);
char*     parse_feature_line(Scanner_p in, SpecFeature_p features);
void print_help(FILE* out);

/*---------------------------------------------------------------------*/
/*                         Internal Functions                          */
/*---------------------------------------------------------------------*/

int main(int argc, char* argv[])
{
   ProofState_p    fstate;
   Scanner_p       in;    
   int             i, min_arity, max_arity, symbol_count;
   long            depthmax, depthsum, count;
   CLState_p       state;
   SpecFeatureCell features;
   SpecLimits_p     limits;

   assert(argv[0]);
   
   InitIO(NAME);

   limits = SpecLimitsAlloc();
   state = process_options(argc, argv, limits);
    
   OpenGlobalOut(outname);

   if(state->argc ==  0)
   {
      CLStateInsertArg(state, "-");
   }
   
   if(parse_features)
   {
      char *name;

      for(i=0; state->argv[i]; i++)
      {
         in = CreateScanner(StreamTypeFile, state->argv[i], true, NULL);
         while(!TestInpTok(in, NoToken))
         {
            name = parse_feature_line(in, &features);            
            SpecFeaturesAddEval(&features, limits);  
            fprintf(GlobalOut, "%s : ", name);
            SpecFeaturesPrint(GlobalOut, &features);
            fprintf(GlobalOut, " : ");
            SpecTypePrint(GlobalOut, &features, mask);
            fprintf(GlobalOut, "\n");
            FREE(name);
         }         
         DestroyScanner(in);
      }
   }
   else
   {
      for(i=0; state->argv[i]; i++)
      {
         fstate = ProofStateAlloc(FPIgnoreProps);
         in    = CreateScanner(StreamTypeFile, state->argv[i], true, NULL);
         ScannerSetFormat(in, parse_format);
         
         FormulaAndClauseSetParse(in, fstate->axioms, 
                                  fstate->f_axioms,
                                  fstate->original_terms, NULL);
         FormulaSetPreprocConjectures(fstate->f_axioms);
         FormulaSetCNF(fstate->f_axioms, fstate->axioms, 
                       fstate->original_terms, fstate->freshvars);
         
         if(!no_preproc)
         {
            ClauseSetPreprocess(fstate->axioms,
                                fstate->watchlist,
                                fstate->tmp_terms,
                                eqdef_incrlimit,
                                eqdef_maxclauses);
         }
         SpecFeaturesCompute(&features, fstate->axioms, fstate->signature);
         SpecFeaturesAddEval(&features, limits);
         
         
         if(!tptp_header)
         {
            fprintf(GlobalOut, "%s : ", state->argv[i]);
            SpecFeaturesPrint(GlobalOut, &features);
            fprintf(GlobalOut, " : ");
            SpecTypePrint(GlobalOut, &features, mask);
            fprintf(GlobalOut, "\n");
         }
         else
         {
            fprintf(GlobalOut, 
                    "%% Syntax   : Number of clauses    : %4ld "
                    "(%4ld non-Horn; %3ld unit; %3ld RR)\n",
                    features.clauses, 
                    features.clauses-features.horn,
                    features.unit,
                    ClauseSetCountTPTPRangeRestricted(fstate->axioms));
            fprintf(GlobalOut, 
                    "%%            Number of literals   : %4ld "
                    "(%4ld equality)\n",
                    features.literals, 
                    ClauseSetCountEqnLiterals(fstate->axioms));	 
            fprintf(GlobalOut, 
                    "%%            Maximal clause size  : %4ld ",
                    ClauseSetMaxLiteralNumber(fstate->axioms));
            if(features.clauses)
            {
               fprintf(GlobalOut, "(%4ld average)\n",
                       features.literals/features.clauses);
            }
            else
            {
               fprintf(GlobalOut, "(   - average)\n");
            }
            
            symbol_count = SigCountSymbols(fstate->signature, true);
            min_arity = SigFindMinPredicateArity(fstate->signature);
            max_arity = SigFindMaxPredicateArity(fstate->signature);	
            
            if(features.eq_content!=SpecNoEq)
            {/* Correct for the fact that TPTP treats equal as a normal
                predicate symbol */
               symbol_count++;
               max_arity = MAX(max_arity,2);
               min_arity = MIN(min_arity,2);
            }
            fprintf(GlobalOut, 
                    "%%            Number of predicates : %4d "
		 "(%4d propositional; ",
                    symbol_count,
                    SigCountAritySymbols(fstate->signature, 0, true));
            if(symbol_count)
            {	    
               fprintf(GlobalOut, "%d-%d arity)\n",
                       min_arity, max_arity);
            }
            else
            {
               fprintf(GlobalOut, "--- arity)\n");
            }
            
            symbol_count = SigCountSymbols(fstate->signature, false);
            min_arity = SigFindMinFunctionArity(fstate->signature);
            max_arity = SigFindMaxFunctionArity(fstate->signature);	
            
            fprintf(GlobalOut, 
                    "%%            Number of functors   : %4d "
                    "(%4d constant; ",
                    symbol_count,
                    SigCountAritySymbols(fstate->signature, 0, false));
            if(symbol_count)
            {	    
               fprintf(GlobalOut, "%d-%d arity)\n",
                       min_arity, max_arity);
            }
            else
            {
               fprintf(GlobalOut, "--- arity)\n");
            }
            fprintf(GlobalOut, 
                    "%%            Number of variables  : %4ld (%4ld singleton)\n",
                    ClauseSetCountVariables(fstate->axioms),
                    ClauseSetCountSingletons(fstate->axioms));
            ClauseSetTPTPDepthInfoAdd(fstate->axioms, &depthmax, &depthsum,
                                      &count);
            if(fstate->axioms->literals)
            {
               fprintf(GlobalOut, 
                       "%%            Maximal term depth   : %4ld (%4ld average)\n",
                       features.clause_max_depth, features.clause_avg_depth);
            }
            else
            {
               fprintf(GlobalOut, 
                       "%%            Maximal term depth   :    - (   - average)\n");
            }
         }
         DestroyScanner(in);
         ProofStateFree(fstate);
      }
   }
   CLStateFree(state);
   SpecLimitsCellFree(limits);
   
   fflush(GlobalOut);
   OutClose(GlobalOut);
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
// Global Variables: Verbose, TermPrologArgs,
//
// Side Effects    : Sets variables in limits, may terminate with
//                   program description if option -h or --help was
//                   present 
//
/----------------------------------------------------------------------*/

CLState_p process_options(int argc, char* argv[], SpecLimits_p limits)
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
	    printf(NAME" " VERSION "\n");
	    exit(NO_ERROR);
	    break;
      case OPT_PARSE_FEATURES:
            parse_features = true;
            break;
      case OPT_OUTPUT:
	    outname = arg;
	    break;
      case OPT_TPTP_PARSE:
	    parse_format = TPTPFormat;
	    break;
      case OPT_TPTP_PRINT:
	    OutputFormat = TPTPFormat;
	    EqnFullEquationalRep = false;
	    EqnUseInfix = false;
	    break;
      case OPT_TPTP_FORMAT:
	    parse_format = TPTPFormat;	    
	    OutputFormat = TPTPFormat;
	    EqnFullEquationalRep = false;
	    break;	
      case OPT_TSTP_PARSE:
	    parse_format = TSTPFormat;
	    break;
      case OPT_TSTP_PRINT:
	    OutputFormat = TSTPFormat;
	    EqnFullEquationalRep = false;
	    EqnUseInfix = false;
	    break;
      case OPT_TSTP_FORMAT:
	    parse_format = TSTPFormat;	    
	    OutputFormat = TSTPFormat;
	    EqnFullEquationalRep = false;
	    break;	
      case OPT_GEN_TPTP_HEADER:
	    tptp_header = true;
	    break;
      case OPT_NO_PREPROCESSING:
	    no_preproc = true;
	    break;
      case OPT_EQ_UNFOLD_MAXCLAUSES:
            eqdef_maxclauses = CLStateGetIntArg(handle, arg);
            break;
      case OPT_EQ_UNFOLD_LIMIT:
            eqdef_incrlimit = CLStateGetIntArg(handle, arg);
            break;
      case OPT_NO_EQ_UNFOLD:
	    eqdef_incrlimit = INT_MIN;
	    break;
      case OPT_DEF_CNF:
            FormulaDefLimit     = CLStateGetIntArg(handle, arg);
            break;
      case OPT_MASK:
	    mask = arg;
	    if(strlen(mask)!=13)
	    {
	       Error("Option -c (--class-mask) requires 13-letter "
		     "string as an argument", USAGE_ERROR);
	    }
	    break;
      case OPT_NGU_ABSOLUTE:
	    limits->ngu_absolute = CLStateGetBoolArg(handle, arg);
	    break;
      case OPT_NGU_FEW_LIMIT:
	    limits->ngu_few_limit = CLStateGetFloatArg(handle, arg);
	    break;
      case OPT_NGU_MANY_LIMIT:
	    limits->ngu_many_limit = CLStateGetFloatArg(handle, arg);
	    break;
      case OPT_GPC_ABSOLUTE:
	    limits->gpc_absolute = CLStateGetBoolArg(handle, arg);
	    break;
      case OPT_GPC_FEW_LIMIT:
	    limits->gpc_few_limit = CLStateGetFloatArg(handle, arg);
	    break;
      case OPT_GPC_MANY_LIMIT:
	    limits->gpc_many_limit = CLStateGetFloatArg(handle, arg);
	    break;
      case OPT_AXIOM_SOME_LIMIT:
	    limits->ax_some_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_AXIOM_MANY_LIMIT:
	    limits->ax_many_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_LIT_SOME_LIMIT:
	    limits->lit_some_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_LIT_MANY_LIMIT:
	    limits->lit_many_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_TERM_MEDIUM_LIMIT:
	    limits->term_medium_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_TERM_LARGE_LIMIT:
	    limits->term_large_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_FAR_SUM_MEDIUM_LIMIT:
	    limits->far_sum_medium_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_FAR_SUM_LARGE_LIMIT:
	    limits->far_sum_large_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_MAX_DEPTH_MEDIUM_LIMIT:
	    limits->depth_medium_limit = CLStateGetIntArg(handle, arg);
	    break;
      case OPT_MAX_DEPTH_DEEP_LIMIT:
	    limits->depth_deep_limit = CLStateGetIntArg(handle, arg);
	    break;
      default:
	 assert(false);
	 break;
      }
   }
   return state;
}


/*-----------------------------------------------------------------------
//
// Function: parse_feature_line()
//
//   Parse a single specification features line of the form
//   <name> : ( <features> ) : <class>
//   where <name> and <class> can be parsed by
//   ParsePlainFileName(). <name> is returned, <class> is ignored, and
//   <features> is stored in features.
//
// Global Variables: -
//
// Side Effects    : Input
//
/----------------------------------------------------------------------*/

char* parse_feature_line(Scanner_p in, SpecFeature_p features)
{
   char *res;
   
   res = ParsePlainFilename(in);
   AcceptInpTok(in, Colon);
   SpecFeaturesParse(in, features);
   return res;
}


/*-----------------------------------------------------------------------
//
// Function: print_help()
//
//   Print the help text.
//
// Global Variables: -
//
// Side Effects    : Output.
//
/----------------------------------------------------------------------*/

void print_help(FILE* out)
{
   fprintf(out, "\n\
\n\
" NAME " " VERSION "\n\
\n\
Usage: classify_problem [options] [files]\n\
\n\
Read sets of clauses and classify them according to predefined criteria.\n\
\n");
   PrintOptions(stdout, opts, "Options:\n\n");
   fprintf(out, "\n\
Copyright (C) 1998-2009 by Stephan Schulz, " STS_MAIL "\n\
\n\
This program is a part of the support structure for the E equational\n\
theorem prover. You can find the latest version of the E distribution\n\
as well as additional information at\n"
E_URL
"\n\
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
\n"
STS_SNAIL
"\n");

}


/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/


