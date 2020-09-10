% fof(bada,axiom,
%     p(a) & ~q(a)  ).

fof(a1,axiom,
    p(a) ).

fof(mp,axiom,
    ! [X] :
      ( p(X) => q(X) )).

fof(query,conjecture,
    ? [X] : q(X)  ).
