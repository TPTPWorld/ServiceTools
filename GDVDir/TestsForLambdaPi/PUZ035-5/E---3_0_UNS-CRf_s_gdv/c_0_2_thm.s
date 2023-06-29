ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_2_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_2_thm.p is ...
fof(query,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query),
    [verified(leaf)] ).
fof(c_0_2,conjecture,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query ).

ZenonModuloLP---0.4.2's c_0_2_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_2_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(query,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    file('/export/starexec/sandbox2/benchmark/theBenchmark.p',query),
    [verified(leaf)] ).
fof(c_0_2,conjecture,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_2_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_2_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
)))

(λ (v_Vo : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
)))
 (ax_query)
 (v_Vo)
);
% SZS end Proof
nodes searched: 1
max branch formulas: 2
proof nodes created: 1
formulas created: 155

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_2_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.00 WC = 0.08 
OUTPUT: c_0_2_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.00 WC = 0.08 
