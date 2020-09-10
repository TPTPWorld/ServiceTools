thf(spec,logic,(
    $modal :=
        [ $constants := $rigid,
          $quantification := $cumulative,
          $consequence := $global,
          $modalities := $modal_system_K ] )).

thf(f,type,p: $i>$o).
thf(1,conjecture,(($box @ (! [X:$i]: (p @ X))) => ! [X:$i]: ($box @ (p @ X)))).
