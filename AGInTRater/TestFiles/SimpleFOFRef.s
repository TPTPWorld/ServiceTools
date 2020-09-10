fof(a,axiom,a).
fof(a_implies_b,axiom,a=>b).
fof(b_implies_c,axiom,b=>c).
fof(c,conjecture,c).

cnf(cnf_a,plain,a,inference(cnf,[],[a])).
cnf(cnf_a_implies_b,plain,~a | b,inference(cnf,[],[a_implies_b])).
cnf(cnf_b_implies_c,plain,~b | c,inference(cnf,[],[b_implies_c])).
fof(negated_c,negated_conjecture,~c,inference(cnf,[],[c])).
cnf(cnf_negated_c,negated_conjecture,~c,inference(cnf,[],[negated_c])).

cnf(b,plain,b,inference(resolve,[],[cnf_a,cnf_a_implies_b])).
cnf(not_b,plain,~b,inference(resolve,[],[cnf_b_implies_c,cnf_negated_c])).
cnf(proved,plain,$false,inference(resolve,[],[b,not_b])).
cnf(proof_root,plain,$false,proved).
