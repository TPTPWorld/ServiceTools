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
