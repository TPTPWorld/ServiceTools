ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p is ...
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
fof(c_0_2,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query,
    [verified(thm)] ).
fof(c_0_4,conjecture,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]) ).

ZenonModuloLP---0.4.2's c_0_4_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
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
fof(c_0_2,axiom,
    ! [X2,X1] :
      ( ~ truth(isa(asked,X1))
      | ~ truth(isa(other,X2)) ),
    query,
    [verified(thm)] ).
fof(c_0_4,conjecture,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]) ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_4_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_4_thm.p'
% START OF SYSTEM OUTPUT
(* PROOF-FOUND *)
% SZS status Theorem
% SZS start Proof
require open Logic.Zenon.FOL Logic.Zenon.LL Logic.Zenon.ND Logic.Zenon.ND_eps Logic.Zenon.ND_eps_full Logic.Zenon.ND_eps_aux Logic.Zenon.LL_ND;
require open Logic.Zenon.zen;
symbol delta : ϵ (∀α (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm))))) 
 ≔ 
 nnpp (∀α (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm)))))

(λ (v_Vn : ϵ (¬
 (∀α (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm))))))),
 Rnotall
 (ι)
 (λ (v_Vm : τ (ι)),
 ¬
 (truth (isa (other) (v_Vm))))
 (λ (v_Vo : τ (ι)),
 λ (v_Vp : ϵ (¬
 (¬
 (truth (isa (other) (v_Vo)))))),
 Rnotnot
 (truth (isa (other) (v_Vo)))
 (λ (v_Vq : ϵ (truth (isa (other) (v_Vo)))),
 Rall
 (ι)
 (λ (v_Vr : τ (ι)),
 ∀α (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vr))))
))
 (v_Vo)
 (λ (v_Vs : ϵ (∀α (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vo))))
))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)
 (knave)
 (λ (v_Vt : ϵ ((¬
 (truth (isa (asked) (knave))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)),
 Ror
 (¬
 (truth (isa (asked) (knave))))
 (¬
 (truth (isa (other) (v_Vo))))
 (λ (v_Vu : ϵ (¬
 (truth (isa (asked) (knave))))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (truth (isa (v_Vm) (knight)))
∨
(truth (isa (v_Vm) (knave)))
)
 (asked)
 (λ (v_Vv : ϵ ((truth (isa (asked) (knight)))
∨
(truth (isa (asked) (knave)))
)),
 Ror
 (truth (isa (asked) (knight)))
 (truth (isa (asked) (knave)))
 (λ (v_Vw : ϵ (truth (isa (asked) (knight)))),
 Rall
 (ι)
 (λ (v_Vm : τ (ι)),
 (¬
 (truth (isa (asked) (v_Vm))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)
 (knight)
 (λ (v_Vx : ϵ ((¬
 (truth (isa (asked) (knight))))
∨
(¬
 (truth (isa (other) (v_Vo))))
)),
 Ror
 (¬
 (truth (isa (asked) (knight))))
 (¬
 (truth (isa (other) (v_Vo))))
 (λ (v_Vy : ϵ (¬
 (truth (isa (asked) (knight))))),
 Raxiom
 (truth (isa (asked) (knight)))
 (v_Vw)
 (v_Vy)
)
 (λ (v_Vz : ϵ (¬
 (truth (isa (other) (v_Vo))))),
 Raxiom
 (truth (isa (other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vx)
)
 (v_Vs)
)
 (λ (v_Vaa : ϵ (truth (isa (asked) (knave)))),
 Raxiom
 (truth (isa (asked) (knave)))
 (v_Vaa)
 (v_Vu)
)
 (v_Vv)
)
 (ax_c_0_3)
)
 (λ (v_Vz : ϵ (¬
 (truth (isa (other) (v_Vo))))),
 Raxiom
 (truth (isa (other) (v_Vo)))
 (v_Vq)
 (v_Vz)
)
 (v_Vt)
)
 (v_Vs)
)
 (ax_c_0_2)
)
 (v_Vp)
)
 (v_Vn)
);
% SZS end Proof
nodes searched: 50
max branch formulas: 43
proof nodes created: 17
formulas created: 371

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_4_thm - ZenonModuloLP---0.4.2 says Theorem - CPU = 0.03 WC = 0.10 
OUTPUT: c_0_4_thm - ZenonModuloLP---0.4.2 says Assurance - CPU = 0.03 WC = 0.10 
