require open Logic.Zenon.FOL ;

//----Symbol signatures
constant symbol esk1_0 : κ ;
constant symbol esk2_0 : κ ;
constant symbol esk3_0 : κ ;
constant symbol esk4_0 : κ ;
constant symbol intersection_point : κ → κ → κ ;
constant symbol line_connecting : κ → κ → κ ;
constant symbol apart_point_and_line : κ → κ → Prop ;
constant symbol convergent_lines : κ → κ → Prop ;
constant symbol distinct_lines : κ → κ → Prop ;
constant symbol distinct_points : κ → κ → Prop ;

//----The problem formulae
symbol apart1_0001 : ϵ (∀ (λ X, (¬ ((distinct_points X X))))) ;
symbol apart2_0002 : ϵ (∀ (λ X, (¬ ((distinct_lines X X))))) ;
symbol apart3_0003 : ϵ (∀ (λ X, (¬ ((convergent_lines X X))))) ;
symbol apart4_0004 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((distinct_points X Y)) ⇒ (((distinct_points X Z)) ∨ ((distinct_points Y Z)))))))))) ;
symbol apart5_0005 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((distinct_lines X Y)) ⇒ (((distinct_lines X Z)) ∨ ((distinct_lines Y Z)))))))))) ;
symbol apart6_0006 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((convergent_lines X Y)) ⇒ (((convergent_lines X Z)) ∨ ((convergent_lines Y Z)))))))))) ;
symbol con1_0007 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((distinct_points X Y)) ⇒ (((apart_point_and_line Z (line_connecting X Y))) ⇒ (((distinct_points Z X)) ∧ ((distinct_points Z Y))))))))))) ;
symbol con2_0008 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((convergent_lines X Y)) ⇒ ((((apart_point_and_line Z X)) ∨ ((apart_point_and_line Z Y))) ⇒ ((distinct_points Z (intersection_point X Y))))))))))) ;
symbol cu1_0009 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ U, (∀ (λ V, ((((distinct_points X Y)) ∧ ((distinct_lines U V))) ⇒ (((apart_point_and_line X U)) ∨ (((apart_point_and_line X V)) ∨ (((apart_point_and_line Y U)) ∨ ((apart_point_and_line Y V)))))))))))))) ;
symbol ceq1_0010 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((apart_point_and_line X Y)) ⇒ (((distinct_points X Z)) ∨ ((apart_point_and_line Z Y)))))))))) ;
symbol ceq2_0011 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ Z, (((apart_point_and_line X Y)) ⇒ (((distinct_lines Y Z)) ∨ ((apart_point_and_line X Z)))))))))) ;
symbol ceq3_0012 : ϵ (∀ (λ X, (∀ (λ Y, (((convergent_lines X Y)) ⇒ ((distinct_lines X Y))))))) ;
symbol con_0013 : ϵ (∀ (λ X, (∀ (λ Y, (∀ (λ U, (∀ (λ V, ((((distinct_points X Y)) ∧ (((convergent_lines U V)) ∧ ((distinct_lines U (line_connecting X Y))))) ⇒ (((apart_point_and_line X U)) ∨ ((apart_point_and_line Y U)))))))))))) ;

//----Derivation formulae
symbol con : ϵ (∀ (λ X1, (∀ (λ X2, (∀ (λ X4, (∀ (λ X5, ((((distinct_points X1 X2)) ∧ (((convergent_lines X4 X5)) ∧ ((distinct_lines X4 (line_connecting X1 X2))))) ⇒ (((apart_point_and_line X1 X4)) ∨ ((apart_point_and_line X2 X4)))))))))))) ;
symbol apart1 : ϵ (∀ (λ X1, (¬ ((distinct_points X1 X1))))) ;
symbol apart4 : ϵ (∀ (λ X1, (∀ (λ X2, (∀ (λ X3, (((distinct_points X1 X2)) ⇒ (((distinct_points X1 X3)) ∨ ((distinct_points X2 X3)))))))))) ;
symbol cu1 : ϵ (∀ (λ X1, (∀ (λ X2, (∀ (λ X4, (∀ (λ X5, ((((distinct_points X1 X2)) ∧ ((distinct_lines X4 X5))) ⇒ (((apart_point_and_line X1 X4)) ∨ (((apart_point_and_line X1 X5)) ∨ (((apart_point_and_line X2 X4)) ∨ ((apart_point_and_line X2 X5)))))))))))))) ;
symbol con1 : ϵ (∀ (λ X1, (∀ (λ X2, (∀ (λ X3, (((distinct_points X1 X2)) ⇒ (((apart_point_and_line X3 (line_connecting X1 X2))) ⇒ (((distinct_points X3 X1)) ∧ ((distinct_points X3 X2))))))))))) ;
symbol c_0_5 : ϵ (¬ (∀ (λ X1, (∀ (λ X2, (∀ (λ X4, (∀ (λ X5, ((((distinct_points X1 X2)) ∧ (((convergent_lines X4 X5)) ∧ ((distinct_lines X4 (line_connecting X1 X2))))) ⇒ (((apart_point_and_line X1 X4)) ∨ ((apart_point_and_line X2 X4))))))))))))) ;
symbol c_0_6 : ϵ (∀ (λ X1, (¬ ((distinct_points X1 X1))))) ;
symbol c_0_7 : ϵ (∀ (λ X9, (∀ (λ X10, (∀ (λ X11, ((¬ ((distinct_points X9 X10))) ∨ (((distinct_points X9 X11)) ∨ ((distinct_points X10 X11)))))))))) ;
symbol c_0_8 : ϵ (((distinct_points esk1_0 esk2_0)) ∧ (((convergent_lines esk3_0 esk4_0)) ∧ (((distinct_lines esk3_0 (line_connecting esk1_0 esk2_0))) ∧ ((¬ ((apart_point_and_line esk1_0 esk3_0))) ∧ (¬ ((apart_point_and_line esk2_0 esk3_0))))))) ;
symbol c_0_9 : ϵ (∀ (λ X24, (∀ (λ X25, (∀ (λ X26, (∀ (λ X27, ((¬ ((distinct_points X24 X25))) ∨ ((¬ ((distinct_lines X26 X27))) ∨ (((apart_point_and_line X24 X26)) ∨ (((apart_point_and_line X24 X27)) ∨ (((apart_point_and_line X25 X26)) ∨ ((apart_point_and_line X25 X27))))))))))))))) ;
symbol c_0_10 : ϵ (∀ (λ X6, (¬ ((distinct_points X6 X6))))) ;
symbol c_0_11 : ϵ (∀ (λ X2, (∀ (λ X3, (∀ (λ X1, (((distinct_points X1 X3)) ∨ (((distinct_points X2 X3)) ∨ (¬ ((distinct_points X1 X2))))))))))) ;
symbol c_0_12 : ϵ ((distinct_points esk1_0 esk2_0)) ;
symbol c_0_13 : ϵ (∀ (λ X2, (∀ (λ X4, (∀ (λ X3, (∀ (λ X1, (((apart_point_and_line X1 X3)) ∨ (((apart_point_and_line X1 X4)) ∨ (((apart_point_and_line X2 X3)) ∨ (((apart_point_and_line X2 X4)) ∨ ((¬ ((distinct_points X1 X2))) ∨ (¬ ((distinct_lines X3 X4)))))))))))))))) ;
symbol c_0_14 : ϵ ((distinct_lines esk3_0 (line_connecting esk1_0 esk2_0))) ;
symbol c_0_15 : ϵ (∀ (λ X1, (¬ ((distinct_points X1 X1))))) ;
symbol c_0_16 : ϵ (∀ (λ X1, (((distinct_points esk1_0 X1)) ∨ ((distinct_points esk2_0 X1))))) ;
symbol c_0_17 : ϵ (∀ (λ X18, (∀ (λ X19, (∀ (λ X20, ((((distinct_points X20 X18)) ∨ ((¬ ((apart_point_and_line X20 (line_connecting X18 X19)))) ∨ (¬ ((distinct_points X18 X19))))) ∧ (((distinct_points X20 X19)) ∨ ((¬ ((apart_point_and_line X20 (line_connecting X18 X19)))) ∨ (¬ ((distinct_points X18 X19)))))))))))) ;
symbol c_0_18 : ϵ (∀ (λ X2, (∀ (λ X1, (((apart_point_and_line X1 (line_connecting esk1_0 esk2_0))) ∨ (((apart_point_and_line X2 (line_connecting esk1_0 esk2_0))) ∨ (((apart_point_and_line X1 esk3_0)) ∨ (((apart_point_and_line X2 esk3_0)) ∨ (¬ ((distinct_points X1 X2))))))))))) ;
symbol c_0_19 : ϵ ((distinct_points esk2_0 esk1_0)) ;
symbol c_0_20 : ϵ (¬ ((apart_point_and_line esk2_0 esk3_0))) ;
symbol c_0_21 : ϵ (¬ ((apart_point_and_line esk1_0 esk3_0))) ;
symbol c_0_22 : ϵ (∀ (λ X3, (∀ (λ X2, (∀ (λ X1, (((distinct_points X1 X2)) ∨ ((¬ ((apart_point_and_line X1 (line_connecting X2 X3)))) ∨ (¬ ((distinct_points X2 X3))))))))))) ;
symbol c_0_23 : ϵ (((apart_point_and_line esk1_0 (line_connecting esk1_0 esk2_0))) ∨ ((apart_point_and_line esk2_0 (line_connecting esk1_0 esk2_0)))) ;
symbol c_0_24 : ϵ (∀ (λ X3, (∀ (λ X2, (∀ (λ X1, (((distinct_points X1 X2)) ∨ ((¬ ((apart_point_and_line X1 (line_connecting X3 X2)))) ∨ (¬ ((distinct_points X3 X2))))))))))) ;
symbol c_0_25 : ϵ ((apart_point_and_line esk2_0 (line_connecting esk1_0 esk2_0))) ;
symbol c_0_26 : ϵ (⊥) ;
