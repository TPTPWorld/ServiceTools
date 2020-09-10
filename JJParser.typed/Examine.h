#ifndef EXAMINE_H
#define EXAMINE_H
//-----------------------------------------------------------------------------
#include "DataTypes.h"
#include "SystemOnTPTP.h"
#include "Utilities.h"
#include "Statistics.h"
//-----------------------------------------------------------------------------
int CheckAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula,
SyntaxType ExpectedSyntax);
int LogicalAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula);
int TPIAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula);
int ReallyAnAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula);
int CopiedAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula);
int InferredAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula);
int DerivedAnnotatedFormula(ANNOTATEDFORMULA AnnotatedFormula);
char * GetSymbol(TERM Term);
int GetArity(TERM Term);
int LooksLikeANumber(char * NumberString) {
int LooksLikeAList(TERM Term,int MinElements,int MaxElements);
int CheckRole(StatusType Role,StatusType DesiredRole);
int CheckAnnotatedFormulaRole(ANNOTATEDFORMULA AnnotatedFormula,
StatusType DesiredRole);

int ExtractTermArguments(String Term);
char * TSTPTermToString(TERM Term,String PutTermHere);

int CountVariableUsageInFormula(FORMULA Formula,VARIABLENODE Variable,
int * QuantifiedOccurences);
void NormalizeSymbolUsage(char * SymbolUsage);
char * GetLiteralSymbolUsage(FORMULA Literal,char ** PutUsageHere,
char ** VariablesStartHere);
void CollectSymbolsInFormula(FORMULA Formula,char ** PredicateCollector,
int * PredicateCollectorLength,char ** FunctorCollector,
int * FunctorCollectorLength,char ** VariableCollector,
int * VariableCollectorLength);
char * GetAnnotatedFormulaSymbolUsage(ANNOTATEDFORMULA AnnotatedTSTPFormula,
char ** PutUsageHere,char ** FunctorUsageStartsHere);
char * GetListOfAnnotatedFormulaSymbolUsage(LISTNODE ListNode,
char ** PutUsageHere,char ** FunctorUsageStartsHere);

int GetSymbolUses(SIGNATURE Signature,TermType Type,char * Name,int Arity);
int CountLiteralsOfPolarity(ANNOTATEDFORMULA AnnotatedFormula,int * Positive,
int * Negative);
int RangeRestrictedClause(ANNOTATEDFORMULA AnnotatedFormula);
int HornClause(ANNOTATEDFORMULA AnnotatedFormula);
int NonHornClause(ANNOTATEDFORMULA AnnotatedFormula);
int CountAnnotatedFormulaUniqueVariablesByUse(ANNOTATEDFORMULA 
AnnotatedFormula,int MinUse,int MaxUse,ConnectiveType Quantification);
int CountFormulaTerms(FORMULA Formula);
int CountAnnotatedFormulaSingletons(ANNOTATEDFORMULA AnnotatedFormula);
int CountAnnotatedFormulaUniqueVariables(ANNOTATEDFORMULA AnnotatedFormula);
int CountAnnotatedFormulaTerms(ANNOTATEDFORMULA AnnotatedFormula);
int CountFormulaAtomsByPredicate(FORMULA Formula,char * Predicate);
int CountAnnotatedFormulaAtomsByPredicate(ANNOTATEDFORMULA AnnotatedFormula,
char * Predicate);
ConnectiveStatisticsType GetFormulaConnectiveUsage(FORMULA Formula);
int FormulaDepth(FORMULA Formula);
int MaxFormulaTermDepth(FORMULA Formula);
int AnnotatedFormulaDepth(ANNOTATEDFORMULA AnnotatedFormula);
int MaxAnnotatedFormulaTermDepth(ANNOTATEDFORMULA AnnotatedFormula);
int SumFormulaTermDepth(FORMULA Formula);
int SumAnnotatedFormulaTermDepth(ANNOTATEDFORMULA AnnotatedFormula);

SyntaxType GetSyntax(ANNOTATEDFORMULA AnnotatedFormula);
SyntaxType GetListSyntax(LISTNODE Head);
void GetListSyntaxTypes(LISTNODE Head,String SyntaxTypes);
char * GetName(ANNOTATEDFORMULA AnnotatedFormula,String PutNameHere);
StatusType GetRole(ANNOTATEDFORMULA AnnotatedFormula,StatusType * SubStatus);
FORMULA GetUniversalCoreFormula(FORMULA QuantifiedFormula);
int ThereIsAConjecture(LISTNODE Head);
FORMULA GetLiteralFromAnnotatedClauseByNumber(ANNOTATEDFORMULA Clause,
int Number);

TERM GetSourceTERM(ANNOTATEDFORMULA AnnotatedFormula,char * SourceSymbol);
char * GetSource(ANNOTATEDFORMULA AnnotatedFormula);
char * GetSourceTerm(ANNOTATEDFORMULA AnnotatedFormula,char * PutInfoHere);
TERM GetInferenceRuleTERM(ANNOTATEDFORMULA AnnotatedFormula);
char * GetInferenceRule(ANNOTATEDFORMULA AnnotatedFormula,char * PutNameHere);
TERMArray GetInferenceInfoTERMs(ANNOTATEDFORMULA AnnotatedFormula,
char * Symbol,int * NumberOfTerms);
TERM GetSourceInfoTERM(ANNOTATEDFORMULA AnnotatedFormula,char * SourceSymbol,
char * InfoTermSymbol);
char * GetSourceInfoTerm(ANNOTATEDFORMULA AnnotatedFormula,char * SourceSymbol,
char * InfoTermSymbol,char * PutInfoHere);
TERM GetInferenceInfoTERM(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol);
char * GetInferenceInfoTerm(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol,
char * PutInfoHere);
SZSResultArray GetInferenceSZSStatuses(ANNOTATEDFORMULA AnnotatedFormula,
SZSResultArray ArrayOfSZSStatuses,int * NumberOfSZSResults);
char * GetInferenceStatus(ANNOTATEDFORMULA AnnotatedFormula,char * SZSStatus);
char * GetDischargedNames(ANNOTATEDFORMULA AnnotatedFormula,
TERM * DischargeList);
char * ExtractAssumptionsList(TERM AssumptionsTerm);
char * GetParentNames(ANNOTATEDFORMULA AnnotatedFormula,char * PutNamesHere);
char * GetNodeParentNames(ANNOTATEDFORMULA AnnotatedFormula,
char * PutNamesHere);
int GetNodeParentList(ANNOTATEDFORMULA AnnotatedFormula,LISTNODE Head,
LISTNODE * Parents);
char * GetFileSourceNameAndNode(ANNOTATEDFORMULA AnnotatedFormula,
char * PutUsageHere);

TERM GetUsefulInfoTERM(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol,
int OccurenceNumber);
char * GetUsefulInfoTerm(ANNOTATEDFORMULA AnnotatedFormula,char * Symbol,
int OccurenceNumber,char * PutInfoHere);
//-----------------------------------------------------------------------------
#endif
