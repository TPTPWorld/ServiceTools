require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require TUT001+1.E---3_0_THM-CRf_s_gdv.Signature as S;
require TUT001+1.E---3_0_THM-CRf_s_gdv.country_usa_thm ;

rule S.c_0_17 ↪ λ c_0_5,

  nnpp (S.country (S.usa))
    (λ (v_Vm : ϵ (¬
 (S.country (S.usa)))),
 Raxiom
 (S.country (S.usa))
 (S.country_usa c_0_5)
 (v_Vm)
);
