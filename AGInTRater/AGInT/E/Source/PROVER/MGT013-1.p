%--------------------------------------------------------------------------
% File     : MGT013-1 : TPTP v3.1.1. Released v2.4.0.
% Domain   : Management (Organisation Theory)
% Problem  : If organization complexity increases, its size cannot decrease 
% Version  : [PB+94] axioms.
% English  : If the complexity of an organization gets bigger, its size
%            cannot get smaller (in lack of reorganization).

% Refs     : [PB+94] Peli et al. (1994), A Logical Approach to Formalizing 
%          : [Kam94] Kamps (1994), Email to G. Sutcliffe
%          : [Kam95] Kamps (1995), Email to G. Sutcliffe
% Source   : [TPTP]
% Names    :

% Status   : Unsatisfiable
% Rating   : 0.00 v2.6.0, 0.11 v2.5.0, 0.00 v2.4.0
% Syntax   : Number of clauses     :   17 (   1 non-Horn;   9 unit;  17 RR)
%            Number of atoms       :   42 (   4 equality)
%            Maximal clause size   :    7 (   2 average)
%            Number of predicates  :    7 (   0 propositional; 1-3 arity)
%            Number of functors    :    7 (   7 constant; 0-0 arity)
%            Number of variables   :   26 (   1 singleton)
%            Maximal term depth    :    1 (   1 average)

% Comments : "Not published due to publication constraints." [Kam95].
%          : Created with tptp2X -f tptp -t clausify:otter MGT013+1.p 
%--------------------------------------------------------------------------
cnf(mp6_1_18,axiom,
    ( ~ greater(A,B)
    | A != B )).

cnf(mp6_2_19,axiom,
    ( ~ greater(A,B)
    | ~ greater(B,A) )).

cnf(mp15_20,axiom,
    ( ~ organization(A,B)
    | time(B) )).

cnf(mp16_21,axiom,
    ( ~ time(A)
    | ~ time(B)
    | greater(A,B)
    | A = B
    | greater(B,A) )).

cnf(mp17_22,axiom,
    ( ~ reorganization_free(A,B,C)
    | reorganization_free(A,C,B) )).

cnf(mp18_23,axiom,
    ( ~ organization(A,B)
    | ~ organization(A,C)
    | ~ complexity(A,D,B)
    | ~ complexity(A,E,C)
    | B != C
    | D = E )).

cnf(t11_FOL_24,hypothesis,
    ( ~ organization(A,B)
    | ~ organization(A,C)
    | ~ reorganization_free(A,B,C)
    | ~ size(A,D,B)
    | ~ size(A,E,C)
    | ~ greater(C,B)
    | ~ greater(D,E) )).

cnf(t12_FOL_25,hypothesis,
    ( ~ organization(A,B)
    | ~ organization(A,C)
    | ~ reorganization_free(A,B,C)
    | ~ complexity(A,D,B)
    | ~ complexity(A,E,C)
    | ~ greater(C,B)
    | ~ greater(D,E) )).

cnf(t13_FOL_26,negated_conjecture,
    ( organization(sk1,sk6) )).

cnf(t13_FOL_27,negated_conjecture,
    ( organization(sk1,sk7) )).

cnf(t13_FOL_28,negated_conjecture,
    ( reorganization_free(sk1,sk6,sk7) )).

cnf(t13_FOL_29,negated_conjecture,
    ( complexity(sk1,sk2,sk6) )).

cnf(t13_FOL_30,negated_conjecture,
    ( complexity(sk1,sk3,sk7) )).

cnf(t13_FOL_31,negated_conjecture,
    ( size(sk1,sk4,sk6) )).

cnf(t13_FOL_32,negated_conjecture,
    ( size(sk1,sk5,sk7) )).

cnf(t13_FOL_33,negated_conjecture,
    ( greater(sk3,sk2) )).

cnf(t13_FOL_34,negated_conjecture,
    ( greater(sk4,sk5) )).

%--------------------------------------------------------------------------
