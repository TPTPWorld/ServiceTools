%------------------------------------------------------------------------------
% File       : EP---0.82
% Problem    : SplitProblem : TPTP v0.0.0
% Transform  : none
% Format     : tptp
% Command    : eproof --print-statistics -xAuto -tAuto --memory-limit=Auto --tstp-in --tstp-out %s

% Computer   : wombat.cs.miami.edu
% Model      : i686 i686
% CPU        : Intel(R) Pentium(R) 4 CPU 2.80GHz @ 2793MHz
% Memory     : 1005MB
% OS         : Linux 2.4.20-6
% CPULimit   : 30s

% Result     : Unsatisfiable 0.1s
% Output     : Refutation 0.1s
% Statistics : Number of clauses     :   18 (  23 expanded)
%              Depth                 :    8
%              Number of atoms       :   30 (  39 expanded)
%              Maximal clause size   :    2 (   2 average)
%              Maximal term depth    :    1 (   1 average)
% Verified   : 

% Comments   : 
%------------------------------------------------------------------------------
%----TSTP SOLUTION
cnf(1,axiom,
    ( p(X1)
    | ~ q(X2) ),
    file('/tmp/SystemOnTPTP28503//SplitProblem.p',a1)).

cnf(2,axiom,
    ( p(X1)
    | q(X2) ),
    file('/tmp/SystemOnTPTP28503//SplitProblem.p',a2)).

cnf(3,axiom,
    ( ~ p(X1)
    | ~ q(X2) ),
    file('/tmp/SystemOnTPTP28503//SplitProblem.p',a3)).

cnf(4,negated_conjecture,
    ( q(X2)
    | ~ p(X1) ),
    file('/tmp/SystemOnTPTP28503//SplitProblem.p',a4)).

cnf(5,derived,
    ( epred1_0
    | ~ p(X1) ),
    inference(split,[split(esplit,[])],[3])).

cnf(6,derived,
    ( epred2_0
    | ~ q(X2) ),
    inference(split,[split(esplit,[])],[3])).

cnf(7,derived,
    ( ~ epred2_0
    | ~ epred1_0 ),
    inference(split,[split(esplit,[])],[3])).

cnf(8,derived,
    ( q(X2) ),
    inference(csr,[status(thm)],[2,4])).

cnf(10,derived,
    ( p(X1)
    | $false ),
    inference(rw,[status(thm)],[1,8,theory(equality)])).

cnf(11,derived,
    ( p(X1) ),
    inference(cn,[status(thm)],[10,theory(equality)])).

cnf(12,derived,
    ( epred2_0
    | $false ),
    inference(rw,[status(thm)],[6,8,theory(equality)])).

cnf(13,derived,
    ( epred2_0 ),
    inference(cn,[status(thm)],[12,theory(equality)])).

cnf(14,derived,
    ( epred1_0
    | $false ),
    inference(rw,[status(thm)],[5,11,theory(equality)])).

cnf(15,derived,
    ( epred1_0 ),
    inference(cn,[status(thm)],[14,theory(equality)])).

cnf(16,derived,
    ( $false
    | ~ epred1_0 ),
    inference(rw,[status(thm)],[7,13,theory(equality)])).

cnf(17,derived,
    ( $false
    | $false ),
    inference(rw,[status(thm)],[16,15,theory(equality)])).

cnf(18,derived,
    ( $false ),
    inference(cn,[status(thm)],[17,theory(equality)])).

cnf(19,derived,
    ( $false ),
    18,
    ['proof']).
%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% # Problem is unsatisfiable, constructing proof object
% # TSTP exit status: Unsatisfiable
% # Proof object starts here.
% cnf(1,axiom,(p(X1)|~q(X2)),file('/tmp/SystemOnTPTP28503//SplitProblem.p', a1)).
% cnf(2,axiom,(p(X1)|q(X2)),file('/tmp/SystemOnTPTP28503//SplitProblem.p', a2)).
% cnf(3,axiom,(~p(X1)|~q(X2)),file('/tmp/SystemOnTPTP28503//SplitProblem.p', a3)).
% cnf(4,negated_conjecture,(q(X2)|~p(X1)),file('/tmp/SystemOnTPTP28503//SplitProblem.p', a4)).
% cnf(5,derived,(epred1_0|~p(X1)),inference(split,[split(esplit,[])],[3])).
% cnf(6,derived,(epred2_0|~q(X2)),inference(split,[split(esplit,[])],[3])).
% cnf(7,derived,(~epred2_0|~epred1_0),inference(split,[split(esplit,[])],[3])).
% cnf(8,derived,(q(X2)),inference(csr,[status(thm)],[2,4])).
% cnf(10,derived,(p(X1)|$false),inference(rw,[status(thm)],[1,8,theory(equality)])).
% cnf(11,derived,(p(X1)),inference(cn,[status(thm)],[10,theory(equality)])).
% cnf(12,derived,(epred2_0|$false),inference(rw,[status(thm)],[6,8,theory(equality)])).
% cnf(13,derived,(epred2_0),inference(cn,[status(thm)],[12,theory(equality)])).
% cnf(14,derived,(epred1_0|$false),inference(rw,[status(thm)],[5,11,theory(equality)])).
% cnf(15,derived,(epred1_0),inference(cn,[status(thm)],[14,theory(equality)])).
% cnf(16,derived,($false|~epred1_0),inference(rw,[status(thm)],[7,13,theory(equality)])).
% cnf(17,derived,($false|$false),inference(rw,[status(thm)],[16,15,theory(equality)])).
% cnf(18,derived,($false),inference(cn,[status(thm)],[17,theory(equality)])).
% cnf(19,derived,($false),18,['proof']).
% # Proof object ends here.
% # ...subsumed                          : 0
% # ...remaining for further processing  : 9
% # Other redundant clauses eleminated   : 0
% # Clauses deleted for lack of memory   : 0
% # Backward-subsumed                    : 0
% # Backward-rewritten                   : 3
% # Contextual simplify-reflections      : 1
% # Generated clauses                    : 3
% # ...of the previous two non-trivial   : 5
% # Paramodulations                      : 0
% # Factorizations                       : 0
% # Equation resolutions                 : 0
% # Current number of processed clauses  : 4
% #    Positive orientable unit clauses  : 4
% #    Positive unorientable unit clauses: 0
% #    Negative unit clauses             : 0
% #    Non-unit-clauses                  : 0
% # Current number of unprocessed clauses: 0
% # ...number of literals in the above   : 0
% # Clause-clause subsumption calls (NU) : 1
% # Rec. Clause-clause subsumption calls : 1
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
