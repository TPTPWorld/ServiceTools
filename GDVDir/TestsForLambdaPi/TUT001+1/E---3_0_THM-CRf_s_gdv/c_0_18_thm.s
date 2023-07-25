ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p is ...
fof(c_0_15,axiom,
    ! [X1] :
      ( big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( ~ big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),
    [verified(thm)] ).
fof(c_0_18,conjecture,
    ! [X1] : ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]) ).

ZenonModulo---0.4.2's c_0_18_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_15,axiom,
    ! [X1] :
      ( big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( ~ big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]),
    [verified(thm)] ).
fof(c_0_18,conjecture,
    ! [X1] : ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_18_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_18_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 15
max branch formulas: 15
proof nodes created: 9
formulas created: 186

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_18 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.country (v_Vm))))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.country (v_Vm)))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (S.country (v_Vm)))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vq : ϵ (S.country (v_Vo))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.big_city (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
 (v_Vo)
 (λ (v_Vr : ϵ ((S.big_city (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)),
 Ror
 (S.big_city (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vs : ϵ (S.big_city (S.capital_of (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
 (v_Vo)
 (λ (v_Vt : ϵ ((¬
 (S.big_city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)),
 Ror
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vu : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vs)
 (v_Vu)
)
 (λ (v_Vv : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vq)
 (v_Vv)
)
 (v_Vt)
)
 (S.c_0_16)
)
 (λ (v_Vv : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vq)
 (v_Vv)
)
 (v_Vr)
)
 (S.c_0_15)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_18_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.03 WC = 0.12  NodesSearch = 15 MaxBranchF = 15 ProofNodes = 9 Formulas = 186
OUTPUT: c_0_18_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.03 WC = 0.12 
