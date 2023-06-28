require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (distinct_points (v_Vq) (v_Vn)))
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (distinct_points (v_Vq) (v_Vn)))
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
))),
 Rall
 (ι)
 (λ (v_Vw : τ (ι)),
 ∀α (λ (v_Vx : τ (ι)),
 ∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vw))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vw) (v_Vx))))
∨
(¬
 (distinct_points (v_Vw) (v_Vx)))
)
)
∧
((distinct_points (v_Vy) (v_Vx))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vw) (v_Vx))))
∨
(¬
 (distinct_points (v_Vw) (v_Vx)))
)
)
)))
 (v_Vq)
 (λ (v_Vz : ϵ (∀α (λ (v_Vx : τ (ι)),
 ∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vx))))
∨
(¬
 (distinct_points (v_Vq) (v_Vx)))
)
)
∧
((distinct_points (v_Vy) (v_Vx))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vx))))
∨
(¬
 (distinct_points (v_Vq) (v_Vx)))
)
)
)))),
 Rall
 (ι)
 (λ (v_Vx : τ (ι)),
 ∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vx))))
∨
(¬
 (distinct_points (v_Vq) (v_Vx)))
)
)
∧
((distinct_points (v_Vy) (v_Vx))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vx))))
∨
(¬
 (distinct_points (v_Vq) (v_Vx)))
)
)
))
 (v_Vs)
 (λ (v_Vaa : ϵ (∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
∧
((distinct_points (v_Vy) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
))),
 Rall
 (ι)
 (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
∧
((distinct_points (v_Vy) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
)
 (v_Vu)
 (λ (v_Vba : ϵ (((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
∧
((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
)),
 Rand
 ((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
 (λ (v_Vca : ϵ ((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)),
 λ (v_Vda : ϵ ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)),
 Raxiom
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
 (v_Vda)
 (v_Vv)
)
 (v_Vba)
)
 (v_Vaa)
)
 (v_Vz)
)
 (ax_c_0_17)
)
 (v_Vt)
)
 (v_Vr)
)
 (v_Vp)
);
