ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_11_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_11_thm.p is ...
fof(c_0_7,axiom,
    ! [X9,X10,X11] :
      ( ~ distinct_points(X9,X10)
      | distinct_points(X9,X11)
      | distinct_points(X10,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[apart4])]),
    [verified(thm)] ).
fof(c_0_11,conjecture,
    ! [X2,X3,X1] :
      ( distinct_points(X1,X3)
      | distinct_points(X2,X3)
      | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

ZenonModuloLP---0.4.2's c_0_11_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_11_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_7,axiom,
    ! [X9,X10,X11] :
      ( ~ distinct_points(X9,X10)
      | distinct_points(X9,X11)
      | distinct_points(X10,X11) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[apart4])]),
    [verified(thm)] ).
fof(c_0_11,conjecture,
    ! [X2,X3,X1] :
      ( distinct_points(X1,X3)
      | distinct_points(X2,X3)
      | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_11_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_11_thm.p'
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
((distinct_points (v_Vm) (v_Vn))
∨
(¬
 (distinct_points (v_Vo) (v_Vm)))
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((distinct_points (v_Vm) (v_Vn))
∨
(¬
 (distinct_points (v_Vo) (v_Vm)))
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((distinct_points (v_Vm) (v_Vn))
∨
(¬
 (distinct_points (v_Vo) (v_Vm)))
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((distinct_points (v_Vm) (v_Vn))
∨
(¬
 (distinct_points (v_Vo) (v_Vm)))
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((distinct_points (v_Vq) (v_Vn))
∨
(¬
 (distinct_points (v_Vo) (v_Vq)))
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vn))
∨
((distinct_points (v_Vq) (v_Vn))
∨
(¬
 (distinct_points (v_Vo) (v_Vq)))
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vs))
∨
((distinct_points (v_Vq) (v_Vs))
∨
(¬
 (distinct_points (v_Vo) (v_Vq)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 (distinct_points (v_Vo) (v_Vs))
∨
((distinct_points (v_Vq) (v_Vs))
∨
(¬
 (distinct_points (v_Vo) (v_Vq)))
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 ((distinct_points (v_Vu) (v_Vs))
∨
((distinct_points (v_Vq) (v_Vs))
∨
(¬
 (distinct_points (v_Vu) (v_Vq)))
)
))),
 Rnotor
 (distinct_points (v_Vu) (v_Vs))
 ((distinct_points (v_Vq) (v_Vs))
∨
(¬
 (distinct_points (v_Vu) (v_Vq)))
)
 (λ (v_Vw : ϵ (¬
 (distinct_points (v_Vu) (v_Vs)))),
 λ (v_Vx : ϵ (¬
 ((distinct_points (v_Vq) (v_Vs))
∨
(¬
 (distinct_points (v_Vu) (v_Vq)))
))),
 Rnotor
 (distinct_points (v_Vq) (v_Vs))
 (¬
 (distinct_points (v_Vu) (v_Vq)))
 (λ (v_Vy : ϵ (¬
 (distinct_points (v_Vq) (v_Vs)))),
 λ (v_Vz : ϵ (¬
 (¬
 (distinct_points (v_Vu) (v_Vq))))),
 Rnotnot
 (distinct_points (v_Vu) (v_Vq))
 (λ (v_Vaa : ϵ (distinct_points (v_Vu) (v_Vq))),
 Rall
 (ι)
 (λ (v_Vba : τ (ι)),
 ∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (¬
 (distinct_points (v_Vba) (v_Vca)))
∨
((distinct_points (v_Vba) (v_Vda))
∨
(distinct_points (v_Vca) (v_Vda))
)
)))
 (v_Vu)
 (λ (v_Vea : ϵ (∀α (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (¬
 (distinct_points (v_Vu) (v_Vca)))
∨
((distinct_points (v_Vu) (v_Vda))
∨
(distinct_points (v_Vca) (v_Vda))
)
)))),
 Rall
 (ι)
 (λ (v_Vca : τ (ι)),
 ∀α (λ (v_Vda : τ (ι)),
 (¬
 (distinct_points (v_Vu) (v_Vca)))
∨
((distinct_points (v_Vu) (v_Vda))
∨
(distinct_points (v_Vca) (v_Vda))
)
))
 (v_Vq)
 (λ (v_Vfa : ϵ (∀α (λ (v_Vda : τ (ι)),
 (¬
 (distinct_points (v_Vu) (v_Vq)))
∨
((distinct_points (v_Vu) (v_Vda))
∨
(distinct_points (v_Vq) (v_Vda))
)
))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 (¬
 (distinct_points (v_Vu) (v_Vq)))
∨
((distinct_points (v_Vu) (v_Vda))
∨
(distinct_points (v_Vq) (v_Vda))
)
)
 (v_Vs)
 (λ (v_Vga : ϵ ((¬
 (distinct_points (v_Vu) (v_Vq)))
∨
((distinct_points (v_Vu) (v_Vs))
∨
(distinct_points (v_Vq) (v_Vs))
)
)),
 Ror
 (¬
 (distinct_points (v_Vu) (v_Vq)))
 ((distinct_points (v_Vu) (v_Vs))
∨
(distinct_points (v_Vq) (v_Vs))
)
 (λ (v_Vha : ϵ (¬
 (distinct_points (v_Vu) (v_Vq)))),
 Raxiom
 (distinct_points (v_Vu) (v_Vq))
 (v_Vaa)
 (v_Vha)
)
 (λ (v_Via : ϵ ((distinct_points (v_Vu) (v_Vs))
∨
(distinct_points (v_Vq) (v_Vs))
)),
 Ror
 (distinct_points (v_Vu) (v_Vs))
 (distinct_points (v_Vq) (v_Vs))
 (λ (v_Vja : ϵ (distinct_points (v_Vu) (v_Vs))),
 Raxiom
 (distinct_points (v_Vu) (v_Vs))
 (v_Vja)
 (v_Vw)
)
 (λ (v_Vka : ϵ (distinct_points (v_Vq) (v_Vs))),
 Raxiom
 (distinct_points (v_Vq) (v_Vs))
 (v_Vka)
 (v_Vy)
)
 (v_Via)
)
 (v_Vga)
)
 (v_Vfa)
)
 (v_Vea)
)
 (ax_c_0_7)
)
 (v_Vz)
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
formulas created: 335

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_11_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.06 WC = 0.13 
OUTPUT: c_0_11_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.06 WC = 0.13 
