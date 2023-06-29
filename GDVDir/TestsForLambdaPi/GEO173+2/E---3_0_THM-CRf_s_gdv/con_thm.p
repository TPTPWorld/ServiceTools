fof(con,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).
fof(con,conjecture,
    ! [X1,X2,X4,X5] :
      ( ( distinct_points(X1,X2)
        & convergent_lines(X4,X5)
        & distinct_lines(X4,line_connecting(X1,X2)) )
     => ( apart_point_and_line(X1,X4)
        | apart_point_and_line(X2,X4) ) ),
    file('/export/starexec/sandbox/benchmark/theBenchmark.p',con) ).
