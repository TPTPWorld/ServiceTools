ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p is ...
fof(everyone_a_knight_or_knave_0001,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave_0002,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1_0003,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2_0004,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1_0005,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2_0006,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3_0007,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes_0008,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).
fof(query_0009_0009,axiom,
    ! [Y,X] :
      ( ~ truth(isa(asked,X))
      | ~ truth(isa(other,Y)) ) ).
fof(everyone_a_knight_or_knave,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave) ).

ZenonModulo---0.4.2's everyone_a_knight_or_knave_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(everyone_a_knight_or_knave_0001,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave_0002,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1_0003,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2_0004,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1_0005,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2_0006,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3_0007,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes_0008,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).
fof(query_0009_0009,axiom,
    ! [Y,X] :
      ( ~ truth(isa(asked,X))
      | ~ truth(isa(other,Y)) ) ).
fof(everyone_a_knight_or_knave,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on everyone_a_knight_or_knave_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 1
max branch formulas: 10
proof nodes created: 1
formulas created: 330

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.everyone_a_knight_or_knave ↪ 
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
 (S.everyone_a_knight_or_knave_0001)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: everyone_a_knight_or_knave_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.06 WC = 0.13  NodesSearch = 1 MaxBranchF = 10 ProofNodes = 1 Formulas = 330
OUTPUT: everyone_a_knight_or_knave_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.06 WC = 0.13 
