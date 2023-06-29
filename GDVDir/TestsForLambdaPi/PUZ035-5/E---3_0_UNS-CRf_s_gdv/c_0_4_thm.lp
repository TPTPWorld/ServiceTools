require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm))))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm)))))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm))))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm))))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (truth (isa (other) (v_Vo)))))),
 Rnotnot
 (truth (isa (other) (v_Vo)))
 (λ (v_Vq : ϵ (truth (isa (other) (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vr : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vr))))
))
 (v_Vo)
 (λ (v_Vs : ϵ (∀α (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vo))))
))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)
 (knave)
 (λ (v_Vt : ϵ ((¬
 (truth (isa (asked) (knave))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)),
 Ror
 (¬
 (truth (isa (asked) (knave))))
 (¬
 (truth (isa (other) (v_Vo))))
 (λ (v_Vu : ϵ (¬
 (truth (isa (asked) (knave))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
)
 (asked)
 (λ (v_Vv : ϵ ((truth (isa (asked) (knight)))
∨
(truth (isa (asked) (knave)))
)),
 Ror
 (truth (isa (asked) (knight)))
 (truth (isa (asked) (knave)))
 (λ (v_Vw : ϵ (truth (isa (asked) (knight)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)
 (knight)
 (λ (v_Vx : ϵ ((¬
 (truth (isa (asked) (knight))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)),
 Ror
 (¬
 (truth (isa (asked) (knight))))
 (¬
 (truth (isa (other) (v_Vo))))
 (λ (v_Vy : ϵ (¬
 (truth (isa (asked) (knight))))),
 Raxiom
 (truth (isa (asked) (knight)))
 (v_Vw)
 (v_Vy)
)
 (λ (v_Vz : ϵ (¬
 (truth (isa (other) (v_Vo))))),
 Raxiom
 (truth (isa (other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vx)
)
 (v_Vs)
)
 (λ (v_Vaa : ϵ (truth (isa (asked) (knave)))),
 Raxiom
 (truth (isa (asked) (knave)))
 (v_Vaa)
 (v_Vu)
)
 (v_Vv)
)
 (ax_c_0_3)
)
 (λ (v_Vz : ϵ (¬
 (truth (isa (other) (v_Vo))))),
 Raxiom
 (truth (isa (other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vt)
)
 (v_Vs)
)
 (ax_c_0_2)
)
 (v_Vp)
)
 (v_Vn)
);
