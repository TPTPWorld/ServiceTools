require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.con1 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
⇒
((S.distinct_points (v_Vo) (v_Vm))
∧
(S.distinct_points (v_Vo) (v_Vn))
)
)
))))
    (λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
⇒
((S.distinct_points (v_Vo) (v_Vm))
∧
(S.distinct_points (v_Vo) (v_Vn))
)
)
)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
⇒
((S.distinct_points (v_Vo) (v_Vm))
∧
(S.distinct_points (v_Vo) (v_Vn))
)
)
))))
 (S.con1_0007)
 (v_Vp)
);
