%--------------------------------------------------------------------------
% File     : SET006+0 : TPTP v3.3.0. Released v2.2.0.
% Domain   : Set Theory
% Axioms   : Naive set theory axioms based on Goedel's set theory
% Version  : [<a href="http://www.cs.miami.edu/%7Etptp/cgi-bin/DVTPTP2WWW/view_file.pl?Category=BibTeX&File=Pas99">Pas99</a>] axioms.
% English  :

% Refs     : [<a href="http://www.cs.miami.edu/%7Etptp/cgi-bin/DVTPTP2WWW/view_file.pl?Category=BibTeX&File=Pas99">Pas99</a>] Pastre (1999), Email to G. Sutcliffe
% Source   : [<a href="http://www.cs.miami.edu/%7Etptp/cgi-bin/DVTPTP2WWW/view_file.pl?Category=BibTeX&File=Pas99">Pas99</a>]
% Names    :

% Status   :
% Syntax   : Number of formulae    :   11 (   1 unit)
%            Number of atoms       :   29 (   3 equality)
%            Maximal formula depth :    7 (   5 average)
%            Number of connectives :   20 (   2 ~  ;   2  |;   4  &)
%                                         (  10 <=>;   2 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    4 (   0 propositional; 2-2 arity)
%            Number of functors    :    9 (   1 constant; 0-2 arity)
%            Number of variables   :   28 (   0 singleton;  27 !;   1 ?)
%            Maximal term depth    :    2 (   1 average)

% Comments : 
%--------------------------------------------------------------------------
%----Axioms of operations on sets
fof(subset,axiom,
    ( ! [A,B] : 
        ( subset(A,B)
      <=> ! [X] : 
            ( member(X,A)
           => member(X,B) ) ) )).

fof(equal_set,axiom,
    ( ! [A,B] : 
        ( equal_set(A,B)
      <=> ( subset(A,B)
          & subset(B,A) ) ) )).

fof(power_set,axiom,
    ( ! [X,A] : 
        ( member(X,power_set(A))
      <=> subset(X,A) ) )).

fof(intersection,axiom,
    ( ! [X,A,B] : 
        ( member(X,intersection(A,B))
      <=> ( member(X,A)
          & member(X,B) ) ) )).

fof(union,axiom,
    ( ! [X,A,B] : 
        ( member(X,union(A,B))
      <=> ( member(X,A)
          | member(X,B) ) ) )).

fof(empty_set,axiom,
    ( ! [X] : ~ member(X,empty_set) )).

fof(difference,axiom,
    ( ! [B,A,E] : 
        ( member(B,difference(E,A))
      <=> ( member(B,E)
          & ~ member(B,A) ) ) )).

fof(singleton,axiom,
    ( ! [X,A] : 
        ( member(X,singleton(A))
      <=> X = A ) )).

fof(unordered_pair,axiom,
    ( ! [X,A,B] : 
        ( member(X,unordered_pair(A,B))
      <=> ( X = A
          | X = B ) ) )).

fof(sum,axiom,
    ( ! [X,A] : 
        ( member(X,sum(A))
      <=> ? [Y] : 
            ( member(Y,A)
            & member(X,Y) ) ) )).

fof(product,axiom,
    ( ! [X,A] : 
        ( member(X,product(A))
      <=> ! [Y] : 
            ( member(Y,A)
           => member(X,Y) ) ) )).

%
% Formulae
%

fof(evalVar, axiom,
	( ! [X] :
		(funcEval(symbX,X)=X))).

fof(evalConst, axiom,
	( ! [X,Y] :
		(funcEval(funcSymbConst(X),Y)=X))).

fof(evalMember1, axiom,
	( ! [X, Y, Z] :
		((funcEval(funcSymbMember(Y,Z),X)=symbTrue)
			<=> (member(funcEval(Y,X),funcEval(Z,X)))))).

fof(evalMember2, axiom,
	( ! [X, Y, Z] :
		((funcEval(funcSymbMember(Y,Z),X)=symbFalse)
			<=> (~member(funcEval(Y,X),funcEval(Z,X)))))).

fof(negation1,axiom,
	( ! [X] :
		((X=symbTrue) <=> (funcNot(X)=symbFalse)))).

fof(negation2,axiom,
	( ! [X] :
		((X=symbFalse) <=> (funcNot(X)=symbTrue)))).

fof(conjunction1,axiom,
	( ! [X, Y] :
		((funcAnd(X,Y)=symbTrue) <=> 
		((X=symbTrue) & (Y=symbTrue))))).

fof(conjunction2,axiom,
	( ! [X, Y] :
		((funcAnd(X,Y)=symbFalse) <=> 
		((X=symbFalse) | (Y=symbFalse))))).

fof(disjunction1,axiom,
	( ! [X, Y] :
		((funcOr(X,Y)=symbTrue) <=> 
		((X=symbTrue) | (Y=symbTrue))))).

fof(disjunction2,axiom,
	( ! [X, Y] :
		((funcOr(X,Y)=symbFalse) <=> 
		((X=symbFalse) & (Y=symbFalse))))).

fof(evalNot, axiom,
	( ! [X, Y] :
		(funcEval(funcSymbNot(Y),X)=funcNot(funcEval(Y,X))))).

fof(evalAnd, axiom,
	( ! [X, Y, Z] :
		(funcEval(funcSymbAnd(X,Y),Z)=
			funcAnd(funcEval(X,Z),funcEval(Y,Z))))).

fof(evalOr, axiom,
	( ! [X, Y, Z] :
		(funcEval(funcSymbOr(X,Y),Z)=
			funcOr(funcEval(X,Z),funcEval(Y,Z))))).

fof(separation, axiom,
	( ! [F]: ! [X]: 
		(member(X,separate(F)) <=> (funcEval(F,X)=symbTrue)))).

%fof(strange, conjecture,
%	(
%		( ! [X] : ((X=separate(funcSymbNot(funcSymbMember(symbX,symbX))))=>
%			(member(X,X))))
%		&
%		(( ? [S] : ! [X] : (member(X,S)=>(~member(X,X)))  ) => ($false))
%	)
%).

%fof(badSetIsBad, conjecture,
%	( ! [X] : ((X=separate(funcSymbNot(funcSymbMember(symbX,symbX))))=>
%			(member(X,X))))
%).

%fof(badSetIsContradictive, conjecture,
%	(~ ?[S]: ![X]: (member(X,S)<=>~member(X,X)))).

%fof(badSetExample, conjecture,
%	(
%		( ! [X] : ((X=separate(funcSymbNot(funcSymbMember(symbX,symbX))))=>
%			(member(X,X))))
%	=>
%		(?[S]: ![X]: (member(X,S)<=>~member(X,X)))
%	)
%).

fof(exampleOfSeparation, axiom,
	theBadSet = separate(funcSymbNot(funcSymbMember(symbX,symbX)))
).

fof(test, conjecture, 
	$false
).

%--------------------------------------------------------------------------
