ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p is ...
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

ZenonModulo---0.4.2's c_0_16_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p
ZenonModulo---0.4.2's own format source file is ...
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

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_16_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 30
max branch formulas: 27
proof nodes created: 12
formulas created: 310

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_16 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (S.distinct_points (S.esk1_0) (v_Vm))
∨
(S.distinct_points (S.esk2_0) (v_Vm))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (S.distinct_points (S.esk1_0) (v_Vm))
∨
(S.distinct_points (S.esk2_0) (v_Vm))
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.distinct_points (S.esk1_0) (v_Vm))
∨
(S.distinct_points (S.esk2_0) (v_Vm))
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((S.distinct_points (S.esk1_0) (v_Vo))
∨
(S.distinct_points (S.esk2_0) (v_Vo))
))),
 Rnotor
 (S.distinct_points (S.esk1_0) (v_Vo))
 (S.distinct_points (S.esk2_0) (v_Vo))
 (λ (v_Vq : ϵ (¬
 (S.distinct_points (S.esk1_0) (v_Vo)))),
 λ (v_Vr : ϵ (¬
 (S.distinct_points (S.esk2_0) (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vs : τ (ι)),
 ∀α (λ (v_Vt : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vt))
∨
((S.distinct_points (v_Vs) (v_Vt))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vs)))
)
)))
 (S.esk2_0)
 (λ (v_Vu : ϵ (∀α (λ (v_Vt : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vt))
∨
((S.distinct_points (S.esk2_0) (v_Vt))
∨
(¬
 (S.distinct_points (v_Vm) (S.esk2_0)))
)
)))),
 Rall
 (ι)
 (λ (v_Vt : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vt))
∨
((S.distinct_points (S.esk2_0) (v_Vt))
∨
(¬
 (S.distinct_points (v_Vm) (S.esk2_0)))
)
))
 (v_Vo)
 (λ (v_Vv : ϵ (∀α (λ (v_Vm : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vo))
∨
((S.distinct_points (S.esk2_0) (v_Vo))
∨
(¬
 (S.distinct_points (v_Vm) (S.esk2_0)))
)
))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vo))
∨
((S.distinct_points (S.esk2_0) (v_Vo))
∨
(¬
 (S.distinct_points (v_Vm) (S.esk2_0)))
)
)
 (S.esk1_0)
 (λ (v_Vw : ϵ ((S.distinct_points (S.esk1_0) (v_Vo))
∨
((S.distinct_points (S.esk2_0) (v_Vo))
∨
(¬
 (S.distinct_points (S.esk1_0) (S.esk2_0)))
)
)),
 Ror
 (S.distinct_points (S.esk1_0) (v_Vo))
 ((S.distinct_points (S.esk2_0) (v_Vo))
∨
(¬
 (S.distinct_points (S.esk1_0) (S.esk2_0)))
)
 (λ (v_Vx : ϵ (S.distinct_points (S.esk1_0) (v_Vo))),
 Raxiom
 (S.distinct_points (S.esk1_0) (v_Vo))
 (v_Vx)
 (v_Vq)
)
 (λ (v_Vy : ϵ ((S.distinct_points (S.esk2_0) (v_Vo))
∨
(¬
 (S.distinct_points (S.esk1_0) (S.esk2_0)))
)),
 Ror
 (S.distinct_points (S.esk2_0) (v_Vo))
 (¬
 (S.distinct_points (S.esk1_0) (S.esk2_0)))
 (λ (v_Vz : ϵ (S.distinct_points (S.esk2_0) (v_Vo))),
 Raxiom
 (S.distinct_points (S.esk2_0) (v_Vo))
 (v_Vz)
 (v_Vr)
)
 (λ (v_Vaa : ϵ (¬
 (S.distinct_points (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.distinct_points (S.esk1_0) (S.esk2_0))
 (S.c_0_12)
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
 (S.c_0_11)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_16_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.06 WC = 0.12  NodesSearch = 30 MaxBranchF = 27 ProofNodes = 12 Formulas = 310
OUTPUT: c_0_16_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.06 WC = 0.12 
