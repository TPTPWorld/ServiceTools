ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p is ...
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).

ZenonModulo---0.4.2's c_0_19_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_19_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_19_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 7
max branch formulas: 7
proof nodes created: 4
formulas created: 160

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_19 ↪ 
  nnpp (S.distinct_points (S.esk2_0) (S.esk1_0))
    (λ (v_Vm : ϵ (¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 (S.distinct_points (S.esk1_0) (v_Vn))
∨
(S.distinct_points (S.esk2_0) (v_Vn))
)
 (S.esk1_0)
 (λ (v_Vo : ϵ ((S.distinct_points (S.esk1_0) (S.esk1_0))
∨
(S.distinct_points (S.esk2_0) (S.esk1_0))
)),
 Ror
 (S.distinct_points (S.esk1_0) (S.esk1_0))
 (S.distinct_points (S.esk2_0) (S.esk1_0))
 (λ (v_Vp : ϵ (⊥)),
 Rfalse
 (v_Vp))
 (λ (v_Vq : ϵ (S.distinct_points (S.esk2_0) (S.esk1_0))),
 Raxiom
 (S.distinct_points (S.esk2_0) (S.esk1_0))
 (v_Vq)
 (v_Vm)
)
 (v_Vo)
)
 (S.c_0_16)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_19_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.04 WC = 0.11  NodesSearch = 7 MaxBranchF = 7 ProofNodes = 4 Formulas = 160
OUTPUT: c_0_19_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.04 WC = 0.11 
