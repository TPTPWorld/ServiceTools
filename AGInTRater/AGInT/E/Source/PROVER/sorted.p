fof(empty_is_sorted, axiom, sorted(nil)).
fof(single_is_sorted, axiom, ![X]:sorted(cons(X,nil))).
fof(rek_sort, axiom, ![X,Y,R]:((lt(X, Y) &
                                sorted(cons(Y,R)))
                                =>
                                sorted(cons(X, cons(Y,R))))).

fof(arith_1lt2, axiom, lt(1,2)).
fof(arith_2lt3, axiom, lt(2,3)).
fof(arith_3lt4, axiom, lt(3,4)).
fof(arith_lt_trans, axiom, ![X,Y,Z]:((lt(X,Y) & lt(Y,Z))=>lt(X,Z))).


    
fof(check_list, conjecture, sorted(cons(1, cons(2, cons(4, nil))))).
