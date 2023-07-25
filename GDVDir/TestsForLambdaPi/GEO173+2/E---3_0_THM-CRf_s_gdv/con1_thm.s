ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con1_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con1_thm.p is ...
fof(apart1_0001,axiom,
    ! [X] : ~ distinct_points(X,X) ).
fof(apart2_0002,axiom,
    ! [X] : ~ distinct_lines(X,X) ).
fof(apart3_0003,axiom,
    ! [X] : ~ convergent_lines(X,X) ).
fof(apart4_0004,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( distinct_points(X,Z)
        | distinct_points(Y,Z) ) ) ).
fof(apart5_0005,axiom,
    ! [X,Y,Z] :
      ( distinct_lines(X,Y)
     => ( distinct_lines(X,Z)
        | distinct_lines(Y,Z) ) ) ).
fof(apart6_0006,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( convergent_lines(X,Z)
        | convergent_lines(Y,Z) ) ) ).
fof(con1_0007,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( apart_point_and_line(Z,line_connecting(X,Y))
       => ( distinct_points(Z,X)
          & distinct_points(Z,Y) ) ) ) ).
fof(con2_0008,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( ( apart_point_and_line(Z,X)
          | apart_point_and_line(Z,Y) )
       => distinct_points(Z,intersection_point(X,Y)) ) ) ).
fof(cu1_0009,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & distinct_lines(U,V) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(X,V)
        | apart_point_and_line(Y,U)
        | apart_point_and_line(Y,V) ) ) ).
fof(ceq1_0010,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_points(X,Z)
        | apart_point_and_line(Z,Y) ) ) ).
fof(ceq2_0011,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_lines(Y,Z)
        | apart_point_and_line(X,Z) ) ) ).
fof(ceq3_0012,axiom,
    ! [X,Y] :
      ( convergent_lines(X,Y)
     => distinct_lines(X,Y) ) ).
fof(con_0013,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).
fof(con1,conjecture,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1) ).

ZenonModulo---0.4.2's con1_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con1_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(apart1_0001,axiom,
    ! [X] : ~ distinct_points(X,X) ).
fof(apart2_0002,axiom,
    ! [X] : ~ distinct_lines(X,X) ).
fof(apart3_0003,axiom,
    ! [X] : ~ convergent_lines(X,X) ).
fof(apart4_0004,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( distinct_points(X,Z)
        | distinct_points(Y,Z) ) ) ).
fof(apart5_0005,axiom,
    ! [X,Y,Z] :
      ( distinct_lines(X,Y)
     => ( distinct_lines(X,Z)
        | distinct_lines(Y,Z) ) ) ).
fof(apart6_0006,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( convergent_lines(X,Z)
        | convergent_lines(Y,Z) ) ) ).
fof(con1_0007,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( apart_point_and_line(Z,line_connecting(X,Y))
       => ( distinct_points(Z,X)
          & distinct_points(Z,Y) ) ) ) ).
fof(con2_0008,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( ( apart_point_and_line(Z,X)
          | apart_point_and_line(Z,Y) )
       => distinct_points(Z,intersection_point(X,Y)) ) ) ).
fof(cu1_0009,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & distinct_lines(U,V) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(X,V)
        | apart_point_and_line(Y,U)
        | apart_point_and_line(Y,V) ) ) ).
fof(ceq1_0010,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_points(X,Z)
        | apart_point_and_line(Z,Y) ) ) ).
fof(ceq2_0011,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_lines(Y,Z)
        | apart_point_and_line(X,Z) ) ) ).
fof(ceq3_0012,axiom,
    ! [X,Y] :
      ( convergent_lines(X,Y)
     => distinct_lines(X,Y) ) ).
fof(con_0013,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).
fof(con1,conjecture,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on con1_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/con1_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 1
max branch formulas: 14
proof nodes created: 1
formulas created: 463

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.con1 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
⇒
((S.distinct_points (v_Vo) (v_Vm))
∧
(S.distinct_points (v_Vo) (v_Vn))
)
)
))))
    (λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
⇒
((S.distinct_points (v_Vo) (v_Vm))
∧
(S.distinct_points (v_Vo) (v_Vn))
)
)
)))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (S.distinct_points (v_Vm) (v_Vn))
⇒
((S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn)))
⇒
((S.distinct_points (v_Vo) (v_Vm))
∧
(S.distinct_points (v_Vo) (v_Vn))
)
)
))))
 (S.con1_0007)
 (v_Vp)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: con1_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.07 WC = 0.12  NodesSearch = 1 MaxBranchF = 14 ProofNodes = 1 Formulas = 463
OUTPUT: con1_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.07 WC = 0.12 
