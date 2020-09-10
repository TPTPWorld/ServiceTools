% SZS output start ListOfFormulae
%--------------------------------------------------------------------------
% File     : BOO001-0 : TPTP v7.3.0. Released v1.0.0.
% Domain   : Algebra (Ternary Boolean)
% Axioms   : Ternary Boolean algebra (equality) axioms
% Version  : [OTTER] (equality) axioms.
% English  :
% Refs     : [Wos88] Wos (1988), Automated Reasoning - 33 Basic Research Pr
%          : [Win82] Winker (1982), Generation and Verification of Finite M
% Source   : [OTTER]
% Names    :
% Status   : Satisfiable
% Syntax   : Number of clauses    :    5 (   0 non-Horn;   5 unit;   0 RR)
%            Number of atoms      :    5 (   5 equality)
%            Maximal clause size  :    1 (   1 average)
%            Number of predicates :    1 (   0 propositional; 2-2 arity)
%            Number of functors   :    2 (   0 constant; 1-3 arity)
%            Number of variables  :   13 (   2 singleton)
%            Maximal term depth   :    3 (   2 average)
% SPC      : 
% Comments : These axioms appear in [Win82], in which ternary_multiply_1 is
%            shown to be independant.
%          : These axioms are also used in [Wos88], p.222.
%--------------------------------------------------------------------------
cnf(associativity,axiom,( multiply(multiply(V,W,X),Y,multiply(V,W,Z)) = multiply(V,W,multiply(X,Y,Z)) )).
cnf(ternary_multiply_1,axiom,( multiply(Y,X,X) = X )).
cnf(ternary_multiply_2,axiom,( multiply(X,X,Y) = X )).
cnf(left_inverse,axiom,( multiply(inverse(Y),Y,X) = X )).
cnf(right_inverse,axiom,( multiply(X,Y,inverse(Y)) = X )).
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% File     : BOO001-1 : TPTP v7.3.0. Released v1.0.0.
% Domain   : Boolean Algebra (Ternary)
% Problem  : In B3 algebra, inverse is an involution
% Version  : [OTTER] (equality) axioms.
% English  :
% Refs     :
% Source   : [OTTER]
% Names    : tba_gg.in [OTTER]
% Status   : Unsatisfiable
% Rating   : 0.11 v7.1.0, 0.06 v7.0.0, 0.05 v6.3.0, 0.06 v6.2.0, 0.07 v6.1.0, 0.06 v6.0.0, 0.19 v5.5.0, 0.21 v5.4.0, 0.07 v5.3.0, 0.00 v5.2.0, 0.07 v5.1.0, 0.00 v2.2.1, 0.11 v2.2.0, 0.14 v2.1.0, 0.25 v2.0.0
% Syntax   : Number of clauses     :    6 (   0 non-Horn;   6 unit;   1 RR)
%            Number of atoms       :    6 (   6 equality)
%            Maximal clause size   :    1 (   1 average)
%            Number of predicates  :    1 (   0 propositional; 2-2 arity)
%            Number of functors    :    3 (   1 constant; 0-3 arity)
%            Number of variables   :   13 (   2 singleton)
%            Maximal term depth    :    3 (   2 average)
% SPC      : CNF_UNS_RFO_PEQ_UEQ
% Comments :
%--------------------------------------------------------------------------
%----Include ternary Boolean algebra axioms
%--------------------------------------------------------------------------
cnf(prove_inverse_is_self_cancelling,negated_conjecture,( inverse(inverse(a)) != a )).
%--------------------------------------------------------------------------
% SZS output end ListOfFormulae
