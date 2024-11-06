cnf(a,axiom,a).
cnf(ab,axiom,a=>b).
cnf(b,plain,b,inference(magic,[],[a,ab])).
