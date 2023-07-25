require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_18_thm ;
require TUT001+1.E---3_0_THM-CRf_s_gdv.c_0_17_thm ;

rule S.c_0_19 ↪ 
  nnpp (⊥)
    (λ (v_Vm : ϵ (¬
 (⊥))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 ¬
 (S.country (v_Vn)))
 (S.usa)
 (λ (v_Vo : ϵ (¬
 (S.country (S.usa)))),
 Raxiom
 (S.country (S.usa))
 (S.c_0_17)
 (v_Vo)
)
 (S.c_0_18)
);
