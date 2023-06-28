require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
)
)
)
)
))))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
)
)
)
)
)))
 (λ (v_Vt : τ (ι)),
 λ (v_Vu : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vt)))
)
)
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vt)))
)
)
)
)
))
 (λ (v_Vv : τ (ι)),
 λ (v_Vw : ϵ (¬
 (∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vv))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vv))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
)
 (λ (v_Vx : τ (ι)),
 λ (v_Vy : ϵ (¬
 ((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vx) (v_Vv))
 ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
 (λ (v_Vz : ϵ (¬
 (apart_point_and_line (v_Vx) (v_Vv)))),
 λ (v_Vaa : ϵ (¬
 ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vx) (v_Vt))
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
 (λ (v_Vba : ϵ (¬
 (apart_point_and_line (v_Vx) (v_Vt)))),
 λ (v_Vca : ϵ (¬
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (v_Vv))
 ((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
 (λ (v_Vda : ϵ (¬
 (apart_point_and_line (v_Vr) (v_Vv)))),
 λ (v_Vea : ϵ (¬
 ((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (v_Vt))
 ((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
 (λ (v_Vfa : ϵ (¬
 (apart_point_and_line (v_Vr) (v_Vt)))),
 λ (v_Vga : ϵ (¬
 ((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
))),
 Rnotor
 (¬
 (distinct_points (v_Vx) (v_Vr)))
 (¬
 (distinct_lines (v_Vv) (v_Vt)))
 (λ (v_Vha : ϵ (¬
 (¬
 (distinct_points (v_Vx) (v_Vr))))),
 λ (v_Via : ϵ (¬
 (¬
 (distinct_lines (v_Vv) (v_Vt))))),
 Rnotnot
 (distinct_lines (v_Vv) (v_Vt))
 (λ (v_Vja : ϵ (distinct_lines (v_Vv) (v_Vt))),
 Rnotnot
 (distinct_points (v_Vx) (v_Vr))
 (λ (v_Vka : ϵ (distinct_points (v_Vx) (v_Vr))),
 Rall
 (ι)
 (λ (v_Vla : τ (ι)),
 ∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vla) (v_Vma)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vla) (v_Vna))
∨
((apart_point_and_line (v_Vla) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)
))))
 (v_Vx)
 (λ (v_Vpa : ϵ (∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vma)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)
))))),
 Rall
 (ι)
 (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vma)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)
)))
 (v_Vr)
 (λ (v_Vqa : ϵ (∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vna))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
)))),
 Rall
 (ι)
 (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vna))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
))
 (v_Vv)
 (λ (v_Vra : ϵ (∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vv) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
))),
 Rall
 (ι)
 (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vv) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
)
 (v_Vt)
 (λ (v_Vsa : ϵ ((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vv) (v_Vt)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
)
)),
 Ror
 (¬
 (distinct_points (v_Vx) (v_Vr)))
 ((¬
 (distinct_lines (v_Vv) (v_Vt)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
)
 (λ (v_Vta : ϵ (¬
 (distinct_points (v_Vx) (v_Vr)))),
 Raxiom
 (distinct_points (v_Vx) (v_Vr))
 (v_Vka)
 (v_Vta)
)
 (λ (v_Vua : ϵ ((¬
 (distinct_lines (v_Vv) (v_Vt)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
)),
 Ror
 (¬
 (distinct_lines (v_Vv) (v_Vt)))
 ((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
 (λ (v_Vva : ϵ (¬
 (distinct_lines (v_Vv) (v_Vt)))),
 Raxiom
 (distinct_lines (v_Vv) (v_Vt))
 (v_Vja)
 (v_Vva)
)
 (λ (v_Vwa : ϵ ((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)),
 Ror
 (apart_point_and_line (v_Vx) (v_Vv))
 ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
 (λ (v_Vxa : ϵ (apart_point_and_line (v_Vx) (v_Vv))),
 Raxiom
 (apart_point_and_line (v_Vx) (v_Vv))
 (v_Vxa)
 (v_Vz)
)
 (λ (v_Vya : ϵ ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)),
 Ror
 (apart_point_and_line (v_Vx) (v_Vt))
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
 (λ (v_Vza : ϵ (apart_point_and_line (v_Vx) (v_Vt))),
 Raxiom
 (apart_point_and_line (v_Vx) (v_Vt))
 (v_Vza)
 (v_Vba)
)
 (λ (v_Vab : ϵ ((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)),
 Ror
 (apart_point_and_line (v_Vr) (v_Vv))
 (apart_point_and_line (v_Vr) (v_Vt))
 (λ (v_Vbb : ϵ (apart_point_and_line (v_Vr) (v_Vv))),
 Raxiom
 (apart_point_and_line (v_Vr) (v_Vv))
 (v_Vbb)
 (v_Vda)
)
 (λ (v_Vcb : ϵ (apart_point_and_line (v_Vr) (v_Vt))),
 Raxiom
 (apart_point_and_line (v_Vr) (v_Vt))
 (v_Vcb)
 (v_Vfa)
)
 (v_Vab)
)
 (v_Vya)
)
 (v_Vwa)
)
 (v_Vua)
)
 (v_Vsa)
)
 (v_Vra)
)
 (v_Vqa)
)
 (v_Vpa)
)
 (ax_c_0_9)
)
 (v_Vha)
)
 (v_Via)
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
