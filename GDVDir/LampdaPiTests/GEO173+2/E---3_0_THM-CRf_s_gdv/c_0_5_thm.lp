require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))) 
 ≔ 
 nnpp (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
)))))))

(λ (v_Vq : ϵ (¬
 (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))))),
 Rnotnot
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))
 (λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
)))))
 (ax_con)
 (v_Vr)
)
 (v_Vq)
);
