Paradox---4.0   system information being retrieved
Paradox---4.0's non-default parameters being retrieved
Paradox---4.0   being checked for execution
Paradox---4.0   checking time limit 60
Paradox---4.0   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/leaf_axioms_sat.p

Paradox---4.0's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/leaf_axioms_sat.p is ...
fof(apart1,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart1),
    [verified(leaf)] ).
fof(apart4,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( distinct_points(X1,X3)
        | distinct_points(X2,X3) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart4),
    [verified(leaf)] ).
fof(cu1,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & distinct_lines(X4,X5) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X1,X5)
        | apart_point_and_line(X2,X4)
        | apart_point_and_line(X2,X5) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',cu1),
    [verified(leaf)] ).
fof(con1,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1),
    [verified(leaf)] ).

Paradox---4.0's leaf_axioms_sat being prepared by /exp/home/tptp/ServiceTools/tptp4X
    -d /tmp/SystemOnTPTP15693 
    -t none 
    -f tptp:short
    -x 
    -u machine
    TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/leaf_axioms_sat.p
Paradox---4.0   will use /tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short
Paradox---4.0's own format source file is ...
fof(apart1,axiom,! [X1] : ~ distinct_points(X1,X1) ).
fof(apart4,axiom,! [X1] : ! [X2] : ! [X3] : ( distinct_points(X1,X2) => ( distinct_points(X1,X3) | distinct_points(X2,X3) ) ) ).
fof(cu1,axiom,! [X1] : ! [X2] : ! [X4] : ! [X5] : ( ( distinct_points(X1,X2) & distinct_lines(X4,X5) ) => ( apart_point_and_line(X1,X4) | apart_point_and_line(X1,X5) | apart_point_and_line(X2,X4) | apart_point_and_line(X2,X5) ) ) ).
fof(con1,axiom,! [X1] : ! [X2] : ! [X3] : ( distinct_points(X1,X2) => ( apart_point_and_line(X3,line_connecting(X1,X2)) => ( distinct_points(X3,X1) & distinct_points(X3,X2) ) ) ) ).

Paradox---4.0   is forced to process that problem/solution
Paradox---4.0   being executed on leaf_axioms_sat using /exp/home/tptp/Systems/Paradox---4.0/paradox --no-progress --time 60 --tstp --model '/tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short'
% START OF SYSTEM OUTPUT
Paradox, version 4.0, 2010-06-29.
+++ PROBLEM: /tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short
Reading '/tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short' ... OK
+++ SOLVING: /tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short
+++ BEGIN MODEL
SZS output start FiniteModel for /tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short
% domain size is 1
fof(domain, fi_domain,
  (![X] : (X = "1"))
).

fof(distinct_lines, fi_predicates,
  ( ![X1,X2] : (distinct_lines(X1,X2) <=> $false)
  )
).

fof(distinct_points, fi_predicates,
  ( ![X1,X2] : (distinct_points(X1,X2) <=> $false)
  )
).
SZS output end FiniteModel for /tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short
+++ END MODEL
+++ RESULT: Satisfiable
SZS status Satisfiable for /tmp/SystemOnTPTP15693/leaf_axioms_sat.tptp:short

% END OF SYSTEM OUTPUT
RESULT: leaf_axioms_sat - Paradox---4.0 says Satisfiable - CPU = 0.00 WC = 0.00  Size = 1
OUTPUT: leaf_axioms_sat - Paradox---4.0 says FiniteModel - CPU = 0.00 WC = 0.00 
