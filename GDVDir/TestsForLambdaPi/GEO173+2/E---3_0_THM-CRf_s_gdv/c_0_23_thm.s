ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p is ...
fof(c_0_18,axiom,
    ! [X2,X1] :
      ( apart_point_and_line(X1,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X2,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X1,esk3_0)
      | apart_point_and_line(X2,esk3_0)
      | ~ distinct_points(X1,X2) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]),
    [verified(thm)] ).
fof(c_0_19,axiom,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]),
    [verified(thm)] ).
fof(c_0_20,axiom,
    ~ apart_point_and_line(esk2_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_21,axiom,
    ~ apart_point_and_line(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_23,conjecture,
    ( apart_point_and_line(esk1_0,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_18,c_0_19]),c_0_20]),c_0_21]) ).

ZenonModulo---0.4.2's c_0_23_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_18,axiom,
    ! [X2,X1] :
      ( apart_point_and_line(X1,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X2,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X1,esk3_0)
      | apart_point_and_line(X2,esk3_0)
      | ~ distinct_points(X1,X2) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]),
    [verified(thm)] ).
fof(c_0_19,axiom,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]),
    [verified(thm)] ).
fof(c_0_20,axiom,
    ~ apart_point_and_line(esk2_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_21,axiom,
    ~ apart_point_and_line(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_23,conjecture,
    ( apart_point_and_line(esk1_0,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_18,c_0_19]),c_0_20]),c_0_21]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_23_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 17
max branch formulas: 17
proof nodes created: 10
formulas created: 250

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_23 ↪ 
  nnpp ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
(S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
)
    (λ (v_Vm : ϵ (¬
 ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
(S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
))),
 Rnotor
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (λ (v_Vn : ϵ (¬
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 λ (v_Vo : ϵ (¬
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0))))),
 Rall
 (ι)
 (λ (v_Vp : τ (ι)),
 ∀α (λ (v_Vq : τ (ι)),
 (S.apart_point_and_line (v_Vq) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vp) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vq) (S.esk3_0))
∨
((S.apart_point_and_line (v_Vp) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vp)))
)
)
)
))
 (S.esk1_0)
 (λ (v_Vr : ϵ (∀α (λ (v_Vq : τ (ι)),
 (S.apart_point_and_line (v_Vq) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vq) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vq) (S.esk1_0)))
)
)
)
))),
 Rall
 (ι)
 (λ (v_Vq : τ (ι)),
 (S.apart_point_and_line (v_Vq) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (v_Vq) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (v_Vq) (S.esk1_0)))
)
)
)
)
 (S.esk2_0)
 (λ (v_Vs : ϵ ((S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
)
)),
 Ror
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
)
 (λ (v_Vt : ϵ (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.apart_point_and_line (S.esk2_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Vt)
 (v_Vo)
)
 (λ (v_Vu : ϵ ((S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
∨
((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
)),
 Ror
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 ((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)
 (λ (v_Vv : ϵ (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))),
 Raxiom
 (S.apart_point_and_line (S.esk1_0) (S.line_connecting (S.esk1_0) (S.esk2_0)))
 (v_Vv)
 (v_Vn)
)
 (λ (v_Vw : ϵ ((S.apart_point_and_line (S.esk2_0) (S.esk3_0))
∨
((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
)),
 Ror
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0))
 ((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)
 (λ (v_Vx : ϵ (S.apart_point_and_line (S.esk2_0) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (S.esk2_0) (S.esk3_0))
 (v_Vx)
 (S.c_0_20)
)
 (λ (v_Vy : ϵ ((S.apart_point_and_line (S.esk1_0) (S.esk3_0))
∨
(¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
)),
 Ror
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0))
 (¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))
 (λ (v_Vz : ϵ (S.apart_point_and_line (S.esk1_0) (S.esk3_0))),
 Raxiom
 (S.apart_point_and_line (S.esk1_0) (S.esk3_0))
 (v_Vz)
 (S.c_0_21)
)
 (λ (v_Vaa : ϵ (¬
 (S.distinct_points (S.esk2_0) (S.esk1_0)))),
 Raxiom
 (S.distinct_points (S.esk2_0) (S.esk1_0))
 (S.c_0_19)
 (v_Vaa)
)
 (v_Vy)
)
 (v_Vw)
)
 (v_Vu)
)
 (v_Vs)
)
 (v_Vr)
)
 (S.c_0_18)
)
 (v_Vm)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_23_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.06 WC = 0.13  NodesSearch = 17 MaxBranchF = 17 ProofNodes = 10 Formulas = 250
OUTPUT: c_0_23_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.06 WC = 0.13 
