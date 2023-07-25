require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_7_thm ;

rule S.c_0_15 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
))),
 Rall
 (ι)
 (λ (v_Vq : τ (ι)),
 ((S.big_city (S.capital_of (v_Vq)))
∨
(¬
 (S.country (v_Vq)))
)
∧
((S.beautiful (S.capital_of (v_Vq)))
∨
(¬
 (S.country (v_Vq)))
)
)
 (v_Vo)
 (λ (v_Vr : ϵ (((S.big_city (S.capital_of (v_Vo)))
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
)),
 Rand
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
 (λ (v_Vs : ϵ ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)),
 λ (v_Vt : ϵ ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)),
 Raxiom
 ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
 (v_Vs)
 (v_Vp)
)
 (v_Vr)
)
 (S.c_0_7)
)
 (v_Vn)
);
