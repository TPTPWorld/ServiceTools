require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_9 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
((S.apart_point_and_line (v_Vm) (v_Vp))
∨
((S.apart_point_and_line (v_Vn) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
)))))
    (λ (v_Vq : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
((S.apart_point_and_line (v_Vm) (v_Vp))
∨
((S.apart_point_and_line (v_Vn) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
))))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
((S.apart_point_and_line (v_Vm) (v_Vp))
∨
((S.apart_point_and_line (v_Vn) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
))))
 (λ (v_Vr : τ (ι)),
 λ (v_Vs : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vr) (v_Vn)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vr) (v_Vo))
∨
((S.apart_point_and_line (v_Vr) (v_Vp))
∨
((S.apart_point_and_line (v_Vn) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vr) (v_Vn)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vr) (v_Vo))
∨
((S.apart_point_and_line (v_Vr) (v_Vp))
∨
((S.apart_point_and_line (v_Vn) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
)))
 (λ (v_Vt : τ (ι)),
 λ (v_Vu : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vr) (v_Vo))
∨
((S.apart_point_and_line (v_Vr) (v_Vp))
∨
((S.apart_point_and_line (v_Vt) (v_Vo))
∨
(S.apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (S.distinct_lines (v_Vo) (v_Vp)))
∨
((S.apart_point_and_line (v_Vr) (v_Vo))
∨
((S.apart_point_and_line (v_Vr) (v_Vp))
∨
((S.apart_point_and_line (v_Vt) (v_Vo))
∨
(S.apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
))
 (λ (v_Vv : τ (ι)),
 λ (v_Vw : ϵ (¬
 (∀α (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (S.distinct_lines (v_Vv) (v_Vp)))
∨
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vp))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vp : τ (ι)),
 (¬
 (S.distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (S.distinct_lines (v_Vv) (v_Vp)))
∨
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vp))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
)
 (λ (v_Vx : τ (ι)),
 λ (v_Vy : ϵ (¬
 ((¬
 (S.distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (S.distinct_lines (v_Vv) (v_Vx)))
∨
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)
)
))),
 Rnotor
 (¬
 (S.distinct_points (v_Vr) (v_Vt)))
 ((¬
 (S.distinct_lines (v_Vv) (v_Vx)))
∨
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)
)
 (λ (v_Vz : ϵ (¬
 (¬
 (S.distinct_points (v_Vr) (v_Vt))))),
 λ (v_Vaa : ϵ (¬
 ((¬
 (S.distinct_lines (v_Vv) (v_Vx)))
∨
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)
))),
 Rnotor
 (¬
 (S.distinct_lines (v_Vv) (v_Vx)))
 ((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)
 (λ (v_Vba : ϵ (¬
 (¬
 (S.distinct_lines (v_Vv) (v_Vx))))),
 λ (v_Vca : ϵ (¬
 ((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
))),
 Rnotor
 (S.apart_point_and_line (v_Vr) (v_Vv))
 ((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
 (λ (v_Vda : ϵ (¬
 (S.apart_point_and_line (v_Vr) (v_Vv)))),
 λ (v_Vea : ϵ (¬
 ((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
))),
 Rnotor
 (S.apart_point_and_line (v_Vr) (v_Vx))
 ((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
 (λ (v_Vfa : ϵ (¬
 (S.apart_point_and_line (v_Vr) (v_Vx)))),
 λ (v_Vga : ϵ (¬
 ((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
))),
 Rnotor
 (S.apart_point_and_line (v_Vt) (v_Vv))
 (S.apart_point_and_line (v_Vt) (v_Vx))
 (λ (v_Vha : ϵ (¬
 (S.apart_point_and_line (v_Vt) (v_Vv)))),
 λ (v_Via : ϵ (¬
 (S.apart_point_and_line (v_Vt) (v_Vx)))),
 Rnotnot
 (S.distinct_lines (v_Vv) (v_Vx))
 (λ (v_Vja : ϵ (S.distinct_lines (v_Vv) (v_Vx))),
 Rnotnot
 (S.distinct_points (v_Vr) (v_Vt))
 (λ (v_Vka : ϵ (S.distinct_points (v_Vr) (v_Vt))),
 Rall
 (ι)
 (λ (v_Vla : τ (ι)),
 ∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vla) (v_Vma))
∧
(S.distinct_lines (v_Vna) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vla) (v_Vna))
∨
((S.apart_point_and_line (v_Vla) (v_Voa))
∨
((S.apart_point_and_line (v_Vma) (v_Vna))
∨
(S.apart_point_and_line (v_Vma) (v_Voa))
)
)
)
))))
 (v_Vr)
 (λ (v_Vpa : ϵ (∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vr) (v_Vma))
∧
(S.distinct_lines (v_Vna) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vna))
∨
((S.apart_point_and_line (v_Vr) (v_Voa))
∨
((S.apart_point_and_line (v_Vma) (v_Vna))
∨
(S.apart_point_and_line (v_Vma) (v_Voa))
)
)
)
))))),
 Rall
 (ι)
 (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vr) (v_Vma))
∧
(S.distinct_lines (v_Vna) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vna))
∨
((S.apart_point_and_line (v_Vr) (v_Voa))
∨
((S.apart_point_and_line (v_Vma) (v_Vna))
∨
(S.apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)))
 (v_Vt)
 (λ (v_Vqa : ϵ (∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vna) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vna))
∨
((S.apart_point_and_line (v_Vr) (v_Voa))
∨
((S.apart_point_and_line (v_Vt) (v_Vna))
∨
(S.apart_point_and_line (v_Vt) (v_Voa))
)
)
)
)))),
 Rall
 (ι)
 (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vna) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vna))
∨
((S.apart_point_and_line (v_Vr) (v_Voa))
∨
((S.apart_point_and_line (v_Vt) (v_Vna))
∨
(S.apart_point_and_line (v_Vt) (v_Voa))
)
)
)
))
 (v_Vv)
 (λ (v_Vra : ϵ (∀α (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vv) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Voa))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Voa))
)
)
)
))),
 Rall
 (ι)
 (λ (v_Voa : τ (ι)),
 ((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vv) (v_Voa))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Voa))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Voa))
)
)
)
)
 (v_Vx)
 (λ (v_Vsa : ϵ (((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vv) (v_Vx))
)
⇒
((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)
)),
 Rimply
 ((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vv) (v_Vx))
)
 ((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)
 (λ (v_Vta : ϵ (¬
 ((S.distinct_points (v_Vr) (v_Vt))
∧
(S.distinct_lines (v_Vv) (v_Vx))
))),
 Rnotand
 (S.distinct_points (v_Vr) (v_Vt))
 (S.distinct_lines (v_Vv) (v_Vx))
 (λ (v_Vua : ϵ (¬
 (S.distinct_points (v_Vr) (v_Vt)))),
 Raxiom
 (S.distinct_points (v_Vr) (v_Vt))
 (v_Vka)
 (v_Vua)
)
 (λ (v_Vva : ϵ (¬
 (S.distinct_lines (v_Vv) (v_Vx)))),
 Raxiom
 (S.distinct_lines (v_Vv) (v_Vx))
 (v_Vja)
 (v_Vva)
)
 (v_Vta)
)
 (λ (v_Vwa : ϵ ((S.apart_point_and_line (v_Vr) (v_Vv))
∨
((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
)),
 Ror
 (S.apart_point_and_line (v_Vr) (v_Vv))
 ((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)
 (λ (v_Vxa : ϵ (S.apart_point_and_line (v_Vr) (v_Vv))),
 Raxiom
 (S.apart_point_and_line (v_Vr) (v_Vv))
 (v_Vxa)
 (v_Vda)
)
 (λ (v_Vya : ϵ ((S.apart_point_and_line (v_Vr) (v_Vx))
∨
((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
)),
 Ror
 (S.apart_point_and_line (v_Vr) (v_Vx))
 ((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)
 (λ (v_Vza : ϵ (S.apart_point_and_line (v_Vr) (v_Vx))),
 Raxiom
 (S.apart_point_and_line (v_Vr) (v_Vx))
 (v_Vza)
 (v_Vfa)
)
 (λ (v_Vab : ϵ ((S.apart_point_and_line (v_Vt) (v_Vv))
∨
(S.apart_point_and_line (v_Vt) (v_Vx))
)),
 Ror
 (S.apart_point_and_line (v_Vt) (v_Vv))
 (S.apart_point_and_line (v_Vt) (v_Vx))
 (λ (v_Vbb : ϵ (S.apart_point_and_line (v_Vt) (v_Vv))),
 Raxiom
 (S.apart_point_and_line (v_Vt) (v_Vv))
 (v_Vbb)
 (v_Vha)
)
 (λ (v_Vcb : ϵ (S.apart_point_and_line (v_Vt) (v_Vx))),
 Raxiom
 (S.apart_point_and_line (v_Vt) (v_Vx))
 (v_Vcb)
 (v_Via)
)
 (v_Vab)
)
 (v_Vya)
)
 (v_Vwa)
)
 (v_Vsa)
)
 (v_Vra)
)
 (v_Vqa)
)
 (v_Vpa)
)
 (S.cu1)
)
 (v_Vz)
)
 (v_Vba)
)
 (v_Vga)
)
 (v_Vea)
)
 (v_Vca)
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
);
