ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_12_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_12_thm.p is ...
fof(c_0_8,axiom,
    ! [X1] :
      ( ~ city(X1)
      | ~ beautiful(X1)
      | ~ has_crime(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_9,axiom,
    ! [X1] :
      ( beautiful(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_12,conjecture,
    ! [X1] :
      ( ~ has_crime(capital_of(X1))
      | ~ city(capital_of(X1))
      | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]) ).

ZenonModulo---0.4.2's c_0_12_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_12_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_8,axiom,
    ! [X1] :
      ( ~ city(X1)
      | ~ beautiful(X1)
      | ~ has_crime(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_6]),
    [verified(thm)] ).
fof(c_0_9,axiom,
    ! [X1] :
      ( beautiful(capital_of(X1))
      | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_12,conjecture,
    ! [X1] :
      ( ~ has_crime(capital_of(X1))
      | ~ city(capital_of(X1))
      | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_12_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s_gdv/c_0_12_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 16
max branch formulas: 17
proof nodes created: 10
formulas created: 227

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_12 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.has_crime (S.capital_of (v_Vm))))
∨
((¬
 (S.city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.has_crime (S.capital_of (v_Vm))))
∨
((¬
 (S.city (S.capital_of (v_Vm))))
∨
(¬
 (S.country (v_Vm)))
)
)))),
 Rnotall
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
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 ((¬
 (S.has_crime (S.capital_of (v_Vo))))
∨
((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
))),
 Rnotor
 (¬
 (S.has_crime (S.capital_of (v_Vo))))
 ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
)
 (λ (v_Vq : ϵ (¬
 (¬
 (S.has_crime (S.capital_of (v_Vo)))))),
 λ (v_Vr : ϵ (¬
 ((¬
 (S.city (S.capital_of (v_Vo))))
∨
(¬
 (S.country (v_Vo)))
))),
 Rnotor
 (¬
 (S.city (S.capital_of (v_Vo))))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vs : ϵ (¬
 (¬
 (S.city (S.capital_of (v_Vo)))))),
 λ (v_Vt : ϵ (¬
 (¬
 (S.country (v_Vo))))),
 Rnotnot
 (S.country (v_Vo))
 (λ (v_Vu : ϵ (S.country (v_Vo))),
 Rnotnot
 (S.city (S.capital_of (v_Vo)))
 (λ (v_Vv : ϵ (S.city (S.capital_of (v_Vo)))),
 Rnotnot
 (S.has_crime (S.capital_of (v_Vo)))
 (λ (v_Vw : ϵ (S.has_crime (S.capital_of (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.beautiful (S.capital_of (v_Vm)))
∨
(¬
 (S.country (v_Vm)))
)
 (v_Vo)
 (λ (v_Vx : ϵ ((S.beautiful (S.capital_of (v_Vo)))
∨
(¬
 (S.country (v_Vo)))
)),
 Ror
 (S.beautiful (S.capital_of (v_Vo)))
 (¬
 (S.country (v_Vo)))
 (λ (v_Vy : ϵ (S.beautiful (S.capital_of (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.city (v_Vm)))
∨
((¬
 (S.beautiful (v_Vm)))
∨
(¬
 (S.has_crime (v_Vm)))
)
)
 (S.capital_of (v_Vo))
 (λ (v_Vz : ϵ ((¬
 (S.city (S.capital_of (v_Vo))))
∨
((¬
 (S.beautiful (S.capital_of (v_Vo))))
∨
(¬
 (S.has_crime (S.capital_of (v_Vo))))
)
)),
 Ror
 (¬
 (S.city (S.capital_of (v_Vo))))
 ((¬
 (S.beautiful (S.capital_of (v_Vo))))
∨
(¬
 (S.has_crime (S.capital_of (v_Vo))))
)
 (λ (v_Vaa : ϵ (¬
 (S.city (S.capital_of (v_Vo))))),
 Raxiom
 (S.city (S.capital_of (v_Vo)))
 (v_Vv)
 (v_Vaa)
)
 (λ (v_Vba : ϵ ((¬
 (S.beautiful (S.capital_of (v_Vo))))
∨
(¬
 (S.has_crime (S.capital_of (v_Vo))))
)),
 Ror
 (¬
 (S.beautiful (S.capital_of (v_Vo))))
 (¬
 (S.has_crime (S.capital_of (v_Vo))))
 (λ (v_Vca : ϵ (¬
 (S.beautiful (S.capital_of (v_Vo))))),
 Raxiom
 (S.beautiful (S.capital_of (v_Vo)))
 (v_Vy)
 (v_Vca)
)
 (λ (v_Vda : ϵ (¬
 (S.has_crime (S.capital_of (v_Vo))))),
 Raxiom
 (S.has_crime (S.capital_of (v_Vo)))
 (v_Vw)
 (v_Vda)
)
 (v_Vba)
)
 (v_Vz)
)
 (S.c_0_8)
)
 (λ (v_Vea : ϵ (¬
 (S.country (v_Vo)))),
 Raxiom
 (S.country (v_Vo))
 (v_Vu)
 (v_Vea)
)
 (v_Vx)
)
 (S.c_0_9)
)
 (v_Vq)
)
 (v_Vs)
)
 (v_Vt)
)
 (v_Vr)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_12_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.07 WC = 0.12  NodesSearch = 16 MaxBranchF = 17 ProofNodes = 10 Formulas = 227
OUTPUT: c_0_12_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.07 WC = 0.12 
