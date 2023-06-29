ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con_thm.p is ...
fof(con,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).
fof(con,conjecture,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & convergent_lines(X4,X5)
        & distinct_lines(X4,line_connecting(X1,X2)) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X2,X4) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',con) ).

ZenonModuloLP---0.4.2's con_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(con,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).
fof(con,conjecture,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & convergent_lines(X4,X5)
        & distinct_lines(X4,line_connecting(X1,X2)) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X2,X4) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',con) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on con_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
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
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
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

(λ (v_Vq : ϵ (¬
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
 (v_Vq)
);
% SZS end Proof
nodes searched: 1
max branch formulas: 2
proof nodes created: 1
formulas created: 212

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: con_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.07 WC = 0.13 
OUTPUT: con_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.07 WC = 0.13 
