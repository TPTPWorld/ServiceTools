require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm)))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm))))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (distinct_points (v_Vm) (v_Vm)))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (distinct_points (v_Vo) (v_Vo))))),
 Rnotnot
 (distinct_points (v_Vo) (v_Vo))
 (λ (v_Vq : ϵ (⊥)),
 Rfalse
 (v_Vq))
 (v_Vp)
)
 (v_Vn)
);
