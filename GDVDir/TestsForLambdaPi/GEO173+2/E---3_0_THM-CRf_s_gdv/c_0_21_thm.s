ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_21_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_21_thm.p is ...
fof(c_0_8,axiom,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]),
    [verified(esa)] ).
fof(c_0_21,conjecture,
    ~ apart_point_and_line(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

ZenonModuloLP---0.4.2's c_0_21_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_21_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_8,axiom,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]),
    [verified(esa)] ).
fof(c_0_21,conjecture,
    ~ apart_point_and_line(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_21_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_21_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (¬
 (apart_point_and_line (esk1_0) (esk3_0))) 
 ≔ 
 nnpp (¬
 (apart_point_and_line (esk1_0) (esk3_0)))

(λ (v_Vm : ϵ (¬
 (¬
 (apart_point_and_line (esk1_0) (esk3_0))))),
 Rand
 (distinct_points (esk1_0) (esk2_0))
 ((convergent_lines (esk3_0) (esk4_0))
∧
((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)
)
 (λ (v_Vn : ϵ (distinct_points (esk1_0) (esk2_0))),
 λ (v_Vo : ϵ ((convergent_lines (esk3_0) (esk4_0))
∧
((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)
)),
 Rand
 (convergent_lines (esk3_0) (esk4_0))
 ((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)
 (λ (v_Vp : ϵ (convergent_lines (esk3_0) (esk4_0))),
 λ (v_Vq : ϵ ((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)),
 Rand
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
 ((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
 (λ (v_Vr : ϵ (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))),
 λ (v_Vs : ϵ ((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)),
 Rand
 (¬
 (apart_point_and_line (esk1_0) (esk3_0)))
 (¬
 (apart_point_and_line (esk2_0) (esk3_0)))
 (λ (v_Vt : ϵ (¬
 (apart_point_and_line (esk1_0) (esk3_0)))),
 λ (v_Vu : ϵ (¬
 (apart_point_and_line (esk2_0) (esk3_0)))),
 Raxiom
 (¬
 (apart_point_and_line (esk1_0) (esk3_0)))
 (v_Vt)
 (v_Vm)
)
 (v_Vs)
)
 (v_Vq)
)
 (v_Vo)
)
 (ax_c_0_8)
);
% SZS end Proof
nodes searched: 2
max branch formulas: 7
proof nodes created: 2
formulas created: 168

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_21_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.04 WC = 0.12 
OUTPUT: c_0_21_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.04 WC = 0.12 
