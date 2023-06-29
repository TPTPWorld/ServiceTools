ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p is ...
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

ZenonModuloLP---0.4.2's c_0_23_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
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

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_23_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_23_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ ((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
(apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
) 
 ≔ 
 nnpp ((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
(apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
)

(λ (v_Vm : ϵ (¬
 ((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
(apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
))),
 Rnotor
 (apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
 (apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
 (λ (v_Vn : ϵ (¬
 (apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0))))),
 λ (v_Vo : ϵ (¬
 (apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0))))),
 Rall
 (ι)
 (λ (v_Vp : τ (ι)),
 ∀α (λ (v_Vq : τ (ι)),
 (apart_point_and_line (v_Vq) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vq) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vq) (v_Vp)))
)
)
)
))
 (esk1_0)
 (λ (v_Vr : ϵ (∀α (λ (v_Vq : τ (ι)),
 (apart_point_and_line (v_Vq) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vq) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (v_Vq) (esk1_0)))
)
)
)
))),
 Rall
 (ι)
 (λ (v_Vq : τ (ι)),
 (apart_point_and_line (v_Vq) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vq) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (v_Vq) (esk1_0)))
)
)
)
)
 (esk2_0)
 (λ (v_Vs : ϵ ((apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (esk2_0) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)
)
)
)),
 Ror
 (apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
 ((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (esk2_0) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)
)
)
 (λ (v_Vt : ϵ (apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))),
 Raxiom
 (apart_point_and_line (esk2_0) (line_connecting (esk1_0) (esk2_0)))
 (v_Vt)
 (v_Vo)
)
 (λ (v_Vu : ϵ ((apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (esk2_0) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)
)
)),
 Ror
 (apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
 ((apart_point_and_line (esk2_0) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)
)
 (λ (v_Vv : ϵ (apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))),
 Raxiom
 (apart_point_and_line (esk1_0) (line_connecting (esk1_0) (esk2_0)))
 (v_Vv)
 (v_Vn)
)
 (λ (v_Vw : ϵ ((apart_point_and_line (esk2_0) (esk3_0))
∨
((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)
)),
 Ror
 (apart_point_and_line (esk2_0) (esk3_0))
 ((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)
 (λ (v_Vx : ϵ (apart_point_and_line (esk2_0) (esk3_0))),
 Raxiom
 (apart_point_and_line (esk2_0) (esk3_0))
 (v_Vx)
 (ax_c_0_20)
)
 (λ (v_Vy : ϵ ((apart_point_and_line (esk1_0) (esk3_0))
∨
(¬
 (distinct_points (esk2_0) (esk1_0)))
)),
 Ror
 (apart_point_and_line (esk1_0) (esk3_0))
 (¬
 (distinct_points (esk2_0) (esk1_0)))
 (λ (v_Vz : ϵ (apart_point_and_line (esk1_0) (esk3_0))),
 Raxiom
 (apart_point_and_line (esk1_0) (esk3_0))
 (v_Vz)
 (ax_c_0_21)
)
 (λ (v_Vaa : ϵ (¬
 (distinct_points (esk2_0) (esk1_0)))),
 Raxiom
 (distinct_points (esk2_0) (esk1_0))
 (ax_c_0_19)
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
 (ax_c_0_18)
)
 (v_Vm)
);
% SZS end Proof
nodes searched: 17
max branch formulas: 17
proof nodes created: 10
formulas created: 250

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_23_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.05 WC = 0.12 
OUTPUT: c_0_23_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.05 WC = 0.12 
