require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.Signature as S;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.c_0_3_thm ;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.c_0_2_thm ;

rule S.c_0_4 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.truth (S.isa (S.other) (v_Vm)))))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.truth (S.isa (S.other) (v_Vm))))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (S.truth (S.isa (S.other) (v_Vm))))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (S.truth (S.isa (S.other) (v_Vo)))))),
 Rnotnot
 (S.truth (S.isa (S.other) (v_Vo)))
 (λ (v_Vq : ϵ (S.truth (S.isa (S.other) (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vr : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vr))))
))
 (v_Vo)
 (λ (v_Vs : ϵ (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)
 (S.knave)
 (λ (v_Vt : ϵ ((¬
 (S.truth (S.isa (S.asked) (S.knave))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)),
 Ror
 (¬
 (S.truth (S.isa (S.asked) (S.knave))))
 (¬
 (S.truth (S.isa (S.other) (v_Vo))))
 (λ (v_Vu : ϵ (¬
 (S.truth (S.isa (S.asked) (S.knave))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
)
 (S.asked)
 (λ (v_Vv : ϵ ((S.truth (S.isa (S.asked) (S.knight)))
∨
(S.truth (S.isa (S.asked) (S.knave)))
)),
 Ror
 (S.truth (S.isa (S.asked) (S.knight)))
 (S.truth (S.isa (S.asked) (S.knave)))
 (λ (v_Vw : ϵ (S.truth (S.isa (S.asked) (S.knight)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)
 (S.knight)
 (λ (v_Vx : ϵ ((¬
 (S.truth (S.isa (S.asked) (S.knight))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)),
 Ror
 (¬
 (S.truth (S.isa (S.asked) (S.knight))))
 (¬
 (S.truth (S.isa (S.other) (v_Vo))))
 (λ (v_Vy : ϵ (¬
 (S.truth (S.isa (S.asked) (S.knight))))),
 Raxiom
 (S.truth (S.isa (S.asked) (S.knight)))
 (v_Vw)
 (v_Vy)
)
 (λ (v_Vz : ϵ (¬
 (S.truth (S.isa (S.other) (v_Vo))))),
 Raxiom
 (S.truth (S.isa (S.other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vx)
)
 (v_Vs)
)
 (λ (v_Vaa : ϵ (S.truth (S.isa (S.asked) (S.knave)))),
 Raxiom
 (S.truth (S.isa (S.asked) (S.knave)))
 (v_Vaa)
 (v_Vu)
)
 (v_Vv)
)
 (S.c_0_3)
)
 (λ (v_Vz : ϵ (¬
 (S.truth (S.isa (S.other) (v_Vo))))),
 Raxiom
 (S.truth (S.isa (S.other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vt)
)
 (v_Vs)
)
 (S.c_0_2)
)
 (v_Vp)
)
 (v_Vn)
);
