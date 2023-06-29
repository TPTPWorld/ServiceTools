ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p is ...
fof(everyone_a_knight_or_knave,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).
fof(everyone_a_knight_or_knave,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave) ).

ZenonModuloLP---0.4.2's everyone_a_knight_or_knave_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(everyone_a_knight_or_knave,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).
fof(everyone_a_knight_or_knave,conjecture,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',everyone_a_knight_or_knave) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on everyone_a_knight_or_knave_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/everyone_a_knight_or_knave_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
)) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
)))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
))
 (ax_everyone_a_knight_or_knave)
 (v_Vn)
);
% SZS end Proof
nodes searched: 1
max branch formulas: 9
proof nodes created: 1
formulas created: 301

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: everyone_a_knight_or_knave_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.00 WC = 0.08 
OUTPUT: everyone_a_knight_or_knave_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.00 WC = 0.08 
