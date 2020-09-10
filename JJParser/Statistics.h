#ifndef STATISTICS_H
#define STATISTICS_H
//-----------------------------------------------------------------------------
#include "DataTypes.h"

typedef enum {
    nodes,
    thf_nodes,
    tff_nodes,
    fof_nodes,
    cnf_nodes,
    leaves,
//----For CNF problems
    count_horn_clauses,
    count_rr_clauses,

//----General
    unit_formulae,
    type_formulae,
    defn_formulae,
    sequent_formulae,
    atoms,
    equality_atoms,
    variable_atoms,
    literal_count,
    terms,
    count_variables,
    count_singletons,
    // count_math_variables,
    count_formula_depth,
    count_term_depth,
    count_nothing
} CountType;

typedef enum {
    depth,
    literals,
    term_depth,
    formula_depth,
    maximize_nothing
} MaximizeType;

typedef struct {
    double NumberOfFormulae;
    double NumberOfTHF;
    double NumberOfTFF;
    double NumberOfFOF;
    double NumberOfCNF;

    double NumberOfTypeFormulae;
    double NumberOfDefnFormulae;
    double NumberOfSequents;
    double NumberOfUnitFormulae;  //----Doubles as NumberOfUnitClauses;
    double NumberOfAtoms;  //----Doubles as NumberOfLiterals;
    double NumberOfEqualityAtoms;  //----Doubles as NumberOfEqualityLiterals
    double NumberOfVariableAtoms;
    double NumberOfLiterals;

    double MaxFormulaDepth;
    double AverageFormulaDepth;
    double MaxTermDepth;
    double AverageTermDepth;

//----Only for CNF
    double NumberOfHornClauses;
    double NumberOfRRClauses;
    double MaxClauseSize;
    double AverageClauseSize;
} FormulaStatisticsType;

typedef struct {
    double NumberOfPredicates;  //----Doubles as number of symbols
    double NumberOfPropositions; 
    double MinPredicateArity;
    double MaxPredicateArity;
    double NumberOfFunctors;
    double NumberOfConstants;
    double MinFunctorArity;
    double MaxFunctorArity;
    double NumberOfVariables;
    double NumberOfSingletons;
    double NumberOfMathPredicates;
    double NumberOfMathFunctions;
    double NumberOfNumbers;
} SymbolStatisticsType;

typedef struct {
    double NumberOfConnectives;
    double NumberOfTypeConnectives;

//----Only THF connectives
    double NumberOfPis;
    double NumberOfSigmas;
    double NumberOfChoices;
    double NumberOfDescriptions;
    double NumberOfApplications;
    double NumberOfMaparrows;
    double NumberOfXprods;
    double NumberOfUnions;
    double NumberOfEquations;  //----Use of = as a term
    double NumberOfTypedEquations;  //----Use of @= as a term

//----Only TFF
    double NumberOfSubtypes;

//----Not for CNF
    double NumberOfNegations;
    double NumberOfDisjunctions;
    double NumberOfConjunctions;
    double NumberOfEquivalences;
    double NumberOfImplications;
    double NumberOfReverseImplications;
    double NumberOfXors;
    double NumberOfNors;
    double NumberOfNands;

//----Variable binders
    double NumberOfUniversals;
    double NumberOfExistentials;
    double NumberOfLambdas;
    double NumberOfPiBinders;
    double NumberOfSigmaBinders;
    double NumberOfChoiceBinders;
    double NumberOfDescriptionBinders;

    double NumberOfTypedVariables;  //----Not a symbol, but counted by :s
    double NumberOfDefinedVariables; //----Not a symbol, but counted by :=s
    double NumberOfMathVariables;  //----Not a symbol, but counted by :s
    double NumberOfGlobalTypeDecs; //----Not a symbol, but counted by :s
    double NumberOfGlobalDefns; //----Not a symbol, but counted by :=s
} ConnectiveStatisticsType;

typedef struct {
    FormulaStatisticsType FormulaStatistics;
    SymbolStatisticsType SymbolStatistics;
    ConnectiveStatisticsType ConnectiveStatistics;
} StatisticsType;
//-----------------------------------------------------------------------------
void InitializeStatistics(StatisticsType * Statistics);
void InitializeFormulaStatistics(FormulaStatisticsType * FormulaStatistics);
void InitializeSymbolStatistics(SymbolStatisticsType * SymbolStatistics);
void InitializeConnectiveStatistics(ConnectiveStatisticsType * 
ConnectiveStatistics);
void AddOnConnectiveStatistics(ConnectiveStatisticsType * ConnectiveStatistics,
ConnectiveStatisticsType MoreConnectiveStatistics);
//-----------------------------------------------------------------------------
#endif
