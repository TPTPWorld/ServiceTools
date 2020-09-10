cnf(j_neutral_left,      axiom, j(0,X)      = X).
cnf(j_neutral_right,     axiom, j(X,0)      = X).
cnf(j_inverse_left,      axiom, j(g(X),X)   = 0).
cnf(j_inverse_right,     axiom, j(X,g(X))   = 0).
cnf(j_commutes,          axiom, j(X,Y)      = j(Y,X)).
cnf(j_associates,        axiom, j(j(X,Y),Z) = j(X,j(Y,Z))).
cnf(f_associates,        axiom, f(f(X,Y),Z) = f(X,f(Y,Z))).
cnf(f_distributes_left,  axiom, f(X,j(Y,Z)) = j(f(X,Y),f(X,Z))).
cnf(f_distributes_right, axiom, f(j(X,Y),Z) = j(f(X,Z),f(Y,Z))).
cnf(x_cubedequals_x,     axiom, f(f(X,X),X) = X).

fof(mult_commutes,conjecture,![X,Y]:(f(X,Y) = f(Y,X))).
