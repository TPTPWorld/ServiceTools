ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_13_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_13_thm.p is ...
fof(c_0_9,axiom,
    ! [X24,X25,X26,X27] :
      ( ~ distinct_points(X24,X25)
      | ~ distinct_lines(X26,X27)
      | apart_point_and_line(X24,X26)
      | apart_point_and_line(X24,X27)
      | apart_point_and_line(X25,X26)
      | apart_point_and_line(X25,X27) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[cu1])]),
    [verified(thm)] ).
fof(c_0_13,conjecture,
    ! [X2,X4,X3,X1] :
      ( apart_point_and_line(X1,X3)
      | apart_point_and_line(X1,X4)
      | apart_point_and_line(X2,X3)
      | apart_point_and_line(X2,X4)
      | ~ distinct_points(X1,X2)
      | ~ distinct_lines(X3,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

ZenonModuloLP---0.4.2's c_0_13_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_13_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_9,axiom,
    ! [X24,X25,X26,X27] :
      ( ~ distinct_points(X24,X25)
      | ~ distinct_lines(X26,X27)
      | apart_point_and_line(X24,X26)
      | apart_point_and_line(X24,X27)
      | apart_point_and_line(X25,X26)
      | apart_point_and_line(X25,X27) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[cu1])]),
    [verified(thm)] ).
fof(c_0_13,conjecture,
    ! [X2,X4,X3,X1] :
      ( apart_point_and_line(X1,X3)
      | apart_point_and_line(X1,X4)
      | apart_point_and_line(X2,X3)
      | apart_point_and_line(X2,X4)
      | ~ distinct_points(X1,X2)
      | ~ distinct_lines(X3,X4) ),
    inference(split_conjunct,[status(thm)],[c_0_9]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_13_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_13_thm.p'
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vm) (v_Vo))
∨
((apart_point_and_line (v_Vm) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vm)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
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
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vn))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vn))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vn)))
)
)
)
)
)))
 (λ (v_Vt : τ (ι)),
 λ (v_Vu : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vt)))
)
)
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 ∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vo))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vo))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vo) (v_Vt)))
)
)
)
)
))
 (λ (v_Vv : τ (ι)),
 λ (v_Vw : ϵ (¬
 (∀α (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vv))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vp : τ (ι)),
 (apart_point_and_line (v_Vp) (v_Vv))
∨
((apart_point_and_line (v_Vp) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vp) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
)
 (λ (v_Vx : τ (ι)),
 λ (v_Vy : ϵ (¬
 ((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vx) (v_Vv))
 ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
)
 (λ (v_Vz : ϵ (¬
 (apart_point_and_line (v_Vx) (v_Vv)))),
 λ (v_Vaa : ϵ (¬
 ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vx) (v_Vt))
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
)
 (λ (v_Vba : ϵ (¬
 (apart_point_and_line (v_Vx) (v_Vt)))),
 λ (v_Vca : ϵ (¬
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (v_Vv))
 ((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
)
 (λ (v_Vda : ϵ (¬
 (apart_point_and_line (v_Vr) (v_Vv)))),
 λ (v_Vea : ϵ (¬
 ((apart_point_and_line (v_Vr) (v_Vt))
∨
((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
))),
 Rnotor
 (apart_point_and_line (v_Vr) (v_Vt))
 ((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
)
 (λ (v_Vfa : ϵ (¬
 (apart_point_and_line (v_Vr) (v_Vt)))),
 λ (v_Vga : ϵ (¬
 ((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
(¬
 (distinct_lines (v_Vv) (v_Vt)))
))),
 Rnotor
 (¬
 (distinct_points (v_Vx) (v_Vr)))
 (¬
 (distinct_lines (v_Vv) (v_Vt)))
 (λ (v_Vha : ϵ (¬
 (¬
 (distinct_points (v_Vx) (v_Vr))))),
 λ (v_Via : ϵ (¬
 (¬
 (distinct_lines (v_Vv) (v_Vt))))),
 Rnotnot
 (distinct_lines (v_Vv) (v_Vt))
 (λ (v_Vja : ϵ (distinct_lines (v_Vv) (v_Vt))),
 Rnotnot
 (distinct_points (v_Vx) (v_Vr))
 (λ (v_Vka : ϵ (distinct_points (v_Vx) (v_Vr))),
 Rall
 (ι)
 (λ (v_Vla : τ (ι)),
 ∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vla) (v_Vma)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
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
)
))))
 (v_Vx)
 (λ (v_Vpa : ϵ (∀α (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vma)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)
))))),
 Rall
 (ι)
 (λ (v_Vma : τ (ι)),
 ∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vma)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vma) (v_Vna))
∨
(apart_point_and_line (v_Vma) (v_Voa))
)
)
)
)
)))
 (v_Vr)
 (λ (v_Vqa : ϵ (∀α (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vna))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
)))),
 Rall
 (ι)
 (λ (v_Vna : τ (ι)),
 ∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vna) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vna))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vna))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
))
 (v_Vv)
 (λ (v_Vra : ϵ (∀α (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vv) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
))),
 Rall
 (ι)
 (λ (v_Voa : τ (ι)),
 (¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vv) (v_Voa)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Voa))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Voa))
)
)
)
)
)
 (v_Vt)
 (λ (v_Vsa : ϵ ((¬
 (distinct_points (v_Vx) (v_Vr)))
∨
((¬
 (distinct_lines (v_Vv) (v_Vt)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
)
)),
 Ror
 (¬
 (distinct_points (v_Vx) (v_Vr)))
 ((¬
 (distinct_lines (v_Vv) (v_Vt)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
)
 (λ (v_Vta : ϵ (¬
 (distinct_points (v_Vx) (v_Vr)))),
 Raxiom
 (distinct_points (v_Vx) (v_Vr))
 (v_Vka)
 (v_Vta)
)
 (λ (v_Vua : ϵ ((¬
 (distinct_lines (v_Vv) (v_Vt)))
∨
((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
)),
 Ror
 (¬
 (distinct_lines (v_Vv) (v_Vt)))
 ((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)
 (λ (v_Vva : ϵ (¬
 (distinct_lines (v_Vv) (v_Vt)))),
 Raxiom
 (distinct_lines (v_Vv) (v_Vt))
 (v_Vja)
 (v_Vva)
)
 (λ (v_Vwa : ϵ ((apart_point_and_line (v_Vx) (v_Vv))
∨
((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
)),
 Ror
 (apart_point_and_line (v_Vx) (v_Vv))
 ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)
 (λ (v_Vxa : ϵ (apart_point_and_line (v_Vx) (v_Vv))),
 Raxiom
 (apart_point_and_line (v_Vx) (v_Vv))
 (v_Vxa)
 (v_Vz)
)
 (λ (v_Vya : ϵ ((apart_point_and_line (v_Vx) (v_Vt))
∨
((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
)),
 Ror
 (apart_point_and_line (v_Vx) (v_Vt))
 ((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)
 (λ (v_Vza : ϵ (apart_point_and_line (v_Vx) (v_Vt))),
 Raxiom
 (apart_point_and_line (v_Vx) (v_Vt))
 (v_Vza)
 (v_Vba)
)
 (λ (v_Vab : ϵ ((apart_point_and_line (v_Vr) (v_Vv))
∨
(apart_point_and_line (v_Vr) (v_Vt))
)),
 Ror
 (apart_point_and_line (v_Vr) (v_Vv))
 (apart_point_and_line (v_Vr) (v_Vt))
 (λ (v_Vbb : ϵ (apart_point_and_line (v_Vr) (v_Vv))),
 Raxiom
 (apart_point_and_line (v_Vr) (v_Vv))
 (v_Vbb)
 (v_Vda)
)
 (λ (v_Vcb : ϵ (apart_point_and_line (v_Vr) (v_Vt))),
 Raxiom
 (apart_point_and_line (v_Vr) (v_Vt))
 (v_Vcb)
 (v_Vfa)
)
 (v_Vab)
)
 (v_Vya)
)
 (v_Vwa)
)
 (v_Vua)
)
 (v_Vsa)
)
 (v_Vra)
)
 (v_Vqa)
)
 (v_Vpa)
)
 (ax_c_0_9)
)
 (v_Vha)
)
 (v_Via)
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
formulas created: 519

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_13_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.06 WC = 0.13 
OUTPUT: c_0_13_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.06 WC = 0.13 
