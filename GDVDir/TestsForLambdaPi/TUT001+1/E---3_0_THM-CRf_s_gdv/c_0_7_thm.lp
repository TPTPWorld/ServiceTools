require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.country_big_city_thm ;

rule S.c_0_7 ↪ λ c_0_5,

  nnpp (∀α (λ (v_Vm : τ (ι)),
 ((S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
∧
((S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ((S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
∧
((S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ((S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
∧
((S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
∧
((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
))),
 Rnotand
 ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
 ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
 (λ (v_Vq : ϵ (¬
 ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (S.big_city (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vr : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 λ (v_Vs : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vt : ϵ (S.country (v_Vo))),
 Rall
 (ι)
 (λ (v_Vu : τ (ι)),
 (S.country (v_Vu))
⇒
((S.big_city (S.capital_of (v_Vu)))
∧
(S.beautiful (S.capital_of (v_Vu)))
)
)
 (v_Vo)
 (λ (v_Vv : ϵ ((S.country (v_Vo))
⇒
((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
)),
 Rimply
 (S.country (v_Vo))
 ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
 (λ (v_Vw : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vt)
 (v_Vw)
)
 (λ (v_Vx : ϵ ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)),
 Rand
 (S.big_city (S.capital_of (v_Vo)))
 (S.beautiful (S.capital_of (v_Vo)))
 (λ (v_Vy : ϵ (S.big_city (S.capital_of (v_Vo)))),
 λ (v_Vz : ϵ (S.beautiful (S.capital_of (v_Vo)))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vy)
 (v_Vr)
)
 (v_Vx)
)
 (v_Vv)
)
 (S.country_big_city c_0_5)
)
 (v_Vs)
)
 (v_Vq)
)
 (λ (v_Vaa : ϵ (¬
 ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (S.beautiful (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vba : ϵ (¬
 (S.beautiful (S.capital_of (v_Vo))))),
 λ (v_Vs : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vt : ϵ (S.country (v_Vo))),
 Rall
 (ι)
 (λ (v_Vu : τ (ι)),
 (S.country (v_Vu))
⇒
((S.big_city (S.capital_of (v_Vu)))
∧
(S.beautiful (S.capital_of (v_Vu)))
)
)
 (v_Vo)
 (λ (v_Vv : ϵ ((S.country (v_Vo))
⇒
((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
)),
 Rimply
 (S.country (v_Vo))
 ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
 (λ (v_Vw : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vt)
 (v_Vw)
)
 (λ (v_Vx : ϵ ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)),
 Rand
 (S.big_city (S.capital_of (v_Vo)))
 (S.beautiful (S.capital_of (v_Vo)))
 (λ (v_Vy : ϵ (S.big_city (S.capital_of (v_Vo)))),
 λ (v_Vz : ϵ (S.beautiful (S.capital_of (v_Vo)))),
 Raxiom
 (S.beautiful (S.capital_of (v_Vo)))
 (v_Vz)
 (v_Vba)
)
 (v_Vx)
)
 (v_Vv)
)
 (S.country_big_city c_0_5)
)
 (v_Vs)
)
 (v_Vaa)
)
 (v_Vp)
)
 (v_Vn)
);
