ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p is ...
fof(c_0_10,axiom,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

ZenonModuloLP---0.4.2's c_0_15_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_10,axiom,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_15_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm))))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm)))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (distinct_points (v_Vo) (v_Vo))))),
 Rnotnot
 (distinct_points (v_Vo) (v_Vo))
 (λ (v_Vq : ϵ (⊥)),
 Rfalse
 (v_Vq))
 (v_Vp)
)
 (v_Vn)
);
% SZS end Proof
nodes searched: 3
max branch formulas: 3
proof nodes created: 3
formulas created: 136

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_15_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.07 WC = 0.13 
OUTPUT: c_0_15_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.07 WC = 0.13 
