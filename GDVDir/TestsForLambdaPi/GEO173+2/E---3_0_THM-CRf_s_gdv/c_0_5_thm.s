ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p is ...
fof(con,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & convergent_lines(X4,X5)
        & distinct_lines(X4,line_connecting(X1,X2)) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X2,X4) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',con),
    [verified(leaf)] ).
fof(c_0_5,conjecture,
    ~ ~ ! [X1,X2,X4,X5] :
          ( ( distinct_points(X1,X2)
            & convergent_lines(X4,X5)
            & distinct_lines(X4,line_connecting(X1,X2)) )
         => ( apart_point_and_line(X1,X4)
            | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]) ).

ZenonModulo---0.4.2's c_0_5_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(con,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & convergent_lines(X4,X5)
        & distinct_lines(X4,line_connecting(X1,X2)) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X2,X4) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',con),
    [verified(leaf)] ).
fof(c_0_5,conjecture,
    ~ ~ ! [X1,X2,X4,X5] :
          ( ( distinct_points(X1,X2)
            & convergent_lines(X4,X5)
            & distinct_lines(X4,line_connecting(X1,X2)) )
         => ( apart_point_and_line(X1,X4)
            | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_5_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 2
max branch formulas: 3
proof nodes created: 2
formulas created: 179

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_5 ↪ 
  nnpp (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (v_Vm) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
)))))))
    (λ (v_Vq : ϵ (¬
 (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (v_Vm) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
))))))))),
 Rnotnot
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (v_Vm) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
))))))
 (λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (v_Vm) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
))))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (v_Vm) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (v_Vm) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
)))))
 (S.con)
 (v_Vr)
)
 (v_Vq)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_5_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.05 WC = 0.13  NodesSearch = 2 MaxBranchF = 3 ProofNodes = 2 Formulas = 179
OUTPUT: c_0_5_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.05 WC = 0.13 
