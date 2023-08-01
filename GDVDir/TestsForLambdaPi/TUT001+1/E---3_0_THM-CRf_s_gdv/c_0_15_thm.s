ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p is ...
fof(c_0_7,axiom,
    ! [X4] :
      ( ( big_city(capital_of(X4))
        | ~ country(X4) )
      & ( beautiful(capital_of(X4))
        | ~ country(X4) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[country_big_city])])]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] :
      ( big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [nnpp(c_0_5)] ).

ZenonModulo---0.4.2's c_0_15_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_7,axiom,
    ! [X4] :
      ( ( big_city(capital_of(X4))
        | ~ country(X4) )
      & ( beautiful(capital_of(X4))
        | ~ country(X4) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[country_big_city])])]),
    [nnpp(c_0_5),verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] :
      ( big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [nnpp(c_0_5)] ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_15_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p'
% START OF SYSTEM OUTPUT
Rnning zenon_modulo -p0 -itptp -olpterm -x arith -neg-conj=c_0_5 -max-time 60s -max-size 12G -sig LAMBDAPI_CONTEXT.Signature TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p > /tmp/tmp.WvUH2TXfbE/ZenonModulo_51162.s
% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_15 ↪ λ c_0_5,

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
 (S.c_0_7 c_0_5)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_15_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.06 WC = 0.12 
OUTPUT: c_0_15_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.06 WC = 0.13 
