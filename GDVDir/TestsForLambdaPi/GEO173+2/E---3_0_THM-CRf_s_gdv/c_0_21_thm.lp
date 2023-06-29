require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (¬
 (apart_point_and_line (esk1_0) (esk3_0))) 
 ≔ 
 nnpp (¬
 (apart_point_and_line (esk1_0) (esk3_0)))

(λ (v_Vm : ϵ (¬
 (¬
 (apart_point_and_line (esk1_0) (esk3_0))))),
 Rand
 (distinct_points (esk1_0) (esk2_0))
 ((convergent_lines (esk3_0) (esk4_0))
∧
((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)
)
 (λ (v_Vn : ϵ (distinct_points (esk1_0) (esk2_0))),
 λ (v_Vo : ϵ ((convergent_lines (esk3_0) (esk4_0))
∧
((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)
)),
 Rand
 (convergent_lines (esk3_0) (esk4_0))
 ((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)
 (λ (v_Vp : ϵ (convergent_lines (esk3_0) (esk4_0))),
 λ (v_Vq : ϵ ((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
∧
((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
)),
 Rand
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
 ((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)
 (λ (v_Vr : ϵ (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))),
 λ (v_Vs : ϵ ((¬
 (apart_point_and_line (esk1_0) (esk3_0)))
∧
(¬
 (apart_point_and_line (esk2_0) (esk3_0)))
)),
 Rand
 (¬
 (apart_point_and_line (esk1_0) (esk3_0)))
 (¬
 (apart_point_and_line (esk2_0) (esk3_0)))
 (λ (v_Vt : ϵ (¬
 (apart_point_and_line (esk1_0) (esk3_0)))),
 λ (v_Vu : ϵ (¬
 (apart_point_and_line (esk2_0) (esk3_0)))),
 Raxiom
 (¬
 (apart_point_and_line (esk1_0) (esk3_0)))
 (v_Vt)
 (v_Vm)
)
 (v_Vs)
)
 (v_Vq)
)
 (v_Vo)
)
 (ax_c_0_8)
);
