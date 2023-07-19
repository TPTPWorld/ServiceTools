require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.Signature as S;

rule S.everyone_a_knight_or_knave ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
)))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
))
 (S.everyone_a_knight_or_knave_0001_0001)
 (v_Vn)
);
