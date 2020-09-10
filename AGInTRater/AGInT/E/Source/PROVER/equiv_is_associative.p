% Show that Boolean equivalence (if-and-only-if) is associative.

fof(equiv00, axiom, equiv(0,0)=1).
fof(equiv01, axiom, equiv(0,1)=0).
fof(equiv10, axiom, equiv(1,0)=0).
fof(equiv11, axiom, equiv(1,1)=1).

fof(domain_is_bool, axiom, ![X]:(X=0 | X=1)).
fof(zero_is_not_one, axiom, 1!=0).

fof(equiv_is_not_assoc, conjecture,
    ![X,Y,Z]:(equiv(X,equiv(Y,Z))=equiv(equiv(X,Y),Z))).

