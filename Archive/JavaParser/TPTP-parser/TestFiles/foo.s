% START OF SYSTEM OUTPUT
thf(tp_complement,type,(
    complement: ( $i > $o ) > $i > $o )).

thf(tp_disjoint,type,(
    disjoint: ( $i > $o ) > ( $i > $o ) > $o )).

thf(tp_emptyset,type,(
    emptyset: $i > $o )).

thf(tp_excl_union,type,(
    excl_union: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_in,type,(
    in: $i > ( $i > $o ) > $o )).

thf(tp_intersection,type,(
    intersection: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_is_a,type,(
    is_a: $i > ( $i > $o ) > $o )).

thf(tp_meets,type,(
    meets: ( $i > $o ) > ( $i > $o ) > $o )).

thf(tp_misses,type,(
    misses: ( $i > $o ) > ( $i > $o ) > $o )).

thf(tp_sK1,type,(
    sK1: $i > $o )).

thf(tp_sK2,type,(
    sK2: $i > $o )).

thf(tp_sK3,type,(
    sK3: $i > $o )).

thf(tp_sK4,type,(
    sK4: $i )).

thf(tp_setminus,type,(
    setminus: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_singleton,type,(
    singleton: $i > $i > $o )).

thf(tp_subset,type,(
    subset: ( $i > $o ) > ( $i > $o ) > $o )).

thf(tp_union,type,(
    union: ( $i > $o ) > ( $i > $o ) > $i > $o )).

thf(tp_unord_pair,type,(
    unord_pair: $i > $i > $i > $o )).

thf(complement,definition,
    ( complement
    = ( ^ [X: $i > $o,U: $i] :
          ~ ( X @ U ) ) )).

thf(disjoint,definition,
    ( disjoint
    = ( ^ [X: $i > $o,Y: $i > $o] :
          ( ( intersection @ X @ Y )
          = emptyset ) ) )).

thf(emptyset,definition,
    ( emptyset
    = ( ^ [X: $i] : $false ) )).

thf(excl_union,definition,
    ( excl_union
    = ( ^ [X: $i > $o,Y: $i > $o,U: $i] :
          ( ( ( X @ U )
            & ~ ( Y @ U ) )
          | ( ~ ( X @ U )
            & ( Y @ U ) ) ) ) )).

thf(in,definition,
    ( in
    = ( ^ [X: $i,M: $i > $o] :
          ( M @ X ) ) )).

thf(intersection,definition,
    ( intersection
    = ( ^ [X: $i > $o,Y: $i > $o,U: $i] :
          ( ( X @ U )
          & ( Y @ U ) ) ) )).

thf(is_a,definition,
    ( is_a
    = ( ^ [X: $i,M: $i > $o] :
          ( M @ X ) ) )).

thf(meets,definition,
    ( meets
    = ( ^ [X: $i > $o,Y: $i > $o] :
        ? [U: $i] :
          ( ( X @ U )
          & ( Y @ U ) ) ) )).

thf(misses,definition,
    ( misses
    = ( ^ [X: $i > $o,Y: $i > $o] :
          ~ ( ? [U: $i] :
                ( ( X @ U )
                & ( Y @ U ) ) ) ) )).

thf(setminus,definition,
    ( setminus
    = ( ^ [X: $i > $o,Y: $i > $o,U: $i] :
          ( ( X @ U )
          & ~ ( Y @ U ) ) ) )).

thf(singleton,definition,
    ( singleton
    = ( ^ [X: $i,U: $i] : ( U = X ) ) )).

thf(subset,definition,
    ( subset
    = ( ^ [X: $i > $o,Y: $i > $o] :
        ! [U: $i] :
          ( ( X @ U )
         => ( Y @ U ) ) ) )).

thf(union,definition,
    ( union
    = ( ^ [X: $i > $o,Y: $i > $o,U: $i] :
          ( ( X @ U )
          | ( Y @ U ) ) ) )).

thf(unord_pair,definition,
    ( unord_pair
    = ( ^ [X: $i,Y: $i,U: $i] :
          ( ( U = X )
          | ( U = Y ) ) ) )).

thf(1,conjecture,(
    ! [X: $i > $o,Y: $i > $o,A: $i > $o] :
      ( ( ( subset @ X @ A )
        & ( subset @ Y @ A ) )
     => ( subset @ ( union @ X @ Y ) @ A ) ) ),
    file('/tmp/SystemOnTPTP3613/SET014^4.tptp',thm)).

thf(2,negated_conjecture,
    ( ( ! [X: $i > $o,Y: $i > $o,A: $i > $o] :
          ( ( ( subset @ X @ A )
            & ( subset @ Y @ A ) )
         => ( subset @ ( union @ X @ Y ) @ A ) ) )
    = $false ),
    inference(negate_conjecture,[status(cth)],[1])).

thf(3,plain,
    ( ( ! [SY0: $i > $o,SY1: $i > $o,SY2: $i > $o] :
          ( ( ! [SY5: $i] :
                ( ( SY0 @ SY5 )
               => ( SY2 @ SY5 ) )
            & ! [SY8: $i] :
                ( ( SY1 @ SY8 )
               => ( SY2 @ SY8 ) ) )
         => ! [SY14: $i] :
              ( ( ( SY0 @ SY14 )
                | ( SY1 @ SY14 ) )
             => ( SY2 @ SY14 ) ) ) )
    = $false ),
    inference(unfold_def,[status(thm)],[2,complement,disjoint,emptyset,excl_union,in,intersection,is_a,meets,misses,setminus,singleton,subset,union,unord_pair])).

thf(4,plain,
    ( ( ( ! [SY27: $i] :
            ( ( sK1 @ SY27 )
           => ( sK3 @ SY27 ) )
        & ! [SY25: $i] :
            ( ( sK2 @ SY25 )
           => ( sK3 @ SY25 ) ) )
     => ! [SY29: $i] :
          ( ( ( sK1 @ SY29 )
            | ( sK2 @ SY29 ) )
         => ( sK3 @ SY29 ) ) )
    = $false ),
    inference(skolemize,[status(thm)],[3])).

thf(5,plain,
    ( ( ! [SY27: $i] :
          ( ( sK1 @ SY27 )
         => ( sK3 @ SY27 ) ) )
    = $true ),
    inference(cnf,[status(thm)],[4])).

thf(6,plain,
    ( ( ! [SY25: $i] :
          ( ( sK2 @ SY25 )
         => ( sK3 @ SY25 ) ) )
    = $true ),
    inference(cnf,[status(thm)],[4])).

thf(7,plain,
    ( ( ! [SY29: $i] :
          ( ( ( sK1 @ SY29 )
            | ( sK2 @ SY29 ) )
         => ( sK3 @ SY29 ) ) )
    = $false ),
    inference(cnf,[status(thm)],[4])).

thf(8,plain,
    ( ( ~ ( ! [SY29: $i] :
              ( ( ( sK1 @ SY29 )
                | ( sK2 @ SY29 ) )
             => ( sK3 @ SY29 ) ) ) )
    = $true ),
    inference(polarity_switch,[status(thm)],[7])).

thf(9,plain,
    ( ( ( ( sK1 @ sK4 )
        | ( sK2 @ sK4 ) )
      & ~ ( sK3 @ sK4 ) )
    = $true ),
    inference(standard_extcnf,[status(thm)],[8])).

thf(10,plain,
    ( ( ! [SY27: $i] :
          ( ~ ( sK1 @ SY27 )
          | ( sK3 @ SY27 ) ) )
    = $true ),
    inference(standard_extcnf,[status(thm)],[5])).

thf(11,plain,
    ( ( ! [SY25: $i] :
          ( ~ ( sK2 @ SY25 )
          | ( sK3 @ SY25 ) ) )
    = $true ),
    inference(standard_extcnf,[status(thm)],[6])).

thf(12,plain,
    ( ( ! [SY25: $i] :
          ( ~ ( sK2 @ SY25 )
          | ( sK3 @ SY25 ) ) )
    = $true ),
    inference(copy,[status(thm)],[11])).

thf(13,plain,
    ( ( ! [SY27: $i] :
          ( ~ ( sK1 @ SY27 )
          | ( sK3 @ SY27 ) ) )
    = $true ),
    inference(copy,[status(thm)],[10])).

thf(14,plain,
    ( ( ( ( sK1 @ sK4 )
        | ( sK2 @ sK4 ) )
      & ~ ( sK3 @ sK4 ) )
    = $true ),
    inference(copy,[status(thm)],[9])).

thf(15,plain,
    ( ( ~ ( ~ ( ( sK1 @ sK4 )
              | ( sK2 @ sK4 ) )
          | ~ ( ~ ( sK3 @ sK4 ) ) ) )
    = $true ),
    inference(unfold_def,[status(thm)],[14,complement,disjoint,emptyset,excl_union,in,intersection,is_a,meets,misses,setminus,singleton,subset,union,unord_pair])).

thf(16,plain,(
    ! [SV1: $i] :
      ( ( ~ ( sK2 @ SV1 )
        | ( sK3 @ SV1 ) )
      = $true ) ),
    inference(extcnf,[status(thm)],[12])).

thf(17,plain,(
    ! [SV2: $i] :
      ( ( ~ ( sK1 @ SV2 )
        | ( sK3 @ SV2 ) )
      = $true ) ),
    inference(extcnf,[status(thm)],[13])).

thf(18,plain,
    ( ( ~ ( ( sK1 @ sK4 )
          | ( sK2 @ sK4 ) )
      | ~ ( ~ ( sK3 @ sK4 ) ) )
    = $false ),
    inference(extcnf,[status(thm)],[15])).

thf(19,plain,(
    ! [SV1: $i] :
      ( ( ( ~ ( sK2 @ SV1 ) )
        = $true )
      | ( ( sK3 @ SV1 )
        = $true ) ) ),
    inference(extcnf,[status(thm)],[16])).

thf(20,plain,(
    ! [SV2: $i] :
      ( ( ( ~ ( sK1 @ SV2 ) )
        = $true )
      | ( ( sK3 @ SV2 )
        = $true ) ) ),
    inference(extcnf,[status(thm)],[17])).

thf(21,plain,
    ( ( ~ ( ~ ( sK3 @ sK4 ) ) )
    = $false ),
    inference(extcnf,[status(thm)],[18])).

thf(22,plain,
    ( ( ~ ( ( sK1 @ sK4 )
          | ( sK2 @ sK4 ) ) )
    = $false ),
    inference(extcnf,[status(thm)],[18])).

thf(23,plain,(
    ! [SV1: $i] :
      ( ( ( sK2 @ SV1 )
        = $false )
      | ( ( sK3 @ SV1 )
        = $true ) ) ),
    inference(extcnf,[status(thm)],[19])).

thf(24,plain,(
    ! [SV2: $i] :
      ( ( ( sK1 @ SV2 )
        = $false )
      | ( ( sK3 @ SV2 )
        = $true ) ) ),
    inference(extcnf,[status(thm)],[20])).

thf(25,plain,
    ( ( ( sK1 @ sK4 )
      | ( sK2 @ sK4 ) )
    = $true ),
    inference(extcnf,[status(thm)],[22])).

thf(26,plain,
    ( ( ~ ( sK3 @ sK4 ) )
    = $true ),
    inference(extcnf,[status(thm)],[21])).

thf(27,plain,
    ( ( ( sK1 @ sK4 )
      = $true )
    | ( ( sK2 @ sK4 )
      = $true ) ),
    inference(extcnf,[status(thm)],[25])).

thf(28,plain,
    ( ( sK3 @ sK4 )
    = $false ),
    inference(extcnf,[status(thm)],[26])).

thf(29,plain,(
    $false = $true ),
    inference(fo_atp_e,[status(thm)],[28,27,24,23])).

thf(30,plain,(
    $false ),
    inference(solved_all_splitted_problems,[status(thm)],[29])).


% END OF SYSTEM OUTPUT
% RESULT: SOT_ZQcm5X - TPTP4X---0.0 says Unknown - CPU = 0.00 WC = 0.01 
% OUTPUT: SOT_ZQcm5X - TPTP4X---0.0 says None - CPU = 0 WC = 0 
