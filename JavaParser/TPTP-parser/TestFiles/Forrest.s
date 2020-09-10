fof(a,axiom,a).

fof(b,axiom,b).

fof(c,axiom,c).

fof(forrest,plain,abc,
    [inference(magic1,[status(thm)],[a,b]),
     inference(magic2,[status(thm)],[b,c])],
    [useless]).
