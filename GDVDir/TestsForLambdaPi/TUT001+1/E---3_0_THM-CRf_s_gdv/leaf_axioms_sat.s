Paradox---4.0   system information being retrieved
Paradox---4.0's non-default parameters being retrieved
Paradox---4.0   being checked for execution
Paradox---4.0   checking time limit 60
Paradox---4.0   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/leaf_axioms_sat.p

Paradox---4.0's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/leaf_axioms_sat.p is ...
fof(country_big_city,axiom,
    ! [X1] :
      ( country(X1)
     => ( big_city(capital_of(X1))
        & beautiful(capital_of(X1)) ) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',country_big_city),
    [verified(leaf)] ).
fof(crime_axiom,axiom,
    ! [X1] :
      ( big_city(X1)
     => has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',crime_axiom),
    [verified(leaf)] ).
fof(big_city_city,axiom,
    ! [X1] :
      ( big_city(X1)
     => city(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',big_city_city),
    [verified(leaf)] ).
fof(country_usa,axiom,
    country(usa),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',country_usa),
    [verified(leaf)] ).

Paradox---4.0's leaf_axioms_sat being prepared by /exp/home/tptp/ServiceTools/tptp4X
    -d /tmp/SystemOnTPTP16839 
    -t none 
    -f tptp:short
    -x 
    -u machine
    TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/leaf_axioms_sat.p
Paradox---4.0   will use /tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short
Paradox---4.0's own format source file is ...
fof(country_big_city,axiom,! [X1] : ( country(X1) => ( big_city(capital_of(X1)) & beautiful(capital_of(X1)) ) ) ).
fof(crime_axiom,axiom,! [X1] : ( big_city(X1) => has_crime(X1) ) ).
fof(big_city_city,axiom,! [X1] : ( big_city(X1) => city(X1) ) ).
fof(country_usa,axiom,country(usa) ).

Paradox---4.0   is forced to process that problem/solution
Paradox---4.0   being executed on leaf_axioms_sat using /exp/home/tptp/Systems/Paradox---4.0/paradox --no-progress --time 60 --tstp --model '/tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short'
% START OF SYSTEM OUTPUT
Paradox, version 4.0, 2010-06-29.
+++ PROBLEM: /tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short
Reading '/tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short' ... OK
+++ SOLVING: /tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short
+++ BEGIN MODEL
SZS output start FiniteModel for /tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short
% domain size is 1
fof(domain, fi_domain,
  (![X] : (X = "1"))
).

fof(beautiful, fi_predicates,
  ( ![X1] : (beautiful(X1) <=> $true)
  )
).

fof(big_city, fi_predicates,
  ( ![X1] : (big_city(X1) <=> $true)
  )
).

fof(city, fi_predicates,
  ( ![X1] : (city(X1) <=> $true)
  )
).

fof(country, fi_predicates,
  ( ![X1] : (country(X1) <=> $true)
  )
).

fof(has_crime, fi_predicates,
  ( ![X1] : (has_crime(X1) <=> $true)
  )
).
SZS output end FiniteModel for /tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short
+++ END MODEL
+++ RESULT: Satisfiable
SZS status Satisfiable for /tmp/SystemOnTPTP16839/leaf_axioms_sat.tptp:short

% END OF SYSTEM OUTPUT
RESULT: leaf_axioms_sat - Paradox---4.0 says Satisfiable - CPU = 0.00 WC = 0.00  Size = 1
OUTPUT: leaf_axioms_sat - Paradox---4.0 says FiniteModel - CPU = 0.00 WC = 0.00 
