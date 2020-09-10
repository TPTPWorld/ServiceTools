tff(test,axiom,p & a = b).
%----Not working in JJParser
% tff(fooleq,axiom,a = (~ b)).

% tff(fool_0,axiom,p(q & r)).
% tff(fool_1,axiom,p(! [Y: $i] : q(Y)) ).

tff(let,axiom,$let(a:$int,a:=27,a)).

tff(qq,axiom,! [X:$i] : p(X) = q(X)).
thf(qq,axiom,! [X:$i] : (p @ X) = ( q @ X)).
thf(qq,axiom,! [X:$i] : p = q).
thf(ww,axiom,ww & p = q).
