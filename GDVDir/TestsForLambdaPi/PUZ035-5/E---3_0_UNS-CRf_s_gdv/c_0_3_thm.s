ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_3_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_3_thm.p is ...
fof(everyone_a_knight_or_knave,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave),
    [verified(leaf)] ).
fof(c_0_3,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave ).

ZenonModulo---0.4.2's c_0_3_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_3_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(everyone_a_knight_or_knave,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave),
    [verified(leaf)] ).
fof(c_0_3,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_3_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_3_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 1
max branch formulas: 2
proof nodes created: 1
formulas created: 147

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_3 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
)))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
))
 (S.everyone_a_knight_or_knave)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_3_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.01 WC = 0.12  NodesSearch = 1 MaxBranchF = 2 ProofNodes = 1 Formulas = 147
OUTPUT: c_0_3_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.01 WC = 0.12 
