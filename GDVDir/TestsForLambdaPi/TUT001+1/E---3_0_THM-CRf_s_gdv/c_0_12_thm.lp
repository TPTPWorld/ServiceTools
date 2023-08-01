require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_9_thm ;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_8_thm ;

rule S.c_0_12 ↪ λ c_0_5,

  nnpp (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.has_crime (S.capital_of (v_Vm))))
∨
((¬
 (S.city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.has_crime (S.capital_of (v_Vm))))
∨
((¬
 (S.city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.has_crime (S.capital_of (v_Vm))))
∨
((¬
 (S.city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((¬
 (S.has_crime (S.capital_of (v_Vo))))
∨
((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
))),
 Rnotor
 (¬
 (S.has_crime (S.capital_of (v_Vo))))
 ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
 (λ (v_Vq : ϵ (¬
 (¬
 (S.has_crime (S.capital_of (v_Vo)))))),
 λ (v_Vr : ϵ (¬
 ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (¬
 (S.city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vs : ϵ (¬
 (¬
 (S.city (S.capital_of (v_Vo)))))),
 λ (v_Vt : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vu : ϵ (S.country (v_Vo))),
 Rnotnot
 (S.city (S.capital_of (v_Vo)))
 (λ (v_Vv : ϵ (S.city (S.capital_of (v_Vo)))),
 Rnotnot
 (S.has_crime (S.capital_of (v_Vo)))
 (λ (v_Vw : ϵ (S.has_crime (S.capital_of (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
 (v_Vo)
 (λ (v_Vx : ϵ ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)),
 Ror
 (S.beautiful (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vy : ϵ (S.beautiful (S.capital_of (v_Vo)))),
 Rall
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
 (S.capital_of (v_Vo))
 (λ (v_Vz : ϵ ((¬
 (S.city (S.capital_of (v_Vo))))
∨
((¬
 (S.beautiful (S.capital_of (v_Vo))))
∨
(¬
 (S.has_crime (S.capital_of (v_Vo))))
)
)),
 Ror
 (¬
 (S.city (S.capital_of (v_Vo))))
 ((¬
 (S.beautiful (S.capital_of (v_Vo))))
∨
(¬
 (S.has_crime (S.capital_of (v_Vo))))
)
 (λ (v_Vaa : ϵ (¬
 (S.city (S.capital_of (v_Vo))))),
 Raxiom
 (S.city (S.capital_of (v_Vo)))
 (v_Vv)
 (v_Vaa)
)
 (λ (v_Vba : ϵ ((¬
 (S.beautiful (S.capital_of (v_Vo))))
∨
(¬
 (S.has_crime (S.capital_of (v_Vo))))
)),
 Ror
 (¬
 (S.beautiful (S.capital_of (v_Vo))))
 (¬
 (S.has_crime (S.capital_of (v_Vo))))
 (λ (v_Vca : ϵ (¬
 (S.beautiful (S.capital_of (v_Vo))))),
 Raxiom
 (S.beautiful (S.capital_of (v_Vo)))
 (v_Vy)
 (v_Vca)
)
 (λ (v_Vda : ϵ (¬
 (S.has_crime (S.capital_of (v_Vo))))),
 Raxiom
 (S.has_crime (S.capital_of (v_Vo)))
 (v_Vw)
 (v_Vda)
)
 (v_Vba)
)
 (v_Vz)
)
 (S.c_0_8 c_0_5)
)
 (λ (v_Vea : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vu)
 (v_Vea)
)
 (v_Vx)
)
 (S.c_0_9 c_0_5)
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
