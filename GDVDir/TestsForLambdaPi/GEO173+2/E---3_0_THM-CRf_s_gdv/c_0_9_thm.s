ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_9_thm.p

ZenonModuloLP---0.4.2's TPTP format TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_9_thm.p is ...
fof(cu1,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & distinct_lines(X4,X5) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X1,X5)
        | apart_point_and_line(X2,X4)
        | apart_point_and_line(X2,X5) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',cu1),
    [verified(leaf)] ).
fof(c_0_9,conjecture,
    ! [X24,X25,X26,X27] :
      ( ~ distinct_points(X24,X25)
      | ~ distinct_lines(X26,X27)
      | apart_point_and_line(X24,X26)
      | apart_point_and_line(X24,X27)
      | apart_point_and_line(X25,X26)
      | apart_point_and_line(X25,X27) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[cu1])]) ).

ZenonModuloLP---0.4.2's c_0_9_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_9_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(cu1,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & distinct_lines(X4,X5) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X1,X5)
        | apart_point_and_line(X2,X4)
        | apart_point_and_line(X2,X5) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',cu1),
    [verified(leaf)] ).
fof(c_0_9,conjecture,
    ! [X24,X25,X26,X27] :
      ( ~ distinct_points(X24,X25)
      | ~ distinct_lines(X26,X27)
      | apart_point_and_line(X24,X26)
      | apart_point_and_line(X24,X27)
      | apart_point_and_line(X25,X26)
      | apart_point_and_line(X25,X27) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[cu1])]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_9_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_9_thm.p'
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
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vp))
∨
((apart_point_and_line (v_Vn) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
))))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vp))
∨
((apart_point_and_line (v_Vn) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
)))))

(λ (v_Vq : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vp))
∨
((apart_point_and_line (v_Vn) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
))))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vm) (v_Vn)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vp))
∨
((apart_point_and_line (v_Vn) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
))))
 (λ (v_Vr : τ (ι)),
 λ (v_Vs : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vr) (v_Vn)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vp))
∨
((apart_point_and_line (v_Vn) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vr) (v_Vn)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vp))
∨
((apart_point_and_line (v_Vn) (v_Vo))
∨
(apart_point_and_line (v_Vn) (v_Vp))
)
)
)
)
)))
 (λ (v_Vt : τ (ι)),
 λ (v_Vu : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vp))
∨
((apart_point_and_line (v_Vt) (v_Vo))
∨
(apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (distinct_lines (v_Vo) (v_Vp)))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vp))
∨
((apart_point_and_line (v_Vt) (v_Vo))
∨
(apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
))
 (λ (v_Vv : τ (ι)),
 λ (v_Vw : ϵ (¬
 (∀α (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (distinct_lines (v_Vv) (v_Vp)))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vp))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vp : τ (ι)),
 (¬
 (distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (distinct_lines (v_Vv) (v_Vp)))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vp))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vp))
)
)
)
)
)
 (λ (v_Vx : τ (ι)),
 λ (v_Vy : ϵ (¬
 ((¬
 (distinct_points (v_Vr) (v_Vt)))
∨
((¬
 (distinct_lines (v_Vv) (v_Vx)))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)
)
))),
 Rnotor
 (¬
 (distinct_points (v_Vr) (v_Vt)))
 ((¬
 (distinct_lines (v_Vv) (v_Vx)))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)
)
 (λ (v_Vz : ϵ (¬
 (¬
 (distinct_points (v_Vr) (v_Vt))))),
 λ (v_Vaa : ϵ (¬
 ((¬
 (distinct_lines (v_Vv) (v_Vx)))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)
))),
 Rnotor
 (¬
 (distinct_lines (v_Vv) (v_Vx)))
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)
 (λ (v_Vba : ϵ (¬
 (¬
 (distinct_lines (v_Vv) (v_Vx))))),
 λ (v_Vca : ϵ (¬
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (v_Vv))
 ((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
 (λ (v_Vda : ϵ (¬
 (apart_point_and_line (v_Vr) (v_Vv)))),
 λ (v_Vea : ϵ (¬
 ((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (v_Vx))
 ((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
 (λ (v_Vfa : ϵ (¬
 (apart_point_and_line (v_Vr) (v_Vx)))),
 λ (v_Vga : ϵ (¬
 ((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
))),
 Rnotor
 (apart_point_and_line (v_Vt) (v_Vv))
 (apart_point_and_line (v_Vt) (v_Vx))
 (λ (v_Vha : ϵ (¬
 (apart_point_and_line (v_Vt) (v_Vv)))),
 λ (v_Via : ϵ (¬
 (apart_point_and_line (v_Vt) (v_Vx)))),
 Rnotnot
 (distinct_lines (v_Vv) (v_Vx))
 (λ (v_Vja : ϵ (distinct_lines (v_Vv) (v_Vx))),
 Rnotnot
 (distinct_points (v_Vr) (v_Vt))
 (λ (v_Vka : ϵ (distinct_points (v_Vr) (v_Vt))),
 Rall
 (ι)
 (λ (v_Vla : τ (ι)),
 ∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vla) (v_Vma))
∧
(distinct_lines (v_Vna) (v_Voa))
)
⇒
((apart_point_and_line (v_Vla) (v_Vna))
∨
((apart_point_and_line (v_Vla) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
))))
 (v_Vr)
 (λ (v_Vpa : ϵ (∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vr) (v_Vma))
∧
(distinct_lines (v_Vna) (v_Voa))
)
⇒
((apart_point_and_line (v_Vr) (v_Vna))
∨
((apart_point_and_line (v_Vr) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
))))),
 Rall
 (ι)
 (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vr) (v_Vma))
∧
(distinct_lines (v_Vna) (v_Voa))
)
⇒
((apart_point_and_line (v_Vr) (v_Vna))
∨
((apart_point_and_line (v_Vr) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)))
 (v_Vt)
 (λ (v_Vqa : ϵ (∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vna) (v_Voa))
)
⇒
((apart_point_and_line (v_Vr) (v_Vna))
∨
((apart_point_and_line (v_Vr) (v_Voa))
∨
((apart_point_and_line (v_Vt) (v_Vna))
∨
(apart_point_and_line (v_Vt) (v_Voa))
)
)
)
)))),
 Rall
 (ι)
 (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vna) (v_Voa))
)
⇒
((apart_point_and_line (v_Vr) (v_Vna))
∨
((apart_point_and_line (v_Vr) (v_Voa))
∨
((apart_point_and_line (v_Vt) (v_Vna))
∨
(apart_point_and_line (v_Vt) (v_Voa))
)
)
)
))
 (v_Vv)
 (λ (v_Vra : ϵ (∀α (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vv) (v_Voa))
)
⇒
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Voa))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Voa))
)
)
)
))),
 Rall
 (ι)
 (λ (v_Voa : τ (ι)),
 ((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vv) (v_Voa))
)
⇒
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Voa))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Voa))
)
)
)
)
 (v_Vx)
 (λ (v_Vsa : ϵ (((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vv) (v_Vx))
)
⇒
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)
)),
 Rimply
 ((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vv) (v_Vx))
)
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)
 (λ (v_Vta : ϵ (¬
 ((distinct_points (v_Vr) (v_Vt))
∧
(distinct_lines (v_Vv) (v_Vx))
))),
 Rnotand
 (distinct_points (v_Vr) (v_Vt))
 (distinct_lines (v_Vv) (v_Vx))
 (λ (v_Vua : ϵ (¬
 (distinct_points (v_Vr) (v_Vt)))),
 Raxiom
 (distinct_points (v_Vr) (v_Vt))
 (v_Vka)
 (v_Vua)
)
 (λ (v_Vva : ϵ (¬
 (distinct_lines (v_Vv) (v_Vx)))),
 Raxiom
 (distinct_lines (v_Vv) (v_Vx))
 (v_Vja)
 (v_Vva)
)
 (v_Vta)
)
 (λ (v_Vwa : ϵ ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
)),
 Ror
 (apart_point_and_line (v_Vr) (v_Vv))
 ((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)
 (λ (v_Vxa : ϵ (apart_point_and_line (v_Vr) (v_Vv))),
 Raxiom
 (apart_point_and_line (v_Vr) (v_Vv))
 (v_Vxa)
 (v_Vda)
)
 (λ (v_Vya : ϵ ((apart_point_and_line (v_Vr) (v_Vx))
∨
((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
)),
 Ror
 (apart_point_and_line (v_Vr) (v_Vx))
 ((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)
 (λ (v_Vza : ϵ (apart_point_and_line (v_Vr) (v_Vx))),
 Raxiom
 (apart_point_and_line (v_Vr) (v_Vx))
 (v_Vza)
 (v_Vfa)
)
 (λ (v_Vab : ϵ ((apart_point_and_line (v_Vt) (v_Vv))
∨
(apart_point_and_line (v_Vt) (v_Vx))
)),
 Ror
 (apart_point_and_line (v_Vt) (v_Vv))
 (apart_point_and_line (v_Vt) (v_Vx))
 (λ (v_Vbb : ϵ (apart_point_and_line (v_Vt) (v_Vv))),
 Raxiom
 (apart_point_and_line (v_Vt) (v_Vv))
 (v_Vbb)
 (v_Vha)
)
 (λ (v_Vcb : ϵ (apart_point_and_line (v_Vt) (v_Vx))),
 Raxiom
 (apart_point_and_line (v_Vt) (v_Vx))
 (v_Vcb)
 (v_Via)
)
 (v_Vab)
)
 (v_Vya)
)
 (v_Vwa)
)
 (v_Vsa)
)
 (v_Vra)
)
 (v_Vqa)
)
 (v_Vpa)
)
 (ax_cu1)
)
 (v_Vz)
)
 (v_Vba)
)
 (v_Vga)
)
 (v_Vea)
)
 (v_Vca)
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
);
% SZS end Proof
nodes searched: 45
max branch formulas: 43
proof nodes created: 19
formulas created: 508

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_9_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.04 WC = 0.14 
OUTPUT: c_0_9_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.04 WC = 0.14 
