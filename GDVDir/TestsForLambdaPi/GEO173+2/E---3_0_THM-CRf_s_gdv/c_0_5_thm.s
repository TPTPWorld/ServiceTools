ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p is ...
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

ZenonModuloLP---0.4.2's c_0_5_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
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

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_5_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_5_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))) 
 ≔ 
 nnpp (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
)))))))

(λ (v_Vq : ϵ (¬
 (¬
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))))),
 Rnotnot
 (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))
 (λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
))))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((distinct_points (v_Vm) (v_Vn))
∧
((convergent_lines (v_Vo) (v_Vp))
∧
(distinct_lines (v_Vo) (line_connecting (v_Vm) (v_Vn)))
)
)
⇒
((apart_point_and_line (v_Vm) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vo))
)
)))))
 (ax_con)
 (v_Vr)
)
 (v_Vq)
);
% SZS end Proof
nodes searched: 2
max branch formulas: 3
proof nodes created: 2
formulas created: 179

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_5_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.05 WC = 0.16 
OUTPUT: c_0_5_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.05 WC = 0.16 
