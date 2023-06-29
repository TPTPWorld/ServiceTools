require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
)))

(λ (v_Vo : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
))))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 ∀α (λ (v_Vn : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vn))))
∨
(¬
 (truth (isa (other) (v_Vm))))
)))
 (ax_query)
 (v_Vo)
);
