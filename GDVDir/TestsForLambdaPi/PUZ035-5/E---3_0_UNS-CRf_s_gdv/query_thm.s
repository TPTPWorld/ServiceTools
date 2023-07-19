ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/query_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/query_thm.p is ...
fof(query_0009_0009,axiom,
    ! [Y,X] :
      ( ~ truth(isa(asked,X))
      | ~ truth(isa(other,Y)) ) ).
fof(query,conjecture,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query) ).

ZenonModulo---0.4.2's query_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/query_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(query_0009_0009,axiom,
    ! [Y,X] :
      ( ~ truth(isa(asked,X))
      | ~ truth(isa(other,Y)) ) ).
fof(query,conjecture,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on query_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/query_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 1
max branch formulas: 2
proof nodes created: 1
formulas created: 176

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.query ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vn))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vm))))
)))
    (λ (v_Vo : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vn))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vm))))
))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vn))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vm))))
)))
 (S.query_0009_0009)
 (v_Vo)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: query_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.07 WC = 0.12  NodesSearch = 1 MaxBranchF = 2 ProofNodes = 1 Formulas = 176
OUTPUT: query_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.07 WC = 0.12 
