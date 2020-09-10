% -------------------------------------------------------------------------
% modal definitions 
% -------------------------------------------------------------------------

% declare type for possible worlds
thf( mworld_type , type , ( mworld:$tType ) ).

% declare accessibility relations
thf( mrel_type , type , ( mrel:mworld>mworld>$o) ).

% define valid operator
thf( mvalid_type , type , ( mvalid: (mworld>$o)>$o ) ).
thf( mvalid_def , definition , ( mvalid = (^ [S:mworld>$o] : ! [W:mworld] : (S@W)))).

% define nullary, unary and binary connectives which are no quantifiers
thf( mimplies_type , type , ( mimplies: (mworld>$o)>(mworld>$o)>mworld>$o) ).
thf( mimplies , definition , ( mimplies = (^ [A:mworld>$o,B:mworld>$o,W:mworld] : ( (A@W) => (B@W) )))).
thf( mbox_type , type , ( mbox: (mworld>$o)>mworld>$o) ).
thf( mbox_def , definition , ( mbox = (^ [A:mworld>$o,W:mworld] : ! [V:mworld] : ( (mrel@W@V) => (A@V) )))).

% define exists-in-world predicates for quantified types and non-emptiness axioms
thf( exists_in_world_type__d_i , type , ( eiw__d_i : ( ( ( $i ) > ( mworld > $o ) ) ) ) ).
thf( eiw_nonempty__d_i , axiom , (! [W:mworld]: ( ? [X:($i)] : (eiw__d_i @ X @ W)))).

% define domain restrictions
thf( eiw_decre__d_i_r , axiom , (! [W:mworld,V:mworld,C:$i]: ( (mrel @ W @ V) => ((eiw__d_i @ C @ V) => (eiw__d_i @ C @ W)) ))).

% define for all quantifiers
thf(mforall_vary_type__d_i , type , ( mforall_vary__d_i : ( ( ( $i ) > ( mworld > $o ) ) > mworld > $o ) ) ).
thf(mforall_vary__d_i , definition , ( mforall_vary__d_i = ( ^ [A:($i)>mworld>$o,W:mworld] : ! [X:($i)] : ((eiw__d_i @ X @ W) => (A @ X @ W))))).

% -------------------------------------------------------------------------
% transformed problem
% -------------------------------------------------------------------------

thf(f,type,p:$i>(mworld>$o)).
thf(1,conjecture,( mvalid @ (mimplies@((mforall_vary__d_i@(^ [ X : $i ] : ((mbox@(p@X))))))@((mbox@(mforall_vary__d_i@(^ [ X : $i ] : ((p@X))))))) )).

% -------------------------------------------------------------------------
% auxiliary definitions 
% -------------------------------------------------------------------------

% define exists-in-world assertion for user-defined constants
thf( exists_in_world_type__d_i_t__o_mworld_t__d_o_c_ , type , ( eiw__d_i_t__o_mworld_t__d_o_c_ : ( ( ( $i>(mworld>$o) ) > ( mworld > $o ) ) ) ) ).
thf( eiw_nonempty__d_i_t__o_mworld_t__d_o_c_ , axiom , (! [W:mworld]: ( ? [X:($i>(mworld>$o))] : (eiw__d_i_t__o_mworld_t__d_o_c_ @ X @ W)))).
thf( eiw_p , axiom , (! [W:mworld]: ( (eiw__d_i_t__o_mworld_t__d_o_c_ @ p @ W)))).



% -------------------------------------------------------------------------
% old problem
% -------------------------------------------------------------------------

%thf(spec,logic,($modal:=[$constants:=$rigid,$quantification:=$decreasing,$consequence:=$global,$modalities:=$modal_system_K])).
%thf(f,type,p:$i>$o).
%thf(1,conjecture,(![X:$i]:($box@(p@X)))=>($box@(![X:$i]:(p@X)))).

