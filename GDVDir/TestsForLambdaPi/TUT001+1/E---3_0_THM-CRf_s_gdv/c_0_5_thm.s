ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p is ...
fof(some_beautiful_crime,axiom,
    ? [X1] :
      ( city(X1)
      & beautiful(X1)
      & has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',some_beautiful_crime) ).
fof(c_0_5,conjecture,
    ~ ~ ? [X1] :
          ( city(X1)
          & beautiful(X1)
          & has_crime(X1) ),
    inference(assume_negation,[status(cth)],[some_beautiful_crime]),
    [nnpp(c_0_5)] ).

ZenonModulo---0.4.2's c_0_5_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(some_beautiful_crime,axiom,
    ? [X1] :
      ( city(X1)
      & beautiful(X1)
      & has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',some_beautiful_crime) ).
fof(c_0_5,conjecture,
    ~ ~ ? [X1] :
          ( city(X1)
          & beautiful(X1)
          & has_crime(X1) ),
    inference(assume_negation,[status(cth)],[some_beautiful_crime]),
    [nnpp(c_0_5)] ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_5_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 4
max branch formulas: 7
proof nodes created: 2
formulas created: 148

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_5 ↪ 
  nnpp (¬
 (¬
 (∃α (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∧
((S.beautiful (v_Vm))
∧
(S.has_crime (v_Vm))
)
))))
    (λ (v_Vn : ϵ (¬
 (¬
 (¬
 (∃α (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∧
((S.beautiful (v_Vm))
∧
(S.has_crime (v_Vm))
)
)))))),
 Rnotnot
 (¬
 (∃α (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∧
((S.beautiful (v_Vm))
∧
(S.has_crime (v_Vm))
)
)))
 (λ (v_Vo : ϵ (¬
 (∃α (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∧
((S.beautiful (v_Vm))
∧
(S.has_crime (v_Vm))
)
)))),
 Raxiom
 (∃α (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∧
((S.beautiful (v_Vm))
∧
(S.has_crime (v_Vm))
)
))
 (S.some_beautiful_crime)
 (v_Vo)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_5_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.06 WC = 0.12  NodesSearch = 4 MaxBranchF = 7 ProofNodes = 2 Formulas = 148
OUTPUT: c_0_5_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.06 WC = 0.12 
