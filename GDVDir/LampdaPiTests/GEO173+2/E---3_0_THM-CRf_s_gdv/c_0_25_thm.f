ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_25_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_25_thm.p is ...
fof(c_0_22,axiom,
    ! [X3,X2,X1] :
      ( distinct_points(X1,X2)
      | ~ apart_point_and_line(X1,line_connecting(X2,X3))
      | ~ distinct_points(X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_17]),
    [verified(thm)] ).
fof(c_0_23,axiom,
    ( apart_point_and_line(esk1_0,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_18,c_0_19]),c_0_20]),c_0_21]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_25,conjecture,
    apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)),
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_22,c_0_23]),c_0_12])]),c_0_15]) ).

ZenonModuloLP---0.4.2's c_0_25_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_25_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_22,axiom,
    ! [X3,X2,X1] :
      ( distinct_points(X1,X2)
      | ~ apart_point_and_line(X1,line_connecting(X2,X3))
      | ~ distinct_points(X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_17]),
    [verified(thm)] ).
fof(c_0_23,axiom,
    ( apart_point_and_line(esk1_0,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_18,c_0_19]),c_0_20]),c_0_21]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_25,conjecture,
    apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)),
    inference(sr,[status(thm)],[inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(spm,[status(thm)],[c_0_22,c_0_23]),c_0_12])]),c_0_15]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_25_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_25_thm.p'
% START OF SYSTEM OUTPUT
Zenon error: exhausted search space without finding a proof
(* Current branch:
(-. (apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0))))
(-. (apart_point_and_line zenon_X8 (line_connecting zenon_X5 (esk1_0))))
(apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
((esk2_0) != (esk1_0))
(-. (distinct_points zenon_X3 (esk2_0)))
(distinct_points (esk1_0) (esk2_0))
(zenon_X5 != zenon_X6)
((esk1_0) != zenon_X6)
(-. (distinct_points zenon_X1 zenon_X0))
((esk1_0) != zenon_X0)
((esk2_0) != zenon_X0)
(-. (apart_point_and_line zenon_X6 (line_connecting (esk1_0) (esk2_0))))
(-. (distinct_points zenon_X6 (esk1_0)))
((esk1_0) != zenon_X3)
((line_connecting (esk1_0) (esk2_0)) != (line_connecting zenon_X5 (esk1_0)))
(distinct_points zenon_X5 (esk1_0))
*)
(* NO-PROOF *)
% SZS status GaveUp

% SZS end Proof
nodes searched: 49
max branch formulas: 34
proof nodes created: 8
formulas created: 383

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_25_thm - ZenonModuloLP---0.4.2 says GaveUp - CPU = 0.07 WC = 0.13 
OUTPUT: c_0_25_thm - ZenonModuloLP---0.4.2 says None - CPU = 0.07 WC = 0.13 
