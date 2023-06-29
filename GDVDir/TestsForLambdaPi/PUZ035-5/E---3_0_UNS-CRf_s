%------------------------------------------------------------------------------
% File     : E---3.0
% Problem  : PUZ035-5 : TPTP v8.1.2. Released v2.0.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E %s %d THM

% Computer : n021.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Wed May 17 15:58:06 EDT 2023

% Result   : Unsatisfiable 0.20s 0.47s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    3
%            Number of leaves      :    2
% Syntax   : Number of clauses     :    6 (   2 unt;   2 nHn;   4 RR)
%            Number of literals    :   10 (   0 equ;   5 neg)
%            Maximal clause size   :    2 (   1 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    2 (   1 usr;   1 prp; 0-1 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-2 aty)
%            Number of variables   :    7 (   5 sgn)

% Comments : 
%------------------------------------------------------------------------------
cnf(query,negated_conjecture,
    ( ~ truth(isa(asked,X1))
    | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query) ).

cnf(everyone_a_knight_or_knave,axiom,
    ( truth(isa(X1,knight))
    | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave) ).

cnf(c_0_2,negated_conjecture,
    ( ~ truth(isa(asked,X1))
    | ~ truth(isa(other,X2)) ),
    query ).

cnf(c_0_3,axiom,
    ( truth(isa(X1,knight))
    | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave ).

cnf(c_0_4,negated_conjecture,
    ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]) ).

cnf(c_0_5,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_4,c_0_3]),c_0_4]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.07/0.12  % Problem    : PUZ035-5 : TPTP v8.1.2. Released v2.0.0.
% 0.07/0.13  % Command    : run_E %s %d THM
% 0.14/0.34  % Computer : n021.cluster.edu
% 0.14/0.34  % Model    : x86_64 x86_64
% 0.14/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.14/0.34  % Memory   : 8042.1875MB
% 0.14/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.14/0.34  % CPULimit   : 300
% 0.14/0.34  % WCLimit    : 300
% 0.14/0.34  % DateTime   : Wed May  3 16:23:42 EDT 2023
% 0.14/0.34  % CPUTime    : 
% 0.20/0.46  Running first-order on 8 cores theorem proving
% 0.20/0.46  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.47  # Version: 3.0pre008
% 0.20/0.47  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.47  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.47  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.47  # Starting sh5l with 300s (1) cores
% 0.20/0.47  # sh5l with pid 8929 completed with status 0
% 0.20/0.47  # Result found by sh5l
% 0.20/0.47  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.47  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.47  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.47  # Starting sh5l with 300s (1) cores
% 0.20/0.47  # SinE strategy is gf500_gu_R04_F100_L20000
% 0.20/0.47  # Search class: FGHNF-FFSF22-SFFFFFNN
% 0.20/0.47  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.20/0.47  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.20/0.47  # SAT001_MinMin_p005000_rr_RG with pid 8936 completed with status 0
% 0.20/0.47  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.20/0.47  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.47  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.47  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.47  # Starting sh5l with 300s (1) cores
% 0.20/0.47  # SinE strategy is gf500_gu_R04_F100_L20000
% 0.20/0.47  # Search class: FGHNF-FFSF22-SFFFFFNN
% 0.20/0.47  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.20/0.47  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.20/0.47  # Preprocessing time       : 0.001 s
% 0.20/0.47  # Presaturation interreduction done
% 0.20/0.47  
% 0.20/0.47  # Proof found!
% 0.20/0.47  # SZS status Unsatisfiable
% 0.20/0.47  # SZS output start CNFRefutation
% See solution above
% 0.20/0.47  # Parsed axioms                        : 9
% 0.20/0.47  # Removed by relevancy pruning/SinE    : 0
% 0.20/0.47  # Initial clauses                      : 9
% 0.20/0.47  # Removed in clause preprocessing      : 0
% 0.20/0.47  # Initial clauses in saturation        : 9
% 0.20/0.47  # Processed clauses                    : 18
% 0.20/0.47  # ...of these trivial                  : 0
% 0.20/0.47  # ...subsumed                          : 0
% 0.20/0.47  # ...remaining for further processing  : 18
% 0.20/0.47  # Other redundant clauses eliminated   : 0
% 0.20/0.47  # Clauses deleted for lack of memory   : 0
% 0.20/0.47  # Backward-subsumed                    : 1
% 0.20/0.47  # Backward-rewritten                   : 0
% 0.20/0.47  # Generated clauses                    : 6
% 0.20/0.47  # ...of the previous two non-redundant : 2
% 0.20/0.47  # ...aggressively subsumed             : 0
% 0.20/0.47  # Contextual simplify-reflections      : 1
% 0.20/0.47  # Paramodulations                      : 6
% 0.20/0.47  # Factorizations                       : 0
% 0.20/0.47  # NegExts                              : 0
% 0.20/0.47  # Equation resolutions                 : 0
% 0.20/0.47  # Propositional unsat checks           : 0
% 0.20/0.47  #    Propositional check models        : 0
% 0.20/0.47  #    Propositional check unsatisfiable : 0
% 0.20/0.47  #    Propositional clauses             : 0
% 0.20/0.47  #    Propositional clauses after purity: 0
% 0.20/0.47  #    Propositional unsat core size     : 0
% 0.20/0.47  #    Propositional preprocessing time  : 0.000
% 0.20/0.47  #    Propositional encoding time       : 0.000
% 0.20/0.47  #    Propositional solver time         : 0.000
% 0.20/0.47  #    Success case prop preproc time    : 0.000
% 0.20/0.47  #    Success case prop encoding time   : 0.000
% 0.20/0.47  #    Success case prop solver time     : 0.000
% 0.20/0.47  # Current number of processed clauses  : 8
% 0.20/0.47  #    Positive orientable unit clauses  : 1
% 0.20/0.47  #    Positive unorientable unit clauses: 0
% 0.20/0.47  #    Negative unit clauses             : 1
% 0.20/0.47  #    Non-unit-clauses                  : 6
% 0.20/0.47  # Current number of unprocessed clauses: 2
% 0.20/0.47  # ...number of literals in the above   : 5
% 0.20/0.47  # Current number of archived formulas  : 0
% 0.20/0.47  # Current number of archived clauses   : 10
% 0.20/0.47  # Clause-clause subsumption calls (NU) : 7
% 0.20/0.47  # Rec. Clause-clause subsumption calls : 7
% 0.20/0.47  # Non-unit clause-clause subsumptions  : 1
% 0.20/0.47  # Unit Clause-clause subsumption calls : 3
% 0.20/0.47  # Rewrite failures with RHS unbound    : 0
% 0.20/0.47  # BW rewrite match attempts            : 0
% 0.20/0.47  # BW rewrite match successes           : 0
% 0.20/0.47  # Condensation attempts                : 0
% 0.20/0.47  # Condensation successes               : 0
% 0.20/0.47  # Termbank termtop insertions          : 407
% 0.20/0.47  
% 0.20/0.47  # -------------------------------------------------
% 0.20/0.47  # User time                : 0.002 s
% 0.20/0.47  # System time              : 0.001 s
% 0.20/0.47  # Total time               : 0.004 s
% 0.20/0.47  # Maximum resident set size: 1604 pages
% 0.20/0.47  
% 0.20/0.47  # -------------------------------------------------
% 0.20/0.47  # User time                : 0.005 s
% 0.20/0.47  # System time              : 0.002 s
% 0.20/0.47  # Total time               : 0.007 s
% 0.20/0.47  # Maximum resident set size: 1680 pages
%------------------------------------------------------------------------------
