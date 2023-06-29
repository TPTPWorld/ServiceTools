ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_22_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_22_thm.p is ...
fof(c_0_17,axiom,
    ! [X18,X19,X20] :
      ( ( distinct_points(X20,X18)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) )
      & ( distinct_points(X20,X19)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[con1])])]),
    [verified(thm)] ).
fof(c_0_22,conjecture,
    ! [X3,X2,X1] :
      ( distinct_points(X1,X2)
      | ~ apart_point_and_line(X1,line_connecting(X2,X3))
      | ~ distinct_points(X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_17]) ).

ZenonModuloLP---0.4.2's c_0_22_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_22_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_17,axiom,
    ! [X18,X19,X20] :
      ( ( distinct_points(X20,X18)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) )
      & ( distinct_points(X20,X19)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[con1])])]),
    [verified(thm)] ).
fof(c_0_22,conjecture,
    ! [X3,X2,X1] :
      ( distinct_points(X1,X2)
      | ~ apart_point_and_line(X1,line_connecting(X2,X3))
      | ~ distinct_points(X2,X3) ),
    inference(split_conjunct,[status(thm)],[c_0_17]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_22_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_22_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vn) (v_Vm))))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vn) (v_Vm))))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vn) (v_Vm))))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vn) (v_Vm))))
∨
(¬
 (distinct_points (v_Vn) (v_Vm)))
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vn) (v_Vq))))
∨
(¬
 (distinct_points (v_Vn) (v_Vq)))
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vn) (v_Vq))))
∨
(¬
 (distinct_points (v_Vn) (v_Vq)))
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
))),
 Rall
 (ι)
 (λ (v_Vw : τ (ι)),
 ∀α (λ (v_Vx : τ (ι)),
 ∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vw))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vw) (v_Vx))))
∨
(¬
 (distinct_points (v_Vw) (v_Vx)))
)
)
∧
((distinct_points (v_Vy) (v_Vx))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vw) (v_Vx))))
∨
(¬
 (distinct_points (v_Vw) (v_Vx)))
)
)
)))
 (v_Vs)
 (λ (v_Vz : ϵ (∀α (λ (v_Vx : τ (ι)),
 ∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vx))))
∨
(¬
 (distinct_points (v_Vs) (v_Vx)))
)
)
∧
((distinct_points (v_Vy) (v_Vx))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vx))))
∨
(¬
 (distinct_points (v_Vs) (v_Vx)))
)
)
)))),
 Rall
 (ι)
 (λ (v_Vx : τ (ι)),
 ∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vx))))
∨
(¬
 (distinct_points (v_Vs) (v_Vx)))
)
)
∧
((distinct_points (v_Vy) (v_Vx))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vx))))
∨
(¬
 (distinct_points (v_Vs) (v_Vx)))
)
)
))
 (v_Vq)
 (λ (v_Vaa : ϵ (∀α (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
∧
((distinct_points (v_Vy) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
))),
 Rall
 (ι)
 (λ (v_Vy : τ (ι)),
 ((distinct_points (v_Vy) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
∧
((distinct_points (v_Vy) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vy) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
)
 (v_Vu)
 (λ (v_Vba : ϵ (((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
∧
((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
)),
 Rand
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
 ((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
 (λ (v_Vca : ϵ ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)),
 λ (v_Vda : ϵ ((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)),
 Raxiom
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vs) (v_Vq))))
∨
(¬
 (distinct_points (v_Vs) (v_Vq)))
)
)
 (v_Vca)
 (v_Vv)
)
 (v_Vba)
)
 (v_Vaa)
)
 (v_Vz)
)
 (ax_c_0_17)
)
 (v_Vt)
)
 (v_Vr)
)
 (v_Vp)
);
% SZS end Proof
nodes searched: 43
max branch formulas: 40
proof nodes created: 13
formulas created: 430

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_22_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.07 WC = 0.13 
OUTPUT: c_0_22_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.07 WC = 0.13 
