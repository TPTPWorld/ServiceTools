/*-----------------------------------------------------------------------

File  : ccl_clauses.h

Author: Stephan Schulz

Contents
 
  Clauses - Infrastructure functions

  Copyright 1998, 1999 by the author.
  This code is released under the GNU General Public Licence.
  See the file COPYING in the main CLIB directory for details.
  Run "eprover -h" for contact information.

Changes

<1> Thu Apr 16 19:38:16 MET DST 1998
    New
<2> Mon Jan 11 00:05:24 MET 1999
    Added properties, proof_depth and proof_size

-----------------------------------------------------------------------*/

#ifndef CCL_CLAUSES

#define CCL_CLAUSES

#include <ccl_neweval.h>
#include <ccl_eqnlist.h>
#include <ccl_clauseinfo.h>
#include <clb_properties.h>

/*---------------------------------------------------------------------*/
/*                    Data type declarations                           */
/*---------------------------------------------------------------------*/

typedef enum 
{
   CPIgnoreProps       = 0,               /* For masking properties
                                           * out */ 
   CPInitial           = 1,               /* Initial clause */
   CPInputClause       = 2*CPInitial,     /* _Really_ initial clause
                                           * in TSTP sense */ 
   CPIsProcessed       = 2*CPInputClause, /* Clause has been processed
                                           * previously */ 
   CPIsOriented        = 2*CPIsProcessed, /* Term and literal
		                             comparisons are up to
		                             date */ 
   CPIsDIndexed        = 2*CPIsOriented,  /* Clause is in the
                                           * demod_index of its set */ 
   CPIsSIndexed        = 2*CPIsDIndexed,  /* Clause is in the fvindex
                                           * of its set */ 
   CPIsTIndexed        = 2*CPIsSIndexed,  /* Clause is in the subterm
                                           * index */ 
   CPIsOIndexed        = 2*CPIsTIndexed,  /* Clause is in the Overlap
                                           * index */    
   CPDeleteClause      = 2*CPIsOIndexed,  /* Clause should be deleted
                                           * for some reason */ 
   CPType1             = 2*CPDeleteClause,/* Three bits used to encode
                                           * the Clause type, taken
                                           * from TPTP or  TSTP input
                                           * format or assumed */
   CPType2             = 2*CPType1,        
   CPType3             = 2*CPType2,       
   CPTypeMask          = CPType1|CPType2|CPType3,
   CPTypeUnknown       = 0,               /* Also used as wildcard */
   CPTypeAxiom         = CPType1,         /* Clause is Axiom */
   CPTypeHypothesis    = CPType2,         /* Clause is Hypothesis */
   CPTypeConjecture    = CPType1|CPType2, /* Clause is Conjecture */
   CPTypeLemma         = CPType3,         /* Clause is Lemma */
   CPTypeNegConjecture = CPType1|CPType3, /* Clause is an negated
                                           * conjecture (used for
                                           * refutation) */
   CPTypeWatchClause   = CPType1|CPType2|CPType3,
                                          /* Clause is intended as a
                                           * watch list clause */
   CPIsIRVictim        = 2*CPType3,       /* Clause has just been
                                             simplified in
                                             interreduction */ 
   CPOpFlag            = 2*CPIsIRVictim,  /* Temporary marker */
   CPIsSelected        = 2*CPOpFlag,      /* For analysis of selected
                                           * clauses only */ 
   CPIsFinal           = 2*CPIsSelected,  /* Clause is a final clause,
                                               i.e. a clause that
                                               might be used by a
                                               postprocessor. */ 
   CPIsProofClause  = 2*CPIsFinal,        /* Clause is part of a
                                             successful proof. */
   CPIsSOS          = 2*CPIsProofClause,  /* Clause is in the set of support.*/
   CPNoGeneration   = 2*CPIsSOS,          /* No generating inferences
                                             with this clause are
                                             necessary */
   CP_CSSCPA_1      = 2*CPNoGeneration,   /* CSSCPA clause sources */
   CP_CSSCPA_2      = 2*CP_CSSCPA_1, 
   CP_CSSCPA_4      = 2*CP_CSSCPA_2, 
   CP_CSSCPA_8      = 2*CP_CSSCPA_4,
   CP_CSSCPA_Mask   = CP_CSSCPA_1|CP_CSSCPA_2|CP_CSSCPA_4|CP_CSSCPA_8,
   CP_CSSCPA_Unkown = 0,
   CPIsProtected    = 2*CP_CSSCPA_8,      /* Unprocessed clause has
                                             been used in
                                             simplification and cannot
                                             be deleted even if
                                             parents die. */
   CPWatchOnly      = 2*CPIsProtected,
   CPSubsumesWatch  = 2*CPWatchOnly,
   CPLimitedRW      = 2*CPSubsumesWatch   /* Clause has been processed
                                           * and hence can only be
                                           * rewritten in limited
                                           * ways. */
}ClauseProperties;


typedef struct clause_cell
{
   long                  ident;       /* Hopefully unique ident for
					 all clauses created during
					 proof run */
   SysDate               date;        /* ...at which this clause
					 became a demodulator */
   Eqn_p                 literals;    /* List of literals */
   short                 neg_lit_no;  /* Negative literals */
   short                 pos_lit_no;  /* Positive literals */
   long                  weight;      /* ClauseStandardWeight()
					 precomputed at some points in
					 the program */
   Eval_p                evaluations; /* List of evauations */
   ClauseProperties      properties;  /* Anything we want to note at
					 the clause? */
   ClauseInfo_p          info;        /* Currently about source in
                                         input, NULL for derived clauses */
   long                  create_date; /* At what iteration of the
					 main loop has this
					 clause been created? */
   long                  proof_depth; /* How long is the longest
					 derivation chain from this
					 clause to an axiom? */
   long                  proof_size;  /* How many (generating)
					 inferences were necessary to
					 create this clause? */
   PTree_p               children;    /* Which can be removed if this
			  	         clause changes significantly */
   struct clause_cell*   parent1;     /* Parents need to be notified */
   struct clause_cell*   parent2;     /* if their children are removed! */
   struct clausesetcell* set;         /* Is the clause in a set? */
   struct clause_cell*   pred;        /* For clause sets = doubly  */
   struct clause_cell*   succ;        /* linked lists */
}ClauseCell, *Clause_p;


/*---------------------------------------------------------------------*/
/*                Exported Functions and Variables                     */
/*---------------------------------------------------------------------*/

extern bool ClausesHaveLocalVariables;
extern bool ClausesHaveDisjointVariables;
extern long ClauseIdentCounter;

#define ClauseSetProp(clause, prop) SetProp((clause), (prop))
#define ClauseDelProp(clause, prop) DelProp((clause), (prop))
#define ClauseGiveProps(clause, prop) GiveProps((clause), (prop))

/* Are _all_ properties in prop set in clause? */
#define ClauseQueryProp(clause, prop) QueryProp((clause), (prop))

/* Are any properties in prop set in clause? */
#define ClauseIsAnyPropSet(clause, prop) IsAnyPropSet((clause), (prop))

void TSTPSkipSource(Scanner_p in);

void ClauseSetTPTPType(Clause_p clause, ClauseProperties type);

#define ClauseQueryTPTPType(clause) \
   ((clause)->properties&CPTypeMask)

#define TPTPTypesCombine(type1, type2)\
   ((type1)==CPTypeAxiom?(type2):\
      ((type2)==CPTypeConjecture?CPTypeConjecture:(type1)))

#define ClauseSetCSSCPASource(clause,prop)\
        ClauseDelProp((clause),CP_CSSCPA_Mask);\
        ClauseSetProp((clause),(prop*CP_CSSCPA_1))
#define ClauseQueryCSSCPASource(clause)\
        (((clause)->properties&CP_CSSCPA_Mask)/CP_CSSCPA_1)

#define ClauseCellAlloc()    (ClauseCell*)SizeMalloc(sizeof(ClauseCell))
#define ClauseCellFree(junk) SizeFree(junk, sizeof(ClauseCell))

#ifdef CONSTANT_MEM_ESTIMATE
#define CLAUSECELL_MEM 68
#else
#define CLAUSECELL_MEM MEMSIZE(ClauseCell)
#endif

Clause_p EmptyClauseAlloc(void);
Clause_p ClauseAlloc(Eqn_p literals);
void     ClauseFree(Clause_p junk);

#define  ClauseGCMarkTerms(clause) EqnListGCMarkTerms((clause)->literals)

#define  ClauseLiteralNumber(clause)\
         ((clause)->pos_lit_no+(clause)->neg_lit_no)

#define  ClausePropLitNumber(clause, prop)\
         EqnListQueryPropNumber((clause)->literals,(prop))

#define  ClauseIsEmpty(clause) (ClauseLiteralNumber(clause)==0)

#define  ClauseIsGoal(clause) (!((clause)->pos_lit_no))
#define  ClauseIsHorn(clause) ((clause)->pos_lit_no <= 1)
#define  ClauseIsUnit(clause) (ClauseLiteralNumber(clause)==1)
#define  ClauseIsDemodulator(clause)\
            (((clause)->pos_lit_no == 1) && \
	     ((clause)->neg_lit_no == 0))
#define  ClauseIsRWRule(clause)\
            (ClauseIsDemodulator(clause)&&EqnIsOriented((clause)->literals))
#define  ClauseIsGround(clause) EqnListIsGround(clause->literals)
#define  ClauseIsPositive(clause) ((clause)->neg_lit_no == 0)
#define  ClauseIsNegative(clause) ((clause)->pos_lit_no == 0)
#define  ClauseIsMixed(clause)\
         (!(ClauseIsPositive(clause)||ClauseIsNegative(clause)))
#define  ClauseIsConjecture(clause) \
         ((ClauseQueryTPTPType(clause)==CPTypeNegConjecture) ||\
          (ClauseQueryTPTPType(clause)==CPTypeConjecture))

#define  ClauseFindNegPureVarLit(clause) \
         EqnListFindNegPureVarLit((clause)->literals)
#define  ClauseIsTrivial(clause) \
         EqnListIsTrivial(clause->literals)

bool     ClauseHasMaxPosEqLit(Clause_p clause);


Clause_p ClauseSortLiterals(Clause_p clause, ComparisonFunctionType cmp_fun);
Clause_p ClauseCanonize(Clause_p clause);
#define  ClauseSubsumeOrderSortLits(clause) \
         ClauseSortLiterals((clause), \
                            (ComparisonFunctionType)EqnSubsumeInverseRefinedCompareRef)
bool     ClauseIsSorted(Clause_p clause, ComparisonFunctionType cmp_fun);
#define  ClauseIsSubsumeOrdered(clause) \
         ClauseIsSorted((clause), \
         (ComparisonFunctionType)EqnSubsumeInverseCompareRef)

int      ClauseStructWeightCompare(Clause_p c1, Clause_p c2);
int      ClauseStructWeightLexCompare(Clause_p c1, Clause_p c2);
#define  ClauseToStack(clause) EqnListToStack((clause)->literals)

bool     ClauseIsACRedundant(Clause_p clause);

#define  ClauseIsEquational(clause) \
         EqnListIsEquational(clause->literals) 
#define  ClauseIsPureEquational(clause) \
         EqnListIsPureEquational(clause->literals) 

#define  ClauseTermSetProp(clause, prop) \
         EqnListTermSetProp((clause)->literals, (prop))
#define  ClauseTBTermDelPropCount(clause, prop) \
         EqnListTBTermDelPropCount((clause)->literals, (prop))
#define  ClauseTermDelProp(clause, prop) \
         EqnListTermDelProp((clause)->literals, (prop))

#define  ClauseIsSOS(clause) ClauseQueryProp((clause), CPIsSOS)

bool     ClauseIsRangeRestricted(Clause_p clause);
bool     ClauseIsAntiRangeRestricted(Clause_p clause);
bool     ClauseIsTPTPRangeRestricted(Clause_p clause);
bool     ClauseIsStronglyRangeRestricted(Clause_p clause);
EqnSide  ClauseIsEqDefinition(Clause_p clause, int min_arity);

Clause_p ClauseCopy(Clause_p clause, TB_p bank);
Clause_p ClauseCopyOpt(Clause_p clause);
Clause_p ClauseCopyDisjoint(Clause_p clause);

Clause_p ClauseSkolemize(Clause_p clause, TB_p bank);

void     ClausePrintList(FILE* out, Clause_p clause, bool fullterms);
void     ClausePrintAxiom(FILE* out, Clause_p clause, bool fullterms);
void     ClausePrintRule(FILE* out, Clause_p clause, bool fullterms);
void     ClausePrintGoal(FILE* out, Clause_p clause, bool fullterms);
void     ClausePrintQuery(FILE* out, Clause_p clause, bool fullterms);
void     ClausePrintTPTPFormat(FILE* out, Clause_p clause);
void     ClausePrintLOPFormat(FILE* out, Clause_p clause, bool fullterms);

void     ClausePrint(FILE* out, Clause_p clause, bool fullterms); 
void     ClausePCLPrint(FILE* out, Clause_p clause, bool fullterms);
void     ClauseTSTPCorePrint(FILE* out, Clause_p clause, bool fullterms);
void     ClauseTSTPPrint(FILE* out, Clause_p clause, bool fullterms,
			 bool complete);

bool             ClauseStartsMaybe(Scanner_p in);
ClauseProperties ClauseTypeParse(Scanner_p in, char *legal_types);
Clause_p         ClauseParse(Scanner_p in, TB_p bank);
Clause_p         ClausePCLParse(Scanner_p in, TB_p bank);

void     ClauseMarkMaximalTerms(OCB_p ocb, Clause_p clause);
#define  ClauseCondMarkMaximalTerms(ocb, clause)\
         if(!ClauseQueryProp(clause, CPIsOriented))\
         {ClauseMarkMaximalTerms(ocb,clause);}

#define  ClauseOrientLiterals(ocb, clause) \
         EqnListOrient((ocb), (clause)->literals)
#define  ClauseMarkMaximalLiterals(ocb, clause) \
         EqnListMaximalLiterals((ocb), (clause)->literals)

#define  ClauseDeleteTermProperties(clause, props) \
         EqnListDeleteTermProperties((clause)->literals, props)

bool     ClauseParentsAreSubset(Clause_p clause1, Clause_p clause2);
void     ClauseDetachParents(Clause_p clause);
void     ClauseRegisterChild(Clause_p clause, Clause_p child);

void     ClauseAddEvalCell(Clause_p clause, Eval_p evaluation);

void     ClauseRemoveEvaluations(Clause_p clause);

double   ClauseWeight(Clause_p clause, double max_term_multiplier,
		      double max_literal_multiplier, double
		      pos_multiplier, long vweight, long fweight, bool
		      count_eq_encoding);

double ClauseFunWeight(Clause_p clause, double max_term_multiplier,
                       double max_literal_multiplier, double
                       pos_multiplier, long vweight, long flimit,
                       long *fweights, long default_fweight);

double ClauseNonLinearWeight(Clause_p clause, double
			     max_term_multiplier, double
			     max_literal_multiplier, double
			     pos_multiplier, long vlweight, long
			     vweight, long fweight, bool
			     count_eq_encoding);
double ClauseSymTypeWeight(Clause_p clause, double
			   max_term_multiplier, double
			   max_literal_multiplier, double
			   pos_multiplier, long vweight, long
			   fweight, long cweight, long pweight);


double   ClauseStandardWeight(Clause_p clause);

double   ClauseOrientWeight(Clause_p clause, double
			    unorientable_literal_multiplier,
			    double max_literal_multiplier, double
			    pos_multiplier, long vweight, long
			    fweight, bool count_eq_encoding);

#define  ClauseDepth(clause) EqnListDepth((clause)->literals)

bool     ClauseNotGreaterEqual(OCB_p ocb,
			       Clause_p clause1, Clause_p clause2);

int      ClauseCompareFun(const void *c1, const void* c2);

#define  NormSubstClause(clause, subst, vars)\
         NormSubstEqnListExcept((clause)->literals,\
				NULL, (subst), (vars))

Clause_p ClauseNormalizeVars(Clause_p clause, VarBank_p fresh_vars);

#define  ClauseAddSymbolDistribution(clause, dist_array)\
         EqnListAddSymbolDistribution((clause)->literals, (dist_array))
#define  ClauseComputeFunctionRanks(clause, rank_array, count)\
         EqnListComputeFunctionRanks((clause)->literals, (rank_array), (count))
#define  ClauseCollectVariables(clause,tree)\
         EqnListCollectVariables((clause)->literals,(tree))

long     ClauseCollectSubterms(Clause_p clause, PStack_p collector);
long     ClauseReturnFCodes(Clause_p clause, PStack_p f_codes);


#endif

/*---------------------------------------------------------------------*/
/*                        End of File                                  */
/*---------------------------------------------------------------------*/






