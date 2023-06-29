%------------------------------------------------------------------------------
% File     : GEO173+2 : TPTP v8.2.0. Released v3.3.0.
% Domain   : Geometry (Constructive)
% Problem  : Lemma on symmetry and apartness
% Version  : [vPl95] axioms : Reduced > Especial.
% English  : If two points are distinct and a line U is distinct from the
%            line connecting the points, then U is apart from at least one
%            of these points.

% Refs     : [vPl95] von Plato (1995), The Axioms of Constructive Geometry
%          : [Li97]  Li (1997), Replacing the Axioms for Connecting Lines a
%          : [Li98]  Li (1998), A Shorter and Intuitive Axiom to Replace th
%          : [ROK06] Raths et al. (2006), The ILTP Problem Library for Intu
% Source   : [ILTP]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.09 v5.3.0, 0.17 v5.2.0, 0.14 v5.0.0, 0.00 v3.3.0
% Syntax   : Number of formulae    :   13 (   3 unt;   0 def)
%            Number of atoms       :   39 (   0 equ)
%            Maximal formula atoms :    6 (   3 avg)
%            Number of connectives :   29 (   3   ~;  10   |;   4   &)
%                                         (   0 <=>;  12  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    9 (   6 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   4 usr;   0 prp; 2-2 aty)
%            Number of functors    :    2 (   2 usr;   0 con; 2-2 aty)
%            Number of variables   :   34 (  34   !;   0   ?)
% SPC      : FOF_THM_RFO_NEQ

% Comments :  Definitions unfolded, hence Especial.
%------------------------------------------------------------------------------
%----Apartness for distinct points, distinct lines, convergent lines
fof(apart1,axiom,
    ! [X] : ~ distinct_points(X,X) ).

fof(apart2,axiom,
    ! [X] : ~ distinct_lines(X,X) ).

fof(apart3,axiom,
    ! [X] : ~ convergent_lines(X,X) ).

fof(apart4,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( distinct_points(X,Z)
        | distinct_points(Y,Z) ) ) ).

fof(apart5,axiom,
    ! [X,Y,Z] :
      ( distinct_lines(X,Y)
     => ( distinct_lines(X,Z)
        | distinct_lines(Y,Z) ) ) ).

fof(apart6,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( convergent_lines(X,Z)
        | convergent_lines(Y,Z) ) ) ).

%----Connecting lines and intersection points
fof(con1,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( apart_point_and_line(Z,line_connecting(X,Y))
       => ( distinct_points(Z,X)
          & distinct_points(Z,Y) ) ) ) ).

fof(con2,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( ( apart_point_and_line(Z,X)
          | apart_point_and_line(Z,Y) )
       => distinct_points(Z,intersection_point(X,Y)) ) ) ).

%----Constructive uniqueness axiom for lines and points
fof(cu1,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & distinct_lines(U,V) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(X,V)
        | apart_point_and_line(Y,U)
        | apart_point_and_line(Y,V) ) ) ).

%----Compatibility of equality with apartness and convergence
fof(ceq1,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_points(X,Z)
        | apart_point_and_line(Z,Y) ) ) ).

fof(ceq2,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_lines(Y,Z)
        | apart_point_and_line(X,Z) ) ) ).

fof(ceq3,axiom,
    ! [X,Y] :
      ( convergent_lines(X,Y)
     => distinct_lines(X,Y) ) ).

fof(con,conjecture,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).

%------------------------------------------------------------------------------
