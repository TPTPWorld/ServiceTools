ZenonModuloLP---0.4.2   system information being retrieved
ZenonModuloLP---0.4.2's non-default parameters being retrieved
ZenonModuloLP---0.4.2   being checked for execution
ZenonModuloLP---0.4.2   checking time limit 60
ZenonModuloLP---0.4.2   checking problem name TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_5_thm.p

ZenonModuloLP---0.4.2's TPTP format TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_5_thm.p is ...
fof(c_0_4,axiom,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]),
    [verified(thm)] ).
fof(c_0_3,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave,
    [verified(thm)] ).
fof(c_0_4,axiom,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]),
    [verified(thm)] ).
fof(c_0_5,conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_4,c_0_3]),c_0_4]),
    [proof] ).

ZenonModuloLP---0.4.2's c_0_5_thm does not need preparation
ZenonModuloLP---0.4.2   will use TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_5_thm.p
ZenonModuloLP---0.4.2's own format source file is ...
fof(c_0_4,axiom,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]),
    [verified(thm)] ).
fof(c_0_3,axiom,
    ! [X1] :
      ( truth(isa(X1,knight))
      | truth(isa(X1,knave)) ),
    everyone_a_knight_or_knave,
    [verified(thm)] ).
fof(c_0_4,axiom,
    ! [X1] : ~ truth(isa(other,X1)),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_2,c_0_3]),c_0_2]),
    [verified(thm)] ).
fof(c_0_5,conjecture,
    $false,
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_4,c_0_3]),c_0_4]),
    [proof] ).

ZenonModuloLP---0.4.2   is forced to process that problem/solution
ZenonModuloLP---0.4.2   being executed on c_0_5_thm using /exp/home/tptp/Systems/ZenonModuloLP---0.4.2/run_zenon_modulo 60 'TestsForLambdaPi/PUZ035-5/E---3_0_UNS-CRf_s_gdv/c_0_5_thm.p'
% START OF SYSTEM OUTPUT
Zenon error: exhausted search space without finding a proof
(* Current branch:
(truth (isa zenon_X0 (knave)))
*)
(* NO-PROOF *)
% SZS status GaveUp

% SZS end Proof
nodes searched: 3
max branch formulas: 3
proof nodes created: 0
formulas created: 159

% ZenonModulo exiting

% END OF SYSTEM OUTPUT
RESULT: c_0_5_thm - ZenonModuloLP---0.4.2 says GaveUp - CPU = 0.04 WC = 0.09 
OUTPUT: c_0_5_thm - ZenonModuloLP---0.4.2 says None - CPU = 0.04 WC = 0.09 
