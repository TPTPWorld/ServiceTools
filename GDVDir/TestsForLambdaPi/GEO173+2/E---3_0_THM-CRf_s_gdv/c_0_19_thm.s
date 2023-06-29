ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p is ...
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).

ZenonModuloLP---0.4.2's c_0_19_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_19_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (distinct_points (esk2_0) (esk1_0)) 
 ≔ 
 nnpp (distinct_points (esk2_0) (esk1_0))

(λ (v_Vm : ϵ (¬
 (distinct_points (esk2_0) (esk1_0)))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 (distinct_points (esk1_0) (v_Vn))
∨
(distinct_points (esk2_0) (v_Vn))
)
 (esk1_0)
 (λ (v_Vo : ϵ ((distinct_points (esk1_0) (esk1_0))
∨
(distinct_points (esk2_0) (esk1_0))
)),
 Ror
 (distinct_points (esk1_0) (esk1_0))
 (distinct_points (esk2_0) (esk1_0))
 (λ (v_Vp : ϵ (⊥)),
 Rfalse
 (v_Vp))
 (λ (v_Vq : ϵ (distinct_points (esk2_0) (esk1_0))),
 Raxiom
 (distinct_points (esk2_0) (esk1_0))
 (v_Vq)
 (v_Vm)
)
 (v_Vo)
)
 (ax_c_0_16)
);
% SZS end Proof
nodes searched: 7
max branch formulas: 7
proof nodes created: 4
formulas created: 160

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_19_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.05 WC = 0.12 
OUTPUT: c_0_19_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.05 WC = 0.12 
