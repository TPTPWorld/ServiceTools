%------------------------------------------------------------------------------
% File     : E---3.0
% Problem  : MGT049+1 : TPTP v8.1.2. Released v2.4.0.
% Transfm  : none
% Format   : tptp:raw
% Command  : run_E %s %d THM

% Computer : n006.cluster.edu
% Model    : x86_64 x86_64
% CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 2.10GHz
% Memory   : 8042.1875MB
% OS       : Linux 3.10.0-693.el7.x86_64
% CPULimit : 300s
% WCLimit  : 300s
% DateTime : Wed May 17 13:48:26 EDT 2023

% Result   : Theorem 0.20s 0.47s
% Output   : CNFRefutation 0.20s
% Verified : 
% SZS Type : Refutation
%            Derivation depth      :    5
%            Number of leaves      :    3
% Syntax   : Number of formulae    :   14 (   4 unt;   0 def)
%            Number of atoms       :   35 (  15 equ)
%            Maximal formula atoms :    6 (   2 avg)
%            Number of connectives :   33 (  12   ~;   9   |;   6   &)
%                                         (   0 <=>;   6  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   2 usr;   1 prp; 0-2 aty)
%            Number of functors    :    6 (   6 usr;   3 con; 0-2 aty)
%            Number of variables   :   29 (   6 sgn;  18   !;   0   ?)

% Comments : 
%------------------------------------------------------------------------------
fof(assumption_6,axiom,
    ! [X1,X4,X5] :
      ( organization(X1)
     => ( ( greater(external_ties(X1,X5),external_ties(X1,X4))
         => greater(position(X1,X5),position(X1,X4)) )
        & ( external_ties(X1,X5) = external_ties(X1,X4)
         => position(X1,X5) = position(X1,X4) ) ) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_6) ).

fof(assumption_11,axiom,
    ! [X1,X4,X5] :
      ( organization(X1)
     => external_ties(X1,X5) = external_ties(X1,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',assumption_11) ).

fof(lemma_6,conjecture,
    ! [X1,X4,X5] :
      ( ( organization(X1)
        & greater(age(X1,X5),age(X1,X4)) )
     => position(X1,X5) = position(X1,X4) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',lemma_6) ).

fof(c_0_3,plain,
    ! [X9,X10,X11] :
      ( ( ~ greater(external_ties(X9,X11),external_ties(X9,X10))
        | greater(position(X9,X11),position(X9,X10))
        | ~ organization(X9) )
      & ( external_ties(X9,X11) != external_ties(X9,X10)
        | position(X9,X11) = position(X9,X10)
        | ~ organization(X9) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[assumption_6])])]) ).

fof(c_0_4,plain,
    ! [X17,X18,X19] :
      ( ~ organization(X17)
      | external_ties(X17,X19) = external_ties(X17,X18) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[assumption_11])]) ).

fof(c_0_5,negated_conjecture,
    ~ ! [X1,X4,X5] :
        ( ( organization(X1)
          & greater(age(X1,X5),age(X1,X4)) )
       => position(X1,X5) = position(X1,X4) ),
    inference(assume_negation,[status(cth)],[lemma_6]) ).

cnf(c_0_6,plain,
    ( position(X1,X2) = position(X1,X3)
    | external_ties(X1,X2) != external_ties(X1,X3)
    | ~ organization(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_3]) ).

cnf(c_0_7,plain,
    ( external_ties(X1,X2) = external_ties(X1,X3)
    | ~ organization(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_4]) ).

fof(c_0_8,negated_conjecture,
    ( organization(esk1_0)
    & greater(age(esk1_0,esk3_0),age(esk1_0,esk2_0))
    & position(esk1_0,esk3_0) != position(esk1_0,esk2_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).

cnf(c_0_9,plain,
    ( position(X1,X2) = position(X1,X3)
    | ~ organization(X1) ),
    inference(csr,[status(thm)],[c_0_6,c_0_7]) ).

cnf(c_0_10,negated_conjecture,
    organization(esk1_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_11,negated_conjecture,
    position(esk1_0,esk3_0) != position(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

cnf(c_0_12,negated_conjecture,
    position(esk1_0,X1) = position(esk1_0,X2),
    inference(spm,[status(thm)],[c_0_9,c_0_10]) ).

cnf(c_0_13,negated_conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[c_0_11,c_0_12]),c_0_12])]),
    [proof] ).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% 0.03/0.11  % Problem    : MGT049+1 : TPTP v8.1.2. Released v2.4.0.
% 0.03/0.13  % Command    : run_E %s %d THM
% 0.13/0.34  % Computer : n006.cluster.edu
% 0.13/0.34  % Model    : x86_64 x86_64
% 0.13/0.34  % CPU      : Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz
% 0.13/0.34  % Memory   : 8042.1875MB
% 0.13/0.34  % OS       : Linux 3.10.0-693.el7.x86_64
% 0.13/0.34  % CPULimit   : 300
% 0.13/0.34  % WCLimit    : 300
% 0.13/0.34  % DateTime   : Wed May  3 18:54:10 EDT 2023
% 0.13/0.34  % CPUTime    : 
% 0.20/0.46  Running first-order on 8 cores theorem proving
% 0.20/0.46  Running: /export/starexec/sandbox2/solver/bin/eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --proof-object --auto-schedule=8 --cpu-limit=300 /export/starexec/sandbox2/benchmark/theBenchmark.p
% 0.20/0.46  # Version: 3.0pre008
% 0.20/0.47  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.47  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.47  # Starting new_bool_1 with 300s (1) cores
% 0.20/0.47  # Starting sh5l with 300s (1) cores
% 0.20/0.47  # new_bool_3 with pid 20577 completed with status 0
% 0.20/0.47  # Result found by new_bool_3
% 0.20/0.47  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.47  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.47  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.47  # Search class: FHHSF-FFSF22-SFFFFFNN
% 0.20/0.47  # partial match(1): FGHSF-FFSF22-SFFFFFNN
% 0.20/0.47  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.20/0.47  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.20/0.47  # SAT001_MinMin_p005000_rr_RG with pid 20581 completed with status 0
% 0.20/0.47  # Result found by SAT001_MinMin_p005000_rr_RG
% 0.20/0.47  # Preprocessing class: FSMSSMSSSSSNFFN.
% 0.20/0.47  # Scheduled 4 strats onto 8 cores with 300 seconds (2400 total)
% 0.20/0.47  # Starting G-E--_208_C18_F1_SE_CS_SOS_SP_PS_S5PRR_RG_S04AN with 1500s (5) cores
% 0.20/0.47  # Starting new_bool_3 with 300s (1) cores
% 0.20/0.47  # SinE strategy is GSinE(CountFormulas,hypos,1.5,,3,20000,1.0)
% 0.20/0.47  # Search class: FHHSF-FFSF22-SFFFFFNN
% 0.20/0.47  # partial match(1): FGHSF-FFSF22-SFFFFFNN
% 0.20/0.47  # Scheduled 5 strats onto 1 cores with 300 seconds (300 total)
% 0.20/0.47  # Starting SAT001_MinMin_p005000_rr_RG with 181s (1) cores
% 0.20/0.47  # Preprocessing time       : 0.001 s
% 0.20/0.47  # Presaturation interreduction done
% 0.20/0.47  
% 0.20/0.47  # Proof found!
% 0.20/0.47  # SZS status Theorem
% 0.20/0.47  # SZS output start CNFRefutation
% See solution above
% 0.20/0.47  # Parsed axioms                        : 9
% 0.20/0.47  # Removed by relevancy pruning/SinE    : 4
% 0.20/0.47  # Initial clauses                      : 8
% 0.20/0.47  # Removed in clause preprocessing      : 0
% 0.20/0.47  # Initial clauses in saturation        : 8
% 0.20/0.47  # Processed clauses                    : 15
% 0.20/0.47  # ...of these trivial                  : 0
% 0.20/0.47  # ...subsumed                          : 0
% 0.20/0.47  # ...remaining for further processing  : 15
% 0.20/0.47  # Other redundant clauses eliminated   : 0
% 0.20/0.47  # Clauses deleted for lack of memory   : 0
% 0.20/0.47  # Backward-subsumed                    : 0
% 0.20/0.47  # Backward-rewritten                   : 1
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
% 0.20/0.47  # Current number of processed clauses  : 6
% 0.20/0.47  #    Positive orientable unit clauses  : 2
% 0.20/0.47  #    Positive unorientable unit clauses: 1
% 0.20/0.47  #    Negative unit clauses             : 1
% 0.20/0.47  #    Non-unit-clauses                  : 2
% 0.20/0.47  # Current number of unprocessed clauses: 3
% 0.20/0.47  # ...number of literals in the above   : 8
% 0.20/0.47  # Current number of archived formulas  : 0
% 0.20/0.47  # Current number of archived clauses   : 9
% 0.20/0.47  # Clause-clause subsumption calls (NU) : 6
% 0.20/0.47  # Rec. Clause-clause subsumption calls : 6
% 0.20/0.47  # Non-unit clause-clause subsumptions  : 1
% 0.20/0.47  # Unit Clause-clause subsumption calls : 0
% 0.20/0.47  # Rewrite failures with RHS unbound    : 0
% 0.20/0.47  # BW rewrite match attempts            : 4
% 0.20/0.47  # BW rewrite match successes           : 4
% 0.20/0.47  # Condensation attempts                : 0
% 0.20/0.47  # Condensation successes               : 0
% 0.20/0.47  # Termbank termtop insertions          : 606
% 0.20/0.47  
% 0.20/0.47  # -------------------------------------------------
% 0.20/0.47  # User time                : 0.004 s
% 0.20/0.47  # System time              : 0.001 s
% 0.20/0.47  # Total time               : 0.004 s
% 0.20/0.47  # Maximum resident set size: 1772 pages
% 0.20/0.47  
% 0.20/0.47  # -------------------------------------------------
% 0.20/0.47  # User time                : 0.006 s
% 0.20/0.47  # System time              : 0.002 s
% 0.20/0.47  # Total time               : 0.008 s
% 0.20/0.47  # Maximum resident set size: 1700 pages
%------------------------------------------------------------------------------
