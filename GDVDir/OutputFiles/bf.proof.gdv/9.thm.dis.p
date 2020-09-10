thf(mworld_type,type,(
    mworld: $tType )).
thf(mrel_type,type,(
    mrel: mworld > mworld > $o )).
thf(mvalid_type,type,(
    mvalid: ( mworld > $o ) > $o )).
thf(mimplies_type,type,(
    mimplies: ( mworld > $o ) > ( mworld > $o ) > mworld > $o )).
thf(mbox_type,type,(
    mbox: ( mworld > $o ) > mworld > $o )).
thf(eiw__d_i_type,type,(
    eiw__d_i: $i > mworld > $o )).
thf(mforall_vary__d_i_type,type,(
    mforall_vary__d_i: ( $i > mworld > $o ) > mworld > $o )).
thf(p_type,type,(
    p: $i > mworld > $o )).
thf(sk1_type,type,(
    sk1: mworld )).
thf(sk2_type,type,(
    sk2: mworld )).
thf(sk3_type,type,(
    sk3: $i )).
thf(7,axiom,(
    ~ ( ! [A: mworld] :
          ( ! [B: $i] :
              ( ( eiw__d_i @ B @ A )
             => ! [C: mworld] :
                  ( ( mrel @ A @ C )
                 => ( p @ B @ C ) ) )
         => ! [B: mworld] :
              ( ( mrel @ A @ B )
             => ! [C: $i] :
                  ( ( eiw__d_i @ C @ B )
                 => ( p @ C @ B ) ) ) ) ) ),
    inference(defexp_and_simp_and_etaexpand,[status(thm)],[2,mbox_def,mforall_vary__d_i_def,mvalid_def,mimplies_def]),
    [verified(thm)]).
thf(9,conjecture,
    ( eiw__d_i @ sk3 @ sk2 ),
    inference(cnf,[status(esa)],[7])).
