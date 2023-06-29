ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_thm.p is ...
fof(c_0_5,axiom,
    ~ ! [X1,X2,X4,X5] :
        ( ( distinct_points(X1,X2)
          & convergent_lines(X4,X5)
          & distinct_lines(X4,line_connecting(X1,X2)) )
       => ( apart_point_and_line(X1,X4)
          | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]),
    [verified(cth)] ).
fof(c_0_8,conjecture,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).

ZenonModuloLP---0.4.2's c_0_8_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_5,axiom,
    ~ ! [X1,X2,X4,X5] :
        ( ( distinct_points(X1,X2)
          & convergent_lines(X4,X5)
          & distinct_lines(X4,line_connecting(X1,X2)) )
       => ( apart_point_and_line(X1,X4)
          | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]),
    [verified(cth)] ).
fof(c_0_8,conjecture,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_8_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_thm.p'
% START OF SYSTEM OUTPUT
Zenon error: exhausted search space without finding a proof
(* Current branch:
(distinct_points Tau_0 Tau_1)
(convergent_lines Tau_2 Tau_3)
(-. (apart_point_and_line Tau_1 Tau_2))
((esk3_0) != Tau_2)
(apart_point_and_line (esk2_0) (esk3_0))
(distinct_lines Tau_2 (line_connecting Tau_0 Tau_1))
(-. (apart_point_and_line Tau_0 Tau_2))
*)
(* NO-PROOF *)
% SZS status GaveUp

% SZS end Proof
nodes searched: 9
max branch formulas: 13
proof nodes created: 0
formulas created: 277

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_8_thm - ZenonModuloLP---0.4.2 says GaveUp - CPU = 0.07 WC = 0.12 
OUTPUT: c_0_8_thm - ZenonModuloLP---0.4.2 says None - CPU = 0.07 WC = 0.12 
