require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require GEO173+2.E---3_0_THM-CRf_s_gdv.Signature as S;
require GEO173+2.E---3_0_THM-CRf_s_gdv.c_0_16_thm ;
require GEO173+2.E---3_0_THM-CRf_s_gdv.c_0_15_thm ;

rule S.c_0_19 ↪ 
  nnpp (S.distinct_points (S.esk2_0) (S.esk1_0))
    (λ (v_Vm : ϵ (¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 (S.distinct_points (S.esk1_0) (v_Vn))
∨
(S.distinct_points (S.esk2_0) (v_Vn))
)
 (S.esk1_0)
 (λ (v_Vo : ϵ ((S.distinct_points (S.esk1_0) (S.esk1_0))
∨
(S.distinct_points (S.esk2_0) (S.esk1_0))
)),
 Ror
 (S.distinct_points (S.esk1_0) (S.esk1_0))
 (S.distinct_points (S.esk2_0) (S.esk1_0))
 (λ (v_Vp : ϵ (S.distinct_points (S.esk1_0) (S.esk1_0))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 ¬
 (S.distinct_points (v_Vn) (v_Vn)))
 (S.esk1_0)
 (λ (v_Vq : ϵ (¬
 (S.distinct_points (S.esk1_0) (S.esk1_0)))),
 Raxiom
 (S.distinct_points (S.esk1_0) (S.esk1_0))
 (v_Vp)
 (v_Vq)
)
 (S.c_0_15)
)
 (λ (v_Vr : ϵ (S.distinct_points (S.esk2_0) (S.esk1_0))),
 Raxiom
 (S.distinct_points (S.esk2_0) (S.esk1_0))
 (v_Vr)
 (v_Vm)
)
 (v_Vo)
)
 (S.c_0_16)
);
