thf(simple_s5,logic,(
    $modal :=
      [ $constants := $rigid,
        $quantification := $constant,
        $consequence :=
          [ $global ],
        $modalities := $modal_system_S5 ] )).

%----Standard S5 v2
thf(simple_s5_v2,logic,(
    [ $modal :=
        [ $constants := $rigid,
          $quantification := $constant,
          $consequence := $global,
          $modalities :=
            [ $modal_system_S5 ] ] ] )).

%----Default modality S5 as list of axioms K + T + 5
thf(simple_s5_v3,logic,(
    $modal :=
      [ $constants := $rigid,
        $quantification := $constant,
        $consequence := $global,
        $modalities :=
          [ $modal_axiom_K,
            $modal_axiom_T,
            $modal_axiom_5 ] ] )).

thf(constants,logic,(
    $modal :=
      [ $constants :=
          [ $constant,
            king_of_france := $flexible ],
        $quantification := $constant,
        $consequence := $global,
        $modalities := $modal_system_S5 ] )).

thf(quantification,logic,(
    $modal :=
      [ $constants := $rigid,
        $quantification :=
          [ $constant,
            plushie := $varying ],
        $consequence := $global,
        $modalities := $modal_system_S5 ] )).

thf(exotic,logic,(
    $modal :=
      [ $constants := $flexible,
        $quantification := $cumulative,
        $consequence :=
          [ $global,
            ax1 := $local ],
        $modalities :=
          [ ! [X: $int] :
              ( X :=
                  [ $modal_axiom_K,
                    $modal_axiom_D ] ),
            a := $modal_system_S5,
            b := $modal_system_KB,
            c := $modal_system_K ] ] )).

thf(quantification,logic,( 
    $modal :=
      [ $constants := $rigid,
        $quantification := $constant,
        $consequence := $global,
        $modalities :=
          ! [X: $int] :
            $ite($greater @ X @ 0,$modal_system_K,$modal_system_KB)] )).

thf(instantiated_modality,logic,(
    $modal :=
      [ $constants := $rigid,
        $quantification := $constant,
        $consequence := $global,
        $modalities :=
          [ $modal_axiom_K,
             ( $box_P @ agent @ archer ) := $modal_system_D ] ] )).

thf(funky_mixed,logic,(
    [ $modal :=
        [ $constants := $rigid,
          $quantification := $constant,
          $consequence := $global,
          $modalities := $modal_system_S5 ],
      $dialetheic :=
        [ $truth_values :=
            [ $true,
              $false,
              $both ],
          $embedding := $translational ] ] )).

