%------------------------------------------------------------------------------
% File       : EP---0.82
% Problem    : SimpleProblem : TPTP v0.0.0
% Transform  : none
% Format     : tptp
% Command    : eproof --print-statistics -xAuto -tAuto --memory-limit=Auto --tstp-in --tstp-out %s

% Computer   : wombat.cs.miami.edu
% Model      : i686 i686
% CPU        : Intel(R) Pentium(R) 4 CPU 2.80GHz @ 2793MHz
% Memory     : 1005MB
% OS         : Linux 2.4.20-6
% CPULimit   : 30s

% Result     : Theorem 0.1s
% Output     : Refutation 0.1s
% Statistics : Number of formulae    :   14 (  14 expanded)
%              Number of clauses     :    6 (   6 expanded)
%              Depth                 :    7
%              Number of atoms       :   18 (  18 expanded)
%              Maximal formula depth :    4 (   2 average)
%              Maximal clause size   :    2 (   3 average)
%              Maximal term depth    :    1 (   1 average)
% Verified   : 

% Comments   : 
%------------------------------------------------------------------------------
%----TSTP SOLUTION
fof(1,axiom,
    ( p(a) ),
    file('TestFiles/SimpleProblem.p',a1)).

fof(2,axiom,
    ( ! [X1] : 
        ( p(X1)
       => q(X1) ) ),
    file('TestFiles/SimpleProblem.p',mp)).

fof(3,conjecture,
    ( ? [X1] : q(X1) ),
    file('TestFiles/SimpleProblem.p',query)).

fof(4,negated_conjecture-derived,
    ( ~ ( ? [X1] : q(X1) ) ),
    inference(assume_negation,[status(cth)],[3])).

cnf(5,derived,
    ( p(a) ),
    inference(split_conjunct,[status(thm)],[1])).

fof(6,derived,
    ( ! [X1] : 
        ( ~ p(X1)
        | q(X1) ) ),
    inference(fof_nnf,[status(thm)],[2])).

fof(7,derived,
    ( ! [X2] : 
        ( ~ p(X2)
        | q(X2) ) ),
    inference(variable_rename,[status(thm)],[6])).

cnf(8,derived,
    ( q(X2)
    | ~ p(X2) ),
    inference(split_conjunct,[status(thm)],[7])).

fof(9,negated_conjecture-derived,
    ( ! [X1] : ~ q(X1) ),
    inference(fof_nnf,[status(thm)],[4])).

fof(10,negated_conjecture-derived,
    ( ! [X2] : ~ q(X2) ),
    inference(variable_rename,[status(thm)],[9])).

cnf(11,negated_conjecture-derived,
    ( ~ q(X2) ),
    inference(split_conjunct,[status(thm)],[10])).

cnf(12,derived,
    ( ~ p(X2) ),
    inference(sr,[status(thm)],[8,11,theory(equality)])).

cnf(13,derived,
    ( $false ),
    inference(sr,[status(thm)],[5,12,theory(equality)])).

cnf(14,derived,
    ( $false ),
    13,
    ['proof']).
%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% TreeLimitedRun: ----------------------------------------------------------
% TreeLimitedRun: /home/graph/tptp/Systems/EP---0.82/eproof --print-statistics -xAuto -tAuto --memory-limit=Auto --tstp-in --tstp-out /tmp/SystemOnTPTP23310//SimpleProblem.p 
% TreeLimitedRun: CPU time limit is 30s
% TreeLimitedRun: WC  time limit is 300s
% TreeLimitedRun: PID is 23350
% TimeLimitedRun: ----------------------------------------------------------
% # Problem is unsatisfiable, constructing proof object
% # TSTP exit status: Theorem
% # Proof object starts here.
% fof(1, axiom,p(a),file('/tmp/SystemOnTPTP23310//SimpleProblem.p', a1)).
% fof(2, axiom,![X1]:(p(X1)=>q(X1)),file('/tmp/SystemOnTPTP23310//SimpleProblem.p', mp)).
% fof(3, conjecture,?[X1]:q(X1),file('/tmp/SystemOnTPTP23310//SimpleProblem.p', query)).
% fof(4, negated_conjecture-derived,~(?[X1]:q(X1)),inference(assume_negation,[status(cth)],[3])).
% cnf(5,derived,(p(a)),inference(split_conjunct,[status(thm)],[1])).
% fof(6, derived,![X1]:(~(p(X1))|q(X1)),inference(fof_nnf,[status(thm)],[2])).
% fof(7, derived,![X2]:(~(p(X2))|q(X2)),inference(variable_rename,[status(thm)],[6])).
% cnf(8,derived,(q(X2)|~p(X2)),inference(split_conjunct,[status(thm)],[7])).
% fof(9, negated_conjecture-derived,![X1]:~(q(X1)),inference(fof_nnf,[status(thm)],[4])).
% fof(10, negated_conjecture-derived,![X2]:~(q(X2)),inference(variable_rename,[status(thm)],[9])).
% cnf(11,negated_conjecture-derived,(~q(X2)),inference(split_conjunct,[status(thm)],[10])).
% cnf(12,derived,(~p(X2)),inference(sr,[status(thm)],[8,11,theory(equality)])).
% cnf(13,derived,($false),inference(sr,[status(thm)],[5,12,theory(equality)])).
% cnf(14,derived,($false),13,['proof']).
% # Proof object ends here.
% # ...subsumed                          : 0
% # ...remaining for further processing  : 3
% # Other redundant clauses eleminated   : 0
% # Clauses deleted for lack of memory   : 0
% # Backward-subsumed                    : 0
% # Backward-rewritten                   : 0
% # Contextual simplify-reflections      : 0
% # Generated clauses                    : 1
% # ...of the previous two non-trivial   : 0
% # Paramodulations                      : 0
% # Factorizations                       : 0
% # Equation resolutions                 : 0
% # Current number of processed clauses  : 2
% #    Positive orientable unit clauses  : 0
% #    Positive unorientable unit clauses: 0
% #    Negative unit clauses             : 2
% #    Non-unit-clauses                  : 0
% # Current number of unprocessed clauses: 0
% # ...number of literals in the above   : 0
% # Clause-clause subsumption calls (NU) : 0
% # Rec. Clause-clause subsumption calls : 0
% # Unit Clause-clause subsumption calls : 0
% # Rewrite failures with RHS unbound    : 0
% 
% # -------------------------------------------------
% # User time                : 0.010 s
% # System time              : 0.000 s
% # Total time               : 0.010 s
% # Maximum resident set size: 0 pages
% 
%------------------------------------------------------------------------------
