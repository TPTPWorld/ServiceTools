Paradox---4.0   system information being retrieved
Paradox---4.0's non-default parameters being retrieved
Paradox---4.0   being checked for execution
Paradox---4.0   checking time limit 60
Paradox---4.0   checking problem name TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/problem_axioms_sat.p

Paradox---4.0's TPTP format TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/problem_axioms_sat.p is ...
fof(apart1_0001,axiom,
    ! [X] : ~ distinct_points(X,X) ).
fof(apart2_0002,axiom,
    ! [X] : ~ distinct_lines(X,X) ).
fof(apart3_0003,axiom,
    ! [X] : ~ convergent_lines(X,X) ).
fof(apart4_0004,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( distinct_points(X,Z)
        | distinct_points(Y,Z) ) ) ).
fof(apart5_0005,axiom,
    ! [X,Y,Z] :
      ( distinct_lines(X,Y)
     => ( distinct_lines(X,Z)
        | distinct_lines(Y,Z) ) ) ).
fof(apart6_0006,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( convergent_lines(X,Z)
        | convergent_lines(Y,Z) ) ) ).
fof(con1_0007,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( apart_point_and_line(Z,line_connecting(X,Y))
       => ( distinct_points(Z,X)
          & distinct_points(Z,Y) ) ) ) ).
fof(con2_0008,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( ( apart_point_and_line(Z,X)
          | apart_point_and_line(Z,Y) )
       => distinct_points(Z,intersection_point(X,Y)) ) ) ).
fof(cu1_0009,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & distinct_lines(U,V) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(X,V)
        | apart_point_and_line(Y,U)
        | apart_point_and_line(Y,V) ) ) ).
fof(ceq1_0010,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_points(X,Z)
        | apart_point_and_line(Z,Y) ) ) ).
fof(ceq2_0011,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_lines(Y,Z)
        | apart_point_and_line(X,Z) ) ) ).
fof(ceq3_0012,axiom,
    ! [X,Y] :
      ( convergent_lines(X,Y)
     => distinct_lines(X,Y) ) ).

Paradox---4.0's problem_axioms_sat being prepared by /exp/home/tptp/ServiceTools/tptp4X
    -d /tmp/SystemOnTPTP15509 
    -t none 
    -f tptp:short
    -x 
    -u machine
    TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s_gdv/problem_axioms_sat.p
Paradox---4.0   will use /tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short
Paradox---4.0's own format source file is ...
fof(apart1_0001,axiom,! [X] : ~ distinct_points(X,X) ).
fof(apart2_0002,axiom,! [X] : ~ distinct_lines(X,X) ).
fof(apart3_0003,axiom,! [X] : ~ convergent_lines(X,X) ).
fof(apart4_0004,axiom,! [X] : ! [Y] : ! [Z] : ( distinct_points(X,Y) => ( distinct_points(X,Z) | distinct_points(Y,Z) ) ) ).
fof(apart5_0005,axiom,! [X] : ! [Y] : ! [Z] : ( distinct_lines(X,Y) => ( distinct_lines(X,Z) | distinct_lines(Y,Z) ) ) ).
fof(apart6_0006,axiom,! [X] : ! [Y] : ! [Z] : ( convergent_lines(X,Y) => ( convergent_lines(X,Z) | convergent_lines(Y,Z) ) ) ).
fof(con1_0007,axiom,! [X] : ! [Y] : ! [Z] : ( distinct_points(X,Y) => ( apart_point_and_line(Z,line_connecting(X,Y)) => ( distinct_points(Z,X) & distinct_points(Z,Y) ) ) ) ).
fof(con2_0008,axiom,! [X] : ! [Y] : ! [Z] : ( convergent_lines(X,Y) => ( ( apart_point_and_line(Z,X) | apart_point_and_line(Z,Y) ) => distinct_points(Z,intersection_point(X,Y)) ) ) ).
fof(cu1_0009,axiom,! [X] : ! [Y] : ! [U] : ! [V] : ( ( distinct_points(X,Y) & distinct_lines(U,V) ) => ( apart_point_and_line(X,U) | apart_point_and_line(X,V) | apart_point_and_line(Y,U) | apart_point_and_line(Y,V) ) ) ).
fof(ceq1_0010,axiom,! [X] : ! [Y] : ! [Z] : ( apart_point_and_line(X,Y) => ( distinct_points(X,Z) | apart_point_and_line(Z,Y) ) ) ).
fof(ceq2_0011,axiom,! [X] : ! [Y] : ! [Z] : ( apart_point_and_line(X,Y) => ( distinct_lines(Y,Z) | apart_point_and_line(X,Z) ) ) ).
fof(ceq3_0012,axiom,! [X] : ! [Y] : ( convergent_lines(X,Y) => distinct_lines(X,Y) ) ).

Paradox---4.0   is forced to process that problem/solution
Paradox---4.0   being executed on problem_axioms_sat using /exp/home/tptp/Systems/Paradox---4.0/paradox --no-progress --time 60 --tstp --model '/tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short'
% START OF SYSTEM OUTPUT
Paradox, version 4.0, 2010-06-29.
+++ PROBLEM: /tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short
Reading '/tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short' ... OK
+++ SOLVING: /tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short
+++ BEGIN MODEL
SZS output start FiniteModel for /tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short
% domain size is 1
fof(domain, fi_domain,
  (![X] : (X = "1"))
).

fof(apart_point_and_line, fi_predicates,
  ( (apart_point_and_line("1","1") <=> $false)
  )
).

fof(convergent_lines, fi_predicates,
  ( ![X1,X2] : (convergent_lines(X1,X2) <=> $false)
  )
).

fof(distinct_lines, fi_predicates,
  ( (distinct_lines("1","1") <=> $false)
  )
).

fof(distinct_points, fi_predicates,
  ( (distinct_points("1","1") <=> $false)
  )
).

fof(line_connecting, fi_functors,
  ( (line_connecting("1","1") = "1")
  )
).
SZS output end FiniteModel for /tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short
+++ END MODEL
+++ RESULT: Satisfiable
SZS status Satisfiable for /tmp/SystemOnTPTP15509/problem_axioms_sat.tptp:short

% END OF SYSTEM OUTPUT
RESULT: problem_axioms_sat - Paradox---4.0 says Satisfiable - CPU = 0.00 WC = 0.01  Size = 1
OUTPUT: problem_axioms_sat - Paradox---4.0 says FiniteModel - CPU = 0.00 WC = 0.01 
