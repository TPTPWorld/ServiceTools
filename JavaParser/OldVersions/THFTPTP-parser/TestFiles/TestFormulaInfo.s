fof(a,axiom,a).

fof(a_implies_b,axiom,a => b).

fof(b,theorem,d != c,inference(mp,[status(thm)],[a,a_implies_b]),
[foo([X,$fof(! [Y] : p(Y))],data)]).
