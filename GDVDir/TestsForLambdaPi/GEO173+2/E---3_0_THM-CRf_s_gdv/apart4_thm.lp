require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require GEO173+2.E---3_0_THM-CRf_s_gdv.Signature as S;

rule S.apart4 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.distinct_points (v_Vm) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
))))
    (λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.distinct_points (v_Vm) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.distinct_points (v_Vm) (v_Vo))
∨
(S.distinct_points (v_Vn) (v_Vo))
)
))))
 (S.apart4_0004)
 (v_Vp)
);
