require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require GEO173+2.E---3_0_THM-CRf_s_gdv.Signature as S;
require GEO173+2.E---3_0_THM-CRf_s_gdv.c_0_14_thm ;
require GEO173+2.E---3_0_THM-CRf_s_gdv.c_0_13_thm ;

rule S.c_0_18 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vm) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vm) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vn) (v_Vm)))
)
)
)
)))
    (λ (v_Vo : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vm) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vm) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vn) (v_Vm)))
)
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vm) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vm) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vn) (v_Vm)))
)
)
)
))
 (λ (v_Vp : τ (ι)),
 λ (v_Vq : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vn) (v_Vp)))
)
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vn) (v_Vp)))
)
)
)
)
 (λ (v_Vr : τ (ι)),
 λ (v_Vs : ϵ (¬
 ((S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vr) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
)
)
)
))),
 Rnotor
 (S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vr) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
)
)
)
 (λ (v_Vt : ϵ (¬
 (S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 λ (v_Vu : ϵ (¬
 ((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vr) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
)
)
))),
 Rnotor
 (S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (v_Vr) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
)
)
 (λ (v_Vv : ϵ (¬
 (S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 λ (v_Vw : ϵ (¬
 ((S.apart_point_and_line (v_Vr) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
)
))),
 Rnotor
 (S.apart_point_and_line (v_Vr) (S.esk3_0))
 ((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
)
 (λ (v_Vx : ϵ (¬
 (S.apart_point_and_line (v_Vr) (S.esk3_0)))),
 λ (v_Vy : ϵ (¬
 ((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vr) (v_Vp)))
))),
 Rnotor
 (S.apart_point_and_line (v_Vp) (S.esk3_0))
 (¬
 (S.distinct_points (v_Vr) (v_Vp)))
 (λ (v_Vz : ϵ (¬
 (S.apart_point_and_line (v_Vp) (S.esk3_0)))),
 λ (v_Vaa : ϵ (¬
 (¬
 (S.distinct_points (v_Vr) (v_Vp))))),
 Rnotnot
 (S.distinct_points (v_Vr) (v_Vp))
 (λ (v_Vba : ϵ (S.distinct_points (v_Vr) (v_Vp))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (v_Vda))
∨
((S.apart_point_and_line (v_Vn) (v_Vca))
∨
((S.apart_point_and_line (v_Vm) (v_Vda))
∨
((S.apart_point_and_line (v_Vm) (v_Vca))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vm)))
∨
(¬
 (S.distinct_lines (v_Vda) (v_Vca)))
)
)
)
)
))))
 (v_Vp)
 (λ (v_Vea : ϵ (∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (v_Vda))
∨
((S.apart_point_and_line (v_Vn) (v_Vca))
∨
((S.apart_point_and_line (v_Vp) (v_Vda))
∨
((S.apart_point_and_line (v_Vp) (v_Vca))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (S.distinct_lines (v_Vda) (v_Vca)))
)
)
)
)
))))),
 Rall
 (ι)
 (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (v_Vda))
∨
((S.apart_point_and_line (v_Vn) (v_Vca))
∨
((S.apart_point_and_line (v_Vp) (v_Vda))
∨
((S.apart_point_and_line (v_Vp) (v_Vca))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (S.distinct_lines (v_Vda) (v_Vca)))
)
)
)
)
)))
 (S.line_connecting (S.esk1_0) (S.esk2_0))
 (λ (v_Vfa : ϵ (∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (v_Vda))
∨
((S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (v_Vda))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (S.distinct_lines (v_Vda) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)
)))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (v_Vda))
∨
((S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (v_Vda))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (S.distinct_lines (v_Vda) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)
))
 (S.esk3_0)
 (λ (v_Vga : ϵ (∀α (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)
))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 (S.apart_point_and_line (v_Vn) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vn) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)
)
 (v_Vr)
 (λ (v_Vha : ϵ ((S.apart_point_and_line (v_Vr) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)
)),
 Ror
 (S.apart_point_and_line (v_Vr) (S.esk3_0))
 ((S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)
 (λ (v_Via : ϵ (S.apart_point_and_line (v_Vr) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (v_Vr) (S.esk3_0))
 (v_Via)
 (v_Vx)
)
 (λ (v_Vja : ϵ ((S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
)),
 Ror
 (S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)
 (λ (v_Vka : ϵ (S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.apart_point_and_line (v_Vr) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Vka)
 (v_Vt)
)
 (λ (v_Vla : ϵ ((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
)),
 Ror
 (S.apart_point_and_line (v_Vp) (S.esk3_0))
 ((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)
 (λ (v_Vma : ϵ (S.apart_point_and_line (v_Vp) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (v_Vp) (S.esk3_0))
 (v_Vma)
 (v_Vz)
)
 (λ (v_Vna : ϵ ((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
)),
 Ror
 (S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)
 (λ (v_Voa : ϵ (S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Voa)
 (v_Vv)
)
 (λ (v_Vpa : ϵ ((¬
 (S.distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
)),
 Ror
 (¬
 (S.distinct_points (v_Vr) (v_Vp)))
 (¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))
 (λ (v_Vqa : ϵ (¬
 (S.distinct_points (v_Vr) (v_Vp)))),
 Raxiom
 (S.distinct_points (v_Vr) (v_Vp))
 (v_Vba)
 (v_Vqa)
)
 (λ (v_Vra : ϵ (¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 Raxiom
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (S.c_0_14)
 (v_Vra)
)
 (v_Vpa)
)
 (v_Vna)
)
 (v_Vla)
)
 (v_Vja)
)
 (v_Vha)
)
 (v_Vga)
)
 (v_Vfa)
)
 (v_Vea)
)
 (S.c_0_13)
)
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
 (v_Vq)
)
 (v_Vo)
);
