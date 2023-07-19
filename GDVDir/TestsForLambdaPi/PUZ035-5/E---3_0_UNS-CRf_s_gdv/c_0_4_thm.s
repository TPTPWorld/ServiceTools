ZenonModulo---0.4.2   system information being retrieved
ZenonModulo---0.4.2's non-default parameters being retrieved
ZenonModulo---0.4.2   being checked for execution
ZenonModulo---0.4.2   checking time limit 60
ZenonModulo---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p

ZenonModulo---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p is ...
fof(c_0_2,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query,
    [verified(thm)] ).
fof(c_0_3,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave,
    [verified(thm)] ).
fof(c_0_4,conjecture,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]) ).

ZenonModulo---0.4.2's c_0_4_thm does not need preparation
ZenonModulo---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p
ZenonModulo---0.4.2's own format source file is ...
fof(c_0_2,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query,
    [verified(thm)] ).
fof(c_0_3,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave,
    [verified(thm)] ).
fof(c_0_4,conjecture,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]) ).

ZenonModulo---0.4.2   is forced to process that problem/solution
ZenonModulo---0.4.2   being executed on c_0_4_thm using /exp/home/tptp/Systems/ZenonModulo---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p'
% START OF SYSTEM OUTPUT
nodes searched: 50
max branch formulas: 43
proof nodes created: 17
formulas created: 371

% SZS status Theorem
% SZS output start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND Logic.Zenon.zen;
require LAMBDAPI_CONTEXT.Signature as S;

rule S.c_0_4 ↪ 
  nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.truth (S.isa (S.other) (v_Vm)))))
    (λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (S.truth (S.isa (S.other) (v_Vm))))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (S.truth (S.isa (S.other) (v_Vm))))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (S.truth (S.isa (S.other) (v_Vo)))))),
 Rnotnot
 (S.truth (S.isa (S.other) (v_Vo)))
 (λ (v_Vq : ϵ (S.truth (S.isa (S.other) (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vr : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vr))))
))
 (v_Vo)
 (λ (v_Vs : ϵ (∀α (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)
 (S.knave)
 (λ (v_Vt : ϵ ((¬
 (S.truth (S.isa (S.asked) (S.knave))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)),
 Ror
 (¬
 (S.truth (S.isa (S.asked) (S.knave))))
 (¬
 (S.truth (S.isa (S.other) (v_Vo))))
 (λ (v_Vu : ϵ (¬
 (S.truth (S.isa (S.asked) (S.knave))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (S.truth (S.isa (v_Vm) (S.knight)))
∨
(S.truth (S.isa (v_Vm) (S.knave)))
)
 (S.asked)
 (λ (v_Vv : ϵ ((S.truth (S.isa (S.asked) (S.knight)))
∨
(S.truth (S.isa (S.asked) (S.knave)))
)),
 Ror
 (S.truth (S.isa (S.asked) (S.knight)))
 (S.truth (S.isa (S.asked) (S.knave)))
 (λ (v_Vw : ϵ (S.truth (S.isa (S.asked) (S.knight)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (S.truth (S.isa (S.asked) (v_Vm))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)
 (S.knight)
 (λ (v_Vx : ϵ ((¬
 (S.truth (S.isa (S.asked) (S.knight))))
∨
(¬
 (S.truth (S.isa (S.other) (v_Vo))))
)),
 Ror
 (¬
 (S.truth (S.isa (S.asked) (S.knight))))
 (¬
 (S.truth (S.isa (S.other) (v_Vo))))
 (λ (v_Vy : ϵ (¬
 (S.truth (S.isa (S.asked) (S.knight))))),
 Raxiom
 (S.truth (S.isa (S.asked) (S.knight)))
 (v_Vw)
 (v_Vy)
)
 (λ (v_Vz : ϵ (¬
 (S.truth (S.isa (S.other) (v_Vo))))),
 Raxiom
 (S.truth (S.isa (S.other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vx)
)
 (v_Vs)
)
 (λ (v_Vaa : ϵ (S.truth (S.isa (S.asked) (S.knave)))),
 Raxiom
 (S.truth (S.isa (S.asked) (S.knave)))
 (v_Vaa)
 (v_Vu)
)
 (v_Vv)
)
 (S.c_0_3)
)
 (λ (v_Vz : ϵ (¬
 (S.truth (S.isa (S.other) (v_Vo))))),
 Raxiom
 (S.truth (S.isa (S.other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vt)
)
 (v_Vs)
)
 (S.c_0_2)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS output end Proof

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_4_thm - ZenonModulo---0.4.2 says Theorem - CPU = 0.04 WC = 0.12  NodesSearch = 50 MaxBranchF = 43 ProofNodes = 17 Formulas = 371
OUTPUT: c_0_4_thm - ZenonModulo---0.4.2 says Proof - CPU = 0.04 WC = 0.12 
