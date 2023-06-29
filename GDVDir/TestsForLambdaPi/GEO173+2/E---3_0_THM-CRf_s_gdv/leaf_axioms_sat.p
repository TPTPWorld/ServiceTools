fof(apart1,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart1),
    [verified(leaf)] ).
fof(apart4,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( distinct_points(X1,X3)
        | distinct_points(X2,X3) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart4),
    [verified(leaf)] ).
fof(cu1,axiom,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & distinct_lines(X4,X5) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X1,X5)
        | apart_point_and_line(X2,X4)
        | apart_point_and_line(X2,X5) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',cu1),
    [verified(leaf)] ).
fof(con1,axiom,
    ! [X1,X2,X3] :
      ( distinct_points(X1,X2)
     => ( apart_point_and_line(X3,line_connecting(X1,X2))
       => ( distinct_points(X3,X1)
          & distinct_points(X3,X2) ) ) ),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',con1),
    [verified(leaf)] ).
