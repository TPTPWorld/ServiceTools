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
