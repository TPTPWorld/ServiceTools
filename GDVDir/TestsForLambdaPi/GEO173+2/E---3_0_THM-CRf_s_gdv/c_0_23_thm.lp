require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_23 ↪ 
  nnpp ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
(S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
    (λ (v_Vm : ϵ (¬
 ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
(S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
))),
 Rnotor
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (λ (v_Vn : ϵ (¬
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 λ (v_Vo : ϵ (¬
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 Rall
 (ι)
 (λ (v_Vp : τ (ι)),
 ∀α (λ (v_Vq : τ (ι)),
 (S.apart_point_and_line (v_Vq) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vq) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vp)))
)
)
)
))
 (S.esk1_0)
 (λ (v_Vr : ϵ (∀α (λ (v_Vq : τ (ι)),
 (S.apart_point_and_line (v_Vq) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vq) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vq) (S.esk1_0)))
)
)
)
))),
 Rall
 (ι)
 (λ (v_Vq : τ (ι)),
 (S.apart_point_and_line (v_Vq) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vq) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vq) (S.esk1_0)))
)
)
)
)
 (S.esk2_0)
 (λ (v_Vs : ϵ ((S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
)
)),
 Ror
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
)
 (λ (v_Vt : ϵ (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Vt)
 (v_Vo)
)
 (λ (v_Vu : ϵ ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
)),
 Ror
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
 (λ (v_Vv : ϵ (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Vv)
 (v_Vn)
)
 (λ (v_Vw : ϵ ((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)),
 Ror
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0))
 ((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
 (λ (v_Vx : ϵ (S.apart_point_and_line (S.esk2_0) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0))
 (v_Vx)
 (S.c_0_20)
)
 (λ (v_Vy : ϵ ((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)),
 Ror
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0))
 (¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
 (λ (v_Vz : ϵ (S.apart_point_and_line (S.esk1_0) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0))
 (v_Vz)
 (S.c_0_21)
)
 (λ (v_Vaa : ϵ (¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))),
 Raxiom
 (S.distinct_points (S.esk2_0) (S.esk1_0))
 (S.c_0_19)
 (v_Vaa)
)
 (v_Vy)
)
 (v_Vw)
)
 (v_Vu)
)
 (v_Vs)
)
 (v_Vr)
)
 (S.c_0_18)
)
 (v_Vm)
);
