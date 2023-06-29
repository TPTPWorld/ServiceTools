Paradox---4.0   system information being retrieved
Paradox---4.0's non-default parameters being retrieved
Paradox---4.0   being checked for execution
Paradox---4.0   checking time limit 60
Paradox---4.0   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/problem_axioms_sat.p

Paradox---4.0's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/problem_axioms_sat.p is ...
fof(everyone_a_knight_or_knave,axiom,
    ! [P] :
      ( truth(isa(P,knight))
      | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave,axiom,
    ! [P] :
      ( ~ truth(isa(P,knight))
      | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1,axiom,
    ! [P,S] :
      ( truth(S)
      | ~ truth(isa(P,knight))
      | ~ says(P,S) ) ).
fof(knights_make_true_statements2,axiom,
    ! [S,P] :
      ( truth(isa(P,knight))
      | ~ truth(S)
      | ~ says(P,S) ) ).
fof(or1,axiom,
    ! [B,A] :
      ( truth(A)
      | truth(B)
      | ~ truth(or(A,B)) ) ).
fof(or2,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(A) ) ).
fof(or3,axiom,
    ! [B,A] :
      ( truth(or(A,B))
      | ~ truth(B) ) ).
fof(says_yes,axiom,
    says(asked,or(isa(asked,knight),isa(other,knight))) ).

Paradox---4.0's problem_axioms_sat being prepared by /exp/home/tptp/ServiceTools/tptp4X
    -d /tmp/SystemOnTPTP46294 
    -t none 
    -f tptp:short
    -x 
    -u machine
    TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/problem_axioms_sat.p
Paradox---4.0   will use /tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short
Paradox---4.0's own format source file is ...
fof(everyone_a_knight_or_knave,axiom,! [P] : ( truth(isa(P,knight)) | truth(isa(P,knave)) ) ).
fof(not_both_a_knight_and_knave,axiom,! [P] : ( ~ truth(isa(P,knight)) | ~ truth(isa(P,knave)) ) ).
fof(knights_make_true_statements1,axiom,! [P] : ! [S] : ( truth(S) | ~ truth(isa(P,knight)) | ~ says(P,S) ) ).
fof(knights_make_true_statements2,axiom,! [S] : ! [P] : ( truth(isa(P,knight)) | ~ truth(S) | ~ says(P,S) ) ).
fof(or1,axiom,! [B] : ! [A] : ( truth(A) | truth(B) | ~ truth(or(A,B)) ) ).
fof(or2,axiom,! [B] : ! [A] : ( truth(or(A,B)) | ~ truth(A) ) ).
fof(or3,axiom,! [B] : ! [A] : ( truth(or(A,B)) | ~ truth(B) ) ).
fof(says_yes,axiom,says(asked,or(isa(asked,knight),isa(other,knight))) ).

Paradox---4.0   is forced to process that problem/solution
Paradox---4.0   being executed on problem_axioms_sat using /exp/home/tptp/Systems/Paradox---4.0/paradox --no-progress --time 60 --tstp --model '/tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short'
% START OF SYSTEM OUTPUT
Paradox, version 4.0, 2010-06-29.
+++ PROBLEM: /tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short
Reading '/tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short' ... OK
+++ SOLVING: /tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short
+++ BEGIN MODEL
SZS output start FiniteModel for /tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short
% domain size is 2
fof(domain, fi_domain,
  (![X] : (X = "1" | X = "2"))
).

fof(asked, fi_functors,
  ( (asked = "1")
  )
).

fof(isa, fi_functors,
  ( (isa("1","1") = "1")
  & (isa("1","2") = "2")
  & (isa("2","1") = "1")
  & (isa("2","2") = "2")
  )
).

fof(knave, fi_functors,
  ( (knave = "1")
  )
).

fof(knight, fi_functors,
  ( (knight = "2")
  )
).

fof(or, fi_functors,
  ( (or("1","1") = "1")
  & (or("1","2") = "2")
  & (or("2","1") = "2")
  & (or("2","2") = "2")
  )
).

fof(other, fi_functors,
  ( (other = "1")
  )
).

fof(says, fi_predicates,
  ( (says("1","1") <=> $false)
  & (says("1","2") <=> $true)
  & (says("2","1") <=> $false)
  & (says("2","2") <=> $false)
  )
).

fof(truth, fi_predicates,
  ( (truth("1") <=> $false)
  & (truth("2") <=> $true)
  )
).
SZS output end FiniteModel for /tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short
+++ END MODEL
+++ RESULT: Satisfiable
SZS status Satisfiable for /tmp/SystemOnTPTP46294/problem_axioms_sat.tptp:short

% END OF SYSTEM OUTPUT
RESULT: problem_axioms_sat - Paradox---4.0 says Satisfiable - CPU = 0.00 WC = 0.00  Size = 2
OUTPUT: problem_axioms_sat - Paradox---4.0 says FiniteModel - CPU = 0.00 WC = 0.00 
