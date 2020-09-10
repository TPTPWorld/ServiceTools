fof(a_implies_b,axiom,a=>b).

fof(c,plain,c,inference(mp,[assumptions([a]),status(thm)],[b,b_implies_c])).
fof(a,assumption,a).
fof(d,plain,d,inference(mp,[assumptions([a]),status(thm)],[a,a_implies_d])).
fof(a_implies_d,axiom,a=>d).

fof(b,plain,b,inference(mp,[assumptions([a]),status(thm)],[a,a_implies_b])).
fof(c_and_d,theorem,c & d,inference(adj,[assumptions([a]),status(thm)],[c,d])).
fof(b_implies_c,axiom,b=>c).
