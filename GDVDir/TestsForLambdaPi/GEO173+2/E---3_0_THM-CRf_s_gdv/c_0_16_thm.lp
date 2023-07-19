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
