require open Logic.Zenon.FOL ;

//----Symbol signatures
constant symbol asked : κ ;
constant symbol isa : κ → κ → κ ;
constant symbol knave : κ ;
constant symbol knight : κ ;
constant symbol or : κ → κ → κ ;
constant symbol other : κ ;
constant symbol says : κ → κ → Prop ;
constant symbol truth : κ → Prop ;

//----The problem formulae
symbol everyone_a_knight_or_knave_0001_0001 : ϵ (∀ (λ P, (((truth (isa P knight))) ∨ ((truth (isa P knave)))))) ;
symbol not_both_a_knight_and_knave_0002_0002 : ϵ (∀ (λ P, ((¬ ((truth (isa P knight)))) ∨ (¬ ((truth (isa P knave))))))) ;
symbol knights_make_true_statements1_0003_0003 : ϵ (∀ (λ P, (∀ (λ S, (((truth S)) ∨ ((¬ ((truth (isa P knight)))) ∨ (¬ ((says P S))))))))) ;
symbol knights_make_true_statements2_0004_0004 : ϵ (∀ (λ S, (∀ (λ P, (((truth (isa P knight))) ∨ ((¬ ((truth S))) ∨ (¬ ((says P S))))))))) ;
symbol or1_0005_0005 : ϵ (∀ (λ B, (∀ (λ A, (((truth A)) ∨ (((truth B)) ∨ (¬ ((truth (or A B)))))))))) ;
symbol or2_0006_0006 : ϵ (∀ (λ B, (∀ (λ A, (((truth (or A B))) ∨ (¬ ((truth A)))))))) ;
symbol or3_0007_0007 : ϵ (∀ (λ B, (∀ (λ A, (((truth (or A B))) ∨ (¬ ((truth B)))))))) ;
symbol says_yes_0008_0008 : ϵ ((says asked (or (isa asked knight) (isa other knight)))) ;
symbol query_0009_0009 : ϵ (∀ (λ Y, (∀ (λ X, ((¬ ((truth (isa asked X)))) ∨ (¬ ((truth (isa other Y))))))))) ;
symbol conjecture_0000 : ϵ (⊥) ;

//----Derivation formulae
symbol query : ϵ (∀ (λ X2, (∀ (λ X1, ((¬ ((truth (isa asked X1)))) ∨ (¬ ((truth (isa other X2))))))))) ;
symbol everyone_a_knight_or_knave : ϵ (∀ (λ X1, (((truth (isa X1 knight))) ∨ ((truth (isa X1 knave)))))) ;
symbol c_0_2 : ϵ (∀ (λ X2, (∀ (λ X1, ((¬ ((truth (isa asked X1)))) ∨ (¬ ((truth (isa other X2))))))))) ;
symbol c_0_3 : ϵ (∀ (λ X1, (((truth (isa X1 knight))) ∨ ((truth (isa X1 knave)))))) ;
symbol c_0_4 : ϵ (∀ (λ X1, (¬ ((truth (isa other X1)))))) ;
symbol c_0_5 : ϵ (⊥) ;
