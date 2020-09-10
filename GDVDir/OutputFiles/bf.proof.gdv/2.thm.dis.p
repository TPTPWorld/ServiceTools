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
thf(1,axiom,
    ( mvalid
    @ ( mimplies
      @ ( mforall_vary__d_i
        @ ^ [A: $i] :
            ( mbox @ ( p @ A ) ) )
      @ ( mbox @ ( mforall_vary__d_i @ p ) ) ) ),
    file('/home/lex/dev/temp/bf.p',1)).
thf(2,conjecture,(
    ~ ( ~ ( mvalid
          @ ( mimplies
            @ ( mforall_vary__d_i
              @ ^ [A: $i] :
                  ( mbox @ ( p @ A ) ) )
            @ ( mbox @ ( mforall_vary__d_i @ p ) ) ) ) ) ),
    inference(neg_conjecture,[status(cth)],[1])).
