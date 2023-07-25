ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p is ...
fof(c_0_17,axiom,
    country(usa),
    inference(split_conjunct,[status(thm)],[country_usa]),
    [verified(thm)] ).
fof(c_0_18,axiom,
    ! [X1] : ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    $false,
    inference(sr,[status(thm)],[c_0_17,c_0_18]),
    [proof] ).

ZenonModulo---0.4.2's c_0_19_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_17,axiom,
    country(usa),
    inference(split_conjunct,[status(thm)],[country_usa]),
    [verified(thm)] ).
fof(c_0_18,axiom,
    ! [X1] : ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    $false,
    inference(sr,[status(thm)],[c_0_17,c_0_18]),
    [proof] ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_19_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 4
max branch formulas: 5
proof nodes created: 2
formulas created: 139

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

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
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_19_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.04 WC = 0.11  NodesSearch = 4 MaxBranchF = 5 ProofNodes = 2 Formulas = 139
OUTPUT: c_0_19_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.04 WC = 0.11 
