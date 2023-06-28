require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (¬
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
 ≔ 
 nnpp (¬
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

(λ (v_Vq : ϵ (¬
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
)))))))),
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
 (λ (v_Vr : ϵ (distinct_points (esk1_0) (esk2_0))),
 λ (v_Vs : ϵ ((convergent_lines (esk3_0) (esk4_0))
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
 (λ (v_Vt : ϵ (convergent_lines (esk3_0) (esk4_0))),
 λ (v_Vu : ϵ ((distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
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
 (λ (v_Vv : ϵ (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))),
 λ (v_Vw : ϵ ((¬
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
 (λ (v_Vx : ϵ (¬
 (apart_point_and_line (esk1_0) (esk3_0)))),
 λ (v_Vy : ϵ (¬
 (apart_point_and_line (esk2_0) (esk3_0)))),
 Rnotnot
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
 (λ (v_Vz : ϵ (∀α (λ (v_Vm : τ (ι)),
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
)))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
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
))))
 (esk1_0)
 (λ (v_Vaa : ϵ (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (esk1_0) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (esk1_0) (v_Vn)))
)
)
⇒
((apart_point_and_line (esk1_0) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (esk1_0) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (esk1_0) (v_Vn)))
)
)
⇒
((apart_point_and_line (esk1_0) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
)))
 (esk2_0)
 (λ (v_Vba : ϵ (∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (esk1_0) (esk2_0)))
)
)
⇒
((apart_point_and_line (esk1_0) (v_Vo))
∨
(apart_point_and_line (esk2_0) (v_Vo))
)
)))),
 Rall
 (ι)
 (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (esk1_0) (esk2_0)))
)
)
⇒
((apart_point_and_line (esk1_0) (v_Vo))
∨
(apart_point_and_line (esk2_0) (v_Vo))
)
))
 (esk3_0)
 (λ (v_Vca : ϵ (∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (esk3_0) (v_Vp))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
)
)
⇒
((apart_point_and_line (esk1_0) (esk3_0))
∨
(apart_point_and_line (esk2_0) (esk3_0))
)
))),
 Rall
 (ι)
 (λ (v_Vp : τ (ι)),
 ((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (esk3_0) (v_Vp))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
)
)
⇒
((apart_point_and_line (esk1_0) (esk3_0))
∨
(apart_point_and_line (esk2_0) (esk3_0))
)
)
 (esk4_0)
 (λ (v_Vda : ϵ (((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (esk3_0) (esk4_0))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
)
)
⇒
((apart_point_and_line (esk1_0) (esk3_0))
∨
(apart_point_and_line (esk2_0) (esk3_0))
)
)),
 Rimply
 ((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (esk3_0) (esk4_0))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
)
)
 ((apart_point_and_line (esk1_0) (esk3_0))
∨
(apart_point_and_line (esk2_0) (esk3_0))
)
 (λ (v_Vea : ϵ (¬
 ((distinct_points (esk1_0) (esk2_0))
∧
((convergent_lines (esk3_0) (esk4_0))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
)
))),
 Rnotand
 (distinct_points (esk1_0) (esk2_0))
 ((convergent_lines (esk3_0) (esk4_0))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
)
 (λ (v_Vfa : ϵ (¬
 (distinct_points (esk1_0) (esk2_0)))),
 Raxiom
 (distinct_points (esk1_0) (esk2_0))
 (v_Vr)
 (v_Vfa)
)
 (λ (v_Vga : ϵ (¬
 ((convergent_lines (esk3_0) (esk4_0))
∧
(distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
))),
 Rnotand
 (convergent_lines (esk3_0) (esk4_0))
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
 (λ (v_Vha : ϵ (¬
 (convergent_lines (esk3_0) (esk4_0)))),
 Raxiom
 (convergent_lines (esk3_0) (esk4_0))
 (v_Vt)
 (v_Vha)
)
 (λ (v_Via : ϵ (¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))),
 Raxiom
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
 (v_Vv)
 (v_Via)
)
 (v_Vga)
)
 (v_Vea)
)
 (λ (v_Vja : ϵ ((apart_point_and_line (esk1_0) (esk3_0))
∨
(apart_point_and_line (esk2_0) (esk3_0))
)),
 Ror
 (apart_point_and_line (esk1_0) (esk3_0))
 (apart_point_and_line (esk2_0) (esk3_0))
 (λ (v_Vka : ϵ (apart_point_and_line (esk1_0) (esk3_0))),
 Raxiom
 (apart_point_and_line (esk1_0) (esk3_0))
 (v_Vka)
 (v_Vx)
)
 (λ (v_Vla : ϵ (apart_point_and_line (esk2_0) (esk3_0))),
 Raxiom
 (apart_point_and_line (esk2_0) (esk3_0))
 (v_Vla)
 (v_Vy)
)
 (v_Vja)
)
 (v_Vda)
)
 (v_Vca)
)
 (v_Vba)
)
 (v_Vaa)
)
 (v_Vz)
)
 (v_Vq)
)
 (v_Vw)
)
 (v_Vu)
)
 (v_Vs)
)
 (ax_c_0_8)
);
