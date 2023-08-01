%------------------------------------------------------------------------------
% File       : E---2.4
% Problem    : PUZ001+1 : TPTP v7.2.0. Released v2.0.0
% Transform  : none
% Format     : tptp:raw
% Command    : eprover --delete-bad-limit=2000000000 --definitional-cnf=24 -s --print-statistics -R --print-version --auto-schedule --proof-object --cpu-limit=%d %s

% Computer   : quoll.cs.miami.edu
% Model      : x86_64 x86_64
% CPU        : Intel(R) Xeon(R) CPU E5-4610 0 @ 2.40GHz
% Memory     : 128721MB
% OS         : Linux 3.10.0-957.10.1.el7.x86_64
% CPULimit   : 60s
% DateTime   : Fri Jul 12 00:15:50 EDT 2019

% Result     : Theorem 0.00s
% Output     : CNFRefutation 0.00s
% Verified   : 
% Statistics : Number of formulae       :   47 (  68 expanded)
%              Number of clauses        :   25 (  32 expanded)
%              Number of leaves         :   11 (  18 expanded)
%              Depth                    :    8
%              Number of atoms          :   85 ( 128 expanded)
%              Number of equality atoms :   26 (  41 expanded)
%              Maximal formula depth    :    5 (   3 average)
%              Maximal clause size      :    4 (   2 average)
%              Maximal term depth       :    2 (   1 average)

% Comments   : 
%------------------------------------------------------------------------------
fof(pel55,conjecture,(
    killed(agatha,agatha) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55)).

fof(pel55_3,axiom,(
    ! [X1] :
      ( lives(X1)
     => ( X1 = agatha
        | X1 = butler
        | X1 = charles ) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_3)).

fof(pel55_1,axiom,(
    ? [X1] :
      ( lives(X1)
      & killed(X1,agatha) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_1)).

fof(pel55_4,axiom,(
    ! [X1,X2] :
      ( killed(X1,X2)
     => hates(X1,X2) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_4)).

fof(pel55_9,axiom,(
    ! [X1] :
      ( hates(agatha,X1)
     => hates(butler,X1) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_9)).

fof(pel55_7,axiom,(
    ! [X1] :
      ( X1 != butler
     => hates(agatha,X1) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_7)).

fof(pel55_5,axiom,(
    ! [X1,X2] :
      ( killed(X1,X2)
     => ~ richer(X1,X2) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_5)).

fof(pel55_8,axiom,(
    ! [X1] :
      ( ~ richer(X1,agatha)
     => hates(butler,X1) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_8)).

fof(pel55_6,axiom,(
    ! [X1] :
      ( hates(agatha,X1)
     => ~ hates(charles,X1) ) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_6)).

fof(pel55_10,axiom,(
    ! [X1] :
    ? [X2] : ~ hates(X1,X2) ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_10)).

fof(pel55_11,axiom,(
    agatha != butler ),
    file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p',pel55_11)).

fof(c_0_11,negated_conjecture,(
    ~ killed(agatha,agatha) ),
    inference(assume_negation,[status(cth)],[pel55])).

fof(c_0_12,plain,(
    ! [X4] :
      ( ~ lives(X4)
      | X4 = agatha
      | X4 = butler
      | X4 = charles ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_3])])).

fof(c_0_13,plain,
    ( lives(esk1_0)
    & killed(esk1_0,agatha) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[pel55_1])])).

fof(c_0_14,negated_conjecture,(
    ~ killed(agatha,agatha) ),
    inference(fof_simplification,[status(thm)],[c_0_11])).

cnf(c_0_15,plain,
    ( X1 = agatha
    | X1 = butler
    | X1 = charles
    | ~ lives(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_12])).

cnf(c_0_16,plain,
    ( lives(esk1_0) ),
    inference(split_conjunct,[status(thm)],[c_0_13])).

fof(c_0_17,plain,(
    ! [X5,X6] :
      ( ~ killed(X5,X6)
      | hates(X5,X6) ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_4])])).

cnf(c_0_18,negated_conjecture,
    ( ~ killed(agatha,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_14])).

cnf(c_0_19,plain,
    ( agatha = esk1_0
    | esk1_0 = butler
    | esk1_0 = charles ),
    inference(spm,[status(thm)],[c_0_15,c_0_16])).

fof(c_0_20,plain,(
    ! [X12] :
      ( ~ hates(agatha,X12)
      | hates(butler,X12) ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_9])])).

fof(c_0_21,plain,(
    ! [X10] :
      ( X10 = butler
      | hates(agatha,X10) ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_7])])).

fof(c_0_22,plain,(
    ! [X7,X8] :
      ( ~ killed(X7,X8)
      | ~ richer(X7,X8) ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_5])])])).

fof(c_0_23,plain,(
    ! [X11] :
      ( richer(X11,agatha)
      | hates(butler,X11) ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_8])])])).

fof(c_0_24,plain,(
    ! [X9] :
      ( ~ hates(agatha,X9)
      | ~ hates(charles,X9) ) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_6])])])).

cnf(c_0_25,plain,
    ( hates(X1,X2)
    | ~ killed(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_17])).

cnf(c_0_26,plain,
    ( killed(esk1_0,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_13])).

cnf(c_0_27,negated_conjecture,
    ( esk1_0 = charles
    | esk1_0 = butler
    | ~ killed(esk1_0,esk1_0) ),
    inference(spm,[status(thm)],[c_0_18,c_0_19])).

fof(c_0_28,plain,(
    ! [X13] : ~ hates(X13,esk2_1(X13)) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_10])])])).

cnf(c_0_29,plain,
    ( hates(butler,X1)
    | ~ hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_20])).

cnf(c_0_30,plain,
    ( X1 = butler
    | hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_21])).

cnf(c_0_31,plain,
    ( ~ killed(X1,X2)
    | ~ richer(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_22])).

cnf(c_0_32,plain,
    ( richer(X1,agatha)
    | hates(butler,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_23])).

cnf(c_0_33,plain,
    ( ~ hates(agatha,X1)
    | ~ hates(charles,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_24])).

cnf(c_0_34,plain,
    ( hates(esk1_0,agatha) ),
    inference(spm,[status(thm)],[c_0_25,c_0_26])).

cnf(c_0_35,plain,
    ( esk1_0 = charles
    | esk1_0 = butler ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_26,c_0_19]),c_0_27])).

cnf(c_0_36,plain,
    ( ~ hates(X1,esk2_1(X1)) ),
    inference(split_conjunct,[status(thm)],[c_0_28])).

cnf(c_0_37,plain,
    ( X1 = butler
    | hates(butler,X1) ),
    inference(spm,[status(thm)],[c_0_29,c_0_30])).

cnf(c_0_38,plain,
    ( hates(butler,X1)
    | ~ killed(X1,agatha) ),
    inference(spm,[status(thm)],[c_0_31,c_0_32])).

cnf(c_0_39,plain,
    ( X1 = butler
    | ~ hates(charles,X1) ),
    inference(spm,[status(thm)],[c_0_33,c_0_30])).

cnf(c_0_40,plain,
    ( esk1_0 = butler
    | hates(charles,agatha) ),
    inference(spm,[status(thm)],[c_0_34,c_0_35])).

cnf(c_0_41,plain,
    ( agatha != butler ),
    inference(split_conjunct,[status(thm)],[pel55_11])).

cnf(c_0_42,plain,
    ( esk2_1(butler) = butler ),
    inference(spm,[status(thm)],[c_0_36,c_0_37])).

cnf(c_0_43,plain,
    ( hates(butler,esk1_0) ),
    inference(spm,[status(thm)],[c_0_38,c_0_26])).

cnf(c_0_44,plain,
    ( esk1_0 = butler ),
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_39,c_0_40]),c_0_41])).

cnf(c_0_45,plain,
    ( ~ hates(butler,butler) ),
    inference(spm,[status(thm)],[c_0_36,c_0_42])).

cnf(c_0_46,plain,
    ( $false ),
    inference(sr,[status(thm)],[inference(rw,[status(thm)],[c_0_43,c_0_44]),c_0_45]),
    [proof]).
%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% # Version: 2.3_dev009
% # No SInE strategy applied
% # Trying AutoSched0 for 29 seconds
% # AutoSched0-Mode selected heuristic G_E___200_C45_F1_SE_CS_SP_PI_CO_S0V
% # and selection function PSelectComplexExceptRRHorn.
% #
% # Preprocessing time       : 0.023 s
% 
% # Proof found!
% # SZS status Theorem
% # SZS output start CNFRefutation
% fof(pel55, conjecture, killed(agatha,agatha), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55)).
% fof(pel55_3, axiom, ![X1]:(lives(X1)=>(X1=agatha|X1=butler|X1=charles)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_3)).
% fof(pel55_1, axiom, ?[X1]:(lives(X1)&killed(X1,agatha)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_1)).
% fof(pel55_4, axiom, ![X1, X2]:(killed(X1,X2)=>hates(X1,X2)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_4)).
% fof(pel55_9, axiom, ![X1]:(hates(agatha,X1)=>hates(butler,X1)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_9)).
% fof(pel55_7, axiom, ![X1]:(X1!=butler=>hates(agatha,X1)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_7)).
% fof(pel55_5, axiom, ![X1, X2]:(killed(X1,X2)=>~(richer(X1,X2))), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_5)).
% fof(pel55_8, axiom, ![X1]:(~(richer(X1,agatha))=>hates(butler,X1)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_8)).
% fof(pel55_6, axiom, ![X1]:(hates(agatha,X1)=>~(hates(charles,X1))), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_6)).
% fof(pel55_10, axiom, ![X1]:?[X2]:~(hates(X1,X2)), file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_10)).
% fof(pel55_11, axiom, agatha!=butler, file('/home/tptp/TPTP-v7.2.0/Problems/PUZ/PUZ001+1.p', pel55_11)).
% fof(c_0_11, negated_conjecture, ~(killed(agatha,agatha)), inference(assume_negation,[status(cth)],[pel55])).
% fof(c_0_12, plain, ![X4]:(~lives(X4)|(X4=agatha|X4=butler|X4=charles)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_3])])).
% fof(c_0_13, plain, (lives(esk1_0)&killed(esk1_0,agatha)), inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[pel55_1])])).
% fof(c_0_14, negated_conjecture, ~killed(agatha,agatha), inference(fof_simplification,[status(thm)],[c_0_11])).
% cnf(c_0_15, plain, (X1=agatha|X1=butler|X1=charles|~lives(X1)), inference(split_conjunct,[status(thm)],[c_0_12])).
% cnf(c_0_16, plain, (lives(esk1_0)), inference(split_conjunct,[status(thm)],[c_0_13])).
% fof(c_0_17, plain, ![X5, X6]:(~killed(X5,X6)|hates(X5,X6)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_4])])).
% cnf(c_0_18, negated_conjecture, (~killed(agatha,agatha)), inference(split_conjunct,[status(thm)],[c_0_14])).
% cnf(c_0_19, plain, (agatha=esk1_0|esk1_0=butler|esk1_0=charles), inference(spm,[status(thm)],[c_0_15, c_0_16])).
% fof(c_0_20, plain, ![X12]:(~hates(agatha,X12)|hates(butler,X12)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_9])])).
% fof(c_0_21, plain, ![X10]:(X10=butler|hates(agatha,X10)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[pel55_7])])).
% fof(c_0_22, plain, ![X7, X8]:(~killed(X7,X8)|~richer(X7,X8)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_5])])])).
% fof(c_0_23, plain, ![X11]:(richer(X11,agatha)|hates(butler,X11)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_8])])])).
% fof(c_0_24, plain, ![X9]:(~hates(agatha,X9)|~hates(charles,X9)), inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_6])])])).
% cnf(c_0_25, plain, (hates(X1,X2)|~killed(X1,X2)), inference(split_conjunct,[status(thm)],[c_0_17])).
% cnf(c_0_26, plain, (killed(esk1_0,agatha)), inference(split_conjunct,[status(thm)],[c_0_13])).
% cnf(c_0_27, negated_conjecture, (esk1_0=charles|esk1_0=butler|~killed(esk1_0,esk1_0)), inference(spm,[status(thm)],[c_0_18, c_0_19])).
% fof(c_0_28, plain, ![X13]:~hates(X13,esk2_1(X13)), inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_simplification,[status(thm)],[pel55_10])])])).
% cnf(c_0_29, plain, (hates(butler,X1)|~hates(agatha,X1)), inference(split_conjunct,[status(thm)],[c_0_20])).
% cnf(c_0_30, plain, (X1=butler|hates(agatha,X1)), inference(split_conjunct,[status(thm)],[c_0_21])).
% cnf(c_0_31, plain, (~killed(X1,X2)|~richer(X1,X2)), inference(split_conjunct,[status(thm)],[c_0_22])).
% cnf(c_0_32, plain, (richer(X1,agatha)|hates(butler,X1)), inference(split_conjunct,[status(thm)],[c_0_23])).
% cnf(c_0_33, plain, (~hates(agatha,X1)|~hates(charles,X1)), inference(split_conjunct,[status(thm)],[c_0_24])).
% cnf(c_0_34, plain, (hates(esk1_0,agatha)), inference(spm,[status(thm)],[c_0_25, c_0_26])).
% cnf(c_0_35, plain, (esk1_0=charles|esk1_0=butler), inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_26, c_0_19]), c_0_27])).
% cnf(c_0_36, plain, (~hates(X1,esk2_1(X1))), inference(split_conjunct,[status(thm)],[c_0_28])).
% cnf(c_0_37, plain, (X1=butler|hates(butler,X1)), inference(spm,[status(thm)],[c_0_29, c_0_30])).
% cnf(c_0_38, plain, (hates(butler,X1)|~killed(X1,agatha)), inference(spm,[status(thm)],[c_0_31, c_0_32])).
% cnf(c_0_39, plain, (X1=butler|~hates(charles,X1)), inference(spm,[status(thm)],[c_0_33, c_0_30])).
% cnf(c_0_40, plain, (esk1_0=butler|hates(charles,agatha)), inference(spm,[status(thm)],[c_0_34, c_0_35])).
% cnf(c_0_41, plain, (agatha!=butler), inference(split_conjunct,[status(thm)],[pel55_11])).
% cnf(c_0_42, plain, (esk2_1(butler)=butler), inference(spm,[status(thm)],[c_0_36, c_0_37])).
% cnf(c_0_43, plain, (hates(butler,esk1_0)), inference(spm,[status(thm)],[c_0_38, c_0_26])).
% cnf(c_0_44, plain, (esk1_0=butler), inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_39, c_0_40]), c_0_41])).
% cnf(c_0_45, plain, (~hates(butler,butler)), inference(spm,[status(thm)],[c_0_36, c_0_42])).
% cnf(c_0_46, plain, ($false), inference(sr,[status(thm)],[inference(rw,[status(thm)],[c_0_43, c_0_44]), c_0_45]), ['proof']).
% # SZS output end CNFRefutation
% # Proof object total steps             : 47
% # Proof object clause steps            : 25
% # Proof object formula steps           : 22
% # Proof object conjectures             : 5
% # Proof object clause conjectures      : 2
% # Proof object formula conjectures     : 3
% # Proof object initial clauses used    : 12
% # Proof object initial formulas used   : 11
% # Proof object generating inferences   : 12
% # Proof object simplifying inferences  : 4
% # Training examples: 0 positive, 0 negative
% # Parsed axioms                        : 14
% # Removed by relevancy pruning/SinE    : 0
% # Initial clauses                      : 15
% # Removed in clause preprocessing      : 0
% # Initial clauses in saturation        : 15
% # Processed clauses                    : 36
% # ...of these trivial                  : 0
% # ...subsumed                          : 3
% # ...remaining for further processing  : 33
% # Other redundant clauses eliminated   : 0
% # Clauses deleted for lack of memory   : 0
% # Backward-subsumed                    : 3
% # Backward-rewritten                   : 7
% # Generated clauses                    : 40
% # ...of the previous two non-trivial   : 33
% # Contextual simplify-reflections      : 1
% # Paramodulations                      : 35
% # Factorizations                       : 5
% # Equation resolutions                 : 0
% # Propositional unsat checks           : 0
% #    Propositional check models        : 0
% #    Propositional check unsatisfiable : 0
% #    Propositional clauses             : 0
% #    Propositional clauses after purity: 0
% #    Propositional unsat core size     : 0
% #    Propositional preprocessing time  : 0.000
% #    Propositional encoding time       : 0.000
% #    Propositional solver time         : 0.000
% #    Success case prop preproc time    : 0.000
% #    Success case prop encoding time   : 0.000
% #    Success case prop solver time     : 0.000
% # Current number of processed clauses  : 23
% #    Positive orientable unit clauses  : 6
% #    Positive unorientable unit clauses: 0
% #    Negative unit clauses             : 6
% #    Non-unit-clauses                  : 11
% # Current number of unprocessed clauses: 11
% # ...number of literals in the above   : 38
% # Current number of archived formulas  : 0
% # Current number of archived clauses   : 10
% # Clause-clause subsumption calls (NU) : 12
% # Rec. Clause-clause subsumption calls : 10
% # Non-unit clause-clause subsumptions  : 3
% # Unit Clause-clause subsumption calls : 7
% # Rewrite failures with RHS unbound    : 0
% # BW rewrite match attempts            : 1
% # BW rewrite match successes           : 1
% # Condensation attempts                : 36
% # Condensation successes               : 0
% # Termbank termtop insertions          : 887
% 
% # -------------------------------------------------
% # User time                : 0.021 s
% # System time              : 0.010 s
% # Total time               : 0.030 s
% # Maximum resident set size: 1572 pages
% 
%------------------------------------------------------------------------------
