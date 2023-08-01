ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_10_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_10_thm.p is ...
fof(crime_axiom,axiom,
    ! [X1] :
      ( big_city(X1)
     => has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',crime_axiom),
    [nnpp(c_0_5),verified(leaf)] ).
fof(c_0_10,conjecture,
    ! [X3] :
      ( ~ big_city(X3)
      | has_crime(X3) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[crime_axiom])]),
    [nnpp(c_0_5)] ).

ZenonModulo---0.4.2's c_0_10_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_10_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(crime_axiom,axiom,
    ! [X1] :
      ( big_city(X1)
     => has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',crime_axiom),
    [nnpp(c_0_5),verified(leaf)] ).
fof(c_0_10,conjecture,
    ! [X3] :
      ( ~ big_city(X3)
      | has_crime(X3) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[crime_axiom])]),
    [nnpp(c_0_5)] ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_10_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_10_thm.p'
% START OF SYSTEM OUTPUT
Rnning zenon_modulo -p0 -itptp -olpterm -x arith -neg-conj=c_0_5 -max-time 60s -max-size 12G -sig LAMBDAPI_CONTEXT.Signature TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_10_thm.p > /tmp/tmp.N8zQjEdGdN/ZenonModulo_50981.s
% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_10 ↪ λ c_0_5,

  nnpp (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (v_Vm)))
∨
(S.has_crime (v_Vm))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (v_Vm)))
∨
(S.has_crime (v_Vm))
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (v_Vm)))
∨
(S.has_crime (v_Vm))
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((¬
 (S.big_city (v_Vo)))
∨
(S.has_crime (v_Vo))
))),
 Rnotor
 (¬
 (S.big_city (v_Vo)))
 (S.has_crime (v_Vo))
 (λ (v_Vq : ϵ (¬
 (¬
 (S.big_city (v_Vo))))),
 λ (v_Vr : ϵ (¬
 (S.has_crime (v_Vo)))),
 Rnotnot
 (S.big_city (v_Vo))
 (λ (v_Vs : ϵ (S.big_city (v_Vo))),
 Rall
 (ι)
 (λ (v_Vt : τ (ι)),
 (S.big_city (v_Vt))
⇒
(S.has_crime (v_Vt))
)
 (v_Vo)
 (λ (v_Vu : ϵ ((S.big_city (v_Vo))
⇒
(S.has_crime (v_Vo))
)),
 Rimply
 (S.big_city (v_Vo))
 (S.has_crime (v_Vo))
 (λ (v_Vv : ϵ (¬
 (S.big_city (v_Vo)))),
 Raxiom
 (S.big_city (v_Vo))
 (v_Vs)
 (v_Vv)
)
 (λ (v_Vw : ϵ (S.has_crime (v_Vo))),
 Raxiom
 (S.has_crime (v_Vo))
 (v_Vw)
 (v_Vr)
)
 (v_Vu)
)
 (S.crime_axiom c_0_5)
)
 (v_Vq)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_10_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.06 WC = 0.14 
OUTPUT: c_0_10_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.06 WC = 0.14 
