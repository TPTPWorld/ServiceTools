ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p is ...
fof(c_0_10,axiom,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

ZenonModulo---0.4.2's c_0_15_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_10,axiom,
    ! [X6] : ~ distinct_points(X6,X6),
    inference(variable_rename,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_15,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_15_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_15_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 1
max branch formulas: 2
proof nodes created: 1
formulas created: 134

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_15 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.distinct_points (v_Vm) (v_Vm))))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.distinct_points (v_Vm) (v_Vm)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.distinct_points (v_Vm) (v_Vm))))
 (S.c_0_10)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_15_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.04 WC = 0.10  NodesSearch = 1 MaxBranchF = 2 ProofNodes = 1 Formulas = 134
OUTPUT: c_0_15_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.04 WC = 0.10 
