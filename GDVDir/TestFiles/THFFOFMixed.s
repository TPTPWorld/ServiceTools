% SZS status Unsatisfiable for InconsistencyWithoutFirstConjunctinD2_minimized.p : (rf:0,axioms:4,ps:3,u:6,ude:false,rLeibEQ:true,rAndEQ:true,use_choice:true,use_extuni:true,use_extcnf_combined:true,expand_extuni:false,foatp:e,atp_timeout:25,atp_calls_frequency:10,ordering:none,proof_output:1,protocol_output:false,clause_count:79,loop_count:0,foatp_calls:2,translation:fof_full)

%**** Beginning of derivation protocol ****
% SZS output start CNFRefutation
thf(tp_mu,type,(
    mu: $tType )).

thf(tp_ess,type,(
    ess: ( mu > $i > $o ) > mu > $i > $o )).

thf(tp_g,type,(
    g: mu > $i > $o )).

thf(tp_mand,type,(
    mand: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_mbox,type,(
    mbox: ( $i > $o ) > $i > $o )).

thf(tp_mbox_generic,type,(
    mbox_generic: ( $i > $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_mdia,type,(
    mdia: ( $i > $o ) > $i > $o )).

thf(tp_mdia_generic,type,(
    mdia_generic: ( $i > $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_mequiv,type,(
    mequiv: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_mexists_ind,type,(
    mexists_ind: ( mu > $i > $o ) > $i > $o )).

thf(tp_mexists_indset,type,(
    mexists_indset: ( ( mu > $i > $o ) > $i > $o ) > $i > $o )).

thf(tp_mforall_ind,type,(
    mforall_ind: ( mu > $i > $o ) > $i > $o )).

thf(tp_mforall_indset,type,(
    mforall_indset: ( ( mu > $i > $o ) > $i > $o ) > $i > $o )).

thf(tp_mimplies,type,(
    mimplies: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_mnot,type,(
    mnot: ( $i > $o ) > $i > $o )).

thf(tp_mor,type,(
    mor: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_msymmetric,type,(
    msymmetric: ( $i > $i > $o ) > $o )).

thf(tp_ne,type,(
    ne: mu > $i > $o )).

thf(tp_p,type,(
    p: ( mu > $i > $o ) > $i > $o )).

thf(tp_rel,type,(
    rel: $i > $i > $o )).

thf(tp_sK1_SY21,type,(
    sK1_SY21: ( mu > $i > $o ) > ( mu > $i > $o ) > $i > $i )).

thf(tp_sK2_SY23,type,(
    sK2_SY23: $i > ( mu > $i > $o ) > ( mu > $i > $o ) > mu )).

thf(tp_v,type,(
    v: ( $i > $o ) > $o )).

thf(ess,definition,
    ( ess
    = ( ^ [Phi: mu > $i > $o,X: mu] :
          ( mforall_indset
          @ ^ [Psi: mu > $i > $o] :
              ( mimplies @ ( Psi @ X )
              @ ( mbox
                @ ( mforall_ind
                  @ ^ [Y: mu] :
                      ( mimplies @ ( Phi @ Y ) @ ( Psi @ Y ) ) ) ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',ess)).

thf(mand,definition,
    ( mand
    = ( ^ [Phi: $i > $o,Psi: $i > $o] :
          ( mnot @ ( mor @ ( mnot @ Phi ) @ ( mnot @ Psi ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mand)).

thf(mbox,definition,
    ( mbox
    = ( mbox_generic @ rel ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mbox)).

thf(mbox_generic,definition,
    ( mbox_generic
    = ( ^ [R: $i > $i > $o,Phi: $i > $o,W: $i] :
        ! [V: $i] :
          ( ~ ( R @ W @ V )
          | ( Phi @ V ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mbox_generic)).

thf(mdia,definition,
    ( mdia
    = ( mdia_generic @ rel ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mdia)).

thf(mdia_generic,definition,
    ( mdia_generic
    = ( ^ [R: $i > $i > $o,Phi: $i > $o] :
          ( mnot @ ( mbox_generic @ R @ ( mnot @ Phi ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mdia_generic)).

thf(mequiv,definition,
    ( mequiv
    = ( ^ [Phi: $i > $o,Psi: $i > $o] :
          ( mand @ ( mimplies @ Phi @ Psi ) @ ( mimplies @ Psi @ Phi ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mequiv)).

thf(mexists_ind,definition,
    ( mexists_ind
    = ( ^ [Phi: mu > $i > $o] :
          ( mnot
          @ ( mforall_ind
            @ ^ [X: mu] :
                ( mnot @ ( Phi @ X ) ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mexists_ind)).

thf(mexists_indset,definition,
    ( mexists_indset
    = ( ^ [Phi: ( mu > $i > $o ) > $i > $o] :
          ( mnot
          @ ( mforall_indset
            @ ^ [X: mu > $i > $o] :
                ( mnot @ ( Phi @ X ) ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mexists_indset)).

thf(mforall_ind,definition,
    ( mforall_ind
    = ( ^ [Phi: mu > $i > $o,W: $i] :
        ! [X: mu] :
          ( Phi @ X @ W ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mforall_ind)).

thf(mforall_indset,definition,
    ( mforall_indset
    = ( ^ [Phi: ( mu > $i > $o ) > $i > $o,W: $i] :
        ! [X: mu > $i > $o] :
          ( Phi @ X @ W ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mforall_indset)).

thf(mimplies,definition,
    ( mimplies
    = ( ^ [Phi: $i > $o,Psi: $i > $o] :
          ( mor @ ( mnot @ Phi ) @ Psi ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mimplies)).

thf(mnot,definition,
    ( mnot
    = ( ^ [Phi: $i > $o,W: $i] :
          ~ ( Phi @ W ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mnot)).

thf(mor,definition,
    ( mor
    = ( ^ [Phi: $i > $o,Psi: $i > $o,W: $i] :
          ( ( Phi @ W )
          | ( Psi @ W ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',mor)).

thf(msymmetric,definition,
    ( msymmetric
    = ( ^ [R: $i > $i > $o] :
        ! [S: $i,T: $i] :
          ( ( R @ S @ T )
         => ( R @ T @ S ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',msymmetric)).

thf(ne,definition,
    ( ne
    = ( ^ [X: mu] :
          ( mforall_indset
          @ ^ [Phi: mu > $i > $o] :
              ( mimplies @ ( ess @ Phi @ X )
              @ ( mbox
                @ ( mexists_ind
                  @ ^ [Y: mu] :
                      ( Phi @ Y ) ) ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',ne)).

thf(v,definition,
    ( v
    = ( ^ [Phi: $i > $o] :
        ! [W: $i] :
          ( Phi @ W ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',v)).

thf(1,axiom,
    ( v @ ( p @ ne ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',axA5)).

thf(2,axiom,
    ( v
    @ ( mforall_indset
      @ ^ [Phi: mu > $i > $o] :
          ( mforall_indset
          @ ^ [Psi: mu > $i > $o] :
              ( mimplies
              @ ( mand @ ( p @ Phi )
                @ ( mbox
                  @ ( mforall_ind
                    @ ^ [X: mu] :
                        ( mimplies @ ( Phi @ X ) @ ( Psi @ X ) ) ) ) )
              @ ( p @ Psi ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',axA2)).

thf(3,axiom,
    ( v
    @ ( mforall_indset
      @ ^ [Phi: mu > $i > $o] :
          ( mimplies
          @ ( p
            @ ^ [X: mu] :
                ( mnot @ ( Phi @ X ) ) )
          @ ( mnot @ ( p @ Phi ) ) ) ) ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',axA1a)).

thf(4,axiom,
    ( msymmetric @ rel ),
    file('InconsistencyWithoutFirstConjunctinD2_minimized.p',sym)).

thf(8,plain,
    ( ( msymmetric @ rel )
    = $true ),
    inference(copy,[status(thm)],[4])).

thf(9,plain,
    ( ( v
      @ ( mforall_indset
        @ ^ [Phi: mu > $i > $o] :
            ( mimplies
            @ ( p
              @ ^ [X: mu] :
                  ( mnot @ ( Phi @ X ) ) )
            @ ( mnot @ ( p @ Phi ) ) ) ) )
    = $true ),
    inference(copy,[status(thm)],[3])).

thf(10,plain,
    ( ( v
      @ ( mforall_indset
        @ ^ [Phi: mu > $i > $o] :
            ( mforall_indset
            @ ^ [Psi: mu > $i > $o] :
                ( mimplies
                @ ( mand @ ( p @ Phi )
                  @ ( mbox
                    @ ( mforall_ind
                      @ ^ [X: mu] :
                          ( mimplies @ ( Phi @ X ) @ ( Psi @ X ) ) ) ) )
                @ ( p @ Psi ) ) ) ) )
    = $true ),
    inference(copy,[status(thm)],[2])).

thf(11,plain,
    ( ( v @ ( p @ ne ) )
    = $true ),
    inference(copy,[status(thm)],[1])).

thf(13,plain,
    ( ( ! [SX0: $i,SX1: $i] :
          ( ~ ( rel @ SX0 @ SX1 )
          | ( rel @ SX1 @ SX0 ) ) )
    = $true ),
    inference(unfold_def,[status(thm)],[8,ess,mand,mbox,mbox_generic,mdia,mdia_generic,mequiv,mexists_ind,mexists_indset,mforall_ind,mforall_indset,mimplies,mnot,mor,msymmetric,ne,v])).

thf(14,plain,
    ( ( ! [SX0: $i,SX1: mu > $i > $o] :
          ( ~ ( p
              @ ^ [SX2: mu,SX3: $i] :
                  ~ ( SX1 @ SX2 @ SX3 )
              @ SX0 )
          | ~ ( p @ SX1 @ SX0 ) ) )
    = $true ),
    inference(unfold_def,[status(thm)],[9,ess,mand,mbox,mbox_generic,mdia,mdia_generic,mequiv,mexists_ind,mexists_indset,mforall_ind,mforall_indset,mimplies,mnot,mor,msymmetric,ne,v])).

thf(15,plain,
    ( ( ! [SX0: $i] :
          ( p
          @ ^ [SX1: mu,SX2: $i] :
            ! [SX3: mu > $i > $o] :
              ( ~ ( ! [SX4: mu > $i > $o] :
                      ( ~ ( SX4 @ SX1 @ SX2 )
                      | ! [SX5: $i] :
                          ( ~ ( rel @ SX2 @ SX5 )
                          | ! [SX6: mu] :
                              ( ~ ( SX3 @ SX6 @ SX5 )
                              | ( SX4 @ SX6 @ SX5 ) ) ) ) )
              | ! [SX4: $i] :
                  ( ~ ( rel @ SX2 @ SX4 )
                  | ~ ( ! [SX5: mu] :
                          ~ ( SX3 @ SX5 @ SX4 ) ) ) )
          @ SX0 ) )
    = $true ),
    inference(unfold_def,[status(thm)],[11,ess,mand,mbox,mbox_generic,mdia,mdia_generic,mequiv,mexists_ind,mexists_indset,mforall_ind,mforall_indset,mimplies,mnot,mor,msymmetric,ne,v])).

thf(16,plain,
    ( ( ! [SX0: $i,SX1: mu > $i > $o,SX2: mu > $i > $o] :
          ( ~ ( ~ ( ~ ( p @ SX1 @ SX0 )
                  | ~ ( ! [SX3: $i] :
                          ( ~ ( rel @ SX0 @ SX3 )
                          | ! [SX4: mu] :
                              ( ~ ( SX1 @ SX4 @ SX3 )
                              | ( SX2 @ SX4 @ SX3 ) ) ) ) ) )
          | ( p @ SX2 @ SX0 ) ) )
    = $true ),
    inference(unfold_def,[status(thm)],[10,ess,mand,mbox,mbox_generic,mdia,mdia_generic,mequiv,mexists_ind,mexists_indset,mforall_ind,mforall_indset,mimplies,mnot,mor,msymmetric,ne,v])).

thf(18,plain,(
    ! [SV1: $i] :
      ( ( ! [SY0: $i] :
            ( ~ ( rel @ SV1 @ SY0 )
            | ( rel @ SY0 @ SV1 ) ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[13])).

thf(19,plain,(
    ! [SV2: $i] :
      ( ( ! [SY1: mu > $i > $o] :
            ( ~ ( p
                @ ^ [SX2: mu,SX3: $i] :
                    ~ ( SY1 @ SX2 @ SX3 )
                @ SV2 )
            | ~ ( p @ SY1 @ SV2 ) ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[14])).

thf(20,plain,(
    ! [SV3: $i] :
      ( ( p
        @ ^ [SX1: mu,SX2: $i] :
          ! [SX3: mu > $i > $o] :
            ( ~ ( ! [SX4: mu > $i > $o] :
                    ( ~ ( SX4 @ SX1 @ SX2 )
                    | ! [SX5: $i] :
                        ( ~ ( rel @ SX2 @ SX5 )
                        | ! [SX6: mu] :
                            ( ~ ( SX3 @ SX6 @ SX5 )
                            | ( SX4 @ SX6 @ SX5 ) ) ) ) )
            | ! [SX4: $i] :
                ( ~ ( rel @ SX2 @ SX4 )
                | ~ ( ! [SX5: mu] :
                        ~ ( SX3 @ SX5 @ SX4 ) ) ) )
        @ SV3 )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[15])).

thf(21,plain,(
    ! [SV4: $i] :
      ( ( ! [SY12: mu > $i > $o,SY13: mu > $i > $o] :
            ( ~ ( ~ ( ~ ( p @ SY12 @ SV4 )
                    | ~ ( ! [SY14: $i] :
                            ( ~ ( rel @ SV4 @ SY14 )
                            | ! [SX4: mu] :
                                ( ~ ( SY12 @ SX4 @ SY14 )
                                | ( SY13 @ SX4 @ SY14 ) ) ) ) ) )
            | ( p @ SY13 @ SV4 ) ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[16])).

thf(22,plain,(
    ! [SV5: $i,SV1: $i] :
      ( ( ~ ( rel @ SV1 @ SV5 )
        | ( rel @ SV5 @ SV1 ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[18])).

thf(23,plain,(
    ! [SV2: $i,SV6: mu > $i > $o] :
      ( ( ~ ( p
            @ ^ [SY16: mu,SY17: $i] :
                ~ ( SV6 @ SY16 @ SY17 )
            @ SV2 )
        | ~ ( p @ SV6 @ SV2 ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[19])).

thf(24,plain,(
    ! [SV4: $i,SV7: mu > $i > $o] :
      ( ( ! [SY18: mu > $i > $o] :
            ( ~ ( ~ ( ~ ( p @ SV7 @ SV4 )
                    | ~ ( ! [SY19: $i] :
                            ( ~ ( rel @ SV4 @ SY19 )
                            | ! [SY20: mu] :
                                ( ~ ( SV7 @ SY20 @ SY19 )
                                | ( SY18 @ SY20 @ SY19 ) ) ) ) ) )
            | ( p @ SY18 @ SV4 ) ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[21])).

thf(25,plain,(
    ! [SV5: $i,SV1: $i] :
      ( ( ( ~ ( rel @ SV1 @ SV5 ) )
        = $true )
      | ( ( rel @ SV5 @ SV1 )
        = $true ) ) ),
    inference(extcnf_or_pos,[status(thm)],[22])).

thf(26,plain,(
    ! [SV2: $i,SV6: mu > $i > $o] :
      ( ( ( ~ ( p
              @ ^ [SY16: mu,SY17: $i] :
                  ~ ( SV6 @ SY16 @ SY17 )
              @ SV2 ) )
        = $true )
      | ( ( ~ ( p @ SV6 @ SV2 ) )
        = $true ) ) ),
    inference(extcnf_or_pos,[status(thm)],[23])).

thf(27,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ~ ( ~ ( ~ ( p @ SV7 @ SV4 )
                | ~ ( ! [SY21: $i] :
                        ( ~ ( rel @ SV4 @ SY21 )
                        | ! [SY22: mu] :
                            ( ~ ( SV7 @ SY22 @ SY21 )
                            | ( SV8 @ SY22 @ SY21 ) ) ) ) ) )
        | ( p @ SV8 @ SV4 ) )
      = $true ) ),
    inference(extcnf_forall_pos,[status(thm)],[24])).

thf(28,plain,(
    ! [SV5: $i,SV1: $i] :
      ( ( ( rel @ SV1 @ SV5 )
        = $false )
      | ( ( rel @ SV5 @ SV1 )
        = $true ) ) ),
    inference(extcnf_not_pos,[status(thm)],[25])).

thf(29,plain,(
    ! [SV2: $i,SV6: mu > $i > $o] :
      ( ( ( p
          @ ^ [SY16: mu,SY17: $i] :
              ~ ( SV6 @ SY16 @ SY17 )
          @ SV2 )
        = $false )
      | ( ( ~ ( p @ SV6 @ SV2 ) )
        = $true ) ) ),
    inference(extcnf_not_pos,[status(thm)],[26])).

thf(30,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( ~ ( ~ ( ~ ( p @ SV7 @ SV4 )
                  | ~ ( ! [SY21: $i] :
                          ( ~ ( rel @ SV4 @ SY21 )
                          | ! [SY22: mu] :
                              ( ~ ( SV7 @ SY22 @ SY21 )
                              | ( SV8 @ SY22 @ SY21 ) ) ) ) ) ) )
        = $true )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_or_pos,[status(thm)],[27])).

thf(31,plain,(
    ! [SV2: $i,SV6: mu > $i > $o] :
      ( ( ( p @ SV6 @ SV2 )
        = $false )
      | ( ( p
          @ ^ [SY16: mu,SY17: $i] :
              ~ ( SV6 @ SY16 @ SY17 )
          @ SV2 )
        = $false ) ) ),
    inference(extcnf_not_pos,[status(thm)],[29])).

thf(32,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( ~ ( ~ ( p @ SV7 @ SV4 )
              | ~ ( ! [SY21: $i] :
                      ( ~ ( rel @ SV4 @ SY21 )
                      | ! [SY22: mu] :
                          ( ~ ( SV7 @ SY22 @ SY21 )
                          | ( SV8 @ SY22 @ SY21 ) ) ) ) ) )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_pos,[status(thm)],[30])).

thf(33,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( ~ ( p @ SV7 @ SV4 )
          | ~ ( ! [SY21: $i] :
                  ( ~ ( rel @ SV4 @ SY21 )
                  | ! [SY22: mu] :
                      ( ~ ( SV7 @ SY22 @ SY21 )
                      | ( SV8 @ SY22 @ SY21 ) ) ) ) )
        = $true )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_neg,[status(thm)],[32])).

thf(34,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( ~ ( p @ SV7 @ SV4 ) )
        = $true )
      | ( ( ~ ( ! [SY21: $i] :
                  ( ~ ( rel @ SV4 @ SY21 )
                  | ! [SY22: mu] :
                      ( ~ ( SV7 @ SY22 @ SY21 )
                      | ( SV8 @ SY22 @ SY21 ) ) ) ) )
        = $true )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_or_pos,[status(thm)],[33])).

thf(35,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( ~ ( ! [SY21: $i] :
                  ( ~ ( rel @ SV4 @ SY21 )
                  | ! [SY22: mu] :
                      ( ~ ( SV7 @ SY22 @ SY21 )
                      | ( SV8 @ SY22 @ SY21 ) ) ) ) )
        = $true )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_pos,[status(thm)],[34])).

thf(36,plain,(
    ! [SV8: mu > $i > $o,SV7: mu > $i > $o,SV4: $i] :
      ( ( ( ! [SY21: $i] :
              ( ~ ( rel @ SV4 @ SY21 )
              | ! [SY22: mu] :
                  ( ~ ( SV7 @ SY22 @ SY21 )
                  | ( SV8 @ SY22 @ SY21 ) ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_pos,[status(thm)],[35])).

thf(37,plain,(
    ! [SV7: mu > $i > $o,SV8: mu > $i > $o,SV4: $i] :
      ( ( ( ~ ( rel @ SV4 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
          | ! [SY23: mu] :
              ( ~ ( SV7 @ SY23 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
              | ( SV8 @ SY23 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_forall_neg,[status(esa)],[36])).

thf(38,plain,(
    ! [SV7: mu > $i > $o,SV8: mu > $i > $o,SV4: $i] :
      ( ( ( ~ ( rel @ SV4 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_or_neg,[status(thm)],[37])).

thf(39,plain,(
    ! [SV4: $i,SV8: mu > $i > $o,SV7: mu > $i > $o] :
      ( ( ( ! [SY23: mu] :
              ( ~ ( SV7 @ SY23 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
              | ( SV8 @ SY23 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_or_neg,[status(thm)],[37])).

thf(40,plain,(
    ! [SV7: mu > $i > $o,SV8: mu > $i > $o,SV4: $i] :
      ( ( ( rel @ SV4 @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
        = $true )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_neg,[status(thm)],[38])).

thf(41,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( ~ ( SV7 @ ( sK2_SY23 @ SV4 @ SV8 @ SV7 ) @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
          | ( SV8 @ ( sK2_SY23 @ SV4 @ SV8 @ SV7 ) @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_forall_neg,[status(esa)],[39])).

thf(42,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( ~ ( SV7 @ ( sK2_SY23 @ SV4 @ SV8 @ SV7 ) @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_or_neg,[status(thm)],[41])).

thf(43,plain,(
    ! [SV7: mu > $i > $o,SV4: $i,SV8: mu > $i > $o] :
      ( ( ( SV8 @ ( sK2_SY23 @ SV4 @ SV8 @ SV7 ) @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_or_neg,[status(thm)],[41])).

thf(44,plain,(
    ! [SV8: mu > $i > $o,SV4: $i,SV7: mu > $i > $o] :
      ( ( ( SV7 @ ( sK2_SY23 @ SV4 @ SV8 @ SV7 ) @ ( sK1_SY21 @ SV8 @ SV7 @ SV4 ) )
        = $true )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p @ SV8 @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_neg,[status(thm)],[42])).

thf(56,plain,(
    ! [SV7: mu > $i > $o,SV4: $i,SV18: mu > $i > $o] :
      ( ( ( ~ ( SV18
              @ ( sK2_SY23 @ SV4
                @ ^ [SX0: mu,SX1: $i] :
                    ~ ( SV18 @ SX0 @ SX1 )
                @ SV7 )
              @ ( sK1_SY21
                @ ^ [SX0: mu,SX1: $i] :
                    ~ ( SV18 @ SX0 @ SX1 )
                @ SV7
                @ SV4 ) ) )
        = $false )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p
          @ ^ [SX0: mu,SX1: $i] :
              ~ ( SV18 @ SX0 @ SX1 )
          @ SV4 )
        = $true ) ) ),
    inference(prim_subst,[status(thm)],[43:[bind(SV8,$thf(^ [SV16: mu] : ^ [SV17: $i] : ~ ( SV18 @ SV16 @ SV17 )))]])).

thf(74,plain,(
    ! [SV7: mu > $i > $o,SV4: $i,SV18: mu > $i > $o] :
      ( ( ( SV18
          @ ( sK2_SY23 @ SV4
            @ ^ [SX0: mu,SX1: $i] :
                ~ ( SV18 @ SX0 @ SX1 )
            @ SV7 )
          @ ( sK1_SY21
            @ ^ [SX0: mu,SX1: $i] :
                ~ ( SV18 @ SX0 @ SX1 )
            @ SV7
            @ SV4 ) )
        = $true )
      | ( ( p @ SV7 @ SV4 )
        = $false )
      | ( ( p
          @ ^ [SX0: mu,SX1: $i] :
              ~ ( SV18 @ SX0 @ SX1 )
          @ SV4 )
        = $true ) ) ),
    inference(extcnf_not_neg,[status(thm)],[56])).

fof(c_0_0,axiom,
    ( ~ $true
  <=> leoLit(leoTi(false,o)) ),
    file('/tmp/SystemOnTPTPFormReply8732/SOT_gT2em4',prox_false1)).

fof(c_0_1,axiom,(
    ! [X15,X17,X20] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X17,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X15,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fofify,[status(thm)],[74])).

fof(c_0_2,axiom,(
    ! [X7] : leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X7,i)),o)) ),
    inference(fofify,[status(thm)],[20])).

fof(c_0_3,axiom,(
    ! [X18,X1] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o))
    <=> leoLit(leoTi(false,o)) ) ),
    file('/tmp/SystemOnTPTPFormReply8732/SOT_gT2em4',ll5)).

fof(c_0_4,axiom,(
    ! [X16,X17,X15] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X15,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X17,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X15,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fofify,[status(thm)],[44])).

fof(c_0_5,axiom,(
    ! [X20,X18,X1] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o))
    <=> leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o)),o)) ) ),
    file('/tmp/SystemOnTPTPFormReply8732/SOT_gT2em4',ll7)).

fof(c_0_6,axiom,(
    ! [X1,X2] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    <=> leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ) ),
    file('/tmp/SystemOnTPTPFormReply8732/SOT_gT2em4',ll2)).

fof(c_0_7,axiom,(
    ! [X15,X16,X17] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X17,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fofify,[status(thm)],[40])).

fof(c_0_8,axiom,(
    ! [X15,X17,X16] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X16,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X17,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X15,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fofify,[status(thm)],[43])).

fof(c_0_9,axiom,(
    ! [X19,X18,X1] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X19,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o))
    <=> leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X19,leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o)),o)) ) ),
    file('/tmp/SystemOnTPTPFormReply8732/SOT_gT2em4',ll6)).

fof(c_0_10,axiom,(
    ! [X1,X2] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    <=> ! [X3] :
          ( ~ ! [X4] :
                ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X4,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
                | ! [X5] :
                    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X5,i)),o))
                    | ! [X6] :
                        ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(X6,tmu)),leoFt(i,o)),leoTi(X5,i)),o))
                        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X4,leoFt(tmu,leoFt(i,o))),leoTi(X6,tmu)),leoFt(i,o)),leoTi(X5,i)),o)) ) ) )
          | ! [X4] :
              ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X4,i)),o))
              | ~ ! [X5] : ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(X5,tmu)),leoFt(i,o)),leoTi(X4,i)),o)) ) ) ) ),
    file('/tmp/SystemOnTPTPFormReply8732/SOT_gT2em4',lf1)).

fof(c_0_11,axiom,(
    ! [X8,X9] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(X9,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X9,i)),leoFt(i,o)),leoTi(X8,i)),o)) ) ),
    inference(fofify,[status(thm)],[28])).

fof(c_0_12,axiom,(
    ! [X14,X11] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X11,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X14,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X11,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X14,i)),o)) ) ),
    inference(fofify,[status(thm)],[1])).

fof(c_0_13,plain,(
    ~ leoLit(leoTi(false,o)) ),
    inference(fof_simplification,[status(thm)],[c_0_0])).

fof(c_0_14,plain,(
    ! [X15,X17,X20] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X17,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X15,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fof_simplification,[status(thm)],[c_0_1])).

fof(c_0_15,axiom,(
    ! [X7] : leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X7,i)),o)) ),
    c_0_2).

fof(c_0_16,axiom,(
    ! [X18,X1] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o))
    <=> leoLit(leoTi(false,o)) ) ),
    c_0_3).

fof(c_0_17,plain,(
    ~ leoLit(leoTi(false,o)) ),
    c_0_13).

fof(c_0_18,plain,(
    ! [X21,X22,X23] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X21,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X22,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X23,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X22,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X23,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X22,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X23,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X21,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X23,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X21,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X22,i)),i)),o)) ) ),
    inference(variable_rename,[status(thm)],[c_0_14])).

fof(c_0_19,plain,(
    ! [X8] : leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X8,i)),o)) ),
    inference(variable_rename,[status(thm)],[c_0_15])).

fof(c_0_20,plain,(
    ! [X16,X17,X15] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X15,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X17,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X15,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fof_simplification,[status(thm)],[c_0_4])).

fof(c_0_21,plain,(
    ! [X19,X20,X21,X22] :
      ( ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X19,tmu)),leoFt(i,o)),leoTi(X20,i)),o))
        | leoLit(leoTi(false,o)) )
      & ( ~ leoLit(leoTi(false,o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X21,tmu)),leoFt(i,o)),leoTi(X22,i)),o)) ) ) ),
    inference(shift_quantors,[status(thm)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_16])])])])).

cnf(c_0_22,plain,
    ( ~ leoLit(leoTi(false,o)) ),
    inference(split_conjunct,[status(thm)],[c_0_17])).

cnf(c_0_23,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_18])).

cnf(c_0_24,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_19])).

fof(c_0_25,axiom,(
    ! [X20,X18,X1] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o))
    <=> leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o)),o)) ) ),
    c_0_5).

fof(c_0_26,plain,(
    ! [X18,X19,X20] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X19,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X19,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X19,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X20,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X19,i)),i)),o)) ) ),
    inference(variable_rename,[status(thm)],[c_0_20])).

cnf(c_0_27,plain,
    ( leoLit(leoTi(false,o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_21])).

cnf(c_0_28,plain,
    ( ~ leoLit(leoTi(false,o)) ),
    c_0_22).

cnf(c_0_29,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_23).

cnf(c_0_30,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_24).

fof(c_0_31,axiom,(
    ! [X1,X2] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    <=> leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ) ),
    c_0_6).

fof(c_0_32,plain,(
    ! [X15,X16,X17] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X17,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fof_simplification,[status(thm)],[c_0_7])).

fof(c_0_33,plain,(
    ! [X15,X17,X16] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X17,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X16,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X17,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X15,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X15,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X17,i)),i)),o)) ) ),
    inference(fof_simplification,[status(thm)],[c_0_8])).

fof(c_0_34,axiom,(
    ! [X19,X18,X1] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X19,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o))
    <=> leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X19,leoFt(tmu,leoFt(i,o))),leoTi(X18,tmu)),leoFt(i,o)),leoTi(X1,i)),o)),o)) ) ),
    c_0_9).

fof(c_0_35,plain,(
    ! [X21,X22,X23,X24,X25,X26] :
      ( ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X21,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X22,tmu)),leoFt(i,o)),leoTi(X23,i)),o))
        | leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X21,leoFt(tmu,leoFt(i,o))),leoTi(X22,tmu)),leoFt(i,o)),leoTi(X23,i)),o)),o)) )
      & ( ~ leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X24,leoFt(tmu,leoFt(i,o))),leoTi(X25,tmu)),leoFt(i,o)),leoTi(X26,i)),o)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X24,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X25,tmu)),leoFt(i,o)),leoTi(X26,i)),o)) ) ) ),
    inference(shift_quantors,[status(thm)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_25])])])])).

cnf(c_0_36,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X1,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_26])).

cnf(c_0_37,plain,
    ( leoLit(leoTi(false,o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_27).

cnf(c_0_38,plain,
    ( ~ leoLit(leoTi(false,o)) ),
    c_0_28).

cnf(c_0_39,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_29).

cnf(c_0_40,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_30).

fof(c_0_41,plain,(
    ! [X1,X2] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    <=> ! [X3] :
          ( ~ ! [X4] :
                ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X4,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
                | ! [X5] :
                    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X5,i)),o))
                    | ! [X6] :
                        ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(X6,tmu)),leoFt(i,o)),leoTi(X5,i)),o))
                        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X4,leoFt(tmu,leoFt(i,o))),leoTi(X6,tmu)),leoFt(i,o)),leoTi(X5,i)),o)) ) ) )
          | ! [X4] :
              ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X4,i)),o))
              | ~ ! [X5] : ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(X5,tmu)),leoFt(i,o)),leoTi(X4,i)),o)) ) ) ) ),
    inference(fof_simplification,[status(thm)],[c_0_10])).

fof(c_0_42,plain,(
    ! [X3,X4,X5,X6] :
      ( ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X3,tmu)),leoFt(i,o)),leoTi(X4,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X3,tmu)),leoFt(i,o)),leoTi(X4,i)),o)) )
      & ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X5,tmu)),leoFt(i,o)),leoTi(X6,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X5,tmu)),leoFt(i,o)),leoTi(X6,i)),o)) ) ) ),
    inference(shift_quantors,[status(thm)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_31])])])])).

fof(c_0_43,plain,(
    ! [X8,X9] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(X9,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X9,i)),leoFt(i,o)),leoTi(X8,i)),o)) ) ),
    inference(fof_simplification,[status(thm)],[c_0_11])).

fof(c_0_44,plain,(
    ! [X18,X19,X20] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X20,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X19,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X20,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X20,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X19,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X20,i)),i)),o)) ) ),
    inference(variable_rename,[status(thm)],[c_0_32])).

fof(c_0_45,plain,(
    ! [X18,X19,X20] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X19,i)),o))
      | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X19,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X19,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X18,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X18,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X19,i)),i)),o)) ) ),
    inference(variable_rename,[status(thm)],[c_0_33])).

fof(c_0_46,plain,(
    ! [X20,X21,X22,X23,X24,X25] :
      ( ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X20,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X21,tmu)),leoFt(i,o)),leoTi(X22,i)),o))
        | leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X20,leoFt(tmu,leoFt(i,o))),leoTi(X21,tmu)),leoFt(i,o)),leoTi(X22,i)),o)),o)) )
      & ( ~ leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X23,leoFt(tmu,leoFt(i,o))),leoTi(X24,tmu)),leoFt(i,o)),leoTi(X25,i)),o)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X23,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X24,tmu)),leoFt(i,o)),leoTi(X25,i)),o)) ) ) ),
    inference(shift_quantors,[status(thm)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_34])])])])).

cnf(c_0_47,plain,
    ( leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_35])).

cnf(c_0_48,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X1,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_36).

cnf(c_0_49,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(sr,[status(thm)],[c_0_37,c_0_38,theory(equality)])).

cnf(c_0_50,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_39).

cnf(c_0_51,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_40).

fof(c_0_52,plain,(
    ! [X7,X8,X9,X13,X15,X16,X18,X19,X20,X22] :
      ( ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(esk1_3(X7,X8,X9),leoFt(tmu,leoFt(i,o))),leoTi(X7,tmu)),leoFt(i,o)),leoTi(X8,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(X13,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X9,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X7,X8,X9,X13),tmu)),leoFt(i,o)),leoTi(X13,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X7,tmu)),leoFt(i,o)),leoTi(X8,i)),o)) )
      & ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(esk2_3(X7,X8,X9),i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(X13,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X9,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X7,X8,X9,X13),tmu)),leoFt(i,o)),leoTi(X13,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X7,tmu)),leoFt(i,o)),leoTi(X8,i)),o)) )
      & ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X9,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(X7,X8,X9),tmu)),leoFt(i,o)),leoTi(esk2_3(X7,X8,X9),i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(X13,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X9,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X7,X8,X9,X13),tmu)),leoFt(i,o)),leoTi(X13,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X7,tmu)),leoFt(i,o)),leoTi(X8,i)),o)) )
      & ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(esk1_3(X7,X8,X9),leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(X7,X8,X9),tmu)),leoFt(i,o)),leoTi(esk2_3(X7,X8,X9),i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X8,i)),leoFt(i,o)),leoTi(X13,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X9,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X7,X8,X9,X13),tmu)),leoFt(i,o)),leoTi(X13,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X7,tmu)),leoFt(i,o)),leoTi(X8,i)),o)) )
      & ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X18,leoFt(tmu,leoFt(i,o))),leoTi(X15,tmu)),leoFt(i,o)),leoTi(X16,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X16,i)),leoFt(i,o)),leoTi(X19,i)),o))
        | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(esk5_2(X15,X16),leoFt(tmu,leoFt(i,o))),leoTi(X20,tmu)),leoFt(i,o)),leoTi(X19,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X18,leoFt(tmu,leoFt(i,o))),leoTi(X20,tmu)),leoFt(i,o)),leoTi(X19,i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X15,tmu)),leoFt(i,o)),leoTi(X16,i)),o)) )
      & ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X16,i)),leoFt(i,o)),leoTi(esk6_2(X15,X16),i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X15,tmu)),leoFt(i,o)),leoTi(X16,i)),o)) )
      & ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(esk5_2(X15,X16),leoFt(tmu,leoFt(i,o))),leoTi(X22,tmu)),leoFt(i,o)),leoTi(esk6_2(X15,X16),i)),o))
        | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X15,tmu)),leoFt(i,o)),leoTi(X16,i)),o)) ) ) ),
    inference(distribute,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(shift_quantors,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_41])])])])])])).

cnf(c_0_53,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_42])).

fof(c_0_54,plain,(
    ! [X10,X11] :
      ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X10,i)),leoFt(i,o)),leoTi(X11,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X11,i)),leoFt(i,o)),leoTi(X10,i)),o)) ) ),
    inference(variable_rename,[status(thm)],[c_0_43])).

cnf(c_0_55,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_44])).

fof(c_0_56,plain,(
    ! [X14,X11] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X11,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X14,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X11,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X14,i)),o)) ) ),
    inference(fof_simplification,[status(thm)],[c_0_12])).

cnf(c_0_57,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_45])).

cnf(c_0_58,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_46])).

cnf(c_0_59,plain,
    ( leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)) ),
    c_0_47).

cnf(c_0_60,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X1,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_48).

cnf(c_0_61,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_49).

cnf(c_0_62,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(spm,[status(thm)],[c_0_50,c_0_51,theory(equality)])).

cnf(c_0_63,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X1,X2,X3,X4),tmu)),leoFt(i,o)),leoTi(X4,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(X1,X2,X3),tmu)),leoFt(i,o)),leoTi(esk2_3(X1,X2,X3),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X4,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_52])).

cnf(c_0_64,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_53).

cnf(c_0_65,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X1,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_54])).

cnf(c_0_66,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_55).

fof(c_0_67,plain,(
    ! [X15,X16] :
      ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X15,i)),o))
      | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X16,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X15,i)),o)) ) ),
    inference(variable_rename,[status(thm)],[c_0_56])).

cnf(c_0_68,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o)) ),
    c_0_57).

cnf(c_0_69,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o)) ),
    c_0_58).

cnf(c_0_70,plain,
    ( leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)) ),
    c_0_59).

cnf(c_0_71,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X1,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_60).

cnf(c_0_72,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_61,c_0_62,theory(equality)])).

cnf(c_0_73,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X1,X2,X3,X4),tmu)),leoFt(i,o)),leoTi(X4,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X3,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(X1,X2,X3),tmu)),leoFt(i,o)),leoTi(esk2_3(X1,X2,X3),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X4,i)),o)) ),
    c_0_63).

cnf(c_0_74,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_64).

cnf(c_0_75,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X1,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_65).

cnf(c_0_76,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_66).

cnf(c_0_77,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(split_conjunct,[status(thm)],[c_0_67])).

cnf(c_0_78,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_68).

cnf(c_0_79,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o)) ),
    c_0_69).

cnf(c_0_80,plain,
    ( leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)) ),
    c_0_70).

cnf(c_0_81,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X1,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_71,c_0_72,theory(equality)])).

cnf(c_0_82,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(X2,X3,X1),tmu)),leoFt(i,o)),leoTi(esk2_3(X2,X3,X1),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X2,X3,X1,X4),tmu)),leoFt(i,o)),leoTi(X4,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X3,i)),leoFt(i,o)),leoTi(X4,i)),o)) ),
    c_0_73).

cnf(c_0_83,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(X1,tmu)),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_74).

cnf(c_0_84,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(ll2,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X1,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_71,c_0_51,theory(equality)])).

cnf(c_0_85,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_75).

cnf(c_0_86,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_76).

cnf(c_0_87,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_77).

cnf(c_0_88,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(X3,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_78).

cnf(c_0_89,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o)),o)) ),
    c_0_79).

cnf(c_0_90,plain,
    ( leoLit(leoTi(leoAt(leoTi(not,leoFt(o,o)),leoTi(leoAt(leoTi(leoAt(leoTi(ll5,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X1,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_80,c_0_81,theory(equality)])).

cnf(c_0_91,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(X2,X3,X1),tmu)),leoFt(i,o)),leoTi(esk2_3(X2,X3,X1),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(X2,X3,X1,X4),tmu)),leoFt(i,o)),leoTi(X4,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(X2,tmu)),leoFt(i,o)),leoTi(X3,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X3,i)),leoFt(i,o)),leoTi(X4,i)),o)) ),
    c_0_82).

cnf(c_0_92,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(lf1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X1,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_83,c_0_84,theory(equality)])).

cnf(c_0_93,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X2,i)),leoFt(i,o)),leoTi(X1,i)),o)) ),
    c_0_85).

cnf(c_0_94,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(X1,i)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_86,c_0_51,theory(equality)])).

cnf(c_0_95,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_87).

cnf(c_0_96,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),o)) ),
    inference(spm,[status(thm)],[c_0_88,c_0_72,theory(equality)])).

cnf(c_0_97,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X1,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),tmu)),leoFt(i,o)),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(leoAt(leoTi(ll7,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X1,i)),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X2,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_89,c_0_90,theory(equality)])).

cnf(c_0_98,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),X1),tmu)),leoFt(i,o)),leoTi(esk2_3(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),X1),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),X1,X4),tmu)),leoFt(i,o)),leoTi(X4,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),leoFt(i,o)),leoTi(X4,i)),o)) ),
    inference(spm,[status(thm)],[c_0_91,c_0_92,theory(equality)])).

cnf(c_0_99,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(crel,leoFt(i,leoFt(i,o))),leoTi(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),i)),leoFt(i,o)),leoTi(X2,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(spm,[status(thm)],[c_0_93,c_0_94,theory(equality)])).

cnf(c_0_100,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o))
    | ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    c_0_95).

cnf(c_0_101,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_96,c_0_97,theory(equality)])).

cnf(c_0_102,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk3_3(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),X1),tmu)),leoFt(i,o)),leoTi(esk2_3(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),X1),i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(X1,leoFt(tmu,leoFt(i,o))),leoTi(esk4_4(leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK2_SY23,leoFt(i,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu)))),leoTi(X2,i)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),tmu))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),tmu)),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoAt(leoTi(leoAt(leoTi(leoAt(leoTi(csK1_SY21,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i)))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,i))),leoTi(ll2,leoFt(tmu,leoFt(i,o)))),leoFt(i,i)),leoTi(X2,i)),X1,X2),tmu)),leoFt(i,o)),leoTi(X2,i)),o))
    | leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X3,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(spm,[status(thm)],[c_0_98,c_0_99,theory(equality)])).

cnf(c_0_103,plain,
    ( ~ leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(leoAt(leoTi(ll3,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(leoAt(leoTi(ll6,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(tmu,leoFt(i,o)))),leoTi(ll5,leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X1,i)),o)) ),
    inference(spm,[status(thm)],[c_0_100,c_0_101,theory(equality)])).

cnf(c_0_104,plain,
    ( leoLit(leoTi(leoAt(leoTi(leoAt(leoTi(cp,leoFt(leoFt(tmu,leoFt(i,o)),leoFt(i,o))),leoTi(X1,leoFt(tmu,leoFt(i,o)))),leoFt(i,o)),leoTi(X2,i)),o)) ),
    inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_61,c_0_102,theory(equality)]),c_0_61,theory(equality)])).

cnf(c_0_105,plain,
    ( $false ),
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[c_0_103,c_0_104,theory(equality)]),theory(equality,[symmetry])]),
    [proof]).

thf(79,plain,(
    $false = $true ),
    inference(fo_atp_e,[status(thm)],[c_0_105])).

thf(80,plain,(
    $false ),
    inference(solved_all_splits,[solved_all_splits(join,[])],[79])).

% SZS output end CNFRefutation

%**** End of derivation protocol ****
%**** no. of clauses in derivation: 69 ****
%**** clause counter: 79 ****

% SZS status Unsatisfiable for InconsistencyWithoutFirstConjunctinD2_minimized.p : (rf:0,axioms:4,ps:3,u:6,ude:false,rLeibEQ:true,rAndEQ:true,use_choice:true,use_extuni:true,use_extcnf_combined:true,expand_extuni:false,foatp:e,atp_timeout:25,atp_calls_frequency:10,ordering:none,proof_output:1,protocol_output:false,clause_count:79,loop_count:0,foatp_calls:2,translation:fof_full)
