require open Logic.Zenon.FOL ;

//----Symbol signatures
constant symbol asked : κ ;
constant symbol isa : κ → κ → κ ;
constant symbol knave : κ ;
constant symbol knight : κ ;
constant symbol other : κ ;
constant symbol truth : κ → Prop ;

//----The problem formulae
symbol conjecture_0000 : ϵ (⊥) ;

//----Derivation formulae
symbol query : ϵ (∀ (λ X2, (∀ (λ X1, ((¬ ((truth (isa asked X1)))) ∨ (¬ ((truth (isa other X2))))))))) ;
symbol everyone_a_knight_or_knave : ϵ (∀ (λ X1, (((truth (isa X1 knight))) ∨ ((truth (isa X1 knave)))))) ;
symbol c_0_2 : ϵ (∀ (λ X2, (∀ (λ X1, ((¬ ((truth (isa asked X1)))) ∨ (¬ ((truth (isa other X2))))))))) ;
symbol c_0_3 : ϵ (∀ (λ X1, (((truth (isa X1 knight))) ∨ ((truth (isa X1 knave)))))) ;
symbol c_0_4 : ϵ (∀ (λ X1, (¬ ((truth (isa other X1)))))) ;
symbol c_0_5 : ϵ (⊥) ;
