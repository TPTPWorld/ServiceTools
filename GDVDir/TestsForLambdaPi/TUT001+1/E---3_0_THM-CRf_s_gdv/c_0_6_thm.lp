require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_5_thm ;

rule S.c_0_6 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.city (v_Vm)))
∨
((¬
 (S.beautiful (v_Vm)))
∨
(¬
 (S.has_crime (v_Vm)))
)
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.city (v_Vm)))
∨
((¬
 (S.beautiful (v_Vm)))
∨
(¬
 (S.has_crime (v_Vm)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.city (v_Vm)))
∨
((¬
 (S.beautiful (v_Vm)))
∨
(¬
 (S.has_crime (v_Vm)))
)
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((¬
 (S.city (v_Vo)))
∨
((¬
 (S.beautiful (v_Vo)))
∨
(¬
 (S.has_crime (v_Vo)))
)
))),
 Rnotor
 (¬
 (S.city (v_Vo)))
 ((¬
 (S.beautiful (v_Vo)))
∨
(¬
 (S.has_crime (v_Vo)))
)
 (λ (v_Vq : ϵ (¬
 (¬
 (S.city (v_Vo))))),
 λ (v_Vr : ϵ (¬
 ((¬
 (S.beautiful (v_Vo)))
∨
(¬
 (S.has_crime (v_Vo)))
))),
 Rnotor
 (¬
 (S.beautiful (v_Vo)))
 (¬
 (S.has_crime (v_Vo)))
 (λ (v_Vs : ϵ (¬
 (¬
 (S.beautiful (v_Vo))))),
 λ (v_Vt : ϵ (¬
 (¬
 (S.has_crime (v_Vo))))),
 Rnotnot
 (S.has_crime (v_Vo))
 (λ (v_Vu : ϵ (S.has_crime (v_Vo))),
 Rnotnot
 (S.beautiful (v_Vo))
 (λ (v_Vv : ϵ (S.beautiful (v_Vo))),
 Rnotnot
 (S.city (v_Vo))
 (λ (v_Vw : ϵ (S.city (v_Vo))),
 Rnotex
 (ι)
 (λ (v_Vx : τ (ι)),
 (S.city (v_Vx))
∧
((S.beautiful (v_Vx))
∧
(S.has_crime (v_Vx))
)
)
 (v_Vo)
 (λ (v_Vy : ϵ (¬
 ((S.city (v_Vo))
∧
((S.beautiful (v_Vo))
∧
(S.has_crime (v_Vo))
)
))),
 Rnotand
 (S.city (v_Vo))
 ((S.beautiful (v_Vo))
∧
(S.has_crime (v_Vo))
)
 (λ (v_Vz : ϵ (¬
 (S.city (v_Vo)))),
 Raxiom
 (S.city (v_Vo))
 (v_Vw)
 (v_Vz)
)
 (λ (v_Vaa : ϵ (¬
 ((S.beautiful (v_Vo))
∧
(S.has_crime (v_Vo))
))),
 Rnotand
 (S.beautiful (v_Vo))
 (S.has_crime (v_Vo))
 (λ (v_Vba : ϵ (¬
 (S.beautiful (v_Vo)))),
 Raxiom
 (S.beautiful (v_Vo))
 (v_Vv)
 (v_Vba)
)
 (λ (v_Vca : ϵ (¬
 (S.has_crime (v_Vo)))),
 Raxiom
 (S.has_crime (v_Vo))
 (v_Vu)
 (v_Vca)
)
 (v_Vaa)
)
 (v_Vy)
)
 (S.c_0_5)
)
 (v_Vq)
)
 (v_Vs)
)
 (v_Vt)
)
 (v_Vr)
)
 (v_Vp)
)
 (v_Vn)
);
