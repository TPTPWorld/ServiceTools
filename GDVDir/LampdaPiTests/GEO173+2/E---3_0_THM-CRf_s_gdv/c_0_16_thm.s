ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p is ...
fof(c_0_11,axiom,
    ! [X2,X3,X1] :
      ( distinct_points(X1,X3)
      | distinct_points(X2,X3)
      | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_16,conjecture,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]) ).

ZenonModuloLP---0.4.2's c_0_16_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_11,axiom,
    ! [X2,X3,X1] :
      ( distinct_points(X1,X3)
      | distinct_points(X2,X3)
      | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_16,conjecture,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_16_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 (distinct_points (esk1_0) (v_Vm))
∨
(distinct_points (esk2_0) (v_Vm))
)) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 (distinct_points (esk1_0) (v_Vm))
∨
(distinct_points (esk2_0) (v_Vm))
))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (distinct_points (esk1_0) (v_Vm))
∨
(distinct_points (esk2_0) (v_Vm))
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (distinct_points (esk1_0) (v_Vm))
∨
(distinct_points (esk2_0) (v_Vm))
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((distinct_points (esk1_0) (v_Vo))
∨
(distinct_points (esk2_0) (v_Vo))
))),
 Rnotor
 (distinct_points (esk1_0) (v_Vo))
 (distinct_points (esk2_0) (v_Vo))
 (λ (v_Vq : ϵ (¬
 (distinct_points (esk1_0) (v_Vo)))),
 λ (v_Vr : ϵ (¬
 (distinct_points (esk2_0) (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vs : τ (ι)),
 ∀α (λ (v_Vt : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (distinct_points (v_Vm) (v_Vt))
∨
((distinct_points (v_Vs) (v_Vt))
∨
(¬
 (distinct_points (v_Vm) (v_Vs)))
)
)))
 (esk2_0)
 (λ (v_Vu : ϵ (∀α (λ (v_Vt : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (distinct_points (v_Vm) (v_Vt))
∨
((distinct_points (esk2_0) (v_Vt))
∨
(¬
 (distinct_points (v_Vm) (esk2_0)))
)
)))),
 Rall
 (ι)
 (λ (v_Vt : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (distinct_points (v_Vm) (v_Vt))
∨
((distinct_points (esk2_0) (v_Vt))
∨
(¬
 (distinct_points (v_Vm) (esk2_0)))
)
))
 (v_Vo)
 (λ (v_Vv : ϵ (∀α (λ (v_Vm : τ (ι)),
 (distinct_points (v_Vm) (v_Vo))
∨
((distinct_points (esk2_0) (v_Vo))
∨
(¬
 (distinct_points (v_Vm) (esk2_0)))
)
))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (distinct_points (v_Vm) (v_Vo))
∨
((distinct_points (esk2_0) (v_Vo))
∨
(¬
 (distinct_points (v_Vm) (esk2_0)))
)
)
 (esk1_0)
 (λ (v_Vw : ϵ ((distinct_points (esk1_0) (v_Vo))
∨
((distinct_points (esk2_0) (v_Vo))
∨
(¬
 (distinct_points (esk1_0) (esk2_0)))
)
)),
 Ror
 (distinct_points (esk1_0) (v_Vo))
 ((distinct_points (esk2_0) (v_Vo))
∨
(¬
 (distinct_points (esk1_0) (esk2_0)))
)
 (λ (v_Vx : ϵ (distinct_points (esk1_0) (v_Vo))),
 Raxiom
 (distinct_points (esk1_0) (v_Vo))
 (v_Vx)
 (v_Vq)
)
 (λ (v_Vy : ϵ ((distinct_points (esk2_0) (v_Vo))
∨
(¬
 (distinct_points (esk1_0) (esk2_0)))
)),
 Ror
 (distinct_points (esk2_0) (v_Vo))
 (¬
 (distinct_points (esk1_0) (esk2_0)))
 (λ (v_Vz : ϵ (distinct_points (esk2_0) (v_Vo))),
 Raxiom
 (distinct_points (esk2_0) (v_Vo))
 (v_Vz)
 (v_Vr)
)
 (λ (v_Vaa : ϵ (¬
 (distinct_points (esk1_0) (esk2_0)))),
 Raxiom
 (distinct_points (esk1_0) (esk2_0))
 (ax_c_0_12)
 (v_Vaa)
)
 (v_Vy)
)
 (v_Vw)
)
 (v_Vv)
)
 (v_Vu)
)
 (ax_c_0_11)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS end Proof
nodes searched: 30
max branch formulas: 27
proof nodes created: 12
formulas created: 310

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_16_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.05 WC = 0.13 
OUTPUT: c_0_16_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.05 WC = 0.13 
