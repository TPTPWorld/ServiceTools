%------------------------------------------------------------------------------
% File     : E---3.0
% Problem  : GEO173+2 : TPTP v8.1.2. Released v3.3.0.
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
% DateTime : Wed May 17 12:19:53 EDT 2023

% Result   : Theorem 0.19s 0.48s
% Output   : CNFRefutation 0.19s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    8
%            Number of leaves      :    5
% Syntax   : Number of formulae    :   27 (  11 unt;   0 def)
%            Number of atoms       :   78 (   0 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   75 (  24   ~;  34   |;  11   &)
%                                         (   0 <=>;   6  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    5 (   4 usr;   1 prp; 0-2 aty)
%            Number of functors    :    5 (   5 usr;   4 con; 0-2 aty)
%            Number of variables   :   48 (   0 sgn;  31   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(con,conjecture,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & convergent_lines(X4,X5)
        & distinct_lines(X4,line_connecting(X1,X2)) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X2,X4) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',con) ).

fof(apart1,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart1) ).

fof(apart4,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( distinct_points(X1,X3)
        | distinct_points(X2,X3) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart4) ).

fof(cu1,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & distinct_lines(X4,X5) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X1,X5)
        | apart_point_and_line(X2,X4)
        | apart_point_and_line(X2,X5) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',cu1) ).

fof(con1,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1) ).

fof(c_0_5,negated_conjecture,
    ~ ! [X1,X2,X4,X5] :
        ( ( distinct_points(X1,X2)
          & convergent_lines(X4,X5)
          & distinct_lines(X4,line_connecting(X1,X2)) )
       => ( apart_point_and_line(X1,X4)
          | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]) ).

fof(c_0_6,plain,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(fof_simplification,[status(thm)],[apart1]) ).

fof(c_0_7,plain,
    ! [X9,X10,X11] :
      ( ~ distinct_points(X9,X10)
      | distinct_points(X9,X11)
      | distinct_points(X10,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[apart4])]) ).

fof(c_0_8,negated_conjecture,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).

fof(c_0_9,plain,
    ! [X24,X25,X26,X27] :
      ( ~ distinct_points(X24,X25)
      | ~ distinct_lines(X26,X27)
      | apart_point_and_line(X24,X26)
      | apart_point_and_line(X24,X27)
      | apart_point_and_line(X25,X26)
      | apart_point_and_line(X25,X27) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[cu1])]) ).

fof(c_0_10,plain,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]) ).

cnf(c_0_11,plain,
    ( distinct_points(X1,X3)
    | distinct_points(X2,X3)
    | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_12,negated_conjecture,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_13,plain,
    ( apart_point_and_line(X1,X3)
    | apart_point_and_line(X1,X4)
    | apart_point_and_line(X2,X3)
    | apart_point_and_line(X2,X4)
    | ~ distinct_points(X1,X2)
    | ~ distinct_lines(X3,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

cnf(c_0_14,negated_conjecture,
    distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0)),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_15,plain,
    ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

cnf(c_0_16,negated_conjecture,
    ( distinct_points(esk1_0,X1)
    | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]) ).

fof(c_0_17,plain,
    ! [X18,X19,X20] :
      ( ( distinct_points(X20,X18)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) )
      & ( distinct_points(X20,X19)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[con1])])]) ).

cnf(c_0_18,negated_conjecture,
    ( apart_point_and_line(X1,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(X2,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(X1,esk3_0)
    | apart_point_and_line(X2,esk3_0)
    | ~ distinct_points(X1,X2) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]) ).

cnf(c_0_19,negated_conjecture,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).

cnf(c_0_20,negated_conjecture,
    ~ apart_point_and_line(esk2_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_21,negated_conjecture,
    ~ apart_point_and_line(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_22,plain,
    ( distinct_points(X1,X2)
    | ~ apart_point_and_line(X1,line_connecting(X2,X3))
    | ~ distinct_points(X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_17]) ).

cnf(c_0_23,negated_conjecture,
    ( apart_point_and_line(esk1_0,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_18,c_0_19]),c_0_20]),c_0_21]) ).

cnf(c_0_24,plain,
    ( distinct_points(X1,X2)
    | ~ apart_point_and_line(X1,line_connecting(X3,X2))
    | ~ distinct_points(X3,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_17]) ).

cnf(c_0_25,negated_conjecture,
    apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)),
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_22,c_0_23]),c_0_12])]),c_0_15]) ).

cnf(c_0_26,negated_conjecture,
    $false,
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_24,c_0_25]),c_0_12])]),c_0_15]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.07/0.12  % Problem    : GEO173+2 : TPTP v8.1.2. Released v3.3.0.
% 0.07/0.13  % Command    : run_E %s %d THM
% 0.13/0.34  % Computer : n021.cluster.edu
% 0.13/0.34  % Model    : x86_64 x86_64
% 0.13/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.34  % Memory   : 8042.1875MB
% 0.13/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.34  % CPULimit   : 300
% 0.13/0.34  % WCLimit    : 300
% 0.13/0.34  % DateTime   : Wed May  3 22:15:28 EDT 2023
% 0.13/0.34  % CPUTime    : 
% 0.19/0.47  Running first-order on 8 cores theorem proving
% 0.19/0.47  Running: /export/starexec/sandbox/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox/benchmark/theBenchmark.p
% 0.19/0.47  # Version: 3.0pre008
% 0.19/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.48  # Starting new_bool_3 with 300s (1) cores
% 0.19/0.48  # Starting new_bool_1 with 300s (1) cores
% 0.19/0.48  # Starting sh5l with 300s (1) cores
% 0.19/0.48  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 26308 completed with status 0
% 0.19/0.48  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.19/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.48  # No SInE strategy applied
% 0.19/0.48  # Search class: FGUNF-FFSS22-SFFFFFNN
% 0.19/0.48  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.19/0.48  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 151s (1) cores
% 0.19/0.48  # Starting new_bool_3 with 136s (1) cores
% 0.19/0.48  # Starting new_bool_1 with 136s (1) cores
% 0.19/0.48  # Starting sh5l with 136s (1) cores
% 0.19/0.48  # G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with pid 26313 completed with status 0
% 0.19/0.48  # Result found by G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN
% 0.19/0.48  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.19/0.48  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.19/0.48  # No SInE strategy applied
% 0.19/0.48  # Search class: FGUNF-FFSS22-SFFFFFNN
% 0.19/0.48  # Scheduled 6 strats onto 5 cores with 1500 seconds (1500 total)
% 0.19/0.48  # Starting SAT001_MinMin_p005000_rr_RG with 811s (1) cores
% 0.19/0.48  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 151s (1) cores
% 0.19/0.48  # Preprocessing time       : 0.001 s
% 0.19/0.48  # Presaturation interreduction done
% 0.19/0.48  
% 0.19/0.48  # Proof found!
% 0.19/0.48  # SZS status Theorem
% 0.19/0.48  # SZS output start CNFRefutation
% See solution above
% 0.19/0.48  # Parsed axioms                        : 13
% 0.19/0.48  # Removed by relevancy pruning/SinE    : 0
% 0.19/0.48  # Initial clauses                      : 19
% 0.19/0.48  # Removed in clause preprocessing      : 0
% 0.19/0.48  # Initial clauses in saturation        : 19
% 0.19/0.48  # Processed clauses                    : 74
% 0.19/0.48  # ...of these trivial                  : 0
% 0.19/0.48  # ...subsumed                          : 10
% 0.19/0.48  # ...remaining for further processing  : 64
% 0.19/0.48  # Other redundant clauses eliminated   : 0
% 0.19/0.48  # Clauses deleted for lack of memory   : 0
% 0.19/0.48  # Backward-subsumed                    : 0
% 0.19/0.48  # Backward-rewritten                   : 1
% 0.19/0.48  # Generated clauses                    : 114
% 0.19/0.48  # ...of the previous two non-redundant : 92
% 0.19/0.48  # ...aggressively subsumed             : 0
% 0.19/0.48  # Contextual simplify-reflections      : 0
% 0.19/0.48  # Paramodulations                      : 104
% 0.19/0.48  # Factorizations                       : 10
% 0.19/0.48  # NegExts                              : 0
% 0.19/0.48  # Equation resolutions                 : 0
% 0.19/0.48  # Propositional unsat checks           : 0
% 0.19/0.48  #    Propositional check models        : 0
% 0.19/0.48  #    Propositional check unsatisfiable : 0
% 0.19/0.48  #    Propositional clauses             : 0
% 0.19/0.48  #    Propositional clauses after purity: 0
% 0.19/0.48  #    Propositional unsat core size     : 0
% 0.19/0.48  #    Propositional preprocessing time  : 0.000
% 0.19/0.48  #    Propositional encoding time       : 0.000
% 0.19/0.48  #    Propositional solver time         : 0.000
% 0.19/0.48  #    Success case prop preproc time    : 0.000
% 0.19/0.48  #    Success case prop encoding time   : 0.000
% 0.19/0.48  #    Success case prop solver time     : 0.000
% 0.19/0.48  # Current number of processed clauses  : 44
% 0.19/0.48  #    Positive orientable unit clauses  : 6
% 0.19/0.48  #    Positive unorientable unit clauses: 0
% 0.19/0.48  #    Negative unit clauses             : 5
% 0.19/0.48  #    Non-unit-clauses                  : 33
% 0.19/0.48  # Current number of unprocessed clauses: 52
% 0.19/0.48  # ...number of literals in the above   : 243
% 0.19/0.48  # Current number of archived formulas  : 0
% 0.19/0.48  # Current number of archived clauses   : 20
% 0.19/0.48  # Clause-clause subsumption calls (NU) : 131
% 0.19/0.48  # Rec. Clause-clause subsumption calls : 92
% 0.19/0.48  # Non-unit clause-clause subsumptions  : 9
% 0.19/0.48  # Unit Clause-clause subsumption calls : 7
% 0.19/0.48  # Rewrite failures with RHS unbound    : 0
% 0.19/0.48  # BW rewrite match attempts            : 1
% 0.19/0.48  # BW rewrite match successes           : 1
% 0.19/0.48  # Condensation attempts                : 0
% 0.19/0.48  # Condensation successes               : 0
% 0.19/0.48  # Termbank termtop insertions          : 2622
% 0.19/0.48  
% 0.19/0.48  # -------------------------------------------------
% 0.19/0.48  # User time                : 0.009 s
% 0.19/0.48  # System time              : 0.001 s
% 0.19/0.48  # Total time               : 0.010 s
% 0.19/0.48  # Maximum resident set size: 1744 pages
% 0.19/0.48  
% 0.19/0.48  # -------------------------------------------------
% 0.19/0.48  # User time                : 0.034 s
% 0.19/0.48  # System time              : 0.005 s
% 0.19/0.48  # Total time               : 0.039 s
% 0.19/0.48  # Maximum resident set size: 1704 pages
%------------------------------------------------------------------------------
