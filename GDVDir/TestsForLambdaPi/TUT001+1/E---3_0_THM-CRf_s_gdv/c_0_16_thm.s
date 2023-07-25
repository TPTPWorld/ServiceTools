ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p is ...
fof(c_0_12,axiom,
    ! [X1] :
      ( ~ has_crime(capital_of(X1))
      | ~ city(capital_of(X1))
      | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]),
    [verified(thm)] ).
fof(c_0_13,axiom,
    ! [X1] :
      ( has_crime(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_14,axiom,
    ! [X1] :
      ( city(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_11]),
    [verified(thm)] ).
fof(c_0_16,conjecture,
    ! [X1] :
      ( ~ big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]) ).

ZenonModulo---0.4.2's c_0_16_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_12,axiom,
    ! [X1] :
      ( ~ has_crime(capital_of(X1))
      | ~ city(capital_of(X1))
      | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]),
    [verified(thm)] ).
fof(c_0_13,axiom,
    ! [X1] :
      ( has_crime(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_14,axiom,
    ! [X1] :
      ( city(X1)
      | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_11]),
    [verified(thm)] ).
fof(c_0_16,conjecture,
    ! [X1] :
      ( ~ big_city(capital_of(X1))
      | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_16_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_16_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 27
max branch formulas: 24
proof nodes created: 16
formulas created: 243

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_16 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.big_city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((¬
 (S.big_city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vq : ϵ (¬
 (¬
 (S.big_city (S.capital_of (v_Vo)))))),
 λ (v_Vr : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.big_city (S.capital_of (v_Vo)))
 (λ (v_Vs : ϵ (S.big_city (S.capital_of (v_Vo)))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vt : ϵ (S.country (v_Vo))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.has_crime (S.capital_of (v_Vm))))
∨
((¬
 (S.city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
)
 (v_Vo)
 (λ (v_Vu : ϵ ((¬
 (S.has_crime (S.capital_of (v_Vo))))
∨
((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
)),
 Ror
 (¬
 (S.has_crime (S.capital_of (v_Vo))))
 ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
 (λ (v_Vv : ϵ (¬
 (S.has_crime (S.capital_of (v_Vo))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.has_crime (v_Vm))
∨
(¬
 (S.big_city (v_Vm)))
)
 (S.capital_of (v_Vo))
 (λ (v_Vw : ϵ ((S.has_crime (S.capital_of (v_Vo)))
∨
(¬
 (S.big_city (S.capital_of (v_Vo))))
)),
 Ror
 (S.has_crime (S.capital_of (v_Vo)))
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (λ (v_Vx : ϵ (S.has_crime (S.capital_of (v_Vo)))),
 Raxiom
 (S.has_crime (S.capital_of (v_Vo)))
 (v_Vx)
 (v_Vv)
)
 (λ (v_Vy : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vs)
 (v_Vy)
)
 (v_Vw)
)
 (S.c_0_13)
)
 (λ (v_Vz : ϵ ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)),
 Ror
 (¬
 (S.city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vaa : ϵ (¬
 (S.city (S.capital_of (v_Vo))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.city (v_Vm))
∨
(¬
 (S.big_city (v_Vm)))
)
 (S.capital_of (v_Vo))
 (λ (v_Vba : ϵ ((S.city (S.capital_of (v_Vo)))
∨
(¬
 (S.big_city (S.capital_of (v_Vo))))
)),
 Ror
 (S.city (S.capital_of (v_Vo)))
 (¬
 (S.big_city (S.capital_of (v_Vo))))
 (λ (v_Vca : ϵ (S.city (S.capital_of (v_Vo)))),
 Raxiom
 (S.city (S.capital_of (v_Vo)))
 (v_Vca)
 (v_Vaa)
)
 (λ (v_Vy : ϵ (¬
 (S.big_city (S.capital_of (v_Vo))))),
 Raxiom
 (S.big_city (S.capital_of (v_Vo)))
 (v_Vs)
 (v_Vy)
)
 (v_Vba)
)
 (S.c_0_14)
)
 (λ (v_Vda : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vt)
 (v_Vda)
)
 (v_Vz)
)
 (v_Vu)
)
 (S.c_0_12)
)
 (v_Vr)
)
 (v_Vq)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_16_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.04 WC = 0.12  NodesSearch = 27 MaxBranchF = 24 ProofNodes = 16 Formulas = 243
OUTPUT: c_0_16_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.04 WC = 0.12 
