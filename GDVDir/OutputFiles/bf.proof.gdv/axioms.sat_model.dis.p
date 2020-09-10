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
thf(mvalid_def,definition,
    ( mvalid
    = ( ^ [A: ( mworld > $o )] :
        ! [B: mworld] :
          ( A @ B ) ) )).
thf(mimplies_def,definition,
    ( mimplies
    = ( ^ [A: ( mworld > $o ),B: ( mworld > $o ),C: mworld] :
          ( ( A @ C )
         => ( B @ C ) ) ) )).
thf(mbox_def,definition,
    ( mbox
    = ( ^ [A: ( mworld > $o ),B: mworld] :
        ! [C: mworld] :
          ( ( mrel @ B @ C )
         => ( A @ C ) ) ) )).
thf(mforall_vary__d_i_def,definition,
    ( mforall_vary__d_i
    = ( ^ [A: ( $i > mworld > $o ),B: mworld] :
        ! [C: $i] :
          ( ( eiw__d_i @ C @ B )
         => ( A @ C @ B ) ) ) )).
thf(5,axiom,(
    ! [A: mworld,B: mworld,C: $i] :
      ( ( mrel @ A @ B )
     => ( ( eiw__d_i @ C @ B )
       => ( eiw__d_i @ C @ A ) ) ) ),
    file('/home/lex/dev/temp/bf.p',eiw_decre__d_i_r)).
