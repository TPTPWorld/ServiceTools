ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p is ...
fof(con1,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1),
    [verified(leaf)] ).
fof(c_0_17,conjecture,
    ! [X18,X19,X20] :
      ( ( distinct_points(X20,X18)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) )
      & ( distinct_points(X20,X19)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[con1])])]) ).

ZenonModuloLP---0.4.2's c_0_17_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(con1,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1),
    [verified(leaf)] ).
fof(c_0_17,conjecture,
    ! [X18,X19,X20] :
      ( ( distinct_points(X20,X18)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) )
      & ( distinct_points(X20,X19)
        | ~ apart_point_and_line(X20,line_connecting(X18,X19))
        | ~ distinct_points(X18,X19) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[con1])])]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_17_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vm))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
∧
((distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vm))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
∧
((distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
))))

(λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vm))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
∧
((distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vm))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
∧
((distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (distinct_points (v_Vm) (v_Vn)))
)
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (distinct_points (v_Vq) (v_Vn)))
)
)
∧
((distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (distinct_points (v_Vq) (v_Vn)))
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (distinct_points (v_Vq) (v_Vn)))
)
)
∧
((distinct_points (v_Vo) (v_Vn))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (distinct_points (v_Vq) (v_Vn)))
)
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
∧
((distinct_points (v_Vo) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 ((distinct_points (v_Vo) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
∧
((distinct_points (v_Vo) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vo) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 (((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
∧
((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
))),
 Rnotand
 ((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
)
 (λ (v_Vw : ϵ (¬
 ((distinct_points (v_Vu) (v_Vq))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
))),
 Rnotor
 (distinct_points (v_Vu) (v_Vq))
 ((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
 (λ (v_Vx : ϵ (¬
 (distinct_points (v_Vu) (v_Vq)))),
 λ (v_Vy : ϵ (¬
 ((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
))),
 Rnotor
 (¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
 (¬
 (distinct_points (v_Vq) (v_Vs)))
 (λ (v_Vz : ϵ (¬
 (¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))))),
 λ (v_Vaa : ϵ (¬
 (¬
 (distinct_points (v_Vq) (v_Vs))))),
 Rnotnot
 (distinct_points (v_Vq) (v_Vs))
 (λ (v_Vba : ϵ (distinct_points (v_Vq) (v_Vs))),
 Rnotnot
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
 (λ (v_Vca : ϵ (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vda) (v_Vea))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vda) (v_Vea)))
⇒
((distinct_points (v_Vfa) (v_Vda))
∧
(distinct_points (v_Vfa) (v_Vea))
)
)
)))
 (v_Vq)
 (λ (v_Vga : ϵ (∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vea))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vea)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vea))
)
)
)))),
 Rall
 (ι)
 (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vea))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vea)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vea))
)
)
))
 (v_Vs)
 (λ (v_Vha : ϵ (∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vs))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vs))
)
)
))),
 Rall
 (ι)
 (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vs))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vs))
)
)
)
 (v_Vu)
 (λ (v_Via : ϵ ((distinct_points (v_Vq) (v_Vs))
⇒
((apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
)
)),
 Rimply
 (distinct_points (v_Vq) (v_Vs))
 ((apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
)
 (λ (v_Vja : ϵ (¬
 (distinct_points (v_Vq) (v_Vs)))),
 Raxiom
 (distinct_points (v_Vq) (v_Vs))
 (v_Vba)
 (v_Vja)
)
 (λ (v_Vka : ϵ ((apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
)),
 Rimply
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
 ((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
 (λ (v_Vla : ϵ (¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))),
 Raxiom
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
 (v_Vca)
 (v_Vla)
)
 (λ (v_Vma : ϵ ((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)),
 Rand
 (distinct_points (v_Vu) (v_Vq))
 (distinct_points (v_Vu) (v_Vs))
 (λ (v_Vna : ϵ (distinct_points (v_Vu) (v_Vq))),
 λ (v_Voa : ϵ (distinct_points (v_Vu) (v_Vs))),
 Raxiom
 (distinct_points (v_Vu) (v_Vq))
 (v_Vna)
 (v_Vx)
)
 (v_Vma)
)
 (v_Vka)
)
 (v_Via)
)
 (v_Vha)
)
 (v_Vga)
)
 (ax_con1)
)
 (v_Vz)
)
 (v_Vaa)
)
 (v_Vy)
)
 (v_Vw)
)
 (λ (v_Vpa : ϵ (¬
 ((distinct_points (v_Vu) (v_Vs))
∨
((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
))),
 Rnotor
 (distinct_points (v_Vu) (v_Vs))
 ((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
)
 (λ (v_Vqa : ϵ (¬
 (distinct_points (v_Vu) (v_Vs)))),
 λ (v_Vy : ϵ (¬
 ((¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (distinct_points (v_Vq) (v_Vs)))
))),
 Rnotor
 (¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))
 (¬
 (distinct_points (v_Vq) (v_Vs)))
 (λ (v_Vz : ϵ (¬
 (¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))))),
 λ (v_Vaa : ϵ (¬
 (¬
 (distinct_points (v_Vq) (v_Vs))))),
 Rnotnot
 (distinct_points (v_Vq) (v_Vs))
 (λ (v_Vba : ϵ (distinct_points (v_Vq) (v_Vs))),
 Rnotnot
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
 (λ (v_Vca : ϵ (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vda) (v_Vea))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vda) (v_Vea)))
⇒
((distinct_points (v_Vfa) (v_Vda))
∧
(distinct_points (v_Vfa) (v_Vea))
)
)
)))
 (v_Vq)
 (λ (v_Vga : ϵ (∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vea))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vea)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vea))
)
)
)))),
 Rall
 (ι)
 (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vea))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vea)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vea))
)
)
))
 (v_Vs)
 (λ (v_Vha : ϵ (∀α (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vs))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vs))
)
)
))),
 Rall
 (ι)
 (λ (v_Vfa : τ (ι)),
 (distinct_points (v_Vq) (v_Vs))
⇒
((apart_point_and_line (v_Vfa) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vfa) (v_Vq))
∧
(distinct_points (v_Vfa) (v_Vs))
)
)
)
 (v_Vu)
 (λ (v_Via : ϵ ((distinct_points (v_Vq) (v_Vs))
⇒
((apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
)
)),
 Rimply
 (distinct_points (v_Vq) (v_Vs))
 ((apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
)
 (λ (v_Vja : ϵ (¬
 (distinct_points (v_Vq) (v_Vs)))),
 Raxiom
 (distinct_points (v_Vq) (v_Vs))
 (v_Vba)
 (v_Vja)
)
 (λ (v_Vka : ϵ ((apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
⇒
((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
)),
 Rimply
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
 ((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)
 (λ (v_Vla : ϵ (¬
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs))))),
 Raxiom
 (apart_point_and_line (v_Vu) (line_connecting (v_Vq) (v_Vs)))
 (v_Vca)
 (v_Vla)
)
 (λ (v_Vma : ϵ ((distinct_points (v_Vu) (v_Vq))
∧
(distinct_points (v_Vu) (v_Vs))
)),
 Rand
 (distinct_points (v_Vu) (v_Vq))
 (distinct_points (v_Vu) (v_Vs))
 (λ (v_Vna : ϵ (distinct_points (v_Vu) (v_Vq))),
 λ (v_Voa : ϵ (distinct_points (v_Vu) (v_Vs))),
 Raxiom
 (distinct_points (v_Vu) (v_Vs))
 (v_Voa)
 (v_Vqa)
)
 (v_Vma)
)
 (v_Vka)
)
 (v_Via)
)
 (v_Vha)
)
 (v_Vga)
)
 (ax_con1)
)
 (v_Vz)
)
 (v_Vaa)
)
 (v_Vy)
)
 (v_Vpa)
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
nodes searched: 215
max branch formulas: 87
proof nodes created: 57
formulas created: 967

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_17_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.07 WC = 0.15 
OUTPUT: c_0_17_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.07 WC = 0.15 
