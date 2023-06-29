fof(everyone_a_knight_or_knave,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).
