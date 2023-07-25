require open Logic.Zenon.FOL ;

//----Symbol signatures
constant symbol capital_of : κ → κ ;
constant symbol usa : κ ;
constant symbol beautiful : κ → Prop ;
constant symbol big_city : κ → Prop ;
constant symbol city : κ → Prop ;
constant symbol country : κ → Prop ;
constant symbol has_crime : κ → Prop ;

//----The problem formulae
symbol Prf problem_conjecture_nnpp ≔ Prf (¬ (∃ (λ X1, (((city X1)) ∧ (((beautiful X1)) ∧ ((has_crime X1))))))) → Prf problem_conjecture_nnpp ;

//----Derivation formulae
symbol some_beautiful_crime : ϵ (∃ (λ X1, (((city X1)) ∧ (((beautiful X1)) ∧ ((has_crime X1)))))) ;
symbol country_big_city : ϵ (∀ (λ X1, (((country X1)) ⇒ (((big_city (capital_of X1))) ∧ ((beautiful (capital_of X1))))))) ;
symbol crime_axiom : ϵ (∀ (λ X1, (((big_city X1)) ⇒ ((has_crime X1))))) ;
symbol big_city_city : ϵ (∀ (λ X1, (((big_city X1)) ⇒ ((city X1))))) ;
symbol country_usa : ϵ ((country usa)) ;
symbol c_0_5 : ϵ (¬ (∃ (λ X1, (((city X1)) ∧ (((beautiful X1)) ∧ ((has_crime X1))))))) ;
symbol c_0_6 : ϵ (∀ (λ X2, ((¬ ((city X2))) ∨ ((¬ ((beautiful X2))) ∨ (¬ ((has_crime X2))))))) ;
symbol c_0_7 : ϵ (∀ (λ X4, ((((big_city (capital_of X4))) ∨ (¬ ((country X4)))) ∧ (((beautiful (capital_of X4))) ∨ (¬ ((country X4))))))) ;
symbol c_0_8 : ϵ (∀ (λ X1, ((¬ ((city X1))) ∨ ((¬ ((beautiful X1))) ∨ (¬ ((has_crime X1))))))) ;
symbol c_0_9 : ϵ (∀ (λ X1, (((beautiful (capital_of X1))) ∨ (¬ ((country X1)))))) ;
symbol c_0_10 : ϵ (∀ (λ X3, ((¬ ((big_city X3))) ∨ ((has_crime X3))))) ;
symbol c_0_11 : ϵ (∀ (λ X5, ((¬ ((big_city X5))) ∨ ((city X5))))) ;
symbol c_0_12 : ϵ (∀ (λ X1, ((¬ ((has_crime (capital_of X1)))) ∨ ((¬ ((city (capital_of X1)))) ∨ (¬ ((country X1))))))) ;
symbol c_0_13 : ϵ (∀ (λ X1, (((has_crime X1)) ∨ (¬ ((big_city X1)))))) ;
symbol c_0_14 : ϵ (∀ (λ X1, (((city X1)) ∨ (¬ ((big_city X1)))))) ;
symbol c_0_15 : ϵ (∀ (λ X1, (((big_city (capital_of X1))) ∨ (¬ ((country X1)))))) ;
symbol c_0_16 : ϵ (∀ (λ X1, ((¬ ((big_city (capital_of X1)))) ∨ (¬ ((country X1)))))) ;
symbol c_0_17 : ϵ ((country usa)) ;
symbol c_0_18 : ϵ (∀ (λ X1, (¬ ((country X1))))) ;
symbol c_0_19 : ϵ (⊥) ;
