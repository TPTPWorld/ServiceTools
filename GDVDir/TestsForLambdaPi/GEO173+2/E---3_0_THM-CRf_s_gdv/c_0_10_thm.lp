require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require GEO173+2.E---3_0_THM-CRf_s_gdv.Signature as S;
require GEO173+2.E---3_0_THM-CRf_s_gdv.c_0_6_thm ;

rule S.c_0_10 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.distinct_points (v_Vm) (v_Vm))))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.distinct_points (v_Vm) (v_Vm)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.distinct_points (v_Vm) (v_Vm))))
 (S.c_0_6)
 (v_Vn)
);
