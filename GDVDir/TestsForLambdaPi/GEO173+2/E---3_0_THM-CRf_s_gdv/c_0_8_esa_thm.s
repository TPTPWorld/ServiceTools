ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_esa_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_esa_thm.p is ...
fof(c_0_8,axiom,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).
fof(c_0_5,conjecture,
    ~ ! [X1,X2,X4,X5] :
        ( ( distinct_points(X1,X2)
          & convergent_lines(X4,X5)
          & distinct_lines(X4,line_connecting(X1,X2)) )
       => ( apart_point_and_line(X1,X4)
          | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]),
    [verified(cth)] ).

ZenonModulo---0.4.2's c_0_8_esa_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_esa_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_8,axiom,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).
fof(c_0_5,conjecture,
    ~ ! [X1,X2,X4,X5] :
        ( ( distinct_points(X1,X2)
          & convergent_lines(X4,X5)
          & distinct_lines(X4,line_connecting(X1,X2)) )
       => ( apart_point_and_line(X1,X4)
          | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]),
    [verified(cth)] ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_8_esa_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_8_esa_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 41
max branch formulas: 39
proof nodes created: 15
formulas created: 432

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_5 ↪ 
  nnpp (¬
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
    (λ (v_Vq : ϵ (¬
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
)))))))),
 Rand
 (S.distinct_points (S.esk1_0) (S.esk2_0))
 ((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
((S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∧
((¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
∧
(¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
)
)
)
 (λ (v_Vr : ϵ (S.distinct_points (S.esk1_0) (S.esk2_0))),
 λ (v_Vs : ϵ ((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
((S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∧
((¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
∧
(¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
)
)
)),
 Rand
 (S.convergent_lines (S.esk3_0) (S.esk4_0))
 ((S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∧
((¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
∧
(¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
)
)
 (λ (v_Vt : ϵ (S.convergent_lines (S.esk3_0) (S.esk4_0))),
 λ (v_Vu : ϵ ((S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∧
((¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
∧
(¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
)
)),
 Rand
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
∧
(¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
)
 (λ (v_Vv : ϵ (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 λ (v_Vw : ϵ ((¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
∧
(¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
)),
 Rand
 (¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))
 (¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))
 (λ (v_Vx : ϵ (¬
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0)))),
 λ (v_Vy : ϵ (¬
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0)))),
 Rnotnot
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
 (λ (v_Vz : ϵ (∀α (λ (v_Vm : τ (ι)),
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
)))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
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
))))
 (S.esk1_0)
 (λ (v_Vaa : ϵ (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (S.esk1_0) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (S.esk1_0) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
))))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (S.esk1_0) (v_Vn))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (S.esk1_0) (v_Vn)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (v_Vo))
∨
(S.apart_point_and_line (v_Vn) (v_Vo))
)
)))
 (S.esk2_0)
 (λ (v_Vba : ϵ (∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (v_Vo))
∨
(S.apart_point_and_line (S.esk2_0) (v_Vo))
)
)))),
 Rall
 (ι)
 (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (v_Vo) (v_Vp))
∧
(S.distinct_lines (v_Vo) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (v_Vo))
∨
(S.apart_point_and_line (S.esk2_0) (v_Vo))
)
))
 (S.esk3_0)
 (λ (v_Vca : ϵ (∀α (λ (v_Vp : τ (ι)),
 ((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (S.esk3_0) (v_Vp))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(S.apart_point_and_line (S.esk2_0) (S.esk3_0))
)
))),
 Rall
 (ι)
 (λ (v_Vp : τ (ι)),
 ((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (S.esk3_0) (v_Vp))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(S.apart_point_and_line (S.esk2_0) (S.esk3_0))
)
)
 (S.esk4_0)
 (λ (v_Vda : ϵ (((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
)
⇒
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(S.apart_point_and_line (S.esk2_0) (S.esk3_0))
)
)),
 Rimply
 ((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
)
 ((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(S.apart_point_and_line (S.esk2_0) (S.esk3_0))
)
 (λ (v_Vea : ϵ (¬
 ((S.distinct_points (S.esk1_0) (S.esk2_0))
∧
((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
))),
 Rnotand
 (S.distinct_points (S.esk1_0) (S.esk2_0))
 ((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
 (λ (v_Vfa : ϵ (¬
 (S.distinct_points (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.distinct_points (S.esk1_0) (S.esk2_0))
 (v_Vr)
 (v_Vfa)
)
 (λ (v_Vga : ϵ (¬
 ((S.convergent_lines (S.esk3_0) (S.esk4_0))
∧
(S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
))),
 Rnotand
 (S.convergent_lines (S.esk3_0) (S.esk4_0))
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (λ (v_Vha : ϵ (¬
 (S.convergent_lines (S.esk3_0) (S.esk4_0)))),
 Raxiom
 (S.convergent_lines (S.esk3_0) (S.esk4_0))
 (v_Vt)
 (v_Vha)
)
 (λ (v_Via : ϵ (¬
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 Raxiom
 (S.distinct_lines (S.esk3_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Vv)
 (v_Via)
)
 (v_Vga)
)
 (v_Vea)
)
 (λ (v_Vja : ϵ ((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(S.apart_point_and_line (S.esk2_0) (S.esk3_0))
)),
 Ror
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0))
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0))
 (λ (v_Vka : ϵ (S.apart_point_and_line (S.esk1_0) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0))
 (v_Vka)
 (v_Vx)
)
 (λ (v_Vla : ϵ (S.apart_point_and_line (S.esk2_0) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0))
 (v_Vla)
 (v_Vy)
)
 (v_Vja)
)
 (v_Vda)
)
 (v_Vca)
)
 (v_Vba)
)
 (v_Vaa)
)
 (v_Vz)
)
 (v_Vq)
)
 (v_Vw)
)
 (v_Vu)
)
 (v_Vs)
)
 (S.c_0_8)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_8_esa_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.11 WC = 0.13  NodesSearch = 41 MaxBranchF = 39 ProofNodes = 15 Formulas = 432
OUTPUT: c_0_8_esa_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.11 WC = 0.13 
