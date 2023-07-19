ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_26_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_26_thm.p is ...
fof(c_0_24,axiom,
    ! [X3,X2,X1] :
      ( distinct_points(X1,X2)
      | ~ apart_point_and_line(X1,line_connecting(X3,X2))
      | ~ distinct_points(X3,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_17]),
    [verified(thm)] ).
fof(c_0_25,axiom,
    apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)),
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_22,c_0_23]),c_0_12])]),c_0_15]) ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_26,conjecture,
    $false,
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_24,c_0_25]),c_0_12])]),c_0_15]),
    [proof] ).

ZenonModulo---0.4.2's c_0_26_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_26_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_24,axiom,
    ! [X3,X2,X1] :
      ( distinct_points(X1,X2)
      | ~ apart_point_and_line(X1,line_connecting(X3,X2))
      | ~ distinct_points(X3,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_17]),
    [verified(thm)] ).
fof(c_0_25,axiom,
    apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)),
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_22,c_0_23]),c_0_12])]),c_0_15]) ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_26,conjecture,
    $false,
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_24,c_0_25]),c_0_12])]),c_0_15]),
    [proof] ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_26_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_26_thm.p'
% START OF SYSTEM OUTPUT
Zenon error: exhausted search space without finding a proof
nodes searched: 63
max branch formulas: 42
proof nodes created: 8
formulas created: 428

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_26_thm - ZenonModulo---0.4.2 says Unknown - CPU = 0.06 WC = 0.11  NodesSearch = 63 MaxBranchF = 42 ProofNodes = 8 Formulas = 428
OUTPUT: c_0_26_thm - ZenonModulo---0.4.2 says None - CPU = 0 WC = 0 
