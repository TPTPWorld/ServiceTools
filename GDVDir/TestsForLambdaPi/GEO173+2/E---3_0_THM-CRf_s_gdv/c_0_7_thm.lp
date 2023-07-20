require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require GEO173+2.E---3_0_THM-CRf_s_gdv.Signature as S;
require GEO173+2.E---3_0_THM-CRf_s_gdv.apart4_thm ;

rule S.c_0_7 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vm) (v_Vn)))
∨
((S.distinct_points (v_Vm) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
))))
    (λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vm) (v_Vn)))
∨
((S.distinct_points (v_Vm) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vm) (v_Vn)))
∨
((S.distinct_points (v_Vm) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vq) (v_Vn)))
∨
((S.distinct_points (v_Vq) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vq) (v_Vn)))
∨
((S.distinct_points (v_Vq) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vq) (v_Vs)))
∨
((S.distinct_points (v_Vq) (v_Vo))
∨
(S.distinct_points (v_Vs) (v_Vo))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 (¬
 (S.distinct_points (v_Vq) (v_Vs)))
∨
((S.distinct_points (v_Vq) (v_Vo))
∨
(S.distinct_points (v_Vs) (v_Vo))
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 ((¬
 (S.distinct_points (v_Vq) (v_Vs)))
∨
((S.distinct_points (v_Vq) (v_Vu))
∨
(S.distinct_points (v_Vs) (v_Vu))
)
))),
 Rnotor
 (¬
 (S.distinct_points (v_Vq) (v_Vs)))
 ((S.distinct_points (v_Vq) (v_Vu))
∨
(S.distinct_points (v_Vs) (v_Vu))
)
 (λ (v_Vw : ϵ (¬
 (¬
 (S.distinct_points (v_Vq) (v_Vs))))),
 λ (v_Vx : ϵ (¬
 ((S.distinct_points (v_Vq) (v_Vu))
∨
(S.distinct_points (v_Vs) (v_Vu))
))),
 Rnotor
 (S.distinct_points (v_Vq) (v_Vu))
 (S.distinct_points (v_Vs) (v_Vu))
 (λ (v_Vy : ϵ (¬
 (S.distinct_points (v_Vq) (v_Vu)))),
 λ (v_Vz : ϵ (¬
 (S.distinct_points (v_Vs) (v_Vu)))),
 Rnotnot
 (S.distinct_points (v_Vq) (v_Vs))
 (λ (v_Vaa : ϵ (S.distinct_points (v_Vq) (v_Vs))),
 Rall
 (ι)
 (λ (v_Vba : τ (ι)),
 ∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (S.distinct_points (v_Vba) (v_Vca))
⇒
((S.distinct_points (v_Vba) (v_Vda))
∨
(S.distinct_points (v_Vca) (v_Vda))
)
)))
 (v_Vq)
 (λ (v_Vea : ϵ (∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vca))
⇒
((S.distinct_points (v_Vq) (v_Vda))
∨
(S.distinct_points (v_Vca) (v_Vda))
)
)))),
 Rall
 (ι)
 (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vca))
⇒
((S.distinct_points (v_Vq) (v_Vda))
∨
(S.distinct_points (v_Vca) (v_Vda))
)
))
 (v_Vs)
 (λ (v_Vfa : ϵ (∀α (λ (v_Vda : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vs))
⇒
((S.distinct_points (v_Vq) (v_Vda))
∨
(S.distinct_points (v_Vs) (v_Vda))
)
))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vs))
⇒
((S.distinct_points (v_Vq) (v_Vda))
∨
(S.distinct_points (v_Vs) (v_Vda))
)
)
 (v_Vu)
 (λ (v_Vga : ϵ ((S.distinct_points (v_Vq) (v_Vs))
⇒
((S.distinct_points (v_Vq) (v_Vu))
∨
(S.distinct_points (v_Vs) (v_Vu))
)
)),
 Rimply
 (S.distinct_points (v_Vq) (v_Vs))
 ((S.distinct_points (v_Vq) (v_Vu))
∨
(S.distinct_points (v_Vs) (v_Vu))
)
 (λ (v_Vha : ϵ (¬
 (S.distinct_points (v_Vq) (v_Vs)))),
 Raxiom
 (S.distinct_points (v_Vq) (v_Vs))
 (v_Vaa)
 (v_Vha)
)
 (λ (v_Via : ϵ ((S.distinct_points (v_Vq) (v_Vu))
∨
(S.distinct_points (v_Vs) (v_Vu))
)),
 Ror
 (S.distinct_points (v_Vq) (v_Vu))
 (S.distinct_points (v_Vs) (v_Vu))
 (λ (v_Vja : ϵ (S.distinct_points (v_Vq) (v_Vu))),
 Raxiom
 (S.distinct_points (v_Vq) (v_Vu))
 (v_Vja)
 (v_Vy)
)
 (λ (v_Vka : ϵ (S.distinct_points (v_Vs) (v_Vu))),
 Raxiom
 (S.distinct_points (v_Vs) (v_Vu))
 (v_Vka)
 (v_Vz)
)
 (v_Via)
)
 (v_Vga)
)
 (v_Vfa)
)
 (v_Vea)
)
 (S.apart4)
)
 (v_Vw)
)
 (v_Vx)
)
 (v_Vv)
)
 (v_Vt)
)
 (v_Vr)
)
 (v_Vp)
);
