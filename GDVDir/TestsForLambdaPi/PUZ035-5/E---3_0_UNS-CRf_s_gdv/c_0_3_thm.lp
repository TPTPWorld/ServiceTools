require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
)) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
)))),
 Raxiom
 (∀α (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
))
 (ax_everyone_a_knight_or_knave)
 (v_Vn)
);
