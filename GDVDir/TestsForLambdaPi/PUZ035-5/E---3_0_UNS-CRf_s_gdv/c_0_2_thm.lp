require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.Signature as S;

rule S.c_0_2 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vn))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vm))))
)))
    (λ (v_Vo : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vn))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vm))))
))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vn))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vm))))
)))
 (S.query)
 (v_Vo)
);
