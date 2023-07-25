require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_14_thm ;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_13_thm ;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_12_thm ;

rule S.c_0_16 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((¬
 (S.big_city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vq : ϵ (¬
 (¬
 (S.big_city (S.capital_of (v_Vo)))))),
 λ (v_Vr : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.big_city (S.capital_of (v_Vo)))
 (λ (v_Vs : ϵ (S.big_city (S.capital_of (v_Vo)))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vt : ϵ (S.country (v_Vo))),
 Rall
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
 (v_Vo)
 (λ (v_Vu : ϵ ((¬
 (S.has_crime (S.capital_of (v_Vo))))
∨
((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
)),
 Ror
 (¬
 (S.has_crime (S.capital_of (v_Vo))))
 ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
 (λ (v_Vv : ϵ (¬
 (S.has_crime (S.capital_of (v_Vo))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.has_crime (v_Vm))
∨
(¬
 (S.big_city (v_Vm)))
)
 (S.capital_of (v_Vo))
 (λ (v_Vw : ϵ ((S.has_crime (S.capital_of (v_Vo)))
∨
(¬
 (S.big_city (S.capital_of (v_Vo))))
)),
 Ror
 (S.has_crime (S.capital_of (v_Vo)))
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (λ (v_Vx : ϵ (S.has_crime (S.capital_of (v_Vo)))),
 Raxiom
 (S.has_crime (S.capital_of (v_Vo)))
 (v_Vx)
 (v_Vv)
)
 (λ (v_Vy : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vs)
 (v_Vy)
)
 (v_Vw)
)
 (S.c_0_13)
)
 (λ (v_Vz : ϵ ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)),
 Ror
 (¬
 (S.city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vaa : ϵ (¬
 (S.city (S.capital_of (v_Vo))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∨
(¬
 (S.big_city (v_Vm)))
)
 (S.capital_of (v_Vo))
 (λ (v_Vba : ϵ ((S.city (S.capital_of (v_Vo)))
∨
(¬
 (S.big_city (S.capital_of (v_Vo))))
)),
 Ror
 (S.city (S.capital_of (v_Vo)))
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (λ (v_Vca : ϵ (S.city (S.capital_of (v_Vo)))),
 Raxiom
 (S.city (S.capital_of (v_Vo)))
 (v_Vca)
 (v_Vaa)
)
 (λ (v_Vy : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vs)
 (v_Vy)
)
 (v_Vba)
)
 (S.c_0_14)
)
 (λ (v_Vda : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vt)
 (v_Vda)
)
 (v_Vz)
)
 (v_Vu)
)
 (S.c_0_12)
)
 (v_Vr)
)
 (v_Vq)
)
 (v_Vp)
)
 (v_Vn)
);
