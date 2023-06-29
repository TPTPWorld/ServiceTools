require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
))))
 (ax_apart4)
 (v_Vp)
);
