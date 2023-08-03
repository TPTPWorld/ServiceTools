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
symbol country_usa_0001 : ϵ ((country usa)) ;
symbol country_big_city_0002 : ϵ (∀ (λ C, (((country C)) ⇒ (((big_city (capital_of C))) ∧ ((beautiful (capital_of C))))))) ;
symbol usa_capital_axiom_0003 : ϵ ((city (capital_of usa))) ;
symbol crime_axiom_0004 : ϵ (∀ (λ C, (((big_city C)) ⇒ ((has_crime C))))) ;
symbol big_city_city_0005 : ϵ (∀ (λ C, (((big_city C)) ⇒ ((city C))))) ;
symbol some_beautiful_crime_0006 : ϵ (∃ (λ C, (((city C)) ∧ (((beautiful C)) ∧ ((has_crime C)))))) ;

//----Derivation formulae
symbol ϵ problem_conjecture_nnpp ≔ ϵ (¬ (∃ (λ C, (((city C)) ∧ (((beautiful C)) ∧ ((has_crime C))))))) → ϵ problem_conjecture_nnpp ;
symbol c_0_5_neg : ϵ ((¬ (¬ (∃ (λ X1, (((city X1)) ∧ (((beautiful X1)) ∧ ((has_crime X1))))))))) ;
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
