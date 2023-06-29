ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p is ...
fof(apart4,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( distinct_points(X1,X3)
        | distinct_points(X2,X3) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart4),
    [verified(leaf)] ).
fof(c_0_7,conjecture,
    ! [X9,X10,X11] :
      ( ~ distinct_points(X9,X10)
      | distinct_points(X9,X11)
      | distinct_points(X10,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[apart4])]) ).

ZenonModuloLP---0.4.2's c_0_7_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(apart4,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( distinct_points(X1,X3)
        | distinct_points(X2,X3) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart4),
    [verified(leaf)] ).
fof(c_0_7,conjecture,
    ! [X9,X10,X11] :
      ( ~ distinct_points(X9,X10)
      | distinct_points(X9,X11)
      | distinct_points(X10,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[apart4])]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_7_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((distinct_points (v_Vm) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vq) (v_Vn)))
∨
((distinct_points (v_Vq) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vq) (v_Vn)))
∨
((distinct_points (v_Vq) (v_Vo))
∨
(distinct_points (v_Vn) (v_Vo))
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vq) (v_Vs)))
∨
((distinct_points (v_Vq) (v_Vo))
∨
(distinct_points (v_Vs) (v_Vo))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 (¬
 (distinct_points (v_Vq) (v_Vs)))
∨
((distinct_points (v_Vq) (v_Vo))
∨
(distinct_points (v_Vs) (v_Vo))
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 ((¬
 (distinct_points (v_Vq) (v_Vs)))
∨
((distinct_points (v_Vq) (v_Vu))
∨
(distinct_points (v_Vs) (v_Vu))
)
))),
 Rnotor
 (¬
 (distinct_points (v_Vq) (v_Vs)))
 ((distinct_points (v_Vq) (v_Vu))
∨
(distinct_points (v_Vs) (v_Vu))
)
 (λ (v_Vw : ϵ (¬
 (¬
 (distinct_points (v_Vq) (v_Vs))))),
 λ (v_Vx : ϵ (¬
 ((distinct_points (v_Vq) (v_Vu))
∨
(distinct_points (v_Vs) (v_Vu))
))),
 Rnotor
 (distinct_points (v_Vq) (v_Vu))
 (distinct_points (v_Vs) (v_Vu))
 (λ (v_Vy : ϵ (¬
 (distinct_points (v_Vq) (v_Vu)))),
 λ (v_Vz : ϵ (¬
 (distinct_points (v_Vs) (v_Vu)))),
 Rnotnot
 (distinct_points (v_Vq) (v_Vs))
 (λ (v_Vaa : ϵ (distinct_points (v_Vq) (v_Vs))),
 Rall
 (ι)
 (λ (v_Vba : τ (ι)),
 ∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (distinct_points (v_Vba) (v_Vca))
⇒
((distinct_points (v_Vba) (v_Vda))
∨
(distinct_points (v_Vca) (v_Vda))
)
)))
 (v_Vq)
 (λ (v_Vea : ϵ (∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (distinct_points (v_Vq) (v_Vca))
⇒
((distinct_points (v_Vq) (v_Vda))
∨
(distinct_points (v_Vca) (v_Vda))
)
)))),
 Rall
 (ι)
 (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (distinct_points (v_Vq) (v_Vca))
⇒
((distinct_points (v_Vq) (v_Vda))
∨
(distinct_points (v_Vca) (v_Vda))
)
))
 (v_Vs)
 (λ (v_Vfa : ϵ (∀α (λ (v_Vda : τ (ι)),
 (distinct_points (v_Vq) (v_Vs))
⇒
((distinct_points (v_Vq) (v_Vda))
∨
(distinct_points (v_Vs) (v_Vda))
)
))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 (distinct_points (v_Vq) (v_Vs))
⇒
((distinct_points (v_Vq) (v_Vda))
∨
(distinct_points (v_Vs) (v_Vda))
)
)
 (v_Vu)
 (λ (v_Vga : ϵ ((distinct_points (v_Vq) (v_Vs))
⇒
((distinct_points (v_Vq) (v_Vu))
∨
(distinct_points (v_Vs) (v_Vu))
)
)),
 Rimply
 (distinct_points (v_Vq) (v_Vs))
 ((distinct_points (v_Vq) (v_Vu))
∨
(distinct_points (v_Vs) (v_Vu))
)
 (λ (v_Vha : ϵ (¬
 (distinct_points (v_Vq) (v_Vs)))),
 Raxiom
 (distinct_points (v_Vq) (v_Vs))
 (v_Vaa)
 (v_Vha)
)
 (λ (v_Via : ϵ ((distinct_points (v_Vq) (v_Vu))
∨
(distinct_points (v_Vs) (v_Vu))
)),
 Ror
 (distinct_points (v_Vq) (v_Vu))
 (distinct_points (v_Vs) (v_Vu))
 (λ (v_Vja : ϵ (distinct_points (v_Vq) (v_Vu))),
 Raxiom
 (distinct_points (v_Vq) (v_Vu))
 (v_Vja)
 (v_Vy)
)
 (λ (v_Vka : ϵ (distinct_points (v_Vs) (v_Vu))),
 Raxiom
 (distinct_points (v_Vs) (v_Vu))
 (v_Vka)
 (v_Vz)
)
 (v_Via)
)
 (v_Vga)
)
 (v_Vfa)
)
 (v_Vea)
)
 (ax_apart4)
)
 (v_Vw)
)
 (v_Vx)
)
 (v_Vv)
)
 (v_Vt)
)
 (v_Vr)
)
 (v_Vp)
);
% SZS end Proof
nodes searched: 30
max branch formulas: 30
proof nodes created: 12
formulas created: 330

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_7_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.06 WC = 0.15 
OUTPUT: c_0_7_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.06 WC = 0.15 
