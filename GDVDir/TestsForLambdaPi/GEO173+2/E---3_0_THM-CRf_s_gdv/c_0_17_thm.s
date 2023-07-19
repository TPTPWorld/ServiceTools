ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p is ...
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

ZenonModulo---0.4.2's c_0_17_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p
ZenonModulo---0.4.2's own format source file is ...
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

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_17_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/c_0_17_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 215
max branch formulas: 87
proof nodes created: 57
formulas created: 967

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_17 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vm))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vn)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vn))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vn)))
)
)
))))
    (λ (v_Vp : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vm))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vn)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vn))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vn)))
)
)
)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vm))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vn)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vn))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vm) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vm) (v_Vn)))
)
)
)))
 (λ (v_Vq : τ (ι)),
 λ (v_Vr : ϵ (¬
 (∀α (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vn)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vn))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vn)))
)
)
))))),
 Rnotall
 (ι)
 (λ (v_Vn : τ (ι)),
 ∀α (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vn)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vn))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vn))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vn)))
)
)
))
 (λ (v_Vs : τ (ι)),
 λ (v_Vt : ϵ (¬
 (∀α (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vs))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
)))),
 Rnotall
 (ι)
 (λ (v_Vo : τ (ι)),
 ((S.distinct_points (v_Vo) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
∧
((S.distinct_points (v_Vo) (v_Vs))
∨
((¬
 (S.apart_point_and_line (v_Vo) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
)
 (λ (v_Vu : τ (ι)),
 λ (v_Vv : ϵ (¬
 (((S.distinct_points (v_Vu) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
∧
((S.distinct_points (v_Vu) (v_Vs))
∨
((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
))),
 Rnotand
 ((S.distinct_points (v_Vu) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
 ((S.distinct_points (v_Vu) (v_Vs))
∨
((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
)
 (λ (v_Vw : ϵ (¬
 ((S.distinct_points (v_Vu) (v_Vq))
∨
((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
))),
 Rnotor
 (S.distinct_points (v_Vu) (v_Vq))
 ((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
 (λ (v_Vx : ϵ (¬
 (S.distinct_points (v_Vu) (v_Vq)))),
 λ (v_Vy : ϵ (¬
 ((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
))),
 Rnotor
 (¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
 (¬
 (S.distinct_points (v_Vq) (v_Vs)))
 (λ (v_Vz : ϵ (¬
 (¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))))),
 λ (v_Vaa : ϵ (¬
 (¬
 (S.distinct_points (v_Vq) (v_Vs))))),
 Rnotnot
 (S.distinct_points (v_Vq) (v_Vs))
 (λ (v_Vba : ϵ (S.distinct_points (v_Vq) (v_Vs))),
 Rnotnot
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
 (λ (v_Vca : ϵ (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vda) (v_Vea))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vda) (v_Vea)))
⇒
((S.distinct_points (v_Vfa) (v_Vda))
∧
(S.distinct_points (v_Vfa) (v_Vea))
)
)
)))
 (v_Vq)
 (λ (v_Vga : ϵ (∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vea))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vea)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vea))
)
)
)))),
 Rall
 (ι)
 (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vea))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vea)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vea))
)
)
))
 (v_Vs)
 (λ (v_Vha : ϵ (∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vs))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vs))
)
)
))),
 Rall
 (ι)
 (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vs))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vs))
)
)
)
 (v_Vu)
 (λ (v_Via : ϵ ((S.distinct_points (v_Vq) (v_Vs))
⇒
((S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
)
)),
 Rimply
 (S.distinct_points (v_Vq) (v_Vs))
 ((S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
)
 (λ (v_Vja : ϵ (¬
 (S.distinct_points (v_Vq) (v_Vs)))),
 Raxiom
 (S.distinct_points (v_Vq) (v_Vs))
 (v_Vba)
 (v_Vja)
)
 (λ (v_Vka : ϵ ((S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
)),
 Rimply
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
 ((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
 (λ (v_Vla : ϵ (¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))),
 Raxiom
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
 (v_Vca)
 (v_Vla)
)
 (λ (v_Vma : ϵ ((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)),
 Rand
 (S.distinct_points (v_Vu) (v_Vq))
 (S.distinct_points (v_Vu) (v_Vs))
 (λ (v_Vna : ϵ (S.distinct_points (v_Vu) (v_Vq))),
 λ (v_Voa : ϵ (S.distinct_points (v_Vu) (v_Vs))),
 Raxiom
 (S.distinct_points (v_Vu) (v_Vq))
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
 (S.con1)
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
 ((S.distinct_points (v_Vu) (v_Vs))
∨
((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
))),
 Rnotor
 (S.distinct_points (v_Vu) (v_Vs))
 ((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
)
 (λ (v_Vqa : ϵ (¬
 (S.distinct_points (v_Vu) (v_Vs)))),
 λ (v_Vy : ϵ (¬
 ((¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
∨
(¬
 (S.distinct_points (v_Vq) (v_Vs)))
))),
 Rnotor
 (¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))
 (¬
 (S.distinct_points (v_Vq) (v_Vs)))
 (λ (v_Vz : ϵ (¬
 (¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))))),
 λ (v_Vaa : ϵ (¬
 (¬
 (S.distinct_points (v_Vq) (v_Vs))))),
 Rnotnot
 (S.distinct_points (v_Vq) (v_Vs))
 (λ (v_Vba : ϵ (S.distinct_points (v_Vq) (v_Vs))),
 Rnotnot
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
 (λ (v_Vca : ϵ (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))),
 Rall
 (ι)
 (λ (v_Vda : τ (ι)),
 ∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vda) (v_Vea))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vda) (v_Vea)))
⇒
((S.distinct_points (v_Vfa) (v_Vda))
∧
(S.distinct_points (v_Vfa) (v_Vea))
)
)
)))
 (v_Vq)
 (λ (v_Vga : ϵ (∀α (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vea))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vea)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vea))
)
)
)))),
 Rall
 (ι)
 (λ (v_Vea : τ (ι)),
 ∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vea))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vea)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vea))
)
)
))
 (v_Vs)
 (λ (v_Vha : ϵ (∀α (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vs))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vs))
)
)
))),
 Rall
 (ι)
 (λ (v_Vfa : τ (ι)),
 (S.distinct_points (v_Vq) (v_Vs))
⇒
((S.apart_point_and_line (v_Vfa) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vfa) (v_Vq))
∧
(S.distinct_points (v_Vfa) (v_Vs))
)
)
)
 (v_Vu)
 (λ (v_Via : ϵ ((S.distinct_points (v_Vq) (v_Vs))
⇒
((S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
)
)),
 Rimply
 (S.distinct_points (v_Vq) (v_Vs))
 ((S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
)
 (λ (v_Vja : ϵ (¬
 (S.distinct_points (v_Vq) (v_Vs)))),
 Raxiom
 (S.distinct_points (v_Vq) (v_Vs))
 (v_Vba)
 (v_Vja)
)
 (λ (v_Vka : ϵ ((S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
⇒
((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
)),
 Rimply
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
 ((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)
 (λ (v_Vla : ϵ (¬
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs))))),
 Raxiom
 (S.apart_point_and_line (v_Vu) (S.line_connecting (v_Vq) (v_Vs)))
 (v_Vca)
 (v_Vla)
)
 (λ (v_Vma : ϵ ((S.distinct_points (v_Vu) (v_Vq))
∧
(S.distinct_points (v_Vu) (v_Vs))
)),
 Rand
 (S.distinct_points (v_Vu) (v_Vq))
 (S.distinct_points (v_Vu) (v_Vs))
 (λ (v_Vna : ϵ (S.distinct_points (v_Vu) (v_Vq))),
 λ (v_Voa : ϵ (S.distinct_points (v_Vu) (v_Vs))),
 Raxiom
 (S.distinct_points (v_Vu) (v_Vs))
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
 (S.con1)
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
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_17_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.05 WC = 0.12  NodesSearch = 215 MaxBranchF = 87 ProofNodes = 57 Formulas = 967
OUTPUT: c_0_17_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.05 WC = 0.12 
