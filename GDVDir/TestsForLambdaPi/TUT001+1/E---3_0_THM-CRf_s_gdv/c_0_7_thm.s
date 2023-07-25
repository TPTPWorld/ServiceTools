ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p is ...
fof(country_big_city,axiom,
    ! [X1] :
      ( country(X1)
     => ( big_city(capital_of(X1))
        & beautiful(capital_of(X1)) ) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',country_big_city) ).
fof(c_0_7,conjecture,
    ! [X4] :
      ( ( big_city(capital_of(X4))
        | ~ country(X4) )
      & ( beautiful(capital_of(X4))
        | ~ country(X4) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[country_big_city])])]) ).

ZenonModulo---0.4.2's c_0_7_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(country_big_city,axiom,
    ! [X1] :
      ( country(X1)
     => ( big_city(capital_of(X1))
        & beautiful(capital_of(X1)) ) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',country_big_city) ).
fof(c_0_7,conjecture,
    ! [X4] :
      ( ( big_city(capital_of(X4))
        | ~ country(X4) )
      & ( beautiful(capital_of(X4))
        | ~ country(X4) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[country_big_city])])]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_7_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_7_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 26
max branch formulas: 17
proof nodes created: 16
formulas created: 210

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_7 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ((S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
∧
((S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ((S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
∧
((S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ((S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
∧
((S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
∧
((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
))),
 Rnotand
 ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
 ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)
 (λ (v_Vq : ϵ (¬
 ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (S.big_city (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vr : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 λ (v_Vs : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vt : ϵ (S.country (v_Vo))),
 Rall
 (ι)
 (λ (v_Vu : τ (ι)),
 (S.country (v_Vu))
⇒
((S.big_city (S.capital_of (v_Vu)))
∧
(S.beautiful (S.capital_of (v_Vu)))
)
)
 (v_Vo)
 (λ (v_Vv : ϵ ((S.country (v_Vo))
⇒
((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
)),
 Rimply
 (S.country (v_Vo))
 ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
 (λ (v_Vw : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vt)
 (v_Vw)
)
 (λ (v_Vx : ϵ ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)),
 Rand
 (S.big_city (S.capital_of (v_Vo)))
 (S.beautiful (S.capital_of (v_Vo)))
 (λ (v_Vy : ϵ (S.big_city (S.capital_of (v_Vo)))),
 λ (v_Vz : ϵ (S.beautiful (S.capital_of (v_Vo)))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vy)
 (v_Vr)
)
 (v_Vx)
)
 (v_Vv)
)
 (S.country_big_city)
)
 (v_Vs)
)
 (v_Vq)
)
 (λ (v_Vaa : ϵ (¬
 ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (S.beautiful (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vba : ϵ (¬
 (S.beautiful (S.capital_of (v_Vo))))),
 λ (v_Vs : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vt : ϵ (S.country (v_Vo))),
 Rall
 (ι)
 (λ (v_Vu : τ (ι)),
 (S.country (v_Vu))
⇒
((S.big_city (S.capital_of (v_Vu)))
∧
(S.beautiful (S.capital_of (v_Vu)))
)
)
 (v_Vo)
 (λ (v_Vv : ϵ ((S.country (v_Vo))
⇒
((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
)),
 Rimply
 (S.country (v_Vo))
 ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)
 (λ (v_Vw : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vt)
 (v_Vw)
)
 (λ (v_Vx : ϵ ((S.big_city (S.capital_of (v_Vo)))
∧
(S.beautiful (S.capital_of (v_Vo)))
)),
 Rand
 (S.big_city (S.capital_of (v_Vo)))
 (S.beautiful (S.capital_of (v_Vo)))
 (λ (v_Vy : ϵ (S.big_city (S.capital_of (v_Vo)))),
 λ (v_Vz : ϵ (S.beautiful (S.capital_of (v_Vo)))),
 Raxiom
 (S.beautiful (S.capital_of (v_Vo)))
 (v_Vz)
 (v_Vba)
)
 (v_Vx)
)
 (v_Vv)
)
 (S.country_big_city)
)
 (v_Vs)
)
 (v_Vaa)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_7_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.05 WC = 0.12  NodesSearch = 26 MaxBranchF = 17 ProofNodes = 16 Formulas = 210
OUTPUT: c_0_7_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.05 WC = 0.12 
