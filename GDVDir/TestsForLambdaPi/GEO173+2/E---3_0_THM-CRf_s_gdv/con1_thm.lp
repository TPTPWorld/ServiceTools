require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn)))
⇒
((distinct_points (v_Vo) (v_Vm))
∧
(distinct_points (v_Vo) (v_Vn))
)
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn)))
⇒
((distinct_points (v_Vo) (v_Vm))
∧
(distinct_points (v_Vo) (v_Vn))
)
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn)))
⇒
((distinct_points (v_Vo) (v_Vm))
∧
(distinct_points (v_Vo) (v_Vn))
)
)
)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vm) (v_Vn))
⇒
((apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn)))
⇒
((distinct_points (v_Vo) (v_Vm))
∧
(distinct_points (v_Vo) (v_Vn))
)
)
))))
 (ax_con1)
 (v_Vp)
);
