require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND ;
require open Logic.Zenon.zen ;
require open PUZ035-5.E---3_0_UNS-CRf_s_gdv.Signature ;

symbol everyone_a_knight_or_knave : ϵ (∀ (λ P, (((truth (isa P knight))) ∨ ((truth (isa P knave)))))) ;
symbol not_both_a_knight_and_knave : ϵ (∀ (λ P, ((¬ ((truth (isa P knight)))) ∨ (¬ ((truth (isa P knave))))))) ;
symbol knights_make_true_statements1 : ϵ (∀ (λ P, (∀ (λ S, (((truth S)) ∨ ((¬ ((truth (isa P knight)))) ∨ (¬ ((says P S))))))))) ;
symbol knights_make_true_statements2 : ϵ (∀ (λ S, (∀ (λ P, (((truth (isa P knight))) ∨ ((¬ ((truth S))) ∨ (¬ ((says P S))))))))) ;
symbol or1 : ϵ (∀ (λ B, (∀ (λ A, (((truth A)) ∨ (((truth B)) ∨ (¬ ((truth (or A B)))))))))) ;
symbol or2 : ϵ (∀ (λ B, (∀ (λ A, (((truth (or A B))) ∨ (¬ ((truth A)))))))) ;
symbol or3 : ϵ (∀ (λ B, (∀ (λ A, (((truth (or A B))) ∨ (¬ ((truth B)))))))) ;
symbol says_yes : ϵ ((says asked (or (isa asked knight) (isa other knight)))) ;
symbol query : ϵ (∀ (λ Y, (∀ (λ X, ((¬ ((truth (isa asked X)))) ∨ (¬ ((truth (isa other Y))))))))) ;

require PUZ035-5.E---3_0_UNS-CRf_s_gdv.query as query ;
opaque symbol lemmas_query ≔ query.delta query ;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.everyone_a_knight_or_knave as everyone_a_knight_or_knave ;
opaque symbol lemmas_everyone_a_knight_or_knave ≔ everyone_a_knight_or_knave.delta everyone_a_knight_or_knave not_both_a_knight_and_knave knights_make_true_statements1 knights_make_true_statements2 or1 or2 or3 says_yes ;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.c_0_2 as c_0_2 ;
opaque symbol lemmas_c_0_2 ≔ c_0_2.delta lemmas_query_leaf ;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.c_0_3 as c_0_3 ;
opaque symbol lemmas_c_0_3 ≔ c_0_3.delta lemmas_everyone_a_knight_or_knave_leaf ;
require PUZ035-5.E---3_0_UNS-CRf_s_gdv.c_0_4 as c_0_4 ;
opaque symbol lemmas_c_0_4 ≔ c_0_4.delta lemmas_c_0_2 lemmas_c_0_3 lemmas_c_0_2 ;
