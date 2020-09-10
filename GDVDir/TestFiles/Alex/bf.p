thf(spec,logic,(
    $modal :=
        [ $constants := $rigid,
          $quantification := $decreasing,
          $consequence := $global,
          $modalities := $modal_system_K ] )).

thf(f,type,p: $i>$o).
thf(1,conjecture,(! [X:$i]: ($box @ (p @ X))) => ($box @ (! [X:$i]: (p @ X)))).
