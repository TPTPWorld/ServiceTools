%------------------------------------------------------------------------------
% domain size is 1
fof(domain,axiom,(
    ! [X] : X = d1 )).

fof(a_truth,axiom,
    ( a_truth(d1)
  <=> $false )).

fof(female,axiom,
    ( female(d1)
  <=> $false )).

fof(from_mars,axiom,
    ( from_mars(d1)
  <=> $false )).

fof(from_venus,axiom,
    ( from_venus(d1)
  <=> $true )).

fof(liar,axiom,
    ( liar(d1)
  <=> $true )).

fof(male,axiom,
    ( male(d1)
  <=> $true )).

fof(says,axiom,(
    ! [X1,X2] :
      ( says(X1,X2)
    <=> $false ) )).

fof(statement_by,axiom,(
    statement_by(d1) = d1 )).

fof(truthteller,axiom,
    ( truthteller(d1)
  <=> $false )).
%------------------------------------------------------------------------------
fof(from_mars_or_venus,axiom,(
    ! [X] :
      ( from_mars(X)
      | from_venus(X) ) )).

fof(not_from_mars_and_venus,axiom,(
    ! [X] :
      ( ~ from_mars(X)
      | ~ from_venus(X) ) )).

fof(male_or_female,axiom,(
    ! [X] :
      ( male(X)
      | female(X) ) )).

fof(not_male_and_female,axiom,(
    ! [X] :
      ( ~ male(X)
      | ~ female(X) ) )).

fof(truthteller_or_liar,axiom,(
    ! [X] :
      ( truthteller(X)
      | liar(X) ) )).

fof(not_truthteller_and_liar,axiom,(
    ! [X] :
      ( ~ truthteller(X)
      | ~ liar(X) ) )).

fof(statements_are_true_or_not,axiom,(
    ! [X,Y] :
      ( ~ says(X,Y)
      | a_truth(Y)
      | ~ a_truth(Y) ) )).

fof(people_say_their_statements,axiom,(
    ! [X,Y] :
      ( ~ says(X,Y)
      | Y = statement_by(X) ) )).

fof(true_statements_made_by_truthtellers,axiom,(
    ! [X] :
      ( ~ a_truth(statement_by(X))
      | truthteller(X) ) )).

fof(false_statements_made_by_liars,axiom,(
    ! [X] :
      ( a_truth(statement_by(X))
      | liar(X) ) )).

fof(venusian_female_are_truthtellers,axiom,(
    ! [X] :
      ( ~ from_venus(X)
      | ~ female(X)
      | truthteller(X) ) )).

fof(venusian_males_are_liars,axiom,(
    ! [X] :
      ( ~ from_venus(X)
      | ~ male(X)
      | liar(X) ) )).

fof(marsian_males_are_truthtellers,axiom,(
    ! [X] :
      ( ~ from_mars(X)
      | ~ male(X)
      | truthteller(X) ) )).

fof(marsian_females_are_liars,axiom,(
    ! [X] :
      ( ~ from_mars(X)
      | ~ female(X)
      | liar(X) ) )).

fof(truthtellers_make_true_statements,axiom,(
    ! [X,Y] :
      ( ~ truthteller(X)
      | ~ says(X,Y)
      | a_truth(Y) ) )).

fof(liars_make_false_statements,axiom,(
    ! [X,Y] :
      ( ~ liar(X)
      | ~ says(X,Y)
      | ~ a_truth(Y) ) )).
