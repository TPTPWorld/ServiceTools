fof(apart1_0001,axiom,
    ! [X] : ~ distinct_points(X,X) ).
fof(apart2_0002,axiom,
    ! [X] : ~ distinct_lines(X,X) ).
fof(apart3_0003,axiom,
    ! [X] : ~ convergent_lines(X,X) ).
fof(apart4_0004,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( distinct_points(X,Z)
        | distinct_points(Y,Z) ) ) ).
fof(apart5_0005,axiom,
    ! [X,Y,Z] :
      ( distinct_lines(X,Y)
     => ( distinct_lines(X,Z)
        | distinct_lines(Y,Z) ) ) ).
fof(apart6_0006,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( convergent_lines(X,Z)
        | convergent_lines(Y,Z) ) ) ).
fof(con1_0007,axiom,
    ! [X,Y,Z] :
      ( distinct_points(X,Y)
     => ( apart_point_and_line(Z,line_connecting(X,Y))
       => ( distinct_points(Z,X)
          & distinct_points(Z,Y) ) ) ) ).
fof(con2_0008,axiom,
    ! [X,Y,Z] :
      ( convergent_lines(X,Y)
     => ( ( apart_point_and_line(Z,X)
          | apart_point_and_line(Z,Y) )
       => distinct_points(Z,intersection_point(X,Y)) ) ) ).
fof(cu1_0009,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & distinct_lines(U,V) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(X,V)
        | apart_point_and_line(Y,U)
        | apart_point_and_line(Y,V) ) ) ).
fof(ceq1_0010,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_points(X,Z)
        | apart_point_and_line(Z,Y) ) ) ).
fof(ceq2_0011,axiom,
    ! [X,Y,Z] :
      ( apart_point_and_line(X,Y)
     => ( distinct_lines(Y,Z)
        | apart_point_and_line(X,Z) ) ) ).
fof(ceq3_0012,axiom,
    ! [X,Y] :
      ( convergent_lines(X,Y)
     => distinct_lines(X,Y) ) ).
fof(con_0013,axiom,
    ! [X,Y,U,V] :
      ( ( distinct_points(X,Y)
        & convergent_lines(U,V)
        & distinct_lines(U,line_connecting(X,Y)) )
     => ( apart_point_and_line(X,U)
        | apart_point_and_line(Y,U) ) ) ).
fof(apart1,conjecture,
    ! [X1] : ~ distinct_points(X1,X1),
    file('/export/starexec/sandbox/benchmark/Axioms/GEO008+0.ax',apart1) ).
