ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p is ...
fof(c_0_13,axiom,
    ! [X2,X4,X3,X1] :
      ( apart_point_and_line(X1,X3)
      | apart_point_and_line(X1,X4)
      | apart_point_and_line(X2,X3)
      | apart_point_and_line(X2,X4)
      | ~ distinct_points(X1,X2)
      | ~ distinct_lines(X3,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_9]),
    [verified(thm)] ).
fof(c_0_14,axiom,
    distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0)),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_18,conjecture,
    ! [X2,X1] :
      ( apart_point_and_line(X1,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X2,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X1,esk3_0)
      | apart_point_and_line(X2,esk3_0)
      | ~ distinct_points(X1,X2) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]) ).

ZenonModuloLP---0.4.2's c_0_18_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_13,axiom,
    ! [X2,X4,X3,X1] :
      ( apart_point_and_line(X1,X3)
      | apart_point_and_line(X1,X4)
      | apart_point_and_line(X2,X3)
      | apart_point_and_line(X2,X4)
      | ~ distinct_points(X1,X2)
      | ~ distinct_lines(X3,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_9]),
    [verified(thm)] ).
fof(c_0_14,axiom,
    distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0)),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_18,conjecture,
    ! [X2,X1] :
      ( apart_point_and_line(X1,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X2,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X1,esk3_0)
      | apart_point_and_line(X2,esk3_0)
      | ~ distinct_points(X1,X2) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_18_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vm) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vm) (esk3_0))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)
)
))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vm) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vm) (esk3_0))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)
)
)))

(λ (v_Vo : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vm) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vm) (esk3_0))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vm) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vm) (esk3_0))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)
)
))
 (λ (v_Vp : τ (ι)),
 λ (v_Vq : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vn) (v_Vp)))
)
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vn) (v_Vp)))
)
)
)
)
 (λ (v_Vr : τ (ι)),
 λ (v_Vs : ϵ (¬
 ((apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vr) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
)
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
 ((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vr) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
)
)
)
 (λ (v_Vt : ϵ (¬
 (apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0))))),
 λ (v_Vu : ϵ (¬
 ((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vr) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
 ((apart_point_and_line (v_Vr) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
)
)
 (λ (v_Vv : ϵ (¬
 (apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0))))),
 λ (v_Vw : ϵ (¬
 ((apart_point_and_line (v_Vr) (esk3_0))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (esk3_0))
 ((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
)
 (λ (v_Vx : ϵ (¬
 (apart_point_and_line (v_Vr) (esk3_0)))),
 λ (v_Vy : ϵ (¬
 ((apart_point_and_line (v_Vp) (esk3_0))
∨
(¬
 (distinct_points (v_Vr) (v_Vp)))
))),
 Rnotor
 (apart_point_and_line (v_Vp) (esk3_0))
 (¬
 (distinct_points (v_Vr) (v_Vp)))
 (λ (v_Vz : ϵ (¬
 (apart_point_and_line (v_Vp) (esk3_0)))),
 λ (v_Vaa : ϵ (¬
 (¬
 (distinct_points (v_Vr) (v_Vp))))),
 Rnotnot
 (distinct_points (v_Vr) (v_Vp))
 (λ (v_Vba : ϵ (distinct_points (v_Vr) (v_Vp))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (v_Vda))
∨
((apart_point_and_line (v_Vn) (v_Vca))
∨
((apart_point_and_line (v_Vm) (v_Vda))
∨
((apart_point_and_line (v_Vm) (v_Vca))
∨
((¬
 (distinct_points (v_Vn) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vda) (v_Vca)))
)
)
)
)
))))
 (v_Vp)
 (λ (v_Vea : ϵ (∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (v_Vda))
∨
((apart_point_and_line (v_Vn) (v_Vca))
∨
((apart_point_and_line (v_Vp) (v_Vda))
∨
((apart_point_and_line (v_Vp) (v_Vca))
∨
((¬
 (distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (distinct_lines (v_Vda) (v_Vca)))
)
)
)
)
))))),
 Rall
 (ι)
 (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (v_Vda))
∨
((apart_point_and_line (v_Vn) (v_Vca))
∨
((apart_point_and_line (v_Vp) (v_Vda))
∨
((apart_point_and_line (v_Vp) (v_Vca))
∨
((¬
 (distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (distinct_lines (v_Vda) (v_Vca)))
)
)
)
)
)))
 (line_connecting (esk1_0) (esk2_0))
 (λ (v_Vfa : ϵ (∀α (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (v_Vda))
∨
((apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (v_Vda))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (distinct_lines (v_Vda) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)
)))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (v_Vda))
∨
((apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (v_Vda))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (distinct_lines (v_Vda) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)
))
 (esk3_0)
 (λ (v_Vga : ϵ (∀α (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)
))),
 Rall
 (ι)
 (λ (v_Vn : τ (ι)),
 (apart_point_and_line (v_Vn) (esk3_0))
∨
((apart_point_and_line (v_Vn) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vn) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)
)
 (v_Vr)
 (λ (v_Vha : ϵ ((apart_point_and_line (v_Vr) (esk3_0))
∨
((apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)
)),
 Ror
 (apart_point_and_line (v_Vr) (esk3_0))
 ((apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)
 (λ (v_Via : ϵ (apart_point_and_line (v_Vr) (esk3_0))),
 Raxiom
 (apart_point_and_line (v_Vr) (esk3_0))
 (v_Via)
 (v_Vx)
)
 (λ (v_Vja : ϵ ((apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
∨
((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)
)),
 Ror
 (apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
 ((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)
 (λ (v_Vka : ϵ (apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))),
 Raxiom
 (apart_point_and_line (v_Vr) (line_connecting (esk1_0) (esk2_0)))
 (v_Vka)
 (v_Vt)
)
 (λ (v_Vla : ϵ ((apart_point_and_line (v_Vp) (esk3_0))
∨
((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
)),
 Ror
 (apart_point_and_line (v_Vp) (esk3_0))
 ((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)
 (λ (v_Vma : ϵ (apart_point_and_line (v_Vp) (esk3_0))),
 Raxiom
 (apart_point_and_line (v_Vp) (esk3_0))
 (v_Vma)
 (v_Vz)
)
 (λ (v_Vna : ϵ ((apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
∨
((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
)),
 Ror
 (apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
 ((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)
 (λ (v_Voa : ϵ (apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))),
 Raxiom
 (apart_point_and_line (v_Vp) (line_connecting (esk1_0) (esk2_0)))
 (v_Voa)
 (v_Vv)
)
 (λ (v_Vpa : ϵ ((¬
 (distinct_points (v_Vr) (v_Vp)))
∨
(¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
)),
 Ror
 (¬
 (distinct_points (v_Vr) (v_Vp)))
 (¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))
 (λ (v_Vqa : ϵ (¬
 (distinct_points (v_Vr) (v_Vp)))),
 Raxiom
 (distinct_points (v_Vr) (v_Vp))
 (v_Vba)
 (v_Vqa)
)
 (λ (v_Vra : ϵ (¬
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0))))),
 Raxiom
 (distinct_lines (esk3_0) (line_connecting (esk1_0) (esk2_0)))
 (ax_c_0_14)
 (v_Vra)
)
 (v_Vpa)
)
 (v_Vna)
)
 (v_Vla)
)
 (v_Vja)
)
 (v_Vha)
)
 (v_Vga)
)
 (v_Vfa)
)
 (v_Vea)
)
 (ax_c_0_13)
)
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
 (v_Vq)
)
 (v_Vo)
);
% SZS end Proof
nodes searched: 62
max branch formulas: 52
proof nodes created: 25
formulas created: 586

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_18_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.06 WC = 0.14 
OUTPUT: c_0_18_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.06 WC = 0.14 
