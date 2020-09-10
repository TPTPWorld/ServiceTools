fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] : 
      ( r2_hidden(A,B)
     => ~ r2_hidden(B,A) ) ),
    file(hidden,r2_hidden),
    [theorem,axiom,file(hidden,r2_hidden)]).

fof(antisymmetry_r2_xboole_0,axiom,(
    ! [A,B] : 
      ( r2_xboole_0(A,B)
     => ~ r2_xboole_0(B,A) ) ),
    file(xboole_0,r2_xboole_0),
    [theorem,axiom,file(xboole_0,r2_xboole_0)]).

fof(cc1_funct_1,axiom,(
    ! [A] : 
      ( v1_xboole_0(A)
     => v1_funct_1(A) ) ),
    file(funct_1,cc1_funct_1),
    [theorem,axiom,file(funct_1,cc1_funct_1)]).

fof(cc1_ordinal1,axiom,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( v1_ordinal1(A)
        & v2_ordinal1(A) ) ) ),
    file(ordinal1,cc1_ordinal1),
    [theorem,axiom,file(ordinal1,cc1_ordinal1)]).

fof(cc1_relat_1,axiom,(
    ! [A] : 
      ( v1_xboole_0(A)
     => v1_relat_1(A) ) ),
    file(relat_1,cc1_relat_1),
    [theorem,axiom,file(relat_1,cc1_relat_1)]).

fof(cc2_funct_1,axiom,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_xboole_0(A)
        & v1_funct_1(A) )
     => ( v1_relat_1(A)
        & v1_funct_1(A)
        & v2_funct_1(A) ) ) ),
    file(funct_1,cc2_funct_1),
    [theorem,axiom,file(funct_1,cc2_funct_1)]).

fof(cc2_ordinal1,axiom,(
    ! [A] : 
      ( ( v1_ordinal1(A)
        & v2_ordinal1(A) )
     => v3_ordinal1(A) ) ),
    file(ordinal1,cc2_ordinal1),
    [theorem,axiom,file(ordinal1,cc2_ordinal1)]).

fof(cc3_ordinal1,axiom,(
    ! [A] : 
      ( v1_xboole_0(A)
     => ( v1_ordinal1(A)
        & v2_ordinal1(A)
        & v3_ordinal1(A) ) ) ),
    file(ordinal1,cc3_ordinal1),
    [theorem,axiom,file(ordinal1,cc3_ordinal1)]).

fof(commutativity_k2_tarski,axiom,(
    ! [A,B] : k2_tarski(A,B) = k2_tarski(B,A) ),
    file(tarski,k2_tarski),
    [theorem,axiom,file(tarski,k2_tarski)]).

fof(commutativity_k2_xboole_0,axiom,(
    ! [A,B] : k2_xboole_0(A,B) = k2_xboole_0(B,A) ),
    file(xboole_0,k2_xboole_0),
    [theorem,axiom,file(xboole_0,k2_xboole_0)]).

fof(connectedness_r1_ordinal1,axiom,(
    ! [A,B] : 
      ( ( v3_ordinal1(A)
        & v3_ordinal1(B) )
     => ( r1_ordinal1(A,B)
        | r1_ordinal1(B,A) ) ) ),
    file(ordinal1,r1_ordinal1),
    [theorem,axiom,file(ordinal1,r1_ordinal1)]).

fof(d10_xboole_0,axiom,(
    ! [A,B] : 
      ( A = B
    <=> ( r1_tarski(A,B)
        & r1_tarski(B,A) ) ) ),
    file(xboole_0,d10_xboole_0),
    [definition,axiom,file(xboole_0,d10_xboole_0)]).

fof(d1_enumset1,axiom,(
    ! [A,B,C,D] : 
      ( D = k1_enumset1(A,B,C)
    <=> ! [E] : 
          ( r2_hidden(E,D)
        <=> ~ ( E != A
              & E != B
              & E != C ) ) ) ),
    file(enumset1,d1_enumset1),
    [definition,axiom,file(enumset1,d1_enumset1)]).

fof(d1_funct_1,axiom,(
    ! [A] : 
      ( v1_funct_1(A)
    <=> ! [B,C,D] : 
          ( ( r2_hidden(k4_tarski(B,C),A)
            & r2_hidden(k4_tarski(B,D),A) )
         => C = D ) ) ),
    file(funct_1,d1_funct_1),
    [definition,axiom,file(funct_1,d1_funct_1)]).

fof(d1_ordinal1,axiom,(
    ! [A] : k1_ordinal1(A) = k2_xboole_0(A,k1_tarski(A)) ),
    file(ordinal1,d1_ordinal1),
    [definition,axiom,file(ordinal1,d1_ordinal1)]).

fof(d1_relat_1,axiom,(
    ! [A] : 
      ( v1_relat_1(A)
    <=> ! [B] : 
          ~ ( r2_hidden(B,A)
            & ! [C,D] : B != k4_tarski(C,D) ) ) ),
    file(relat_1,d1_relat_1),
    [definition,axiom,file(relat_1,d1_relat_1)]).

fof(d1_tarski,axiom,(
    ! [A,B] : 
      ( B = k1_tarski(A)
    <=> ! [C] : 
          ( r2_hidden(C,B)
        <=> C = A ) ) ),
    file(tarski,d1_tarski),
    [definition,axiom,file(tarski,d1_tarski)]).

fof(d2_enumset1,axiom,(
    ! [A,B,C,D,E] : 
      ( E = k2_enumset1(A,B,C,D)
    <=> ! [F] : 
          ( r2_hidden(F,E)
        <=> ~ ( F != A
              & F != B
              & F != C
              & F != D ) ) ) ),
    file(enumset1,d2_enumset1),
    [definition,axiom,file(enumset1,d2_enumset1)]).

fof(d2_ordinal1,axiom,(
    ! [A] : 
      ( v1_ordinal1(A)
    <=> ! [B] : 
          ( r2_hidden(B,A)
         => r1_tarski(B,A) ) ) ),
    file(ordinal1,d2_ordinal1),
    [definition,axiom,file(ordinal1,d2_ordinal1)]).

fof(d2_xboole_0,axiom,(
    ! [A,B,C] : 
      ( C = k2_xboole_0(A,B)
    <=> ! [D] : 
          ( r2_hidden(D,C)
        <=> ( r2_hidden(D,A)
            | r2_hidden(D,B) ) ) ) ),
    file(xboole_0,d2_xboole_0),
    [definition,axiom,file(xboole_0,d2_xboole_0)]).

fof(d3_enumset1,axiom,(
    ! [A,B,C,D,E,F] : 
      ( F = k3_enumset1(A,B,C,D,E)
    <=> ! [G] : 
          ( r2_hidden(G,F)
        <=> ~ ( G != A
              & G != B
              & G != C
              & G != D
              & G != E ) ) ) ),
    file(enumset1,d3_enumset1),
    [definition,axiom,file(enumset1,d3_enumset1)]).

fof(d3_ordinal1,axiom,(
    ! [A] : 
      ( v2_ordinal1(A)
    <=> ! [B,C] : 
          ~ ( r2_hidden(B,A)
            & r2_hidden(C,A)
            & ~ r2_hidden(B,C)
            & B != C
            & ~ r2_hidden(C,B) ) ) ),
    file(ordinal1,d3_ordinal1),
    [definition,axiom,file(ordinal1,d3_ordinal1)]).

fof(d3_tarski,axiom,(
    ! [A,B] : 
      ( r1_tarski(A,B)
    <=> ! [C] : 
          ( r2_hidden(C,A)
         => r2_hidden(C,B) ) ) ),
    file(tarski,d3_tarski),
    [definition,axiom,file(tarski,d3_tarski)]).

fof(d4_enumset1,axiom,(
    ! [A,B,C,D,E,F,G] : 
      ( G = k4_enumset1(A,B,C,D,E,F)
    <=> ! [H] : 
          ( r2_hidden(H,G)
        <=> ~ ( H != A
              & H != B
              & H != C
              & H != D
              & H != E
              & H != F ) ) ) ),
    file(enumset1,d4_enumset1),
    [definition,axiom,file(enumset1,d4_enumset1)]).

fof(d4_ordinal1,axiom,(
    ! [A] : 
      ( v3_ordinal1(A)
    <=> ( v1_ordinal1(A)
        & v2_ordinal1(A) ) ) ),
    file(ordinal1,d4_ordinal1),
    [definition,axiom,file(ordinal1,d4_ordinal1)]).

fof(d4_relat_1,axiom,(
    ! [A] : 
      ( v1_relat_1(A)
     => ! [B] : 
          ( B = k1_relat_1(A)
        <=> ! [C] : 
              ( r2_hidden(C,B)
            <=> ? [D] : r2_hidden(k4_tarski(C,D),A) ) ) ) ),
    file(relat_1,d4_relat_1),
    [definition,axiom,file(relat_1,d4_relat_1)]).

fof(d4_tarski,axiom,(
    ! [A,B] : 
      ( B = k3_tarski(A)
    <=> ! [C] : 
          ( r2_hidden(C,B)
        <=> ? [D] : 
              ( r2_hidden(C,D)
              & r2_hidden(D,A) ) ) ) ),
    file(tarski,d4_tarski),
    [definition,axiom,file(tarski,d4_tarski)]).

fof(d4_xboole_0,axiom,(
    ! [A,B,C] : 
      ( C = k4_xboole_0(A,B)
    <=> ! [D] : 
          ( r2_hidden(D,C)
        <=> ( r2_hidden(D,A)
            & ~ r2_hidden(D,B) ) ) ) ),
    file(xboole_0,d4_xboole_0),
    [definition,axiom,file(xboole_0,d4_xboole_0)]).

fof(d5_funct_1,axiom,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A) )
     => ! [B] : 
          ( B = k2_relat_1(A)
        <=> ! [C] : 
              ( r2_hidden(C,B)
            <=> ? [D] : 
                  ( r2_hidden(D,k1_relat_1(A))
                  & C = k1_funct_1(A,D) ) ) ) ) ),
    file(funct_1,d5_funct_1),
    [definition,axiom,file(funct_1,d5_funct_1)]).

fof(d5_tarski,axiom,(
    ! [A,B] : k4_tarski(A,B) = k2_tarski(k2_tarski(A,B),k1_tarski(A)) ),
    file(tarski,d5_tarski),
    [definition,axiom,file(tarski,d5_tarski)]).

fof(d6_ordinal1,axiom,(
    ! [A] : 
      ( v4_ordinal1(A)
    <=> A = k3_tarski(A) ) ),
    file(ordinal1,d6_ordinal1),
    [definition,axiom,file(ordinal1,d6_ordinal1)]).

fof(d7_ordinal1,axiom,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A) )
     => ( v5_ordinal1(A)
      <=> v3_ordinal1(k1_relat_1(A)) ) ) ),
    file(ordinal1,d7_ordinal1),
    [definition,axiom,file(ordinal1,d7_ordinal1)]).

fof(d8_ordinal1,axiom,(
    ! [A,B] : 
      ( ( v1_relat_1(B)
        & v1_funct_1(B)
        & v5_ordinal1(B) )
     => ( m1_ordinal1(B,A)
      <=> r1_tarski(k2_relat_1(B),A) ) ) ),
    file(ordinal1,d8_ordinal1),
    [definition,axiom,file(ordinal1,d8_ordinal1)]).

fof(d8_xboole_0,axiom,(
    ! [A,B] : 
      ( r2_xboole_0(A,B)
    <=> ( r1_tarski(A,B)
        & A != B ) ) ),
    file(xboole_0,d8_xboole_0),
    [definition,axiom,file(xboole_0,d8_xboole_0)]).

fof(d9_ordinal1,axiom,(
    ! [A] : 
      ( v6_ordinal1(A)
    <=> ! [B,C] : 
          ( ( r2_hidden(B,A)
            & r2_hidden(C,A) )
         => r3_xboole_0(B,C) ) ) ),
    file(ordinal1,d9_ordinal1),
    [definition,axiom,file(ordinal1,d9_ordinal1)]).

fof(d9_xboole_0,axiom,(
    ! [A,B] : 
      ( r3_xboole_0(A,B)
    <=> ( r1_tarski(A,B)
        | r1_tarski(B,A) ) ) ),
    file(xboole_0,d9_xboole_0),
    [definition,axiom,file(xboole_0,d9_xboole_0)]).

fof(de_c1_3_1_1_1_1__ordinal1,axiom,(
    c1_3_1_1_1_1__ordinal1 = c5_3__ordinal1 ),
    file(ordinal1,c1_3_1_1_1_1__ordinal1),
    [definition,axiom,file(ordinal1,c1_3_1_1_1_1__ordinal1)]).

fof(de_c1_3_1_1_1_2__ordinal1,axiom,(
    c1_3_1_1_1_2__ordinal1 = c1_3__ordinal1 ),
    file(ordinal1,c1_3_1_1_1_2__ordinal1),
    [definition,axiom,file(ordinal1,c1_3_1_1_1_2__ordinal1)]).

fof(de_c1_3_1_1_1_3__ordinal1,axiom,(
    c1_3_1_1_1_3__ordinal1 = c2_3__ordinal1 ),
    file(ordinal1,c1_3_1_1_1_3__ordinal1),
    [definition,axiom,file(ordinal1,c1_3_1_1_1_3__ordinal1)]).

fof(de_c1_3_1_1_1_4__ordinal1,axiom,(
    c1_3_1_1_1_4__ordinal1 = c3_3__ordinal1 ),
    file(ordinal1,c1_3_1_1_1_4__ordinal1),
    [definition,axiom,file(ordinal1,c1_3_1_1_1_4__ordinal1)]).

fof(de_c1_3_1_1_1_5__ordinal1,axiom,(
    c1_3_1_1_1_5__ordinal1 = c4_3__ordinal1 ),
    file(ordinal1,c1_3_1_1_1_5__ordinal1),
    [definition,axiom,file(ordinal1,c1_3_1_1_1_5__ordinal1)]).

fof(de_c1_4_1_1_1_1__ordinal1,axiom,(
    c1_4_1_1_1_1__ordinal1 = c6_4__ordinal1 ),
    file(ordinal1,c1_4_1_1_1_1__ordinal1),
    [definition,axiom,file(ordinal1,c1_4_1_1_1_1__ordinal1)]).

fof(de_c1_4_1_1_1_2__ordinal1,axiom,(
    c1_4_1_1_1_2__ordinal1 = c1_4__ordinal1 ),
    file(ordinal1,c1_4_1_1_1_2__ordinal1),
    [definition,axiom,file(ordinal1,c1_4_1_1_1_2__ordinal1)]).

fof(de_c1_4_1_1_1_3__ordinal1,axiom,(
    c1_4_1_1_1_3__ordinal1 = c2_4__ordinal1 ),
    file(ordinal1,c1_4_1_1_1_3__ordinal1),
    [definition,axiom,file(ordinal1,c1_4_1_1_1_3__ordinal1)]).

fof(de_c1_4_1_1_1_4__ordinal1,axiom,(
    c1_4_1_1_1_4__ordinal1 = c3_4__ordinal1 ),
    file(ordinal1,c1_4_1_1_1_4__ordinal1),
    [definition,axiom,file(ordinal1,c1_4_1_1_1_4__ordinal1)]).

fof(de_c1_4_1_1_1_5__ordinal1,axiom,(
    c1_4_1_1_1_5__ordinal1 = c4_4__ordinal1 ),
    file(ordinal1,c1_4_1_1_1_5__ordinal1),
    [definition,axiom,file(ordinal1,c1_4_1_1_1_5__ordinal1)]).

fof(de_c1_4_1_1_1_6__ordinal1,axiom,(
    c1_4_1_1_1_6__ordinal1 = c5_4__ordinal1 ),
    file(ordinal1,c1_4_1_1_1_6__ordinal1),
    [definition,axiom,file(ordinal1,c1_4_1_1_1_6__ordinal1)]).

fof(de_c2_31__ordinal1,axiom,(
    c2_31__ordinal1 = c1_31__ordinal1 ),
    file(ordinal1,c2_31__ordinal1),
    [definition,axiom,file(ordinal1,c2_31__ordinal1)]).

fof(de_c2_41__ordinal1,axiom,(
    c2_41__ordinal1 = k1_ordinal1(k3_tarski(c1_41__ordinal1)) ),
    file(ordinal1,c2_41__ordinal1),
    [definition,axiom,file(ordinal1,c2_41__ordinal1)]).

fof(de_c2_53__ordinal1,axiom,(
    c2_53__ordinal1 = k1_xboole_0 ),
    file(ordinal1,c2_53__ordinal1),
    [definition,axiom,file(ordinal1,c2_53__ordinal1)]).

fof(de_c2_60_5_1__ordinal1,axiom,(
    c2_60_5_1__ordinal1 = c1_60_5_1__ordinal1 ),
    file(ordinal1,c2_60_5_1__ordinal1),
    [definition,axiom,file(ordinal1,c2_60_5_1__ordinal1)]).

fof(de_c2_60__ordinal1,axiom,(
    c2_60__ordinal1 = k3_tarski(c1_60__ordinal1) ),
    file(ordinal1,c2_60__ordinal1),
    [definition,axiom,file(ordinal1,c2_60__ordinal1)]).

fof(de_c3_31_1__ordinal1,axiom,(
    c3_31_1__ordinal1 = c2_31_1__ordinal1 ),
    file(ordinal1,c3_31_1__ordinal1),
    [definition,axiom,file(ordinal1,c3_31_1__ordinal1)]).

fof(de_c3_53__ordinal1,axiom,(
    c3_53__ordinal1 = c2_53__ordinal1 ),
    file(ordinal1,c3_53__ordinal1),
    [definition,axiom,file(ordinal1,c3_53__ordinal1)]).

fof(de_c3_60_1_1__ordinal1,axiom,(
    c3_60_1_1__ordinal1 = c2_60_1_1__ordinal1 ),
    file(ordinal1,c3_60_1_1__ordinal1),
    [definition,axiom,file(ordinal1,c3_60_1_1__ordinal1)]).

fof(de_c3_60_3__ordinal1,axiom,(
    c3_60_3__ordinal1 = c1_60_3__ordinal1 ),
    file(ordinal1,c3_60_3__ordinal1),
    [definition,axiom,file(ordinal1,c3_60_3__ordinal1)]).

fof(de_c3_60_5_1_2_2__ordinal1,axiom,(
    c3_60_5_1_2_2__ordinal1 = c2_60_5_1_2_2__ordinal1 ),
    file(ordinal1,c3_60_5_1_2_2__ordinal1),
    [definition,axiom,file(ordinal1,c3_60_5_1_2_2__ordinal1)]).

fof(de_c4_41__ordinal1,axiom,(
    c4_41__ordinal1 = c3_41__ordinal1 ),
    file(ordinal1,c4_41__ordinal1),
    [definition,axiom,file(ordinal1,c4_41__ordinal1)]).

fof(de_c4_60_2__ordinal1,axiom,(
    c4_60_2__ordinal1 = c1_60_2__ordinal1 ),
    file(ordinal1,c4_60_2__ordinal1),
    [definition,axiom,file(ordinal1,c4_60_2__ordinal1)]).

fof(de_c4_60_5_1_1__ordinal1,axiom,(
    c4_60_5_1_1__ordinal1 = c3_60_5_1_1__ordinal1 ),
    file(ordinal1,c4_60_5_1_1__ordinal1),
    [definition,axiom,file(ordinal1,c4_60_5_1_1__ordinal1)]).

fof(de_c6_60_1__ordinal1,axiom,(
    c6_60_1__ordinal1 = c4_60_1__ordinal1 ),
    file(ordinal1,c6_60_1__ordinal1),
    [definition,axiom,file(ordinal1,c6_60_1__ordinal1)]).

fof(de_c7_31__ordinal1,axiom,(
    c7_31__ordinal1 = c5_31__ordinal1 ),
    file(ordinal1,c7_31__ordinal1),
    [definition,axiom,file(ordinal1,c7_31__ordinal1)]).

fof(de_c7_60_1__ordinal1,axiom,(
    c7_60_1__ordinal1 = c5_60_1__ordinal1 ),
    file(ordinal1,c7_60_1__ordinal1),
    [definition,axiom,file(ordinal1,c7_60_1__ordinal1)]).

fof(de_c8_31__ordinal1,axiom,(
    c8_31__ordinal1 = c6_31__ordinal1 ),
    file(ordinal1,c8_31__ordinal1),
    [definition,axiom,file(ordinal1,c8_31__ordinal1)]).

fof(dh_c1_10,axiom,
    ( ! [A] : 
        ( r2_hidden(c1_10__ordinal1,k1_ordinal1(A))
      <=> ( r2_hidden(c1_10__ordinal1,A)
          | c1_10__ordinal1 = A ) )
   => ! [B,C] : 
        ( r2_hidden(B,k1_ordinal1(C))
      <=> ( r2_hidden(B,C)
          | B = C ) ) ),
    file(ordinal1,c1_10__ordinal1),
    [axiom,axiom,file(ordinal1,c1_10__ordinal1)]).

fof(dh_c1_11,axiom,
    ( c1_11__ordinal1 != k1_ordinal1(c1_11__ordinal1)
   => ! [A] : A != k1_ordinal1(A) ),
    file(ordinal1,c1_11__ordinal1),
    [axiom,axiom,file(ordinal1,c1_11__ordinal1)]).

fof(dh_c1_19,axiom,
    ( ( v3_ordinal1(c1_19__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ! [B] : 
              ( v1_ordinal1(B)
             => ( ( r2_hidden(B,c1_19__ordinal1)
                  & r2_hidden(c1_19__ordinal1,A) )
               => r2_hidden(B,A) ) ) ) )
   => ! [C] : 
        ( v3_ordinal1(C)
       => ! [D] : 
            ( v3_ordinal1(D)
           => ! [E] : 
                ( v1_ordinal1(E)
               => ( ( r2_hidden(E,C)
                    & r2_hidden(C,D) )
                 => r2_hidden(E,D) ) ) ) ) ),
    file(ordinal1,c1_19__ordinal1),
    [axiom,axiom,file(ordinal1,c1_19__ordinal1)]).

fof(dh_c1_1,axiom,
    ( ! [A,B] : 
        ~ ( r2_hidden(c1_1__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,c1_1__ordinal1) )
   => ! [C,D,E] : 
        ~ ( r2_hidden(C,D)
          & r2_hidden(D,E)
          & r2_hidden(E,C) ) ),
    file(ordinal1,c1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_1__ordinal1)]).

fof(dh_c1_20_2,axiom,
    ( ( r2_hidden(c1_20_2__ordinal1,c4_20__ordinal1)
     => r2_hidden(c1_20_2__ordinal1,c1_20__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,c4_20__ordinal1)
       => r2_hidden(A,c1_20__ordinal1) ) ),
    file(ordinal1,c1_20_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_20_2__ordinal1)]).

fof(dh_c1_20_3,axiom,
    ( ( r2_hidden(c1_20_3__ordinal1,c1_20__ordinal1)
     => r2_hidden(c1_20_3__ordinal1,c4_20__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,c1_20__ordinal1)
       => r2_hidden(A,c4_20__ordinal1) ) ),
    file(ordinal1,c1_20_3__ordinal1),
    [axiom,axiom,file(ordinal1,c1_20_3__ordinal1)]).

fof(dh_c1_20,axiom,
    ( ( v1_ordinal1(c1_20__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ( r2_xboole_0(c1_20__ordinal1,A)
           => r2_hidden(c1_20__ordinal1,A) ) ) )
   => ! [B] : 
        ( v1_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ( r2_xboole_0(B,C)
             => r2_hidden(B,C) ) ) ) ),
    file(ordinal1,c1_20__ordinal1),
    [axiom,axiom,file(ordinal1,c1_20__ordinal1)]).

fof(dh_c1_21,axiom,
    ( ( v1_ordinal1(c1_21__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ! [B] : 
              ( v3_ordinal1(B)
             => ( ( r1_tarski(c1_21__ordinal1,A)
                  & r2_hidden(A,B) )
               => r2_hidden(c1_21__ordinal1,B) ) ) ) )
   => ! [C] : 
        ( v1_ordinal1(C)
       => ! [D] : 
            ( v3_ordinal1(D)
           => ! [E] : 
                ( v3_ordinal1(E)
               => ( ( r1_tarski(C,D)
                    & r2_hidden(D,E) )
                 => r2_hidden(C,E) ) ) ) ) ),
    file(ordinal1,c1_21__ordinal1),
    [axiom,axiom,file(ordinal1,c1_21__ordinal1)]).

fof(dh_c1_22_1,axiom,
    ( ( r2_hidden(c1_22_1__ordinal1,c1_22__ordinal1)
     => r1_tarski(c1_22_1__ordinal1,c1_22__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,c1_22__ordinal1)
       => r1_tarski(A,c1_22__ordinal1) ) ),
    file(ordinal1,c1_22_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_22_1__ordinal1)]).

fof(dh_c1_22,axiom,
    ( ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(c1_22__ordinal1,A)
         => v3_ordinal1(c1_22__ordinal1) ) )
   => ! [B,C] : 
        ( v3_ordinal1(C)
       => ( r2_hidden(B,C)
         => v3_ordinal1(B) ) ) ),
    file(ordinal1,c1_22__ordinal1),
    [axiom,axiom,file(ordinal1,c1_22__ordinal1)]).

fof(dh_c1_23_1,axiom,
    ( ( r2_hidden(c1_23_1__ordinal1,c4_23__ordinal1)
     => r2_hidden(c1_23_1__ordinal1,c2_23__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,c4_23__ordinal1)
       => r2_hidden(A,c2_23__ordinal1) ) ),
    file(ordinal1,c1_23_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_23_1__ordinal1)]).

fof(dh_c1_23,axiom,
    ( ( v3_ordinal1(c1_23__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ~ ( ~ r2_hidden(c1_23__ordinal1,A)
              & c1_23__ordinal1 != A
              & ~ r2_hidden(A,c1_23__ordinal1) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ~ ( ~ r2_hidden(B,C)
                & B != C
                & ~ r2_hidden(C,B) ) ) ) ),
    file(ordinal1,c1_23__ordinal1),
    [axiom,axiom,file(ordinal1,c1_23__ordinal1)]).

fof(dh_c1_25,axiom,
    ( ( v3_ordinal1(c1_25__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => r3_xboole_0(c1_25__ordinal1,A) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => r3_xboole_0(B,C) ) ) ),
    file(ordinal1,c1_25__ordinal1),
    [axiom,axiom,file(ordinal1,c1_25__ordinal1)]).

fof(dh_c1_26,axiom,
    ( ( v3_ordinal1(c1_26__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ( r1_ordinal1(c1_26__ordinal1,A)
            | r2_hidden(A,c1_26__ordinal1) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ( r1_ordinal1(B,C)
              | r2_hidden(C,B) ) ) ) ),
    file(ordinal1,c1_26__ordinal1),
    [axiom,axiom,file(ordinal1,c1_26__ordinal1)]).

fof(dh_c1_2,axiom,
    ( ! [A,B,C] : 
        ~ ( r2_hidden(c1_2__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_2__ordinal1) )
   => ! [D,E,F,G] : 
        ~ ( r2_hidden(D,E)
          & r2_hidden(E,F)
          & r2_hidden(F,G)
          & r2_hidden(G,D) ) ),
    file(ordinal1,c1_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_2__ordinal1)]).

fof(dh_c1_30_1,axiom,
    ( ~ ( r2_hidden(c1_30_1__ordinal1,k1_ordinal1(c1_30__ordinal1))
        & ~ r2_hidden(c1_30_1__ordinal1,c1_30__ordinal1)
        & c1_30_1__ordinal1 != c1_30__ordinal1 )
   => ! [A] : 
        ~ ( r2_hidden(A,k1_ordinal1(c1_30__ordinal1))
          & ~ r2_hidden(A,c1_30__ordinal1)
          & A != c1_30__ordinal1 ) ),
    file(ordinal1,c1_30_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_30_1__ordinal1)]).

fof(dh_c1_30_2,axiom,
    ( ( r2_hidden(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1))
     => r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) )
   => ! [A] : 
        ( r2_hidden(A,k1_ordinal1(c1_30__ordinal1))
       => r1_tarski(A,k1_ordinal1(c1_30__ordinal1)) ) ),
    file(ordinal1,c1_30_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_30_2__ordinal1)]).

fof(dh_c1_30_3,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
          & r2_hidden(c2_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
          & ~ r2_hidden(c1_30_3__ordinal1,c2_30_3__ordinal1)
          & c1_30_3__ordinal1 != c2_30_3__ordinal1
          & ~ r2_hidden(c2_30_3__ordinal1,c1_30_3__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(B,k1_ordinal1(c1_30__ordinal1))
          & r2_hidden(c2_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
          & ~ r2_hidden(B,c2_30_3__ordinal1)
          & B != c2_30_3__ordinal1
          & ~ r2_hidden(c2_30_3__ordinal1,B) ) ),
    file(ordinal1,c1_30_3__ordinal1),
    [axiom,axiom,file(ordinal1,c1_30_3__ordinal1)]).

fof(dh_c1_30,axiom,
    ( ( v3_ordinal1(c1_30__ordinal1)
     => v3_ordinal1(k1_ordinal1(c1_30__ordinal1)) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => v3_ordinal1(k1_ordinal1(A)) ) ),
    file(ordinal1,c1_30__ordinal1),
    [axiom,axiom,file(ordinal1,c1_30__ordinal1)]).

fof(dh_c1_31_1,axiom,
    ( ( r2_hidden(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1))
     => r1_tarski(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1)) )
   => ! [A] : 
        ( r2_hidden(A,k3_tarski(c1_31__ordinal1))
       => r1_tarski(A,k3_tarski(c1_31__ordinal1)) ) ),
    file(ordinal1,c1_31_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_31_1__ordinal1)]).

fof(dh_c1_3_1,axiom,
    ( ~ ( r2_hidden(c1_3_1__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
        & ! [A] : 
            ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
              & r2_hidden(A,c1_3_1__ordinal1) ) )
   => ! [B] : 
        ~ ( r2_hidden(B,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
          & ! [C] : 
              ~ ( r2_hidden(C,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
                & r2_hidden(C,B) ) ) ),
    file(ordinal1,c1_3_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_3_1__ordinal1)]).

fof(dh_c1_31,axiom,
    ( ( v3_ordinal1(c1_31__ordinal1)
     => v3_ordinal1(k3_tarski(c1_31__ordinal1)) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => v3_ordinal1(k3_tarski(A)) ) ),
    file(ordinal1,c1_31__ordinal1),
    [axiom,axiom,file(ordinal1,c1_31__ordinal1)]).

fof(dh_c1_34_1,axiom,
    ( ( r2_hidden(c1_34_1__ordinal1,c1_34__ordinal1)
     => r1_tarski(c1_34_1__ordinal1,c1_34__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,c1_34__ordinal1)
       => r1_tarski(A,c1_34__ordinal1) ) ),
    file(ordinal1,c1_34_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_34_1__ordinal1)]).

fof(dh_c1_34,axiom,
    ( ( ! [A] : 
          ( r2_hidden(A,c1_34__ordinal1)
         => ( v3_ordinal1(A)
            & r1_tarski(A,c1_34__ordinal1) ) )
     => v3_ordinal1(c1_34__ordinal1) )
   => ! [B] : 
        ( ! [C] : 
            ( r2_hidden(C,B)
           => ( v3_ordinal1(C)
              & r1_tarski(C,B) ) )
       => v3_ordinal1(B) ) ),
    file(ordinal1,c1_34__ordinal1),
    [axiom,axiom,file(ordinal1,c1_34__ordinal1)]).

fof(dh_c1_35,axiom,
    ( ! [A] : 
        ( v3_ordinal1(A)
       => ~ ( r1_tarski(c1_35__ordinal1,A)
            & c1_35__ordinal1 != k1_xboole_0
            & ! [B] : 
                ( v3_ordinal1(B)
               => ~ ( r2_hidden(B,c1_35__ordinal1)
                    & ! [C] : 
                        ( v3_ordinal1(C)
                       => ( r2_hidden(C,c1_35__ordinal1)
                         => r1_ordinal1(B,C) ) ) ) ) ) )
   => ! [D,E] : 
        ( v3_ordinal1(E)
       => ~ ( r1_tarski(D,E)
            & D != k1_xboole_0
            & ! [F] : 
                ( v3_ordinal1(F)
               => ~ ( r2_hidden(F,D)
                    & ! [G] : 
                        ( v3_ordinal1(G)
                       => ( r2_hidden(G,D)
                         => r1_ordinal1(F,G) ) ) ) ) ) ) ),
    file(ordinal1,c1_35__ordinal1),
    [axiom,axiom,file(ordinal1,c1_35__ordinal1)]).

fof(dh_c1_36,axiom,
    ( ( v3_ordinal1(c1_36__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ( r2_hidden(c1_36__ordinal1,A)
          <=> r1_ordinal1(k1_ordinal1(c1_36__ordinal1),A) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ( r2_hidden(B,C)
            <=> r1_ordinal1(k1_ordinal1(B),C) ) ) ) ),
    file(ordinal1,c1_36__ordinal1),
    [axiom,axiom,file(ordinal1,c1_36__ordinal1)]).

fof(dh_c1_37,axiom,
    ( ( v3_ordinal1(c1_37__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ( r2_hidden(c1_37__ordinal1,k1_ordinal1(A))
          <=> r1_ordinal1(c1_37__ordinal1,A) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ( r2_hidden(B,k1_ordinal1(C))
            <=> r1_ordinal1(B,C) ) ) ) ),
    file(ordinal1,c1_37__ordinal1),
    [axiom,axiom,file(ordinal1,c1_37__ordinal1)]).

fof(dh_c1_3,axiom,
    ( ! [A,B,C,D] : 
        ~ ( r2_hidden(c1_3__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,C)
          & r2_hidden(C,D)
          & r2_hidden(D,c1_3__ordinal1) )
   => ! [E,F,G,H,I] : 
        ~ ( r2_hidden(E,F)
          & r2_hidden(F,G)
          & r2_hidden(G,H)
          & r2_hidden(H,I)
          & r2_hidden(I,E) ) ),
    file(ordinal1,c1_3__ordinal1),
    [axiom,axiom,file(ordinal1,c1_3__ordinal1)]).

fof(dh_c1_40_1,axiom,
    ( ( r2_hidden(c1_40_1__ordinal1,k3_tarski(c1_40__ordinal1))
     => r1_tarski(c1_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) )
   => ! [A] : 
        ( r2_hidden(A,k3_tarski(c1_40__ordinal1))
       => r1_tarski(A,k3_tarski(c1_40__ordinal1)) ) ),
    file(ordinal1,c1_40_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_40_1__ordinal1)]).

fof(dh_c1_40,axiom,
    ( ( ! [A] : 
          ( r2_hidden(A,c1_40__ordinal1)
         => v3_ordinal1(A) )
     => v3_ordinal1(k3_tarski(c1_40__ordinal1)) )
   => ! [B] : 
        ( ! [C] : 
            ( r2_hidden(C,B)
           => v3_ordinal1(C) )
       => v3_ordinal1(k3_tarski(B)) ) ),
    file(ordinal1,c1_40__ordinal1),
    [axiom,axiom,file(ordinal1,c1_40__ordinal1)]).

fof(dh_c1_41,axiom,
    ( ~ ( ! [A] : 
            ( r2_hidden(A,c1_41__ordinal1)
           => v3_ordinal1(A) )
        & ! [A] : 
            ( v3_ordinal1(A)
           => ~ r1_tarski(c1_41__ordinal1,A) ) )
   => ! [B] : 
        ~ ( ! [C] : 
              ( r2_hidden(C,B)
             => v3_ordinal1(C) )
          & ! [C] : 
              ( v3_ordinal1(C)
             => ~ r1_tarski(B,C) ) ) ),
    file(ordinal1,c1_41__ordinal1),
    [axiom,axiom,file(ordinal1,c1_41__ordinal1)]).

fof(dh_c1_4_1,axiom,
    ( ~ ( r2_hidden(c1_4_1__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
        & ! [A] : 
            ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
              & r2_hidden(A,c1_4_1__ordinal1) ) )
   => ! [B] : 
        ~ ( r2_hidden(B,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
          & ! [C] : 
              ~ ( r2_hidden(C,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
                & r2_hidden(C,B) ) ) ),
    file(ordinal1,c1_4_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_4_1__ordinal1)]).

fof(dh_c1_42_1_1,axiom,
    ( ~ ( r2_hidden(c1_42_1_1__ordinal1,c1_42_1__ordinal1)
        & ~ r2_hidden(c1_42_1_1__ordinal1,c1_42__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(A,c1_42_1__ordinal1)
          & ~ r2_hidden(A,c1_42__ordinal1) ) ),
    file(ordinal1,c1_42_1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_42_1_1__ordinal1)]).

fof(dh_c1_42_1,axiom,
    ( ( r2_hidden(c1_42_1__ordinal1,c1_42__ordinal1)
     => r1_tarski(c1_42_1__ordinal1,c1_42__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,c1_42__ordinal1)
       => r1_tarski(A,c1_42__ordinal1) ) ),
    file(ordinal1,c1_42_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_42_1__ordinal1)]).

fof(dh_c1_42_2,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_42_2__ordinal1,c1_42__ordinal1)
          & r2_hidden(A,c1_42__ordinal1)
          & ~ r2_hidden(c1_42_2__ordinal1,A)
          & c1_42_2__ordinal1 != A
          & ~ r2_hidden(A,c1_42_2__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(B,c1_42__ordinal1)
          & r2_hidden(C,c1_42__ordinal1)
          & ~ r2_hidden(B,C)
          & B != C
          & ~ r2_hidden(C,B) ) ),
    file(ordinal1,c1_42_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_42_2__ordinal1)]).

fof(dh_c1_42,axiom,
    ( ? [A] : 
      ! [B] : 
        ( r2_hidden(B,A)
      <=> v3_ordinal1(B) )
   => ! [C] : 
        ( r2_hidden(C,c1_42__ordinal1)
      <=> v3_ordinal1(C) ) ),
    file(ordinal1,c1_42__ordinal1),
    [axiom,axiom,file(ordinal1,c1_42__ordinal1)]).

fof(dh_c1_43_1,axiom,
    ( ( v3_ordinal1(c1_43_1__ordinal1)
     => r2_hidden(c1_43_1__ordinal1,c2_43__ordinal1) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => r2_hidden(A,c2_43__ordinal1) ) ),
    file(ordinal1,c1_43_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_43_1__ordinal1)]).

fof(dh_c1_43,axiom,
    ( ? [A] : 
      ! [B] : 
        ( v3_ordinal1(B)
       => r2_hidden(B,A) )
   => ! [C] : 
        ( v3_ordinal1(C)
       => r2_hidden(C,c1_43__ordinal1) ) ),
    file(ordinal1,c1_43__ordinal1),
    [axiom,axiom,file(ordinal1,c1_43__ordinal1)]).

fof(dh_c1_44,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & ~ r2_hidden(A,c1_44__ordinal1)
        & ! [B] : 
            ( v3_ordinal1(B)
           => ( ~ r2_hidden(B,c1_44__ordinal1)
             => r1_ordinal1(A,B) ) ) )
   => ! [C] : 
      ? [D] : 
        ( v3_ordinal1(D)
        & ~ r2_hidden(D,C)
        & ! [E] : 
            ( v3_ordinal1(E)
           => ( ~ r2_hidden(E,C)
             => r1_ordinal1(D,E) ) ) ) ),
    file(ordinal1,c1_44__ordinal1),
    [axiom,axiom,file(ordinal1,c1_44__ordinal1)]).

fof(dh_c1_47_1,axiom,
    ( ( v3_ordinal1(c1_47_1__ordinal1)
     => ( r2_hidden(c1_47_1__ordinal1,c1_47__ordinal1)
       => r2_hidden(k1_ordinal1(c1_47_1__ordinal1),c1_47__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c1_47__ordinal1)
         => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) ) ),
    file(ordinal1,c1_47_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_47_1__ordinal1)]).

fof(dh_c1_47_2,axiom,
    ( ( r2_hidden(c1_47_2__ordinal1,c1_47__ordinal1)
     => r2_hidden(c1_47_2__ordinal1,k3_tarski(c1_47__ordinal1)) )
   => ! [A] : 
        ( r2_hidden(A,c1_47__ordinal1)
       => r2_hidden(A,k3_tarski(c1_47__ordinal1)) ) ),
    file(ordinal1,c1_47_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_47_2__ordinal1)]).

fof(dh_c1_47_3,axiom,
    ( ( r2_hidden(c1_47_3__ordinal1,k3_tarski(c1_47__ordinal1))
     => r2_hidden(c1_47_3__ordinal1,c1_47__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,k3_tarski(c1_47__ordinal1))
       => r2_hidden(A,c1_47__ordinal1) ) ),
    file(ordinal1,c1_47_3__ordinal1),
    [axiom,axiom,file(ordinal1,c1_47_3__ordinal1)]).

fof(dh_c1_47,axiom,
    ( ( v3_ordinal1(c1_47__ordinal1)
     => ( v4_ordinal1(c1_47__ordinal1)
      <=> ! [A] : 
            ( v3_ordinal1(A)
           => ( r2_hidden(A,c1_47__ordinal1)
             => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ( v4_ordinal1(B)
        <=> ! [C] : 
              ( v3_ordinal1(C)
             => ( r2_hidden(C,B)
               => r2_hidden(k1_ordinal1(C),B) ) ) ) ) ),
    file(ordinal1,c1_47__ordinal1),
    [axiom,axiom,file(ordinal1,c1_47__ordinal1)]).

fof(dh_c1_48_1,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & r2_hidden(A,c1_48__ordinal1)
        & ~ r2_hidden(k1_ordinal1(A),c1_48__ordinal1) )
   => ( v3_ordinal1(c1_48_1__ordinal1)
      & r2_hidden(c1_48_1__ordinal1,c1_48__ordinal1)
      & ~ r2_hidden(k1_ordinal1(c1_48_1__ordinal1),c1_48__ordinal1) ) ),
    file(ordinal1,c1_48_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_48_1__ordinal1)]).

fof(dh_c1_48,axiom,
    ( ( v3_ordinal1(c1_48__ordinal1)
     => ( ~ ( ~ v4_ordinal1(c1_48__ordinal1)
            & ! [A] : 
                ( v3_ordinal1(A)
               => c1_48__ordinal1 != k1_ordinal1(A) ) )
        & ~ ( ? [A] : 
                ( v3_ordinal1(A)
                & c1_48__ordinal1 = k1_ordinal1(A) )
            & v4_ordinal1(c1_48__ordinal1) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ( ~ ( ~ v4_ordinal1(B)
              & ! [C] : 
                  ( v3_ordinal1(C)
                 => B != k1_ordinal1(C) ) )
          & ~ ( ? [C] : 
                  ( v3_ordinal1(C)
                  & B = k1_ordinal1(C) )
              & v4_ordinal1(B) ) ) ) ),
    file(ordinal1,c1_48__ordinal1),
    [axiom,axiom,file(ordinal1,c1_48__ordinal1)]).

fof(dh_c1_4,axiom,
    ( ! [A,B,C,D,E] : 
        ~ ( r2_hidden(c1_4__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,C)
          & r2_hidden(C,D)
          & r2_hidden(D,E)
          & r2_hidden(E,c1_4__ordinal1) )
   => ! [F,G,H,I,J,K] : 
        ~ ( r2_hidden(F,G)
          & r2_hidden(G,H)
          & r2_hidden(H,I)
          & r2_hidden(I,J)
          & r2_hidden(J,K)
          & r2_hidden(K,F) ) ),
    file(ordinal1,c1_4__ordinal1),
    [axiom,axiom,file(ordinal1,c1_4__ordinal1)]).

fof(dh_c1_53_1,axiom,
    ( ? [A] : m1_subset_1(A,k1_relat_1(c2_53__ordinal1))
   => m1_subset_1(c1_53_1__ordinal1,k1_relat_1(c2_53__ordinal1)) ),
    file(ordinal1,c1_53_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_53_1__ordinal1)]).

fof(dh_c1_53,axiom,
    ( m1_ordinal1(k1_xboole_0,c1_53__ordinal1)
   => ! [A] : m1_ordinal1(k1_xboole_0,A) ),
    file(ordinal1,c1_53__ordinal1),
    [axiom,axiom,file(ordinal1,c1_53__ordinal1)]).

fof(dh_c1_54,axiom,
    ( ( ( v1_relat_1(c1_54__ordinal1)
        & v1_funct_1(c1_54__ordinal1) )
     => ( v3_ordinal1(k1_relat_1(c1_54__ordinal1))
       => m1_ordinal1(c1_54__ordinal1,k2_relat_1(c1_54__ordinal1)) ) )
   => ! [A] : 
        ( ( v1_relat_1(A)
          & v1_funct_1(A) )
       => ( v3_ordinal1(k1_relat_1(A))
         => m1_ordinal1(A,k2_relat_1(A)) ) ) ),
    file(ordinal1,c1_54__ordinal1),
    [axiom,axiom,file(ordinal1,c1_54__ordinal1)]).

fof(dh_c1_56,axiom,
    ( ! [A] : 
        ( r1_tarski(c1_56__ordinal1,A)
       => ! [B] : 
            ( m1_ordinal1(B,c1_56__ordinal1)
           => m1_ordinal1(B,A) ) )
   => ! [C,D] : 
        ( r1_tarski(C,D)
       => ! [E] : 
            ( m1_ordinal1(E,C)
           => m1_ordinal1(E,D) ) ) ),
    file(ordinal1,c1_56__ordinal1),
    [axiom,axiom,file(ordinal1,c1_56__ordinal1)]).

fof(dh_c1_58,axiom,
    ( ! [A] : 
        ( m1_ordinal1(A,c1_58__ordinal1)
       => ! [B] : 
            ( v3_ordinal1(B)
           => m1_ordinal1(k2_ordinal1(A,B),c1_58__ordinal1) ) )
   => ! [C,D] : 
        ( m1_ordinal1(D,C)
       => ! [E] : 
            ( v3_ordinal1(E)
           => m1_ordinal1(k2_ordinal1(D,E),C) ) ) ),
    file(ordinal1,c1_58__ordinal1),
    [axiom,axiom,file(ordinal1,c1_58__ordinal1)]).

fof(dh_c1_5,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_5__ordinal1,A)
          & r1_tarski(A,c1_5__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(B,C)
          & r1_tarski(C,B) ) ),
    file(ordinal1,c1_5__ordinal1),
    [axiom,axiom,file(ordinal1,c1_5__ordinal1)]).

fof(dh_c1_60_1_1,axiom,
    ( ~ ( r2_hidden(c1_60_1_1__ordinal1,k3_tarski(c1_60__ordinal1))
        & ! [A,B] : k4_tarski(A,B) != c1_60_1_1__ordinal1 )
   => ! [C] : 
        ~ ( r2_hidden(C,k3_tarski(c1_60__ordinal1))
          & ! [D,E] : k4_tarski(D,E) != C ) ),
    file(ordinal1,c1_60_1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_1_1__ordinal1)]).

fof(dh_c1_60_1,axiom,
    ( ! [A,B] : 
        ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,A),k3_tarski(c1_60__ordinal1))
          & r2_hidden(k4_tarski(c1_60_1__ordinal1,B),k3_tarski(c1_60__ordinal1))
          & A != B )
   => ! [C,D,E] : 
        ~ ( r2_hidden(k4_tarski(C,D),k3_tarski(c1_60__ordinal1))
          & r2_hidden(k4_tarski(C,E),k3_tarski(c1_60__ordinal1))
          & D != E ) ),
    file(ordinal1,c1_60_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_1__ordinal1)]).

fof(dh_c1_60_2,axiom,
    ( ! [A,B] : 
        ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [C] : 
              ( ( v1_relat_1(C)
                & v1_funct_1(C)
                & v5_ordinal1(C) )
             => ( C = c1_60_2__ordinal1
               => k1_relat_1(C) = A ) )
          & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [C] : 
              ( ( v1_relat_1(C)
                & v1_funct_1(C)
                & v5_ordinal1(C) )
             => ( C = c1_60_2__ordinal1
               => k1_relat_1(C) = B ) ) )
       => A = B )
   => ! [D,E,F] : 
        ( ( r2_hidden(D,c1_60__ordinal1)
          & ! [G] : 
              ( ( v1_relat_1(G)
                & v1_funct_1(G)
                & v5_ordinal1(G) )
             => ( G = D
               => k1_relat_1(G) = E ) )
          & r2_hidden(D,c1_60__ordinal1)
          & ! [G] : 
              ( ( v1_relat_1(G)
                & v1_funct_1(G)
                & v5_ordinal1(G) )
             => ( G = D
               => k1_relat_1(G) = F ) ) )
       => E = F ) ),
    file(ordinal1,c1_60_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_2__ordinal1)]).

fof(dh_c1_60_3,axiom,
    ( ! [A] : 
        ( r2_hidden(k4_tarski(c1_60_3__ordinal1,A),c3_60__ordinal1)
       => v3_ordinal1(A) )
   => ! [B,C] : 
        ( r2_hidden(k4_tarski(B,C),c3_60__ordinal1)
       => v3_ordinal1(C) ) ),
    file(ordinal1,c1_60_3__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_3__ordinal1)]).

fof(dh_c1_60_4,axiom,
    ( ( r2_hidden(c1_60_4__ordinal1,k2_relat_1(c3_60__ordinal1))
     => v3_ordinal1(c1_60_4__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,k2_relat_1(c3_60__ordinal1))
       => v3_ordinal1(A) ) ),
    file(ordinal1,c1_60_4__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_4__ordinal1)]).

fof(dh_c1_60_5_1_1,axiom,
    ( ( r2_hidden(c1_60_5_1_1__ordinal1,k1_relat_1(c2_60__ordinal1))
     => r2_hidden(c1_60_5_1_1__ordinal1,c5_60__ordinal1) )
   => ! [A] : 
        ( r2_hidden(A,k1_relat_1(c2_60__ordinal1))
       => r2_hidden(A,c5_60__ordinal1) ) ),
    file(ordinal1,c1_60_5_1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_5_1_1__ordinal1)]).

fof(dh_c1_60_5_1_2_1,axiom,
    ( ( ( v1_relat_1(c1_60_5_1_2_1__ordinal1)
        & v1_funct_1(c1_60_5_1_2_1__ordinal1)
        & v5_ordinal1(c1_60_5_1_2_1__ordinal1) )
     => ( r2_hidden(c1_60_5_1_2_1__ordinal1,c1_60__ordinal1)
       => r1_ordinal1(k1_relat_1(c1_60_5_1_2_1__ordinal1),c2_60_5_1__ordinal1) ) )
   => ! [A] : 
        ( ( v1_relat_1(A)
          & v1_funct_1(A)
          & v5_ordinal1(A) )
       => ( r2_hidden(A,c1_60__ordinal1)
         => r1_ordinal1(k1_relat_1(A),c2_60_5_1__ordinal1) ) ) ),
    file(ordinal1,c1_60_5_1_2_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_5_1_2_1__ordinal1)]).

fof(dh_c1_60_5_1_2_2,axiom,
    ( ( v3_ordinal1(c1_60_5_1_2_2__ordinal1)
     => ( r2_hidden(c1_60_5_1_2_2__ordinal1,k2_relat_1(c3_60__ordinal1))
       => r1_ordinal1(c1_60_5_1_2_2__ordinal1,c2_60_5_1__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,k2_relat_1(c3_60__ordinal1))
         => r1_ordinal1(A,c2_60_5_1__ordinal1) ) ) ),
    file(ordinal1,c1_60_5_1_2_2__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_5_1_2_2__ordinal1)]).

fof(dh_c1_60_5_1,axiom,
    ( ~ ( r2_hidden(c1_60_5_1__ordinal1,c5_60__ordinal1)
        & ~ r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(c2_60__ordinal1)) )
   => ! [A] : 
        ~ ( r2_hidden(A,c5_60__ordinal1)
          & ~ r2_hidden(A,k1_relat_1(c2_60__ordinal1)) ) ),
    file(ordinal1,c1_60_5_1__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60_5_1__ordinal1)]).

fof(dh_c1_60,axiom,
    ( ( ( ! [A] : 
            ( r2_hidden(A,c1_60__ordinal1)
           => ( v1_relat_1(A)
              & v1_funct_1(A)
              & v5_ordinal1(A) ) )
        & v6_ordinal1(c1_60__ordinal1) )
     => ( v1_relat_1(k3_tarski(c1_60__ordinal1))
        & v1_funct_1(k3_tarski(c1_60__ordinal1))
        & v5_ordinal1(k3_tarski(c1_60__ordinal1)) ) )
   => ! [B] : 
        ( ( ! [C] : 
              ( r2_hidden(C,B)
             => ( v1_relat_1(C)
                & v1_funct_1(C)
                & v5_ordinal1(C) ) )
          & v6_ordinal1(B) )
       => ( v1_relat_1(k3_tarski(B))
          & v1_funct_1(k3_tarski(B))
          & v5_ordinal1(k3_tarski(B)) ) ) ),
    file(ordinal1,c1_60__ordinal1),
    [axiom,axiom,file(ordinal1,c1_60__ordinal1)]).

fof(dh_c1_64,axiom,
    ( ( v3_ordinal1(c1_64__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ~ ( ~ r2_xboole_0(c1_64__ordinal1,A)
              & c1_64__ordinal1 != A
              & ~ r2_xboole_0(A,c1_64__ordinal1) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ~ ( ~ r2_xboole_0(B,C)
                & B != C
                & ~ r2_xboole_0(C,B) ) ) ) ),
    file(ordinal1,c1_64__ordinal1),
    [axiom,axiom,file(ordinal1,c1_64__ordinal1)]).

fof(dh_c1_8,axiom,
    ( r2_hidden(c1_8__ordinal1,k1_ordinal1(c1_8__ordinal1))
   => ! [A] : r2_hidden(A,k1_ordinal1(A)) ),
    file(ordinal1,c1_8__ordinal1),
    [axiom,axiom,file(ordinal1,c1_8__ordinal1)]).

fof(dh_c1_9,axiom,
    ( ! [A] : 
        ( k1_ordinal1(c1_9__ordinal1) = k1_ordinal1(A)
       => c1_9__ordinal1 = A )
   => ! [B,C] : 
        ( k1_ordinal1(B) = k1_ordinal1(C)
       => B = C ) ),
    file(ordinal1,c1_9__ordinal1),
    [axiom,axiom,file(ordinal1,c1_9__ordinal1)]).

fof(dh_c2_10,axiom,
    ( ( r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1))
    <=> ( r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
        | c1_10__ordinal1 = c2_10__ordinal1 ) )
   => ! [A] : 
        ( r2_hidden(c1_10__ordinal1,k1_ordinal1(A))
      <=> ( r2_hidden(c1_10__ordinal1,A)
          | c1_10__ordinal1 = A ) ) ),
    file(ordinal1,c2_10__ordinal1),
    [axiom,axiom,file(ordinal1,c2_10__ordinal1)]).

fof(dh_c2_19,axiom,
    ( ( v3_ordinal1(c2_19__ordinal1)
     => ! [A] : 
          ( v1_ordinal1(A)
         => ( ( r2_hidden(A,c1_19__ordinal1)
              & r2_hidden(c1_19__ordinal1,c2_19__ordinal1) )
           => r2_hidden(A,c2_19__ordinal1) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v1_ordinal1(C)
           => ( ( r2_hidden(C,c1_19__ordinal1)
                & r2_hidden(c1_19__ordinal1,B) )
             => r2_hidden(C,B) ) ) ) ),
    file(ordinal1,c2_19__ordinal1),
    [axiom,axiom,file(ordinal1,c2_19__ordinal1)]).

fof(dh_c2_1,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_1__ordinal1,c2_1__ordinal1)
          & r2_hidden(c2_1__ordinal1,A)
          & r2_hidden(A,c1_1__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(c1_1__ordinal1,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_1__ordinal1) ) ),
    file(ordinal1,c2_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_1__ordinal1)]).

fof(dh_c2_20_3,axiom,
    ( ? [A] : 
        ( A = c1_20_3__ordinal1
        & r2_hidden(A,c1_20__ordinal1) )
   => ( c2_20_3__ordinal1 = c1_20_3__ordinal1
      & r2_hidden(c2_20_3__ordinal1,c1_20__ordinal1) ) ),
    file(ordinal1,c2_20_3__ordinal1),
    [axiom,axiom,file(ordinal1,c2_20_3__ordinal1)]).

fof(dh_c2_20,axiom,
    ( ( v3_ordinal1(c2_20__ordinal1)
     => ( r2_xboole_0(c1_20__ordinal1,c2_20__ordinal1)
       => r2_hidden(c1_20__ordinal1,c2_20__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_xboole_0(c1_20__ordinal1,A)
         => r2_hidden(c1_20__ordinal1,A) ) ) ),
    file(ordinal1,c2_20__ordinal1),
    [axiom,axiom,file(ordinal1,c2_20__ordinal1)]).

fof(dh_c2_21,axiom,
    ( ( v3_ordinal1(c2_21__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => ( ( r1_tarski(c1_21__ordinal1,c2_21__ordinal1)
              & r2_hidden(c2_21__ordinal1,A) )
           => r2_hidden(c1_21__ordinal1,A) ) ) )
   => ! [B] : 
        ( v3_ordinal1(B)
       => ! [C] : 
            ( v3_ordinal1(C)
           => ( ( r1_tarski(c1_21__ordinal1,B)
                & r2_hidden(B,C) )
             => r2_hidden(c1_21__ordinal1,C) ) ) ) ),
    file(ordinal1,c2_21__ordinal1),
    [axiom,axiom,file(ordinal1,c2_21__ordinal1)]).

fof(dh_c2_22_1,axiom,
    ( ? [A] : 
        ( r2_hidden(A,c1_22_1__ordinal1)
        & ~ r2_hidden(A,c1_22__ordinal1) )
   => ( r2_hidden(c2_22_1__ordinal1,c1_22_1__ordinal1)
      & ~ r2_hidden(c2_22_1__ordinal1,c1_22__ordinal1) ) ),
    file(ordinal1,c2_22_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_22_1__ordinal1)]).

fof(dh_c2_22,axiom,
    ( ( v3_ordinal1(c2_22__ordinal1)
     => ( r2_hidden(c1_22__ordinal1,c2_22__ordinal1)
       => v3_ordinal1(c1_22__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(c1_22__ordinal1,A)
         => v3_ordinal1(c1_22__ordinal1) ) ) ),
    file(ordinal1,c2_22__ordinal1),
    [axiom,axiom,file(ordinal1,c2_22__ordinal1)]).

fof(dh_c2_23,axiom,
    ( ( v3_ordinal1(c2_23__ordinal1)
     => ~ ( ~ r2_hidden(c1_23__ordinal1,c2_23__ordinal1)
          & c1_23__ordinal1 != c2_23__ordinal1
          & ~ r2_hidden(c2_23__ordinal1,c1_23__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ~ ( ~ r2_hidden(c1_23__ordinal1,A)
            & c1_23__ordinal1 != A
            & ~ r2_hidden(A,c1_23__ordinal1) ) ) ),
    file(ordinal1,c2_23__ordinal1),
    [axiom,axiom,file(ordinal1,c2_23__ordinal1)]).

fof(dh_c2_25,axiom,
    ( ( v3_ordinal1(c2_25__ordinal1)
     => r3_xboole_0(c1_25__ordinal1,c2_25__ordinal1) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => r3_xboole_0(c1_25__ordinal1,A) ) ),
    file(ordinal1,c2_25__ordinal1),
    [axiom,axiom,file(ordinal1,c2_25__ordinal1)]).

fof(dh_c2_26,axiom,
    ( ( v3_ordinal1(c2_26__ordinal1)
     => ( r1_ordinal1(c1_26__ordinal1,c2_26__ordinal1)
        | r2_hidden(c2_26__ordinal1,c1_26__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r1_ordinal1(c1_26__ordinal1,A)
          | r2_hidden(A,c1_26__ordinal1) ) ) ),
    file(ordinal1,c2_26__ordinal1),
    [axiom,axiom,file(ordinal1,c2_26__ordinal1)]).

fof(dh_c2_2,axiom,
    ( ! [A,B] : 
        ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
          & r2_hidden(c2_2__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,c1_2__ordinal1) )
   => ! [C,D,E] : 
        ~ ( r2_hidden(c1_2__ordinal1,C)
          & r2_hidden(C,D)
          & r2_hidden(D,E)
          & r2_hidden(E,c1_2__ordinal1) ) ),
    file(ordinal1,c2_2__ordinal1),
    [axiom,axiom,file(ordinal1,c2_2__ordinal1)]).

fof(dh_c2_30_3,axiom,
    ( ~ ( r2_hidden(c1_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
        & r2_hidden(c2_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
        & ~ r2_hidden(c1_30_3__ordinal1,c2_30_3__ordinal1)
        & c1_30_3__ordinal1 != c2_30_3__ordinal1
        & ~ r2_hidden(c2_30_3__ordinal1,c1_30_3__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
          & r2_hidden(A,k1_ordinal1(c1_30__ordinal1))
          & ~ r2_hidden(c1_30_3__ordinal1,A)
          & c1_30_3__ordinal1 != A
          & ~ r2_hidden(A,c1_30_3__ordinal1) ) ),
    file(ordinal1,c2_30_3__ordinal1),
    [axiom,axiom,file(ordinal1,c2_30_3__ordinal1)]).

fof(dh_c2_31_1,axiom,
    ( ? [A] : 
        ( r2_hidden(c1_31_1__ordinal1,A)
        & r2_hidden(A,c1_31__ordinal1) )
   => ( r2_hidden(c1_31_1__ordinal1,c2_31_1__ordinal1)
      & r2_hidden(c2_31_1__ordinal1,c1_31__ordinal1) ) ),
    file(ordinal1,c2_31_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_31_1__ordinal1)]).

fof(dh_c2_34,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c2_34__ordinal1,c1_34__ordinal1)
          & r2_hidden(A,c1_34__ordinal1)
          & ~ r2_hidden(c2_34__ordinal1,A)
          & c2_34__ordinal1 != A
          & ~ r2_hidden(A,c2_34__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(B,c1_34__ordinal1)
          & r2_hidden(C,c1_34__ordinal1)
          & ~ r2_hidden(B,C)
          & B != C
          & ~ r2_hidden(C,B) ) ),
    file(ordinal1,c2_34__ordinal1),
    [axiom,axiom,file(ordinal1,c2_34__ordinal1)]).

fof(dh_c2_35,axiom,
    ( ( v3_ordinal1(c2_35__ordinal1)
     => ~ ( r1_tarski(c1_35__ordinal1,c2_35__ordinal1)
          & c1_35__ordinal1 != k1_xboole_0
          & ! [A] : 
              ( v3_ordinal1(A)
             => ~ ( r2_hidden(A,c1_35__ordinal1)
                  & ! [B] : 
                      ( v3_ordinal1(B)
                     => ( r2_hidden(B,c1_35__ordinal1)
                       => r1_ordinal1(A,B) ) ) ) ) ) )
   => ! [C] : 
        ( v3_ordinal1(C)
       => ~ ( r1_tarski(c1_35__ordinal1,C)
            & c1_35__ordinal1 != k1_xboole_0
            & ! [D] : 
                ( v3_ordinal1(D)
               => ~ ( r2_hidden(D,c1_35__ordinal1)
                    & ! [E] : 
                        ( v3_ordinal1(E)
                       => ( r2_hidden(E,c1_35__ordinal1)
                         => r1_ordinal1(D,E) ) ) ) ) ) ) ),
    file(ordinal1,c2_35__ordinal1),
    [axiom,axiom,file(ordinal1,c2_35__ordinal1)]).

fof(dh_c2_36,axiom,
    ( ( v3_ordinal1(c2_36__ordinal1)
     => ( r2_hidden(c1_36__ordinal1,c2_36__ordinal1)
      <=> r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(c1_36__ordinal1,A)
        <=> r1_ordinal1(k1_ordinal1(c1_36__ordinal1),A) ) ) ),
    file(ordinal1,c2_36__ordinal1),
    [axiom,axiom,file(ordinal1,c2_36__ordinal1)]).

fof(dh_c2_37,axiom,
    ( ( v3_ordinal1(c2_37__ordinal1)
     => ( r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1))
      <=> r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(c1_37__ordinal1,k1_ordinal1(A))
        <=> r1_ordinal1(c1_37__ordinal1,A) ) ) ),
    file(ordinal1,c2_37__ordinal1),
    [axiom,axiom,file(ordinal1,c2_37__ordinal1)]).

fof(dh_c2_3,axiom,
    ( ! [A,B,C] : 
        ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
          & r2_hidden(c2_3__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_3__ordinal1) )
   => ! [D,E,F,G] : 
        ~ ( r2_hidden(c1_3__ordinal1,D)
          & r2_hidden(D,E)
          & r2_hidden(E,F)
          & r2_hidden(F,G)
          & r2_hidden(G,c1_3__ordinal1) ) ),
    file(ordinal1,c2_3__ordinal1),
    [axiom,axiom,file(ordinal1,c2_3__ordinal1)]).

fof(dh_c2_40_1,axiom,
    ( ? [A] : 
        ( r2_hidden(c1_40_1__ordinal1,A)
        & r2_hidden(A,c1_40__ordinal1) )
   => ( r2_hidden(c1_40_1__ordinal1,c2_40_1__ordinal1)
      & r2_hidden(c2_40_1__ordinal1,c1_40__ordinal1) ) ),
    file(ordinal1,c2_40_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_40_1__ordinal1)]).

fof(dh_c2_40,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c2_40__ordinal1,k3_tarski(c1_40__ordinal1))
          & r2_hidden(A,k3_tarski(c1_40__ordinal1))
          & ~ r2_hidden(c2_40__ordinal1,A)
          & c2_40__ordinal1 != A
          & ~ r2_hidden(A,c2_40__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(B,k3_tarski(c1_40__ordinal1))
          & r2_hidden(C,k3_tarski(c1_40__ordinal1))
          & ~ r2_hidden(B,C)
          & B != C
          & ~ r2_hidden(C,B) ) ),
    file(ordinal1,c2_40__ordinal1),
    [axiom,axiom,file(ordinal1,c2_40__ordinal1)]).

fof(dh_c2_42_2,axiom,
    ( ~ ( r2_hidden(c1_42_2__ordinal1,c1_42__ordinal1)
        & r2_hidden(c2_42_2__ordinal1,c1_42__ordinal1)
        & ~ r2_hidden(c1_42_2__ordinal1,c2_42_2__ordinal1)
        & c1_42_2__ordinal1 != c2_42_2__ordinal1
        & ~ r2_hidden(c2_42_2__ordinal1,c1_42_2__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_42_2__ordinal1,c1_42__ordinal1)
          & r2_hidden(A,c1_42__ordinal1)
          & ~ r2_hidden(c1_42_2__ordinal1,A)
          & c1_42_2__ordinal1 != A
          & ~ r2_hidden(A,c1_42_2__ordinal1) ) ),
    file(ordinal1,c2_42_2__ordinal1),
    [axiom,axiom,file(ordinal1,c2_42_2__ordinal1)]).

fof(dh_c2_43,axiom,
    ( ? [A] : 
      ! [B] : 
        ( r2_hidden(B,A)
      <=> ( r2_hidden(B,c1_43__ordinal1)
          & v3_ordinal1(B) ) )
   => ! [C] : 
        ( r2_hidden(C,c2_43__ordinal1)
      <=> ( r2_hidden(C,c1_43__ordinal1)
          & v3_ordinal1(C) ) ) ),
    file(ordinal1,c2_43__ordinal1),
    [axiom,axiom,file(ordinal1,c2_43__ordinal1)]).

fof(dh_c2_44,axiom,
    ( ~ ! [A] : 
          ( v3_ordinal1(A)
         => r2_hidden(A,c1_44__ordinal1) )
   => ( v3_ordinal1(c2_44__ordinal1)
      & ~ r2_hidden(c2_44__ordinal1,c1_44__ordinal1) ) ),
    file(ordinal1,c2_44__ordinal1),
    [axiom,axiom,file(ordinal1,c2_44__ordinal1)]).

fof(dh_c2_47_1,axiom,
    ( ? [A] : 
        ( r2_hidden(c1_47_1__ordinal1,A)
        & r2_hidden(A,c1_47__ordinal1) )
   => ( r2_hidden(c1_47_1__ordinal1,c2_47_1__ordinal1)
      & r2_hidden(c2_47_1__ordinal1,c1_47__ordinal1) ) ),
    file(ordinal1,c2_47_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_47_1__ordinal1)]).

fof(dh_c2_47_3,axiom,
    ( ? [A] : 
        ( r2_hidden(c1_47_3__ordinal1,A)
        & r2_hidden(A,c1_47__ordinal1) )
   => ( r2_hidden(c1_47_3__ordinal1,c2_47_3__ordinal1)
      & r2_hidden(c2_47_3__ordinal1,c1_47__ordinal1) ) ),
    file(ordinal1,c2_47_3__ordinal1),
    [axiom,axiom,file(ordinal1,c2_47_3__ordinal1)]).

fof(dh_c2_48,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & c1_48__ordinal1 = k1_ordinal1(A) )
   => ( v3_ordinal1(c2_48__ordinal1)
      & c1_48__ordinal1 = k1_ordinal1(c2_48__ordinal1) ) ),
    file(ordinal1,c2_48__ordinal1),
    [axiom,axiom,file(ordinal1,c2_48__ordinal1)]).

fof(dh_c2_4,axiom,
    ( ! [A,B,C,D] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,C)
          & r2_hidden(C,D)
          & r2_hidden(D,c1_4__ordinal1) )
   => ! [E,F,G,H,I] : 
        ~ ( r2_hidden(c1_4__ordinal1,E)
          & r2_hidden(E,F)
          & r2_hidden(F,G)
          & r2_hidden(G,H)
          & r2_hidden(H,I)
          & r2_hidden(I,c1_4__ordinal1) ) ),
    file(ordinal1,c2_4__ordinal1),
    [axiom,axiom,file(ordinal1,c2_4__ordinal1)]).

fof(dh_c2_56,axiom,
    ( ( r1_tarski(c1_56__ordinal1,c2_56__ordinal1)
     => ! [A] : 
          ( m1_ordinal1(A,c1_56__ordinal1)
         => m1_ordinal1(A,c2_56__ordinal1) ) )
   => ! [B] : 
        ( r1_tarski(c1_56__ordinal1,B)
       => ! [C] : 
            ( m1_ordinal1(C,c1_56__ordinal1)
           => m1_ordinal1(C,B) ) ) ),
    file(ordinal1,c2_56__ordinal1),
    [axiom,axiom,file(ordinal1,c2_56__ordinal1)]).

fof(dh_c2_58,axiom,
    ( ( m1_ordinal1(c2_58__ordinal1,c1_58__ordinal1)
     => ! [A] : 
          ( v3_ordinal1(A)
         => m1_ordinal1(k2_ordinal1(c2_58__ordinal1,A),c1_58__ordinal1) ) )
   => ! [B] : 
        ( m1_ordinal1(B,c1_58__ordinal1)
       => ! [C] : 
            ( v3_ordinal1(C)
           => m1_ordinal1(k2_ordinal1(B,C),c1_58__ordinal1) ) ) ),
    file(ordinal1,c2_58__ordinal1),
    [axiom,axiom,file(ordinal1,c2_58__ordinal1)]).

fof(dh_c2_5,axiom,
    ( ~ ( r2_hidden(c1_5__ordinal1,c2_5__ordinal1)
        & r1_tarski(c2_5__ordinal1,c1_5__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_5__ordinal1,A)
          & r1_tarski(A,c1_5__ordinal1) ) ),
    file(ordinal1,c2_5__ordinal1),
    [axiom,axiom,file(ordinal1,c2_5__ordinal1)]).

fof(dh_c2_60_1_1,axiom,
    ( ? [A] : 
        ( r2_hidden(c1_60_1_1__ordinal1,A)
        & r2_hidden(A,c1_60__ordinal1) )
   => ( r2_hidden(c1_60_1_1__ordinal1,c2_60_1_1__ordinal1)
      & r2_hidden(c2_60_1_1__ordinal1,c1_60__ordinal1) ) ),
    file(ordinal1,c2_60_1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_1_1__ordinal1)]).

fof(dh_c2_60_1,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
          & r2_hidden(k4_tarski(c1_60_1__ordinal1,A),k3_tarski(c1_60__ordinal1))
          & c2_60_1__ordinal1 != A )
   => ! [B,C] : 
        ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,B),k3_tarski(c1_60__ordinal1))
          & r2_hidden(k4_tarski(c1_60_1__ordinal1,C),k3_tarski(c1_60__ordinal1))
          & B != C ) ),
    file(ordinal1,c2_60_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_1__ordinal1)]).

fof(dh_c2_60_2,axiom,
    ( ! [A] : 
        ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [B] : 
              ( ( v1_relat_1(B)
                & v1_funct_1(B)
                & v5_ordinal1(B) )
             => ( B = c1_60_2__ordinal1
               => k1_relat_1(B) = c2_60_2__ordinal1 ) )
          & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [B] : 
              ( ( v1_relat_1(B)
                & v1_funct_1(B)
                & v5_ordinal1(B) )
             => ( B = c1_60_2__ordinal1
               => k1_relat_1(B) = A ) ) )
       => c2_60_2__ordinal1 = A )
   => ! [C,D] : 
        ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [E] : 
              ( ( v1_relat_1(E)
                & v1_funct_1(E)
                & v5_ordinal1(E) )
             => ( E = c1_60_2__ordinal1
               => k1_relat_1(E) = C ) )
          & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [E] : 
              ( ( v1_relat_1(E)
                & v1_funct_1(E)
                & v5_ordinal1(E) )
             => ( E = c1_60_2__ordinal1
               => k1_relat_1(E) = D ) ) )
       => C = D ) ),
    file(ordinal1,c2_60_2__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_2__ordinal1)]).

fof(dh_c2_60_3,axiom,
    ( ( r2_hidden(k4_tarski(c1_60_3__ordinal1,c2_60_3__ordinal1),c3_60__ordinal1)
     => v3_ordinal1(c2_60_3__ordinal1) )
   => ! [A] : 
        ( r2_hidden(k4_tarski(c1_60_3__ordinal1,A),c3_60__ordinal1)
       => v3_ordinal1(A) ) ),
    file(ordinal1,c2_60_3__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_3__ordinal1)]).

fof(dh_c2_60_4,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k1_relat_1(c3_60__ordinal1))
        & c1_60_4__ordinal1 = k1_funct_1(c3_60__ordinal1,A) )
   => ( r2_hidden(c2_60_4__ordinal1,k1_relat_1(c3_60__ordinal1))
      & c1_60_4__ordinal1 = k1_funct_1(c3_60__ordinal1,c2_60_4__ordinal1) ) ),
    file(ordinal1,c2_60_4__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_4__ordinal1)]).

fof(dh_c2_60_5_1_1,axiom,
    ( ? [A] : r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,A),c2_60__ordinal1)
   => r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,c2_60_5_1_1__ordinal1),c2_60__ordinal1) ),
    file(ordinal1,c2_60_5_1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_5_1_1__ordinal1)]).

fof(dh_c2_60_5_1_2_2,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k1_relat_1(c3_60__ordinal1))
        & c1_60_5_1_2_2__ordinal1 = k1_funct_1(c3_60__ordinal1,A) )
   => ( r2_hidden(c2_60_5_1_2_2__ordinal1,k1_relat_1(c3_60__ordinal1))
      & c1_60_5_1_2_2__ordinal1 = k1_funct_1(c3_60__ordinal1,c2_60_5_1_2_2__ordinal1) ) ),
    file(ordinal1,c2_60_5_1_2_2__ordinal1),
    [axiom,axiom,file(ordinal1,c2_60_5_1_2_2__ordinal1)]).

fof(dh_c2_64,axiom,
    ( ( v3_ordinal1(c2_64__ordinal1)
     => ~ ( ~ r2_xboole_0(c1_64__ordinal1,c2_64__ordinal1)
          & c1_64__ordinal1 != c2_64__ordinal1
          & ~ r2_xboole_0(c2_64__ordinal1,c1_64__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ~ ( ~ r2_xboole_0(c1_64__ordinal1,A)
            & c1_64__ordinal1 != A
            & ~ r2_xboole_0(A,c1_64__ordinal1) ) ) ),
    file(ordinal1,c2_64__ordinal1),
    [axiom,axiom,file(ordinal1,c2_64__ordinal1)]).

fof(dh_c2_9,axiom,
    ( ( k1_ordinal1(c1_9__ordinal1) = k1_ordinal1(c2_9__ordinal1)
     => c1_9__ordinal1 = c2_9__ordinal1 )
   => ! [A] : 
        ( k1_ordinal1(c1_9__ordinal1) = k1_ordinal1(A)
       => c1_9__ordinal1 = A ) ),
    file(ordinal1,c2_9__ordinal1),
    [axiom,axiom,file(ordinal1,c2_9__ordinal1)]).

fof(dh_c3_19,axiom,
    ( ( v1_ordinal1(c3_19__ordinal1)
     => ( ( r2_hidden(c3_19__ordinal1,c1_19__ordinal1)
          & r2_hidden(c1_19__ordinal1,c2_19__ordinal1) )
       => r2_hidden(c3_19__ordinal1,c2_19__ordinal1) ) )
   => ! [A] : 
        ( v1_ordinal1(A)
       => ( ( r2_hidden(A,c1_19__ordinal1)
            & r2_hidden(c1_19__ordinal1,c2_19__ordinal1) )
         => r2_hidden(A,c2_19__ordinal1) ) ) ),
    file(ordinal1,c3_19__ordinal1),
    [axiom,axiom,file(ordinal1,c3_19__ordinal1)]).

fof(dh_c3_1,axiom,
    ( ~ ( r2_hidden(c1_1__ordinal1,c2_1__ordinal1)
        & r2_hidden(c2_1__ordinal1,c3_1__ordinal1)
        & r2_hidden(c3_1__ordinal1,c1_1__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_1__ordinal1,c2_1__ordinal1)
          & r2_hidden(c2_1__ordinal1,A)
          & r2_hidden(A,c1_1__ordinal1) ) ),
    file(ordinal1,c3_1__ordinal1),
    [axiom,axiom,file(ordinal1,c3_1__ordinal1)]).

fof(dh_c3_20,axiom,
    ( ? [A] : m1_subset_1(A,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
   => m1_subset_1(c3_20__ordinal1,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1)) ),
    file(ordinal1,c3_20__ordinal1),
    [axiom,axiom,file(ordinal1,c3_20__ordinal1)]).

fof(dh_c3_21,axiom,
    ( ( v3_ordinal1(c3_21__ordinal1)
     => ( ( r1_tarski(c1_21__ordinal1,c2_21__ordinal1)
          & r2_hidden(c2_21__ordinal1,c3_21__ordinal1) )
       => r2_hidden(c1_21__ordinal1,c3_21__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( ( r1_tarski(c1_21__ordinal1,c2_21__ordinal1)
            & r2_hidden(c2_21__ordinal1,A) )
         => r2_hidden(c1_21__ordinal1,A) ) ) ),
    file(ordinal1,c3_21__ordinal1),
    [axiom,axiom,file(ordinal1,c3_21__ordinal1)]).

fof(dh_c3_22_1,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
              & r2_hidden(B,A) ) )
   => ( r2_hidden(c3_22_1__ordinal1,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
      & ! [C] : 
          ~ ( r2_hidden(C,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
            & r2_hidden(C,c3_22_1__ordinal1) ) ) ),
    file(ordinal1,c3_22_1__ordinal1),
    [axiom,axiom,file(ordinal1,c3_22_1__ordinal1)]).

fof(dh_c3_23,axiom,
    ( ? [A] : 
        ( r2_hidden(A,c1_23__ordinal1)
        & ~ r2_hidden(A,c2_23__ordinal1) )
   => ( r2_hidden(c3_23__ordinal1,c1_23__ordinal1)
      & ~ r2_hidden(c3_23__ordinal1,c2_23__ordinal1) ) ),
    file(ordinal1,c3_23__ordinal1),
    [axiom,axiom,file(ordinal1,c3_23__ordinal1)]).

fof(dh_c3_2,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
          & r2_hidden(c2_2__ordinal1,c3_2__ordinal1)
          & r2_hidden(c3_2__ordinal1,A)
          & r2_hidden(A,c1_2__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
          & r2_hidden(c2_2__ordinal1,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_2__ordinal1) ) ),
    file(ordinal1,c3_2__ordinal1),
    [axiom,axiom,file(ordinal1,c3_2__ordinal1)]).

fof(dh_c3_31,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c3_31__ordinal1,k3_tarski(c1_31__ordinal1))
          & r2_hidden(A,k3_tarski(c1_31__ordinal1))
          & ~ r2_hidden(c3_31__ordinal1,A)
          & c3_31__ordinal1 != A
          & ~ r2_hidden(A,c3_31__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(B,k3_tarski(c1_31__ordinal1))
          & r2_hidden(C,k3_tarski(c1_31__ordinal1))
          & ~ r2_hidden(B,C)
          & B != C
          & ~ r2_hidden(C,B) ) ),
    file(ordinal1,c3_31__ordinal1),
    [axiom,axiom,file(ordinal1,c3_31__ordinal1)]).

fof(dh_c3_34,axiom,
    ( ~ ( r2_hidden(c2_34__ordinal1,c1_34__ordinal1)
        & r2_hidden(c3_34__ordinal1,c1_34__ordinal1)
        & ~ r2_hidden(c2_34__ordinal1,c3_34__ordinal1)
        & c2_34__ordinal1 != c3_34__ordinal1
        & ~ r2_hidden(c3_34__ordinal1,c2_34__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c2_34__ordinal1,c1_34__ordinal1)
          & r2_hidden(A,c1_34__ordinal1)
          & ~ r2_hidden(c2_34__ordinal1,A)
          & c2_34__ordinal1 != A
          & ~ r2_hidden(A,c2_34__ordinal1) ) ),
    file(ordinal1,c3_34__ordinal1),
    [axiom,axiom,file(ordinal1,c3_34__ordinal1)]).

fof(dh_c3_35,axiom,
    ( ? [A] : m1_subset_1(A,c1_35__ordinal1)
   => m1_subset_1(c3_35__ordinal1,c1_35__ordinal1) ),
    file(ordinal1,c3_35__ordinal1),
    [axiom,axiom,file(ordinal1,c3_35__ordinal1)]).

fof(dh_c3_3,axiom,
    ( ! [A,B] : 
        ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
          & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
          & r2_hidden(c3_3__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,c1_3__ordinal1) )
   => ! [C,D,E] : 
        ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
          & r2_hidden(c2_3__ordinal1,C)
          & r2_hidden(C,D)
          & r2_hidden(D,E)
          & r2_hidden(E,c1_3__ordinal1) ) ),
    file(ordinal1,c3_3__ordinal1),
    [axiom,axiom,file(ordinal1,c3_3__ordinal1)]).

fof(dh_c3_40_1,axiom,
    ( ~ ( r2_hidden(c3_40_1__ordinal1,c1_40_1__ordinal1)
        & ~ r2_hidden(c3_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) )
   => ! [A] : 
        ~ ( r2_hidden(A,c1_40_1__ordinal1)
          & ~ r2_hidden(A,k3_tarski(c1_40__ordinal1)) ) ),
    file(ordinal1,c3_40_1__ordinal1),
    [axiom,axiom,file(ordinal1,c3_40_1__ordinal1)]).

fof(dh_c3_40,axiom,
    ( ~ ( r2_hidden(c2_40__ordinal1,k3_tarski(c1_40__ordinal1))
        & r2_hidden(c3_40__ordinal1,k3_tarski(c1_40__ordinal1))
        & ~ r2_hidden(c2_40__ordinal1,c3_40__ordinal1)
        & c2_40__ordinal1 != c3_40__ordinal1
        & ~ r2_hidden(c3_40__ordinal1,c2_40__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c2_40__ordinal1,k3_tarski(c1_40__ordinal1))
          & r2_hidden(A,k3_tarski(c1_40__ordinal1))
          & ~ r2_hidden(c2_40__ordinal1,A)
          & c2_40__ordinal1 != A
          & ~ r2_hidden(A,c2_40__ordinal1) ) ),
    file(ordinal1,c3_40__ordinal1),
    [axiom,axiom,file(ordinal1,c3_40__ordinal1)]).

fof(dh_c3_41,axiom,
    ( ~ ( r2_hidden(c3_41__ordinal1,c1_41__ordinal1)
        & ~ r2_hidden(c3_41__ordinal1,c2_41__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(A,c1_41__ordinal1)
          & ~ r2_hidden(A,c2_41__ordinal1) ) ),
    file(ordinal1,c3_41__ordinal1),
    [axiom,axiom,file(ordinal1,c3_41__ordinal1)]).

fof(dh_c3_44,axiom,
    ( ? [A] : 
      ! [B] : 
        ( r2_hidden(B,A)
      <=> ( r2_hidden(B,k1_ordinal1(c2_44__ordinal1))
          & ~ r2_hidden(B,c1_44__ordinal1) ) )
   => ! [C] : 
        ( r2_hidden(C,c3_44__ordinal1)
      <=> ( r2_hidden(C,k1_ordinal1(c2_44__ordinal1))
          & ~ r2_hidden(C,c1_44__ordinal1) ) ) ),
    file(ordinal1,c3_44__ordinal1),
    [axiom,axiom,file(ordinal1,c3_44__ordinal1)]).

fof(dh_c3_4,axiom,
    ( ! [A,B,C] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
          & r2_hidden(c3_4__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_4__ordinal1) )
   => ! [D,E,F,G] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,D)
          & r2_hidden(D,E)
          & r2_hidden(E,F)
          & r2_hidden(F,G)
          & r2_hidden(G,c1_4__ordinal1) ) ),
    file(ordinal1,c3_4__ordinal1),
    [axiom,axiom,file(ordinal1,c3_4__ordinal1)]).

fof(dh_c3_56,axiom,
    ( ( m1_ordinal1(c3_56__ordinal1,c1_56__ordinal1)
     => m1_ordinal1(c3_56__ordinal1,c2_56__ordinal1) )
   => ! [A] : 
        ( m1_ordinal1(A,c1_56__ordinal1)
       => m1_ordinal1(A,c2_56__ordinal1) ) ),
    file(ordinal1,c3_56__ordinal1),
    [axiom,axiom,file(ordinal1,c3_56__ordinal1)]).

fof(dh_c3_58,axiom,
    ( ( v3_ordinal1(c3_58__ordinal1)
     => m1_ordinal1(k2_ordinal1(c2_58__ordinal1,c3_58__ordinal1),c1_58__ordinal1) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => m1_ordinal1(k2_ordinal1(c2_58__ordinal1,A),c1_58__ordinal1) ) ),
    file(ordinal1,c3_58__ordinal1),
    [axiom,axiom,file(ordinal1,c3_58__ordinal1)]).

fof(dh_c3_60_1,axiom,
    ( ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
        & r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
        & c2_60_1__ordinal1 != c3_60_1__ordinal1 )
   => ! [A] : 
        ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
          & r2_hidden(k4_tarski(c1_60_1__ordinal1,A),k3_tarski(c1_60__ordinal1))
          & c2_60_1__ordinal1 != A ) ),
    file(ordinal1,c3_60_1__ordinal1),
    [axiom,axiom,file(ordinal1,c3_60_1__ordinal1)]).

fof(dh_c3_60_2,axiom,
    ( ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
        & ! [A] : 
            ( ( v1_relat_1(A)
              & v1_funct_1(A)
              & v5_ordinal1(A) )
           => ( A = c1_60_2__ordinal1
             => k1_relat_1(A) = c2_60_2__ordinal1 ) )
        & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
        & ! [A] : 
            ( ( v1_relat_1(A)
              & v1_funct_1(A)
              & v5_ordinal1(A) )
           => ( A = c1_60_2__ordinal1
             => k1_relat_1(A) = c3_60_2__ordinal1 ) ) )
     => c2_60_2__ordinal1 = c3_60_2__ordinal1 )
   => ! [B] : 
        ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [C] : 
              ( ( v1_relat_1(C)
                & v1_funct_1(C)
                & v5_ordinal1(C) )
             => ( C = c1_60_2__ordinal1
               => k1_relat_1(C) = c2_60_2__ordinal1 ) )
          & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
          & ! [C] : 
              ( ( v1_relat_1(C)
                & v1_funct_1(C)
                & v5_ordinal1(C) )
             => ( C = c1_60_2__ordinal1
               => k1_relat_1(C) = B ) ) )
       => c2_60_2__ordinal1 = B ) ),
    file(ordinal1,c3_60_2__ordinal1),
    [axiom,axiom,file(ordinal1,c3_60_2__ordinal1)]).

fof(dh_c3_60_5_1_1,axiom,
    ( ? [A] : 
        ( r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,c2_60_5_1_1__ordinal1),A)
        & r2_hidden(A,c1_60__ordinal1) )
   => ( r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,c2_60_5_1_1__ordinal1),c3_60_5_1_1__ordinal1)
      & r2_hidden(c3_60_5_1_1__ordinal1,c1_60__ordinal1) ) ),
    file(ordinal1,c3_60_5_1_1__ordinal1),
    [axiom,axiom,file(ordinal1,c3_60_5_1_1__ordinal1)]).

fof(dh_c3_60_5_1,axiom,
    ( ? [A] : 
        ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A)
        & r2_hidden(A,c1_60__ordinal1)
        & r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(A)) )
   => ( v1_relat_1(c3_60_5_1__ordinal1)
      & v1_funct_1(c3_60_5_1__ordinal1)
      & v5_ordinal1(c3_60_5_1__ordinal1)
      & r2_hidden(c3_60_5_1__ordinal1,c1_60__ordinal1)
      & r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(c3_60_5_1__ordinal1)) ) ),
    file(ordinal1,c3_60_5_1__ordinal1),
    [axiom,axiom,file(ordinal1,c3_60_5_1__ordinal1)]).

fof(dh_c3_60,axiom,
    ( ? [A] : 
        ( v1_relat_1(A)
        & v1_funct_1(A)
        & ! [B,C] : 
            ( r2_hidden(k4_tarski(B,C),A)
          <=> ( r2_hidden(B,c1_60__ordinal1)
              & r2_hidden(B,c1_60__ordinal1)
              & ! [D] : 
                  ( ( v1_relat_1(D)
                    & v1_funct_1(D)
                    & v5_ordinal1(D) )
                 => ( D = B
                   => k1_relat_1(D) = C ) ) ) ) )
   => ( v1_relat_1(c3_60__ordinal1)
      & v1_funct_1(c3_60__ordinal1)
      & ! [E,F] : 
          ( r2_hidden(k4_tarski(E,F),c3_60__ordinal1)
        <=> ( r2_hidden(E,c1_60__ordinal1)
            & r2_hidden(E,c1_60__ordinal1)
            & ! [G] : 
                ( ( v1_relat_1(G)
                  & v1_funct_1(G)
                  & v5_ordinal1(G) )
               => ( G = E
                 => k1_relat_1(G) = F ) ) ) ) ) ),
    file(ordinal1,c3_60__ordinal1),
    [axiom,axiom,file(ordinal1,c3_60__ordinal1)]).

fof(dh_c4_1,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
              & r2_hidden(B,A) ) )
   => ( r2_hidden(c4_1__ordinal1,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
      & ! [C] : 
          ~ ( r2_hidden(C,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
            & r2_hidden(C,c4_1__ordinal1) ) ) ),
    file(ordinal1,c4_1__ordinal1),
    [axiom,axiom,file(ordinal1,c4_1__ordinal1)]).

fof(dh_c4_20,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
              & r2_hidden(B,A) ) )
   => ( r2_hidden(c4_20__ordinal1,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
      & ! [C] : 
          ~ ( r2_hidden(C,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
            & r2_hidden(C,c4_20__ordinal1) ) ) ),
    file(ordinal1,c4_20__ordinal1),
    [axiom,axiom,file(ordinal1,c4_20__ordinal1)]).

fof(dh_c4_23,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
              & r2_hidden(B,A) ) )
   => ( r2_hidden(c4_23__ordinal1,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
      & ! [C] : 
          ~ ( r2_hidden(C,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
            & r2_hidden(C,c4_23__ordinal1) ) ) ),
    file(ordinal1,c4_23__ordinal1),
    [axiom,axiom,file(ordinal1,c4_23__ordinal1)]).

fof(dh_c4_2,axiom,
    ( ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
        & r2_hidden(c2_2__ordinal1,c3_2__ordinal1)
        & r2_hidden(c3_2__ordinal1,c4_2__ordinal1)
        & r2_hidden(c4_2__ordinal1,c1_2__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
          & r2_hidden(c2_2__ordinal1,c3_2__ordinal1)
          & r2_hidden(c3_2__ordinal1,A)
          & r2_hidden(A,c1_2__ordinal1) ) ),
    file(ordinal1,c4_2__ordinal1),
    [axiom,axiom,file(ordinal1,c4_2__ordinal1)]).

fof(dh_c4_31,axiom,
    ( ~ ( r2_hidden(c3_31__ordinal1,k3_tarski(c1_31__ordinal1))
        & r2_hidden(c4_31__ordinal1,k3_tarski(c1_31__ordinal1))
        & ~ r2_hidden(c3_31__ordinal1,c4_31__ordinal1)
        & c3_31__ordinal1 != c4_31__ordinal1
        & ~ r2_hidden(c4_31__ordinal1,c3_31__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c3_31__ordinal1,k3_tarski(c1_31__ordinal1))
          & r2_hidden(A,k3_tarski(c1_31__ordinal1))
          & ~ r2_hidden(c3_31__ordinal1,A)
          & c3_31__ordinal1 != A
          & ~ r2_hidden(A,c3_31__ordinal1) ) ),
    file(ordinal1,c4_31__ordinal1),
    [axiom,axiom,file(ordinal1,c4_31__ordinal1)]).

fof(dh_c4_35,axiom,
    ( ? [A] : 
        ( r2_hidden(A,c1_35__ordinal1)
        & ! [B] : 
            ~ ( r2_hidden(B,c1_35__ordinal1)
              & r2_hidden(B,A) ) )
   => ( r2_hidden(c4_35__ordinal1,c1_35__ordinal1)
      & ! [C] : 
          ~ ( r2_hidden(C,c1_35__ordinal1)
            & r2_hidden(C,c4_35__ordinal1) ) ) ),
    file(ordinal1,c4_35__ordinal1),
    [axiom,axiom,file(ordinal1,c4_35__ordinal1)]).

fof(dh_c4_3,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
          & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
          & r2_hidden(c3_3__ordinal1,c4_3__ordinal1)
          & r2_hidden(c4_3__ordinal1,A)
          & r2_hidden(A,c1_3__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
          & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
          & r2_hidden(c3_3__ordinal1,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_3__ordinal1) ) ),
    file(ordinal1,c4_3__ordinal1),
    [axiom,axiom,file(ordinal1,c4_3__ordinal1)]).

fof(dh_c4_40,axiom,
    ( ? [A] : 
        ( r2_hidden(c2_40__ordinal1,A)
        & r2_hidden(A,c1_40__ordinal1) )
   => ( r2_hidden(c2_40__ordinal1,c4_40__ordinal1)
      & r2_hidden(c4_40__ordinal1,c1_40__ordinal1) ) ),
    file(ordinal1,c4_40__ordinal1),
    [axiom,axiom,file(ordinal1,c4_40__ordinal1)]).

fof(dh_c4_44,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & r2_hidden(A,c3_44__ordinal1)
        & ! [B] : 
            ( v3_ordinal1(B)
           => ( r2_hidden(B,c3_44__ordinal1)
             => r1_ordinal1(A,B) ) ) )
   => ( v3_ordinal1(c4_44__ordinal1)
      & r2_hidden(c4_44__ordinal1,c3_44__ordinal1)
      & ! [C] : 
          ( v3_ordinal1(C)
         => ( r2_hidden(C,c3_44__ordinal1)
           => r1_ordinal1(c4_44__ordinal1,C) ) ) ) ),
    file(ordinal1,c4_44__ordinal1),
    [axiom,axiom,file(ordinal1,c4_44__ordinal1)]).

fof(dh_c4_4,axiom,
    ( ! [A,B] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
          & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
          & r2_hidden(c4_4__ordinal1,A)
          & r2_hidden(A,B)
          & r2_hidden(B,c1_4__ordinal1) )
   => ! [C,D,E] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
          & r2_hidden(c3_4__ordinal1,C)
          & r2_hidden(C,D)
          & r2_hidden(D,E)
          & r2_hidden(E,c1_4__ordinal1) ) ),
    file(ordinal1,c4_4__ordinal1),
    [axiom,axiom,file(ordinal1,c4_4__ordinal1)]).

fof(dh_c4_60_1,axiom,
    ( ? [A] : 
        ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),A)
        & r2_hidden(A,c1_60__ordinal1) )
   => ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),c4_60_1__ordinal1)
      & r2_hidden(c4_60_1__ordinal1,c1_60__ordinal1) ) ),
    file(ordinal1,c4_60_1__ordinal1),
    [axiom,axiom,file(ordinal1,c4_60_1__ordinal1)]).

fof(dh_c4_60_5_1,axiom,
    ( ? [A] : r2_hidden(k4_tarski(c1_60_5_1__ordinal1,A),c3_60_5_1__ordinal1)
   => r2_hidden(k4_tarski(c1_60_5_1__ordinal1,c4_60_5_1__ordinal1),c3_60_5_1__ordinal1) ),
    file(ordinal1,c4_60_5_1__ordinal1),
    [axiom,axiom,file(ordinal1,c4_60_5_1__ordinal1)]).

fof(dh_c4_60,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & r1_tarski(k2_relat_1(c3_60__ordinal1),A) )
   => ( v3_ordinal1(c4_60__ordinal1)
      & r1_tarski(k2_relat_1(c3_60__ordinal1),c4_60__ordinal1) ) ),
    file(ordinal1,c4_60__ordinal1),
    [axiom,axiom,file(ordinal1,c4_60__ordinal1)]).

fof(dh_c5_2,axiom,
    ( ? [A] : 
        ( r2_hidden(A,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
              & r2_hidden(B,A) ) )
   => ( r2_hidden(c5_2__ordinal1,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
      & ! [C] : 
          ~ ( r2_hidden(C,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
            & r2_hidden(C,c5_2__ordinal1) ) ) ),
    file(ordinal1,c5_2__ordinal1),
    [axiom,axiom,file(ordinal1,c5_2__ordinal1)]).

fof(dh_c5_31,axiom,
    ( ? [A] : 
        ( r2_hidden(c3_31__ordinal1,A)
        & r2_hidden(A,c1_31__ordinal1) )
   => ( r2_hidden(c3_31__ordinal1,c5_31__ordinal1)
      & r2_hidden(c5_31__ordinal1,c1_31__ordinal1) ) ),
    file(ordinal1,c5_31__ordinal1),
    [axiom,axiom,file(ordinal1,c5_31__ordinal1)]).

fof(dh_c5_35,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & A = c4_35__ordinal1 )
   => ( v3_ordinal1(c5_35__ordinal1)
      & c5_35__ordinal1 = c4_35__ordinal1 ) ),
    file(ordinal1,c5_35__ordinal1),
    [axiom,axiom,file(ordinal1,c5_35__ordinal1)]).

fof(dh_c5_3,axiom,
    ( ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
        & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
        & r2_hidden(c3_3__ordinal1,c4_3__ordinal1)
        & r2_hidden(c4_3__ordinal1,c5_3__ordinal1)
        & r2_hidden(c5_3__ordinal1,c1_3__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
          & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
          & r2_hidden(c3_3__ordinal1,c4_3__ordinal1)
          & r2_hidden(c4_3__ordinal1,A)
          & r2_hidden(A,c1_3__ordinal1) ) ),
    file(ordinal1,c5_3__ordinal1),
    [axiom,axiom,file(ordinal1,c5_3__ordinal1)]).

fof(dh_c5_40,axiom,
    ( ? [A] : 
        ( r2_hidden(c3_40__ordinal1,A)
        & r2_hidden(A,c1_40__ordinal1) )
   => ( r2_hidden(c3_40__ordinal1,c5_40__ordinal1)
      & r2_hidden(c5_40__ordinal1,c1_40__ordinal1) ) ),
    file(ordinal1,c5_40__ordinal1),
    [axiom,axiom,file(ordinal1,c5_40__ordinal1)]).

fof(dh_c5_44,axiom,
    ( ( v3_ordinal1(c5_44__ordinal1)
     => ( ~ r2_hidden(c5_44__ordinal1,c1_44__ordinal1)
       => r1_ordinal1(c4_44__ordinal1,c5_44__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( ~ r2_hidden(A,c1_44__ordinal1)
         => r1_ordinal1(c4_44__ordinal1,A) ) ) ),
    file(ordinal1,c5_44__ordinal1),
    [axiom,axiom,file(ordinal1,c5_44__ordinal1)]).

fof(dh_c5_4,axiom,
    ( ! [A] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
          & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
          & r2_hidden(c4_4__ordinal1,c5_4__ordinal1)
          & r2_hidden(c5_4__ordinal1,A)
          & r2_hidden(A,c1_4__ordinal1) )
   => ! [B,C] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
          & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
          & r2_hidden(c4_4__ordinal1,B)
          & r2_hidden(B,C)
          & r2_hidden(C,c1_4__ordinal1) ) ),
    file(ordinal1,c5_4__ordinal1),
    [axiom,axiom,file(ordinal1,c5_4__ordinal1)]).

fof(dh_c5_60_1,axiom,
    ( ? [A] : 
        ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),A)
        & r2_hidden(A,c1_60__ordinal1) )
   => ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),c5_60_1__ordinal1)
      & r2_hidden(c5_60_1__ordinal1,c1_60__ordinal1) ) ),
    file(ordinal1,c5_60_1__ordinal1),
    [axiom,axiom,file(ordinal1,c5_60_1__ordinal1)]).

fof(dh_c5_60,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & ! [B] : 
            ( v3_ordinal1(B)
           => ( r2_hidden(B,k2_relat_1(c3_60__ordinal1))
             => r1_ordinal1(B,A) ) )
        & ! [B] : 
            ( v3_ordinal1(B)
           => ( ! [C] : 
                  ( v3_ordinal1(C)
                 => ( r2_hidden(C,k2_relat_1(c3_60__ordinal1))
                   => r1_ordinal1(C,B) ) )
             => r1_ordinal1(A,B) ) ) )
   => ( v3_ordinal1(c5_60__ordinal1)
      & ! [D] : 
          ( v3_ordinal1(D)
         => ( r2_hidden(D,k2_relat_1(c3_60__ordinal1))
           => r1_ordinal1(D,c5_60__ordinal1) ) )
      & ! [D] : 
          ( v3_ordinal1(D)
         => ( ! [E] : 
                ( v3_ordinal1(E)
               => ( r2_hidden(E,k2_relat_1(c3_60__ordinal1))
                 => r1_ordinal1(E,D) ) )
           => r1_ordinal1(c5_60__ordinal1,D) ) ) ) ),
    file(ordinal1,c5_60__ordinal1),
    [axiom,axiom,file(ordinal1,c5_60__ordinal1)]).

fof(dh_c6_31,axiom,
    ( ? [A] : 
        ( r2_hidden(c4_31__ordinal1,A)
        & r2_hidden(A,c1_31__ordinal1) )
   => ( r2_hidden(c4_31__ordinal1,c6_31__ordinal1)
      & r2_hidden(c6_31__ordinal1,c1_31__ordinal1) ) ),
    file(ordinal1,c6_31__ordinal1),
    [axiom,axiom,file(ordinal1,c6_31__ordinal1)]).

fof(dh_c6_35,axiom,
    ( ( v3_ordinal1(c6_35__ordinal1)
     => ( r2_hidden(c6_35__ordinal1,c1_35__ordinal1)
       => r1_ordinal1(c5_35__ordinal1,c6_35__ordinal1) ) )
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c1_35__ordinal1)
         => r1_ordinal1(c5_35__ordinal1,A) ) ) ),
    file(ordinal1,c6_35__ordinal1),
    [axiom,axiom,file(ordinal1,c6_35__ordinal1)]).

fof(dh_c6_4,axiom,
    ( ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
        & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
        & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
        & r2_hidden(c4_4__ordinal1,c5_4__ordinal1)
        & r2_hidden(c5_4__ordinal1,c6_4__ordinal1)
        & r2_hidden(c6_4__ordinal1,c1_4__ordinal1) )
   => ! [A] : 
        ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
          & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
          & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
          & r2_hidden(c4_4__ordinal1,c5_4__ordinal1)
          & r2_hidden(c5_4__ordinal1,A)
          & r2_hidden(A,c1_4__ordinal1) ) ),
    file(ordinal1,c6_4__ordinal1),
    [axiom,axiom,file(ordinal1,c6_4__ordinal1)]).

fof(dt_c1_10__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_10__ordinal1),
    [assumption,axiom,file(ordinal1,c1_10__ordinal1)]).

fof(dt_c1_11__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_11__ordinal1),
    [assumption,axiom,file(ordinal1,c1_11__ordinal1)]).

fof(dt_c1_19__ordinal1,axiom,(
    v3_ordinal1(c1_19__ordinal1) ),
    file(ordinal1,c1_19__ordinal1),
    [assumption,axiom,file(ordinal1,c1_19__ordinal1)]).

fof(dt_c1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_1__ordinal1)]).

fof(dt_c1_20_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_20_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_20_2__ordinal1)]).

fof(dt_c1_20_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_20_3__ordinal1),
    [assumption,axiom,file(ordinal1,c1_20_3__ordinal1)]).

fof(dt_c1_20__ordinal1,axiom,(
    v1_ordinal1(c1_20__ordinal1) ),
    file(ordinal1,c1_20__ordinal1),
    [assumption,axiom,file(ordinal1,c1_20__ordinal1)]).

fof(dt_c1_21__ordinal1,axiom,(
    v1_ordinal1(c1_21__ordinal1) ),
    file(ordinal1,c1_21__ordinal1),
    [assumption,axiom,file(ordinal1,c1_21__ordinal1)]).

fof(dt_c1_22_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_22_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_22_1__ordinal1)]).

fof(dt_c1_22__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_22__ordinal1),
    [assumption,axiom,file(ordinal1,c1_22__ordinal1)]).

fof(dt_c1_23_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_23_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_23_1__ordinal1)]).

fof(dt_c1_23__ordinal1,axiom,(
    v3_ordinal1(c1_23__ordinal1) ),
    file(ordinal1,c1_23__ordinal1),
    [assumption,axiom,file(ordinal1,c1_23__ordinal1)]).

fof(dt_c1_25__ordinal1,axiom,(
    v3_ordinal1(c1_25__ordinal1) ),
    file(ordinal1,c1_25__ordinal1),
    [assumption,axiom,file(ordinal1,c1_25__ordinal1)]).

fof(dt_c1_26__ordinal1,axiom,(
    v3_ordinal1(c1_26__ordinal1) ),
    file(ordinal1,c1_26__ordinal1),
    [assumption,axiom,file(ordinal1,c1_26__ordinal1)]).

fof(dt_c1_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_2__ordinal1)]).

fof(dt_c1_30_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_30_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_30_1__ordinal1)]).

fof(dt_c1_30_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_30_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_30_2__ordinal1)]).

fof(dt_c1_30_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_30_3__ordinal1),
    [assumption,axiom,file(ordinal1,c1_30_3__ordinal1)]).

fof(dt_c1_30__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_30__ordinal1),
    [assumption,axiom,file(ordinal1,c1_30__ordinal1)]).

fof(dt_c1_3_1_1_1_1__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c5_3__ordinal1,de_c1_3_1_1_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_3_1_1_1_1__ordinal1),[file(ordinal1,c1_3_1_1_1_1__ordinal1)]]).

fof(dt_c1_3_1_1_1_2__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c1_3__ordinal1,de_c1_3_1_1_1_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_3_1_1_1_2__ordinal1),[file(ordinal1,c1_3_1_1_1_2__ordinal1)]]).

fof(dt_c1_3_1_1_1_3__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c2_3__ordinal1,de_c1_3_1_1_1_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_3_1_1_1_3__ordinal1),[file(ordinal1,c1_3_1_1_1_3__ordinal1)]]).

fof(dt_c1_3_1_1_1_4__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c3_3__ordinal1,de_c1_3_1_1_1_4__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_3_1_1_1_4__ordinal1),[file(ordinal1,c1_3_1_1_1_4__ordinal1)]]).

fof(dt_c1_3_1_1_1_5__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c4_3__ordinal1,de_c1_3_1_1_1_5__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_3_1_1_1_5__ordinal1),[file(ordinal1,c1_3_1_1_1_5__ordinal1)]]).

fof(dt_c1_31_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_31_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_31_1__ordinal1)]).

fof(dt_c1_3_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_3_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_3_1__ordinal1)]).

fof(dt_c1_31__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_31__ordinal1),
    [assumption,axiom,file(ordinal1,c1_31__ordinal1)]).

fof(dt_c1_34_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_34_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_34_1__ordinal1)]).

fof(dt_c1_34__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_34__ordinal1),
    [assumption,axiom,file(ordinal1,c1_34__ordinal1)]).

fof(dt_c1_35__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_35__ordinal1),
    [assumption,axiom,file(ordinal1,c1_35__ordinal1)]).

fof(dt_c1_36__ordinal1,axiom,(
    v3_ordinal1(c1_36__ordinal1) ),
    file(ordinal1,c1_36__ordinal1),
    [assumption,axiom,file(ordinal1,c1_36__ordinal1)]).

fof(dt_c1_37__ordinal1,axiom,(
    v3_ordinal1(c1_37__ordinal1) ),
    file(ordinal1,c1_37__ordinal1),
    [assumption,axiom,file(ordinal1,c1_37__ordinal1)]).

fof(dt_c1_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_3__ordinal1),
    [assumption,axiom,file(ordinal1,c1_3__ordinal1)]).

fof(dt_c1_40_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_40_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_40_1__ordinal1)]).

fof(dt_c1_40__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_40__ordinal1),
    [assumption,axiom,file(ordinal1,c1_40__ordinal1)]).

fof(dt_c1_4_1_1_1_1__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c6_4__ordinal1,de_c1_4_1_1_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_4_1_1_1_1__ordinal1),[file(ordinal1,c1_4_1_1_1_1__ordinal1)]]).

fof(dt_c1_4_1_1_1_2__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c1_4__ordinal1,de_c1_4_1_1_1_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_4_1_1_1_2__ordinal1),[file(ordinal1,c1_4_1_1_1_2__ordinal1)]]).

fof(dt_c1_4_1_1_1_3__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c2_4__ordinal1,de_c1_4_1_1_1_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_4_1_1_1_3__ordinal1),[file(ordinal1,c1_4_1_1_1_3__ordinal1)]]).

fof(dt_c1_4_1_1_1_4__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c3_4__ordinal1,de_c1_4_1_1_1_4__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_4_1_1_1_4__ordinal1),[file(ordinal1,c1_4_1_1_1_4__ordinal1)]]).

fof(dt_c1_4_1_1_1_5__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c4_4__ordinal1,de_c1_4_1_1_1_5__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_4_1_1_1_5__ordinal1),[file(ordinal1,c1_4_1_1_1_5__ordinal1)]]).

fof(dt_c1_4_1_1_1_6__ordinal1,plain,(
    $true ),
    inference(mizar_by,[],[dt_c5_4__ordinal1,de_c1_4_1_1_1_6__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_4_1_1_1_6__ordinal1),[file(ordinal1,c1_4_1_1_1_6__ordinal1)]]).

fof(dt_c1_4_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_4_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_4_1__ordinal1)]).

fof(dt_c1_41__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_41__ordinal1),
    [assumption,axiom,file(ordinal1,c1_41__ordinal1)]).

fof(dt_c1_42_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_42_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_42_1_1__ordinal1)]).

fof(dt_c1_42_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_42_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_42_1__ordinal1)]).

fof(dt_c1_42_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_42_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_42_2__ordinal1)]).

fof(dt_c1_42__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c1_42,e1_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_42__ordinal1),[file(ordinal1,c1_42__ordinal1)]]).

fof(dt_c1_43_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_43_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_43_1__ordinal1)]).

fof(dt_c1_43__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c1_43,e1_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_43__ordinal1),[file(ordinal1,c1_43__ordinal1)]]).

fof(dt_c1_44__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_44__ordinal1),
    [assumption,axiom,file(ordinal1,c1_44__ordinal1)]).

fof(dt_c1_47_1__ordinal1,axiom,(
    v3_ordinal1(c1_47_1__ordinal1) ),
    file(ordinal1,c1_47_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_47_1__ordinal1)]).

fof(dt_c1_47_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_47_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_47_2__ordinal1)]).

fof(dt_c1_47_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_47_3__ordinal1),
    [assumption,axiom,file(ordinal1,c1_47_3__ordinal1)]).

fof(dt_c1_47__ordinal1,axiom,(
    v3_ordinal1(c1_47__ordinal1) ),
    file(ordinal1,c1_47__ordinal1),
    [assumption,axiom,file(ordinal1,c1_47__ordinal1)]).

fof(dt_c1_48_1__ordinal1,plain,(
    v3_ordinal1(c1_48_1__ordinal1) ),
    inference(consider,[],[dh_c1_48_1,e2_48_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_48_1__ordinal1),[file(ordinal1,c1_48_1__ordinal1)]]).

fof(dt_c1_48__ordinal1,axiom,(
    v3_ordinal1(c1_48__ordinal1) ),
    file(ordinal1,c1_48__ordinal1),
    [assumption,axiom,file(ordinal1,c1_48__ordinal1)]).

fof(dt_c1_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_4__ordinal1),
    [assumption,axiom,file(ordinal1,c1_4__ordinal1)]).

fof(dt_c1_53_1__ordinal1,plain,(
    m1_subset_1(c1_53_1__ordinal1,k1_relat_1(c2_53__ordinal1)) ),
    inference(consider,[],[dh_c1_53_1,e1_53_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c1_53_1__ordinal1),[file(ordinal1,c1_53_1__ordinal1)]]).

fof(dt_c1_53__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_53__ordinal1),
    [assumption,axiom,file(ordinal1,c1_53__ordinal1)]).

fof(dt_c1_54__ordinal1,axiom,
    ( v1_relat_1(c1_54__ordinal1)
    & v1_funct_1(c1_54__ordinal1) ),
    file(ordinal1,c1_54__ordinal1),
    [assumption,axiom,file(ordinal1,c1_54__ordinal1)]).

fof(dt_c1_56__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_56__ordinal1),
    [assumption,axiom,file(ordinal1,c1_56__ordinal1)]).

fof(dt_c1_58__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_58__ordinal1),
    [assumption,axiom,file(ordinal1,c1_58__ordinal1)]).

fof(dt_c1_5__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_5__ordinal1),
    [assumption,axiom,file(ordinal1,c1_5__ordinal1)]).

fof(dt_c1_60_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_1_1__ordinal1)]).

fof(dt_c1_60_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_1__ordinal1)]).

fof(dt_c1_60_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_2__ordinal1)]).

fof(dt_c1_60_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_3__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_3__ordinal1)]).

fof(dt_c1_60_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_4__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_4__ordinal1)]).

fof(dt_c1_60_5_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_5_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_5_1_1__ordinal1)]).

fof(dt_c1_60_5_1_2_1__ordinal1,axiom,
    ( v1_relat_1(c1_60_5_1_2_1__ordinal1)
    & v1_funct_1(c1_60_5_1_2_1__ordinal1)
    & v5_ordinal1(c1_60_5_1_2_1__ordinal1) ),
    file(ordinal1,c1_60_5_1_2_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_5_1_2_1__ordinal1)]).

fof(dt_c1_60_5_1_2_2__ordinal1,axiom,(
    v3_ordinal1(c1_60_5_1_2_2__ordinal1) ),
    file(ordinal1,c1_60_5_1_2_2__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_5_1_2_2__ordinal1)]).

fof(dt_c1_60_5_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60_5_1__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60_5_1__ordinal1)]).

fof(dt_c1_60__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_60__ordinal1),
    [assumption,axiom,file(ordinal1,c1_60__ordinal1)]).

fof(dt_c1_64__ordinal1,axiom,(
    v3_ordinal1(c1_64__ordinal1) ),
    file(ordinal1,c1_64__ordinal1),
    [assumption,axiom,file(ordinal1,c1_64__ordinal1)]).

fof(dt_c1_8__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_8__ordinal1),
    [assumption,axiom,file(ordinal1,c1_8__ordinal1)]).

fof(dt_c1_9__ordinal1,axiom,(
    $true ),
    file(ordinal1,c1_9__ordinal1),
    [assumption,axiom,file(ordinal1,c1_9__ordinal1)]).

fof(dt_c2_10__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_10__ordinal1),
    [assumption,axiom,file(ordinal1,c2_10__ordinal1)]).

fof(dt_c2_19__ordinal1,axiom,(
    v3_ordinal1(c2_19__ordinal1) ),
    file(ordinal1,c2_19__ordinal1),
    [assumption,axiom,file(ordinal1,c2_19__ordinal1)]).

fof(dt_c2_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_1__ordinal1),
    [assumption,axiom,file(ordinal1,c2_1__ordinal1)]).

fof(dt_c2_20_3__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_20_3,e2_20_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_20_3__ordinal1),[file(ordinal1,c2_20_3__ordinal1)]]).

fof(dt_c2_20__ordinal1,axiom,(
    v3_ordinal1(c2_20__ordinal1) ),
    file(ordinal1,c2_20__ordinal1),
    [assumption,axiom,file(ordinal1,c2_20__ordinal1)]).

fof(dt_c2_21__ordinal1,axiom,(
    v3_ordinal1(c2_21__ordinal1) ),
    file(ordinal1,c2_21__ordinal1),
    [assumption,axiom,file(ordinal1,c2_21__ordinal1)]).

fof(dt_c2_22_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_22_1,e3_22_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_22_1__ordinal1),[file(ordinal1,c2_22_1__ordinal1)]]).

fof(dt_c2_22__ordinal1,axiom,(
    v3_ordinal1(c2_22__ordinal1) ),
    file(ordinal1,c2_22__ordinal1),
    [assumption,axiom,file(ordinal1,c2_22__ordinal1)]).

fof(dt_c2_23__ordinal1,axiom,(
    v3_ordinal1(c2_23__ordinal1) ),
    file(ordinal1,c2_23__ordinal1),
    [assumption,axiom,file(ordinal1,c2_23__ordinal1)]).

fof(dt_c2_25__ordinal1,axiom,(
    v3_ordinal1(c2_25__ordinal1) ),
    file(ordinal1,c2_25__ordinal1),
    [assumption,axiom,file(ordinal1,c2_25__ordinal1)]).

fof(dt_c2_26__ordinal1,axiom,(
    v3_ordinal1(c2_26__ordinal1) ),
    file(ordinal1,c2_26__ordinal1),
    [assumption,axiom,file(ordinal1,c2_26__ordinal1)]).

fof(dt_c2_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_2__ordinal1),
    [assumption,axiom,file(ordinal1,c2_2__ordinal1)]).

fof(dt_c2_30_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_30_3__ordinal1),
    [assumption,axiom,file(ordinal1,c2_30_3__ordinal1)]).

fof(dt_c2_31_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_31_1,e2_31_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_31_1__ordinal1),[file(ordinal1,c2_31_1__ordinal1)]]).

fof(dt_c2_31__ordinal1,plain,(
    v3_ordinal1(c2_31__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c1_31__ordinal1,cc1_ordinal1,de_c2_31__ordinal1,e2_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_31__ordinal1),[file(ordinal1,c2_31__ordinal1)]]).

fof(dt_c2_34__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_34__ordinal1),
    [assumption,axiom,file(ordinal1,c2_34__ordinal1)]).

fof(dt_c2_35__ordinal1,axiom,(
    v3_ordinal1(c2_35__ordinal1) ),
    file(ordinal1,c2_35__ordinal1),
    [assumption,axiom,file(ordinal1,c2_35__ordinal1)]).

fof(dt_c2_36__ordinal1,axiom,(
    v3_ordinal1(c2_36__ordinal1) ),
    file(ordinal1,c2_36__ordinal1),
    [assumption,axiom,file(ordinal1,c2_36__ordinal1)]).

fof(dt_c2_37__ordinal1,axiom,(
    v3_ordinal1(c2_37__ordinal1) ),
    file(ordinal1,c2_37__ordinal1),
    [assumption,axiom,file(ordinal1,c2_37__ordinal1)]).

fof(dt_c2_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_3__ordinal1),
    [assumption,axiom,file(ordinal1,c2_3__ordinal1)]).

fof(dt_c2_40_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_40_1,e2_40_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_40_1__ordinal1),[file(ordinal1,c2_40_1__ordinal1)]]).

fof(dt_c2_40__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_40__ordinal1),
    [assumption,axiom,file(ordinal1,c2_40__ordinal1)]).

fof(dt_c2_41__ordinal1,plain,(
    v3_ordinal1(c2_41__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,t2_subset,antisymmetry_r2_hidden,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,dt_k1_tarski,dt_k2_xboole_0,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t6_boole,t7_boole,t8_boole,dt_k1_ordinal1,dt_k3_tarski,dt_c1_41__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,fc4_ordinal1,d1_ordinal1,de_c2_41__ordinal1,e3_41__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_41__ordinal1),[file(ordinal1,c2_41__ordinal1)]]).

fof(dt_c2_42_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_42_2__ordinal1),
    [assumption,axiom,file(ordinal1,c2_42_2__ordinal1)]).

fof(dt_c2_43__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_43,e3_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_43__ordinal1),[file(ordinal1,c2_43__ordinal1)]]).

fof(dt_c2_44__ordinal1,plain,(
    v3_ordinal1(c2_44__ordinal1) ),
    inference(consider,[],[dh_c2_44,e1_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_44__ordinal1),[file(ordinal1,c2_44__ordinal1)]]).

fof(dt_c2_47_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_47_1,e4_47_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_47_1__ordinal1),[file(ordinal1,c2_47_1__ordinal1)]]).

fof(dt_c2_47_3__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_47_3,e2_47_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_47_3__ordinal1),[file(ordinal1,c2_47_3__ordinal1)]]).

fof(dt_c2_48__ordinal1,plain,(
    v3_ordinal1(c2_48__ordinal1) ),
    inference(consider,[],[dh_c2_48,e2_48__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_48__ordinal1),[file(ordinal1,c2_48__ordinal1)]]).

fof(dt_c2_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_4__ordinal1),
    [assumption,axiom,file(ordinal1,c2_4__ordinal1)]).

fof(dt_c2_53__ordinal1,plain,
    ( v1_relat_1(c2_53__ordinal1)
    & v1_funct_1(c2_53__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,t2_subset,antisymmetry_r2_hidden,t1_subset,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t7_boole,t8_boole,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t6_boole,de_c2_53__ordinal1,e1_53__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_53__ordinal1),[file(ordinal1,c2_53__ordinal1)]]).

fof(dt_c2_56__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_56__ordinal1),
    [assumption,axiom,file(ordinal1,c2_56__ordinal1)]).

fof(dt_c2_58__ordinal1,axiom,(
    m1_ordinal1(c2_58__ordinal1,c1_58__ordinal1) ),
    file(ordinal1,c2_58__ordinal1),
    [assumption,axiom,file(ordinal1,c2_58__ordinal1)]).

fof(dt_c2_5__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_5__ordinal1),
    [assumption,axiom,file(ordinal1,c2_5__ordinal1)]).

fof(dt_c2_60_1_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_60_1_1,e2_60_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_60_1_1__ordinal1),[file(ordinal1,c2_60_1_1__ordinal1)]]).

fof(dt_c2_60_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_60_1__ordinal1),
    [assumption,axiom,file(ordinal1,c2_60_1__ordinal1)]).

fof(dt_c2_60_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_60_2__ordinal1),
    [assumption,axiom,file(ordinal1,c2_60_2__ordinal1)]).

fof(dt_c2_60_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_60_3__ordinal1),
    [assumption,axiom,file(ordinal1,c2_60_3__ordinal1)]).

fof(dt_c2_60_4__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_60_4,e2_60_4__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_60_4__ordinal1),[file(ordinal1,c2_60_4__ordinal1)]]).

fof(dt_c2_60_5_1_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_60_5_1_1,e2_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_60_5_1_1__ordinal1),[file(ordinal1,c2_60_5_1_1__ordinal1)]]).

fof(dt_c2_60_5_1_2_2__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c2_60_5_1_2_2,e2_60_5_1_2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_60_5_1_2_2__ordinal1),[file(ordinal1,c2_60_5_1_2_2__ordinal1)]]).

fof(dt_c2_60_5_1__ordinal1,plain,(
    v3_ordinal1(c2_60_5_1__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c1_60_5_1__ordinal1,cc1_ordinal1,de_c2_60_5_1__ordinal1,e3_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_60_5_1__ordinal1),[file(ordinal1,c2_60_5_1__ordinal1)]]).

fof(dt_c2_60__ordinal1,plain,
    ( v1_relat_1(c2_60__ordinal1)
    & v1_funct_1(c2_60__ordinal1) ),
    inference(mizar_by,[],[dt_k3_tarski,dt_c1_60__ordinal1,rc1_funct_1,de_c2_60__ordinal1,e4_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,c2_60__ordinal1),[file(ordinal1,c2_60__ordinal1)]]).

fof(dt_c2_64__ordinal1,axiom,(
    v3_ordinal1(c2_64__ordinal1) ),
    file(ordinal1,c2_64__ordinal1),
    [assumption,axiom,file(ordinal1,c2_64__ordinal1)]).

fof(dt_c2_9__ordinal1,axiom,(
    $true ),
    file(ordinal1,c2_9__ordinal1),
    [assumption,axiom,file(ordinal1,c2_9__ordinal1)]).

fof(dt_c3_19__ordinal1,axiom,(
    v1_ordinal1(c3_19__ordinal1) ),
    file(ordinal1,c3_19__ordinal1),
    [assumption,axiom,file(ordinal1,c3_19__ordinal1)]).

fof(dt_c3_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_1__ordinal1),
    [assumption,axiom,file(ordinal1,c3_1__ordinal1)]).

fof(dt_c3_20__ordinal1,plain,(
    m1_subset_1(c3_20__ordinal1,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1)) ),
    inference(consider,[],[dh_c3_20,e3_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_20__ordinal1),[file(ordinal1,c3_20__ordinal1)]]).

fof(dt_c3_21__ordinal1,axiom,(
    v3_ordinal1(c3_21__ordinal1) ),
    file(ordinal1,c3_21__ordinal1),
    [assumption,axiom,file(ordinal1,c3_21__ordinal1)]).

fof(dt_c3_22_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c3_22_1,e6_22_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_22_1__ordinal1),[file(ordinal1,c3_22_1__ordinal1)]]).

fof(dt_c3_23__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c3_23,e4_23__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_23__ordinal1),[file(ordinal1,c3_23__ordinal1)]]).

fof(dt_c3_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_2__ordinal1),
    [assumption,axiom,file(ordinal1,c3_2__ordinal1)]).

fof(dt_c3_31_1__ordinal1,plain,(
    v3_ordinal1(c3_31_1__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c2_31_1__ordinal1,cc1_ordinal1,de_c3_31_1__ordinal1,e5_31_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_31_1__ordinal1),[file(ordinal1,c3_31_1__ordinal1)]]).

fof(dt_c3_31__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_31__ordinal1),
    [assumption,axiom,file(ordinal1,c3_31__ordinal1)]).

fof(dt_c3_34__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_34__ordinal1),
    [assumption,axiom,file(ordinal1,c3_34__ordinal1)]).

fof(dt_c3_35__ordinal1,plain,(
    m1_subset_1(c3_35__ordinal1,c1_35__ordinal1) ),
    inference(consider,[],[dh_c3_35,e1_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_35__ordinal1),[file(ordinal1,c3_35__ordinal1)]]).

fof(dt_c3_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_3__ordinal1),
    [assumption,axiom,file(ordinal1,c3_3__ordinal1)]).

fof(dt_c3_40_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_40_1__ordinal1),
    [assumption,axiom,file(ordinal1,c3_40_1__ordinal1)]).

fof(dt_c3_40__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_40__ordinal1),
    [assumption,axiom,file(ordinal1,c3_40__ordinal1)]).

fof(dt_c3_41__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_41__ordinal1),
    [assumption,axiom,file(ordinal1,c3_41__ordinal1)]).

fof(dt_c3_44__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c3_44,e3_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_44__ordinal1),[file(ordinal1,c3_44__ordinal1)]]).

fof(dt_c3_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_4__ordinal1),
    [assumption,axiom,file(ordinal1,c3_4__ordinal1)]).

fof(dt_c3_53__ordinal1,plain,
    ( v1_relat_1(c3_53__ordinal1)
    & v1_funct_1(c3_53__ordinal1)
    & v5_ordinal1(c3_53__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,t2_subset,antisymmetry_r2_hidden,t1_subset,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t7_boole,t8_boole,dt_k1_xboole_0,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t6_boole,dt_c2_53__ordinal1,de_c2_53__ordinal1,rc4_ordinal1,rc1_funct_1,de_c3_53__ordinal1,e3_53__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_53__ordinal1),[file(ordinal1,c3_53__ordinal1)]]).

fof(dt_c3_56__ordinal1,axiom,(
    m1_ordinal1(c3_56__ordinal1,c1_56__ordinal1) ),
    file(ordinal1,c3_56__ordinal1),
    [assumption,axiom,file(ordinal1,c3_56__ordinal1)]).

fof(dt_c3_58__ordinal1,axiom,(
    v3_ordinal1(c3_58__ordinal1) ),
    file(ordinal1,c3_58__ordinal1),
    [assumption,axiom,file(ordinal1,c3_58__ordinal1)]).

fof(dt_c3_60_1_1__ordinal1,plain,
    ( v1_relat_1(c3_60_1_1__ordinal1)
    & v1_funct_1(c3_60_1_1__ordinal1)
    & v5_ordinal1(c3_60_1_1__ordinal1) ),
    inference(mizar_by,[],[dt_c2_60_1_1__ordinal1,rc4_ordinal1,rc1_funct_1,de_c3_60_1_1__ordinal1,e4_60_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_60_1_1__ordinal1),[file(ordinal1,c3_60_1_1__ordinal1)]]).

fof(dt_c3_60_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_60_1__ordinal1),
    [assumption,axiom,file(ordinal1,c3_60_1__ordinal1)]).

fof(dt_c3_60_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c3_60_2__ordinal1),
    [assumption,axiom,file(ordinal1,c3_60_2__ordinal1)]).

fof(dt_c3_60_3__ordinal1,plain,
    ( v1_relat_1(c3_60_3__ordinal1)
    & v1_funct_1(c3_60_3__ordinal1)
    & v5_ordinal1(c3_60_3__ordinal1) ),
    inference(mizar_by,[],[dt_c1_60_3__ordinal1,rc4_ordinal1,rc1_funct_1,de_c3_60_3__ordinal1,e3_60_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_60_3__ordinal1),[file(ordinal1,c3_60_3__ordinal1)]]).

fof(dt_c3_60_5_1_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c3_60_5_1_1,e4_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_60_5_1_1__ordinal1),[file(ordinal1,c3_60_5_1_1__ordinal1)]]).

fof(dt_c3_60_5_1_2_2__ordinal1,plain,
    ( v1_relat_1(c3_60_5_1_2_2__ordinal1)
    & v1_funct_1(c3_60_5_1_2_2__ordinal1)
    & v5_ordinal1(c3_60_5_1_2_2__ordinal1) ),
    inference(mizar_by,[],[dt_c2_60_5_1_2_2__ordinal1,rc4_ordinal1,rc1_funct_1,de_c3_60_5_1_2_2__ordinal1,e6_60_5_1_2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_60_5_1_2_2__ordinal1),[file(ordinal1,c3_60_5_1_2_2__ordinal1)]]).

fof(dt_c3_60_5_1__ordinal1,plain,
    ( v1_relat_1(c3_60_5_1__ordinal1)
    & v1_funct_1(c3_60_5_1__ordinal1)
    & v5_ordinal1(c3_60_5_1__ordinal1) ),
    inference(consider,[],[dh_c3_60_5_1,e5_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_60_5_1__ordinal1),[file(ordinal1,c3_60_5_1__ordinal1)]]).

fof(dt_c3_60__ordinal1,plain,
    ( v1_relat_1(c3_60__ordinal1)
    & v1_funct_1(c3_60__ordinal1) ),
    inference(consider,[],[dh_c3_60,e6_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,c3_60__ordinal1),[file(ordinal1,c3_60__ordinal1)]]).

fof(dt_c4_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_1,e2_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_1__ordinal1),[file(ordinal1,c4_1__ordinal1)]]).

fof(dt_c4_20__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_20,e6_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_20__ordinal1),[file(ordinal1,c4_20__ordinal1)]]).

fof(dt_c4_23__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_23,e7_23__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_23__ordinal1),[file(ordinal1,c4_23__ordinal1)]]).

fof(dt_c4_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,c4_2__ordinal1),
    [assumption,axiom,file(ordinal1,c4_2__ordinal1)]).

fof(dt_c4_31__ordinal1,axiom,(
    $true ),
    file(ordinal1,c4_31__ordinal1),
    [assumption,axiom,file(ordinal1,c4_31__ordinal1)]).

fof(dt_c4_35__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_35,e4_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_35__ordinal1),[file(ordinal1,c4_35__ordinal1)]]).

fof(dt_c4_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c4_3__ordinal1),
    [assumption,axiom,file(ordinal1,c4_3__ordinal1)]).

fof(dt_c4_40__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_40,e4_40__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_40__ordinal1),[file(ordinal1,c4_40__ordinal1)]]).

fof(dt_c4_41__ordinal1,plain,(
    v3_ordinal1(c4_41__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c3_41__ordinal1,cc1_ordinal1,de_c4_41__ordinal1,e5_41__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_41__ordinal1),[file(ordinal1,c4_41__ordinal1)]]).

fof(dt_c4_44__ordinal1,plain,(
    v3_ordinal1(c4_44__ordinal1) ),
    inference(consider,[],[dh_c4_44,e9_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_44__ordinal1),[file(ordinal1,c4_44__ordinal1)]]).

fof(dt_c4_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c4_4__ordinal1),
    [assumption,axiom,file(ordinal1,c4_4__ordinal1)]).

fof(dt_c4_60_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_60_1,e3_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_60_1__ordinal1),[file(ordinal1,c4_60_1__ordinal1)]]).

fof(dt_c4_60_2__ordinal1,plain,
    ( v1_relat_1(c4_60_2__ordinal1)
    & v1_funct_1(c4_60_2__ordinal1)
    & v5_ordinal1(c4_60_2__ordinal1) ),
    inference(mizar_by,[],[dt_c1_60_2__ordinal1,rc4_ordinal1,rc1_funct_1,de_c4_60_2__ordinal1,e2_60_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_60_2__ordinal1),[file(ordinal1,c4_60_2__ordinal1)]]).

fof(dt_c4_60_5_1_1__ordinal1,plain,
    ( v1_relat_1(c4_60_5_1_1__ordinal1)
    & v1_funct_1(c4_60_5_1_1__ordinal1)
    & v5_ordinal1(c4_60_5_1_1__ordinal1) ),
    inference(mizar_by,[],[dt_c3_60_5_1_1__ordinal1,rc4_ordinal1,rc1_funct_1,de_c4_60_5_1_1__ordinal1,e6_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_60_5_1_1__ordinal1),[file(ordinal1,c4_60_5_1_1__ordinal1)]]).

fof(dt_c4_60_5_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c4_60_5_1,e8_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_60_5_1__ordinal1),[file(ordinal1,c4_60_5_1__ordinal1)]]).

fof(dt_c4_60__ordinal1,plain,(
    v3_ordinal1(c4_60__ordinal1) ),
    inference(consider,[],[dh_c4_60,e10_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,c4_60__ordinal1),[file(ordinal1,c4_60__ordinal1)]]).

fof(dt_c5_2__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c5_2,e2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,c5_2__ordinal1),[file(ordinal1,c5_2__ordinal1)]]).

fof(dt_c5_31__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c5_31,e5_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,c5_31__ordinal1),[file(ordinal1,c5_31__ordinal1)]]).

fof(dt_c5_35__ordinal1,plain,(
    v3_ordinal1(c5_35__ordinal1) ),
    inference(consider,[],[dh_c5_35,e7_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,c5_35__ordinal1),[file(ordinal1,c5_35__ordinal1)]]).

fof(dt_c5_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,c5_3__ordinal1),
    [assumption,axiom,file(ordinal1,c5_3__ordinal1)]).

fof(dt_c5_40__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c5_40,e6_40__ordinal1]),
    [lemma_conjecture,file(ordinal1,c5_40__ordinal1),[file(ordinal1,c5_40__ordinal1)]]).

fof(dt_c5_44__ordinal1,axiom,(
    v3_ordinal1(c5_44__ordinal1) ),
    file(ordinal1,c5_44__ordinal1),
    [assumption,axiom,file(ordinal1,c5_44__ordinal1)]).

fof(dt_c5_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c5_4__ordinal1),
    [assumption,axiom,file(ordinal1,c5_4__ordinal1)]).

fof(dt_c5_60_1__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c5_60_1,e5_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c5_60_1__ordinal1),[file(ordinal1,c5_60_1__ordinal1)]]).

fof(dt_c5_60__ordinal1,plain,(
    v3_ordinal1(c5_60__ordinal1) ),
    inference(consider,[],[dh_c5_60,e14_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,c5_60__ordinal1),[file(ordinal1,c5_60__ordinal1)]]).

fof(dt_c6_31__ordinal1,plain,(
    $true ),
    inference(consider,[],[dh_c6_31,e7_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,c6_31__ordinal1),[file(ordinal1,c6_31__ordinal1)]]).

fof(dt_c6_35__ordinal1,axiom,(
    v3_ordinal1(c6_35__ordinal1) ),
    file(ordinal1,c6_35__ordinal1),
    [assumption,axiom,file(ordinal1,c6_35__ordinal1)]).

fof(dt_c6_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,c6_4__ordinal1),
    [assumption,axiom,file(ordinal1,c6_4__ordinal1)]).

fof(dt_c6_60_1__ordinal1,plain,
    ( v1_relat_1(c6_60_1__ordinal1)
    & v1_funct_1(c6_60_1__ordinal1)
    & v5_ordinal1(c6_60_1__ordinal1) ),
    inference(mizar_by,[],[dt_c4_60_1__ordinal1,rc4_ordinal1,rc1_funct_1,de_c6_60_1__ordinal1,e7_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c6_60_1__ordinal1),[file(ordinal1,c6_60_1__ordinal1)]]).

fof(dt_c7_31__ordinal1,plain,(
    v3_ordinal1(c7_31__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c5_31__ordinal1,dt_c6_31__ordinal1,cc1_ordinal1,de_c7_31__ordinal1,e10_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,c7_31__ordinal1),[file(ordinal1,c7_31__ordinal1)]]).

fof(dt_c7_60_1__ordinal1,plain,
    ( v1_relat_1(c7_60_1__ordinal1)
    & v1_funct_1(c7_60_1__ordinal1)
    & v5_ordinal1(c7_60_1__ordinal1) ),
    inference(mizar_by,[],[dt_c5_60_1__ordinal1,rc4_ordinal1,rc1_funct_1,de_c7_60_1__ordinal1,e8_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,c7_60_1__ordinal1),[file(ordinal1,c7_60_1__ordinal1)]]).

fof(dt_c8_31__ordinal1,plain,(
    v3_ordinal1(c8_31__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c5_31__ordinal1,dt_c6_31__ordinal1,cc1_ordinal1,de_c8_31__ordinal1,e10_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,c8_31__ordinal1),[file(ordinal1,c8_31__ordinal1)]]).

fof(dt_k1_enumset1,axiom,(
    $true ),
    file(enumset1,k1_enumset1),
    [sort,axiom,file(enumset1,k1_enumset1)]).

fof(dt_k1_funct_1,axiom,(
    $true ),
    file(funct_1,k1_funct_1),
    [sort,axiom,file(funct_1,k1_funct_1)]).

fof(dt_k1_ordinal1,axiom,(
    $true ),
    file(ordinal1,k1_ordinal1),
    [sort,axiom,file(ordinal1,k1_ordinal1)]).

fof(dt_k1_relat_1,axiom,(
    $true ),
    file(relat_1,k1_relat_1),
    [sort,axiom,file(relat_1,k1_relat_1)]).

fof(dt_k1_tarski,axiom,(
    $true ),
    file(tarski,k1_tarski),
    [sort,axiom,file(tarski,k1_tarski)]).

fof(dt_k1_xboole_0,axiom,(
    $true ),
    file(xboole_0,k1_xboole_0),
    [sort,axiom,file(xboole_0,k1_xboole_0)]).

fof(dt_k1_zfmisc_1,axiom,(
    $true ),
    file(zfmisc_1,k1_zfmisc_1),
    [sort,axiom,file(zfmisc_1,k1_zfmisc_1)]).

fof(dt_k2_enumset1,axiom,(
    $true ),
    file(enumset1,k2_enumset1),
    [sort,axiom,file(enumset1,k2_enumset1)]).

fof(dt_k2_ordinal1,axiom,(
    ! [A,B] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A)
        & v3_ordinal1(B) )
     => m1_ordinal1(k2_ordinal1(A,B),k2_relat_1(A)) ) ),
    file(ordinal1,k2_ordinal1),
    [sort,axiom,file(ordinal1,k2_ordinal1)]).

fof(dt_k2_relat_1,axiom,(
    $true ),
    file(relat_1,k2_relat_1),
    [sort,axiom,file(relat_1,k2_relat_1)]).

fof(dt_k2_tarski,axiom,(
    $true ),
    file(tarski,k2_tarski),
    [sort,axiom,file(tarski,k2_tarski)]).

fof(dt_k2_xboole_0,axiom,(
    $true ),
    file(xboole_0,k2_xboole_0),
    [sort,axiom,file(xboole_0,k2_xboole_0)]).

fof(dt_k3_enumset1,axiom,(
    $true ),
    file(enumset1,k3_enumset1),
    [sort,axiom,file(enumset1,k3_enumset1)]).

fof(dt_k3_tarski,axiom,(
    $true ),
    file(tarski,k3_tarski),
    [sort,axiom,file(tarski,k3_tarski)]).

fof(dt_k4_enumset1,axiom,(
    $true ),
    file(enumset1,k4_enumset1),
    [sort,axiom,file(enumset1,k4_enumset1)]).

fof(dt_k4_tarski,axiom,(
    $true ),
    file(tarski,k4_tarski),
    [sort,axiom,file(tarski,k4_tarski)]).

fof(dt_k4_xboole_0,axiom,(
    $true ),
    file(xboole_0,k4_xboole_0),
    [sort,axiom,file(xboole_0,k4_xboole_0)]).

fof(dt_k7_relat_1,axiom,(
    ! [A,B] : 
      ( v1_relat_1(A)
     => v1_relat_1(k7_relat_1(A,B)) ) ),
    file(relat_1,k7_relat_1),
    [sort,axiom,file(relat_1,k7_relat_1)]).

fof(dt_m1_ordinal1,axiom,(
    ! [A,B] : 
      ( m1_ordinal1(B,A)
     => ( v1_relat_1(B)
        & v1_funct_1(B)
        & v5_ordinal1(B) ) ) ),
    file(ordinal1,m1_ordinal1),
    [sort,axiom,file(ordinal1,m1_ordinal1)]).

fof(dt_m1_subset_1,axiom,(
    $true ),
    file(subset_1,m1_subset_1),
    [sort,axiom,file(subset_1,m1_subset_1)]).

fof(e10_20__ordinal1,plain,(
    r1_tarski(c4_20__ordinal1,c2_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c2_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e9_20__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_20__ordinal1),[file(ordinal1,e10_20__ordinal1)]]).

fof(e10_22_1__ordinal1,plain,(
    ~ ( ~ r2_hidden(c3_22_1__ordinal1,c1_22__ordinal1)
      & c3_22_1__ordinal1 != c1_22__ordinal1
      & ~ r2_hidden(c1_22__ordinal1,c3_22_1__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,dt_c2_22__ordinal1,dt_c3_22_1__ordinal1,t1_subset,t3_subset,t7_boole,e9_22_1__ordinal1,e1_22__ordinal1,e8_22_1__ordinal1,d3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_22_1__ordinal1),[file(ordinal1,e10_22_1__ordinal1)]]).

fof(e10_23__ordinal1,plain,(
    r1_tarski(c4_23__ordinal1,c1_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_23__ordinal1,dt_c2_23__ordinal1,dt_c4_23__ordinal1,t1_subset,t3_subset,t7_boole,e9_23__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_23__ordinal1),[file(ordinal1,e10_23__ordinal1)]]).

fof(e10_31__ordinal1,plain,
    ( v3_ordinal1(c5_31__ordinal1)
    & v3_ordinal1(c6_31__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,dt_c1_31__ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c2_31__ordinal1,dt_c5_31__ordinal1,dt_c6_31__ordinal1,de_c2_31__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e9_31__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_31__ordinal1),[file(ordinal1,e10_31__ordinal1)]]).

fof(e10_35__ordinal1,axiom,(
    r2_hidden(c6_35__ordinal1,c1_35__ordinal1) ),
    file(ordinal1,e10_35__ordinal1),
    [assumption,axiom,file(ordinal1,e10_35__ordinal1)]).

fof(e10_40__ordinal1,plain,(
    ~ ( ~ r2_hidden(c2_40__ordinal1,c3_40__ordinal1)
      & c2_40__ordinal1 != c3_40__ordinal1
      & ~ r2_hidden(c3_40__ordinal1,c2_40__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c2_40__ordinal1,dt_c3_40__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e9_40__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_40__ordinal1),[file(ordinal1,e10_40__ordinal1)]]).

fof(e10_44__ordinal1,plain,
    ( r2_hidden(c4_44__ordinal1,c3_44__ordinal1)
    & ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c3_44__ordinal1)
         => r1_ordinal1(c4_44__ordinal1,A) ) ) ),
    inference(consider,[],[dh_c4_44,e9_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_44__ordinal1),[file(ordinal1,e10_44__ordinal1)]]).

fof(e10_47_1__ordinal1,plain,(
    r1_tarski(k2_xboole_0(c1_47_1__ordinal1,k1_tarski(c1_47_1__ordinal1)),c2_47_1__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,dt_k1_tarski,dt_k2_xboole_0,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,t3_subset,e9_47_1__ordinal1,e7_47_1__ordinal1,t8_xboole_1]),
    [lemma_conjecture,file(ordinal1,e10_47_1__ordinal1),[file(ordinal1,e10_47_1__ordinal1)]]).

fof(e10_60_1__ordinal1,plain,
    ( r1_tarski(c6_60_1__ordinal1,c7_60_1__ordinal1)
    | r1_tarski(c7_60_1__ordinal1,c6_60_1__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,dt_c4_60_1__ordinal1,dt_c5_60_1__ordinal1,rc4_ordinal1,rc1_funct_1,reflexivity_r1_tarski,symmetry_r3_xboole_0,reflexivity_r3_xboole_0,dt_c6_60_1__ordinal1,dt_c7_60_1__ordinal1,de_c6_60_1__ordinal1,de_c7_60_1__ordinal1,t3_subset,e9_60_1__ordinal1,d9_xboole_0]),
    [lemma_conjecture,file(ordinal1,e10_60_1__ordinal1),[file(ordinal1,e10_60_1__ordinal1)]]).

fof(e10_60_5_1_1__ordinal1,plain,
    ( r2_hidden(c4_60_5_1_1__ordinal1,k1_relat_1(c3_60__ordinal1))
    & k1_relat_1(c4_60_5_1_1__ordinal1) = k1_funct_1(c3_60__ordinal1,c4_60_5_1_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,dt_c3_60_5_1_1__ordinal1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_funct_1,dt_k1_relat_1,dt_k4_tarski,dt_c3_60__ordinal1,dt_c4_60_5_1_1__ordinal1,de_c4_60_5_1_1__ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e9_60_5_1_1__ordinal1,t8_funct_1]),
    [lemma_conjecture,file(ordinal1,e10_60_5_1_1__ordinal1),[file(ordinal1,e10_60_5_1_1__ordinal1)]]).

fof(e10_60_5_1__ordinal1,plain,(
    r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(c2_60__ordinal1)) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_tarski,dt_k3_tarski,dt_m1_subset_1,dt_c1_60__ordinal1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60_5_1__ordinal1,dt_c2_60__ordinal1,dt_c3_60_5_1__ordinal1,dt_c4_60_5_1__ordinal1,de_c2_60__ordinal1,fc1_zfmisc_1,t1_subset,t3_subset,t7_boole,d5_tarski,e7_60_5_1__ordinal1,e9_60_5_1__ordinal1,d4_relat_1]),
    [lemma_conjecture,file(ordinal1,e10_60_5_1__ordinal1),[file(ordinal1,e10_60_5_1__ordinal1)]]).

fof(e10_60__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & r1_tarski(k2_relat_1(c3_60__ordinal1),A) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc6_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k2_relat_1,dt_c3_60__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e9_60__ordinal1,t36_ordinal1]),
    [lemma_conjecture,file(ordinal1,e10_60__ordinal1),[file(ordinal1,e10_60__ordinal1)]]).

fof(e1_10_1__ordinal1,axiom,(
    r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1)) ),
    file(ordinal1,e1_10_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_10_1__ordinal1)]).

fof(e1_10__ordinal1,plain,(
    ~ ( r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1))
      & ~ r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
      & c1_10__ordinal1 != c2_10__ordinal1 ) ),
    inference(discharge_asm,[discharged([e1_10_1__ordinal1])],[i1_10_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_10__ordinal1),[file(ordinal1,e1_10__ordinal1)]]).

fof(e1_11__ordinal1,axiom,(
    c1_11__ordinal1 = k1_ordinal1(c1_11__ordinal1) ),
    file(ordinal1,e1_11__ordinal1),
    [assumption,axiom,file(ordinal1,e1_11__ordinal1)]).

fof(e11_20__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c4_20__ordinal1)
     => r2_hidden(A,c1_20__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_20_2__ordinal1])],[i1_20_2__ordinal1]),dh_c1_20_2]),
    [lemma_conjecture,file(ordinal1,e11_20__ordinal1),[file(ordinal1,e11_20__ordinal1)]]).

fof(e11_22_1__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,dt_c3_22_1__ordinal1,t1_subset,t7_boole,e10_22_1__ordinal1,e1_22_1__ordinal1,e8_22_1__ordinal1,t3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_22_1__ordinal1),[file(ordinal1,e11_22_1__ordinal1)]]).

fof(e11_23__ordinal1,plain,(
    v3_ordinal1(c4_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_23__ordinal1,dt_c2_23__ordinal1,dt_c4_23__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e9_23__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_23__ordinal1),[file(ordinal1,e11_23__ordinal1)]]).

fof(e11_31__ordinal1,plain,
    ( r2_hidden(c3_31__ordinal1,c7_31__ordinal1)
    & r2_hidden(c4_31__ordinal1,c8_31__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_31__ordinal1,dt_c3_31__ordinal1,dt_c4_31__ordinal1,dt_c5_31__ordinal1,dt_c6_31__ordinal1,dt_c7_31__ordinal1,dt_c8_31__ordinal1,de_c7_31__ordinal1,de_c8_31__ordinal1,t1_subset,t7_boole,e6_31__ordinal1,e8_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_31__ordinal1),[file(ordinal1,e11_31__ordinal1)]]).

fof(e11_35__ordinal1,plain,(
    ~ r2_hidden(c6_35__ordinal1,c5_35__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_35__ordinal1,dt_c4_35__ordinal1,dt_c5_35__ordinal1,dt_c6_35__ordinal1,t1_subset,t7_boole,e10_35__ordinal1,e5_35__ordinal1,e8_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_35__ordinal1),[file(ordinal1,e11_35__ordinal1)]]).

fof(e11_44__ordinal1,plain,(
    ~ r2_hidden(c4_44__ordinal1,c1_44__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_44__ordinal1,dt_c2_44__ordinal1,dt_c3_44__ordinal1,dt_c4_44__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e4_44__ordinal1,e10_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_44__ordinal1),[file(ordinal1,e11_44__ordinal1)]]).

fof(e11_47_1__ordinal1,plain,(
    r1_tarski(k1_ordinal1(c1_47_1__ordinal1),c2_47_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,e10_47_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_47_1__ordinal1),[file(ordinal1,e11_47_1__ordinal1)]]).

fof(e11_60_1__ordinal1,plain,(
    c2_60_1__ordinal1 = c3_60_1__ordinal1 ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,rc4_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1__ordinal1,dt_c2_60_1__ordinal1,dt_c3_60_1__ordinal1,dt_c4_60_1__ordinal1,dt_c5_60_1__ordinal1,dt_c6_60_1__ordinal1,dt_c7_60_1__ordinal1,de_c6_60_1__ordinal1,de_c7_60_1__ordinal1,fc1_zfmisc_1,t1_subset,t3_subset,t7_boole,d5_tarski,e10_60_1__ordinal1,e4_60_1__ordinal1,e6_60_1__ordinal1,d1_funct_1]),
    [lemma_conjecture,file(ordinal1,e11_60_1__ordinal1),[file(ordinal1,e11_60_1__ordinal1)]]).

fof(e11_60_5_1_1__ordinal1,plain,(
    r2_hidden(k1_relat_1(c4_60_5_1_1__ordinal1),k2_relat_1(c3_60__ordinal1)) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,dt_c3_60_5_1_1__ordinal1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc6_relat_1,fc7_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_funct_1,dt_k1_relat_1,dt_k2_relat_1,dt_c3_60__ordinal1,dt_c4_60_5_1_1__ordinal1,de_c4_60_5_1_1__ordinal1,rc1_funct_1,t1_subset,t7_boole,e10_60_5_1_1__ordinal1,d5_funct_1]),
    [lemma_conjecture,file(ordinal1,e11_60_5_1_1__ordinal1),[file(ordinal1,e11_60_5_1_1__ordinal1)]]).

fof(e11_60__ordinal1,plain,(
    r1_tarski(k2_relat_1(c3_60__ordinal1),c4_60__ordinal1) ),
    inference(consider,[],[dh_c4_60,e10_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e11_60__ordinal1),[file(ordinal1,e11_60__ordinal1)]]).

fof(e1_19__ordinal1,axiom,
    ( r2_hidden(c3_19__ordinal1,c1_19__ordinal1)
    & r2_hidden(c1_19__ordinal1,c2_19__ordinal1) ),
    file(ordinal1,e1_19__ordinal1),
    [assumption,axiom,file(ordinal1,e1_19__ordinal1)]).

fof(e1_1__ordinal1,plain,
    ( r2_hidden(c1_1__ordinal1,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
    & r2_hidden(c2_1__ordinal1,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
    & r2_hidden(c3_1__ordinal1,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_enumset1,dt_c1_1__ordinal1,dt_c2_1__ordinal1,dt_c3_1__ordinal1,t1_subset,t7_boole,d1_enumset1]),
    [lemma_conjecture,file(ordinal1,e1_1__ordinal1),[file(ordinal1,e1_1__ordinal1)]]).

fof(e1_20_1__ordinal1,axiom,(
    k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1) = k1_xboole_0 ),
    file(ordinal1,e1_20_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_20_1__ordinal1)]).

fof(e1_20_2__ordinal1,axiom,(
    r2_hidden(c1_20_2__ordinal1,c4_20__ordinal1) ),
    file(ordinal1,e1_20_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_20_2__ordinal1)]).

fof(e1_20_3__ordinal1,axiom,(
    r2_hidden(c1_20_3__ordinal1,c1_20__ordinal1) ),
    file(ordinal1,e1_20_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_20_3__ordinal1)]).

fof(e1_20__ordinal1,axiom,(
    r2_xboole_0(c1_20__ordinal1,c2_20__ordinal1) ),
    file(ordinal1,e1_20__ordinal1),
    [assumption,axiom,file(ordinal1,e1_20__ordinal1)]).

fof(e1_21__ordinal1,axiom,
    ( r1_tarski(c1_21__ordinal1,c2_21__ordinal1)
    & r2_hidden(c2_21__ordinal1,c3_21__ordinal1) ),
    file(ordinal1,e1_21__ordinal1),
    [assumption,axiom,file(ordinal1,e1_21__ordinal1)]).

fof(e12_20__ordinal1,plain,(
    r1_tarski(c4_20__ordinal1,c1_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e11_20__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e12_20__ordinal1),[file(ordinal1,e12_20__ordinal1)]]).

fof(e1_22_1__ordinal1,axiom,(
    r2_hidden(c1_22_1__ordinal1,c1_22__ordinal1) ),
    file(ordinal1,e1_22_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_22_1__ordinal1)]).

fof(e12_23__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c4_23__ordinal1)
     => r2_hidden(A,c2_23__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_23_1__ordinal1])],[i1_23_1__ordinal1]),dh_c1_23_1]),
    [lemma_conjecture,file(ordinal1,e12_23__ordinal1),[file(ordinal1,e12_23__ordinal1)]]).

fof(e1_22__ordinal1,axiom,(
    r2_hidden(c1_22__ordinal1,c2_22__ordinal1) ),
    file(ordinal1,e1_22__ordinal1),
    [assumption,axiom,file(ordinal1,e1_22__ordinal1)]).

fof(e1_23_1__ordinal1,axiom,(
    r2_hidden(c1_23_1__ordinal1,c4_23__ordinal1) ),
    file(ordinal1,e1_23_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_23_1__ordinal1)]).

fof(e12_31__ordinal1,plain,
    ( v3_ordinal1(c3_31__ordinal1)
    & v3_ordinal1(c4_31__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,dt_c5_31__ordinal1,dt_c6_31__ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c3_31__ordinal1,dt_c4_31__ordinal1,dt_c7_31__ordinal1,dt_c8_31__ordinal1,de_c7_31__ordinal1,de_c8_31__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e11_31__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e12_31__ordinal1),[file(ordinal1,e12_31__ordinal1)]]).

fof(e12_35__ordinal1,plain,
    ( c6_35__ordinal1 = c5_35__ordinal1
    | r2_hidden(c5_35__ordinal1,c6_35__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c5_35__ordinal1,dt_c6_35__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e11_35__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e12_35__ordinal1),[file(ordinal1,e12_35__ordinal1)]]).

fof(e1_23__ordinal1,axiom,
    ( ~ r2_hidden(c1_23__ordinal1,c2_23__ordinal1)
    & c1_23__ordinal1 != c2_23__ordinal1 ),
    file(ordinal1,e1_23__ordinal1),
    [assumption,axiom,file(ordinal1,e1_23__ordinal1)]).

fof(e12_44__ordinal1,axiom,(
    ~ r2_hidden(c5_44__ordinal1,c1_44__ordinal1) ),
    file(ordinal1,e12_44__ordinal1),
    [assumption,axiom,file(ordinal1,e12_44__ordinal1)]).

fof(e12_47_1__ordinal1,plain,
    ( k1_ordinal1(c1_47_1__ordinal1) = c2_47_1__ordinal1
    | r2_xboole_0(k1_ordinal1(c1_47_1__ordinal1),c2_47_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_k1_ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,e11_47_1__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e12_47_1__ordinal1),[file(ordinal1,e12_47_1__ordinal1)]]).

fof(e1_25__ordinal1,plain,
    ( r1_ordinal1(c1_25__ordinal1,c2_25__ordinal1)
    | r1_ordinal1(c2_25__ordinal1,c1_25__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,reflexivity_r1_tarski,cc1_ordinal1,t3_subset,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,redefinition_r1_ordinal1,dt_c1_25__ordinal1,dt_c2_25__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_25__ordinal1),[file(ordinal1,e1_25__ordinal1)]]).

fof(e12_60_5_1_1__ordinal1,plain,(
    r1_ordinal1(k1_relat_1(c4_60_5_1_1__ordinal1),c5_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,dt_c3_60_5_1_1__ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc6_relat_1,fc7_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_relat_1,dt_k2_relat_1,dt_c3_60__ordinal1,dt_c4_60_5_1_1__ordinal1,dt_c5_60__ordinal1,de_c4_60_5_1_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e11_60_5_1_1__ordinal1,e15_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e12_60_5_1_1__ordinal1),[file(ordinal1,e12_60_5_1_1__ordinal1)]]).

fof(e12_60__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(A,k2_relat_1(c3_60__ordinal1))
       => r1_ordinal1(A,c4_60__ordinal1) ) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc6_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k2_relat_1,dt_c3_60__ordinal1,dt_c4_60__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e11_60__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e12_60__ordinal1),[file(ordinal1,e12_60__ordinal1)]]).

fof(e1_26__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_26__ordinal1,c2_26__ordinal1)
      & c1_26__ordinal1 != c2_26__ordinal1
      & ~ r2_hidden(c2_26__ordinal1,c1_26__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_26__ordinal1,dt_c2_26__ordinal1,cc1_ordinal1,t1_subset,t7_boole,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_26__ordinal1),[file(ordinal1,e1_26__ordinal1)]]).

fof(e1_2__ordinal1,plain,
    ( r2_hidden(c1_2__ordinal1,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
    & r2_hidden(c2_2__ordinal1,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
    & r2_hidden(c3_2__ordinal1,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
    & r2_hidden(c4_2__ordinal1,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k2_enumset1,dt_c1_2__ordinal1,dt_c2_2__ordinal1,dt_c3_2__ordinal1,dt_c4_2__ordinal1,t1_subset,t7_boole,d2_enumset1]),
    [lemma_conjecture,file(ordinal1,e1_2__ordinal1),[file(ordinal1,e1_2__ordinal1)]]).

fof(e1_30_1__ordinal1,axiom,(
    r2_hidden(c1_30_1__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    file(ordinal1,e1_30_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_30_1__ordinal1)]).

fof(e1_30_2_1__ordinal1,axiom,(
    r2_hidden(c1_30_2__ordinal1,c1_30__ordinal1) ),
    file(ordinal1,e1_30_2_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_30_2_1__ordinal1)]).

fof(e1_30_2__ordinal1,axiom,(
    r2_hidden(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    file(ordinal1,e1_30_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_30_2__ordinal1)]).

fof(e1_30_3__ordinal1,axiom,
    ( r2_hidden(c1_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
    & r2_hidden(c2_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    file(ordinal1,e1_30_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_30_3__ordinal1)]).

fof(e1_30__ordinal1,axiom,(
    v3_ordinal1(c1_30__ordinal1) ),
    file(ordinal1,e1_30__ordinal1),
    [assumption,axiom,file(ordinal1,e1_30__ordinal1)]).

fof(e1_3_1_1_1_1__ordinal1,axiom,(
    c1_3_1__ordinal1 = c1_3__ordinal1 ),
    file(ordinal1,e1_3_1_1_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3_1_1_1_1__ordinal1)]).

fof(e1_3_1_1_1_2__ordinal1,axiom,(
    c1_3_1__ordinal1 = c2_3__ordinal1 ),
    file(ordinal1,e1_3_1_1_1_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3_1_1_1_2__ordinal1)]).

fof(e1_3_1_1_1_3__ordinal1,axiom,(
    c1_3_1__ordinal1 = c3_3__ordinal1 ),
    file(ordinal1,e1_3_1_1_1_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3_1_1_1_3__ordinal1)]).

fof(e1_3_1_1_1_4__ordinal1,axiom,(
    c1_3_1__ordinal1 = c4_3__ordinal1 ),
    file(ordinal1,e1_3_1_1_1_4__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3_1_1_1_4__ordinal1)]).

fof(e1_3_1_1_1_5__ordinal1,axiom,(
    c1_3_1__ordinal1 = c5_3__ordinal1 ),
    file(ordinal1,e1_3_1_1_1_5__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3_1_1_1_5__ordinal1)]).

fof(e1_3_1_1_1__ordinal1,plain,(
    ~ ( c1_3_1__ordinal1 != c1_3__ordinal1
      & c1_3_1__ordinal1 != c2_3__ordinal1
      & c1_3_1__ordinal1 != c3_3__ordinal1
      & c1_3_1__ordinal1 != c4_3__ordinal1
      & c1_3_1__ordinal1 != c5_3__ordinal1 ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,t1_subset,t7_boole,e1_3_1__ordinal1,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e1_3_1_1_1__ordinal1),[file(ordinal1,e1_3_1_1_1__ordinal1)]]).

fof(e1_31_1__ordinal1,axiom,(
    r2_hidden(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1)) ),
    file(ordinal1,e1_31_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_31_1__ordinal1)]).

fof(e1_3_1__ordinal1,axiom,(
    r2_hidden(c1_3_1__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1)) ),
    file(ordinal1,e1_3_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3_1__ordinal1)]).

fof(e1_31__ordinal1,axiom,
    ( v1_ordinal1(c1_31__ordinal1)
    & v2_ordinal1(c1_31__ordinal1) ),
    file(ordinal1,e1_31__ordinal1),
    [assumption,axiom,file(ordinal1,e1_31__ordinal1)]).

fof(e13_20__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c1_20__ordinal1)
     => r2_hidden(A,c4_20__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_20_3__ordinal1])],[i1_20_3__ordinal1]),dh_c1_20_3]),
    [lemma_conjecture,file(ordinal1,e13_20__ordinal1),[file(ordinal1,e13_20__ordinal1)]]).

fof(e13_23__ordinal1,plain,(
    r1_tarski(c4_23__ordinal1,c2_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c2_23__ordinal1,dt_c4_23__ordinal1,t1_subset,t3_subset,t7_boole,e12_23__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e13_23__ordinal1),[file(ordinal1,e13_23__ordinal1)]]).

fof(e13_31__ordinal1,plain,(
    ~ ( ~ r2_hidden(c3_31__ordinal1,c4_31__ordinal1)
      & c3_31__ordinal1 != c4_31__ordinal1
      & ~ r2_hidden(c4_31__ordinal1,c3_31__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c3_31__ordinal1,dt_c4_31__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e12_31__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e13_31__ordinal1),[file(ordinal1,e13_31__ordinal1)]]).

fof(e13_35__ordinal1,plain,(
    r1_ordinal1(c5_35__ordinal1,c6_35__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c5_35__ordinal1,dt_c6_35__ordinal1,t1_subset,t3_subset,t7_boole,e12_35__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e13_35__ordinal1),[file(ordinal1,e13_35__ordinal1)]]).

fof(e1_34_1__ordinal1,axiom,(
    r2_hidden(c1_34_1__ordinal1,c1_34__ordinal1) ),
    file(ordinal1,e1_34_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_34_1__ordinal1)]).

fof(e13_44__ordinal1,axiom,(
    ~ r1_ordinal1(c4_44__ordinal1,c5_44__ordinal1) ),
    file(ordinal1,e13_44__ordinal1),
    [assumption,axiom,file(ordinal1,e13_44__ordinal1)]).

fof(e13_47_1__ordinal1,plain,
    ( k1_ordinal1(c1_47_1__ordinal1) = c2_47_1__ordinal1
    | r2_hidden(k1_ordinal1(c1_47_1__ordinal1),c2_47_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_k1_ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e12_47_1__ordinal1,e8_47_1__ordinal1,t21_ordinal1]),
    [lemma_conjecture,file(ordinal1,e13_47_1__ordinal1),[file(ordinal1,e13_47_1__ordinal1)]]).

fof(e1_34__ordinal1,axiom,(
    ! [A] : 
      ( r2_hidden(A,c1_34__ordinal1)
     => ( v3_ordinal1(A)
        & r1_tarski(A,c1_34__ordinal1) ) ) ),
    file(ordinal1,e1_34__ordinal1),
    [assumption,axiom,file(ordinal1,e1_34__ordinal1)]).

fof(e1_35__ordinal1,plain,(
    ? [A] : m1_subset_1(A,c1_35__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,dt_c1_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_35__ordinal1),[file(ordinal1,e1_35__ordinal1)]]).

fof(e13_60_5_1_1__ordinal1,plain,(
    r2_hidden(c1_60_5_1_1__ordinal1,c5_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,dt_c3_60_5_1_1__ordinal1,cc1_ordinal1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_relat_1,dt_c1_60_5_1_1__ordinal1,dt_c4_60_5_1_1__ordinal1,dt_c5_60__ordinal1,de_c4_60_5_1_1__ordinal1,t1_subset,t7_boole,e12_60_5_1_1__ordinal1,e7_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e13_60_5_1_1__ordinal1),[file(ordinal1,e13_60_5_1_1__ordinal1)]]).

fof(e13_60__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_hidden(B,k2_relat_1(c3_60__ordinal1))
           => r1_ordinal1(B,A) ) ) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,t8_boole,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc6_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k2_relat_1,dt_c3_60__ordinal1,dt_c4_60__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e12_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e13_60__ordinal1),[file(ordinal1,e13_60__ordinal1)]]).

fof(e1_36_1__ordinal1,axiom,(
    r2_hidden(c1_36__ordinal1,c2_36__ordinal1) ),
    file(ordinal1,e1_36_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_36_1__ordinal1)]).

fof(e1_36__ordinal1,plain,
    ( r2_hidden(c1_36__ordinal1,c2_36__ordinal1)
   => r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1) ),
    inference(discharge_asm,[discharged([e1_36_1__ordinal1])],[i1_36_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_36__ordinal1),[file(ordinal1,e1_36__ordinal1)]]).

fof(e1_37_1__ordinal1,axiom,(
    r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1)) ),
    file(ordinal1,e1_37_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_37_1__ordinal1)]).

fof(e1_37__ordinal1,plain,
    ( r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1))
   => r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1) ),
    inference(discharge_asm,[discharged([e1_37_1__ordinal1])],[i1_37_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_37__ordinal1),[file(ordinal1,e1_37__ordinal1)]]).

fof(e1_3__ordinal1,axiom,
    ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
    & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
    & r2_hidden(c3_3__ordinal1,c4_3__ordinal1)
    & r2_hidden(c4_3__ordinal1,c5_3__ordinal1)
    & r2_hidden(c5_3__ordinal1,c1_3__ordinal1) ),
    file(ordinal1,e1_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_3__ordinal1)]).

fof(e1_40_1__ordinal1,axiom,(
    r2_hidden(c1_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) ),
    file(ordinal1,e1_40_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_40_1__ordinal1)]).

fof(e1_40__ordinal1,axiom,(
    ! [A] : 
      ( r2_hidden(A,c1_40__ordinal1)
     => v3_ordinal1(A) ) ),
    file(ordinal1,e1_40__ordinal1),
    [assumption,axiom,file(ordinal1,e1_40__ordinal1)]).

fof(e1_4_1_1_1_1__ordinal1,axiom,(
    c1_4_1__ordinal1 = c1_4__ordinal1 ),
    file(ordinal1,e1_4_1_1_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1_1_1_1__ordinal1)]).

fof(e1_4_1_1_1_2__ordinal1,axiom,(
    c1_4_1__ordinal1 = c2_4__ordinal1 ),
    file(ordinal1,e1_4_1_1_1_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1_1_1_2__ordinal1)]).

fof(e1_4_1_1_1_3__ordinal1,axiom,(
    c1_4_1__ordinal1 = c3_4__ordinal1 ),
    file(ordinal1,e1_4_1_1_1_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1_1_1_3__ordinal1)]).

fof(e1_4_1_1_1_4__ordinal1,axiom,(
    c1_4_1__ordinal1 = c4_4__ordinal1 ),
    file(ordinal1,e1_4_1_1_1_4__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1_1_1_4__ordinal1)]).

fof(e1_4_1_1_1_5__ordinal1,axiom,(
    c1_4_1__ordinal1 = c5_4__ordinal1 ),
    file(ordinal1,e1_4_1_1_1_5__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1_1_1_5__ordinal1)]).

fof(e1_4_1_1_1_6__ordinal1,axiom,(
    c1_4_1__ordinal1 = c6_4__ordinal1 ),
    file(ordinal1,e1_4_1_1_1_6__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1_1_1_6__ordinal1)]).

fof(e1_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 != c1_4__ordinal1
      & c1_4_1__ordinal1 != c2_4__ordinal1
      & c1_4_1__ordinal1 != c3_4__ordinal1
      & c1_4_1__ordinal1 != c4_4__ordinal1
      & c1_4_1__ordinal1 != c5_4__ordinal1
      & c1_4_1__ordinal1 != c6_4__ordinal1 ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,t1_subset,t7_boole,e1_4_1__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e1_4_1_1_1__ordinal1),[file(ordinal1,e1_4_1_1_1__ordinal1)]]).

fof(e1_41__ordinal1,axiom,(
    ! [A] : 
      ( r2_hidden(A,c1_41__ordinal1)
     => v3_ordinal1(A) ) ),
    file(ordinal1,e1_41__ordinal1),
    [assumption,axiom,file(ordinal1,e1_41__ordinal1)]).

fof(e1_4_1__ordinal1,axiom,(
    r2_hidden(c1_4_1__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1)) ),
    file(ordinal1,e1_4_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4_1__ordinal1)]).

fof(e14_20__ordinal1,plain,(
    r1_tarski(c1_20__ordinal1,c4_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e13_20__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e14_20__ordinal1),[file(ordinal1,e14_20__ordinal1)]]).

fof(e1_42_1_1__ordinal1,axiom,(
    r2_hidden(c1_42_1_1__ordinal1,c1_42_1__ordinal1) ),
    file(ordinal1,e1_42_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_42_1_1__ordinal1)]).

fof(e1_42_1__ordinal1,axiom,(
    r2_hidden(c1_42_1__ordinal1,c1_42__ordinal1) ),
    file(ordinal1,e1_42_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_42_1__ordinal1)]).

fof(e1_42_2__ordinal1,axiom,
    ( r2_hidden(c1_42_2__ordinal1,c1_42__ordinal1)
    & r2_hidden(c2_42_2__ordinal1,c1_42__ordinal1) ),
    file(ordinal1,e1_42_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_42_2__ordinal1)]).

fof(e14_23__ordinal1,plain,
    ( r2_xboole_0(c4_23__ordinal1,c2_23__ordinal1)
    | c4_23__ordinal1 = c2_23__ordinal1 ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c2_23__ordinal1,dt_c4_23__ordinal1,t3_subset,e13_23__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e14_23__ordinal1),[file(ordinal1,e14_23__ordinal1)]]).

fof(e1_42__ordinal1,axiom,(
    ? [A] : 
    ! [B] : 
      ( r2_hidden(B,A)
    <=> v3_ordinal1(B) ) ),
    file(ordinal1,e1_42__ordinal1),
    [assumption,axiom,file(ordinal1,e1_42__ordinal1)]).

fof(e1_43_1__ordinal1,axiom,(
    v3_ordinal1(c1_43_1__ordinal1) ),
    file(ordinal1,e1_43_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_43_1__ordinal1)]).

fof(e1_43__ordinal1,axiom,(
    ? [A] : 
    ! [B] : 
      ( v3_ordinal1(B)
     => r2_hidden(B,A) ) ),
    file(ordinal1,e1_43__ordinal1),
    [assumption,axiom,file(ordinal1,e1_43__ordinal1)]).

fof(e14_44__ordinal1,plain,(
    ~ r2_hidden(c4_44__ordinal1,c5_44__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c4_44__ordinal1,dt_c5_44__ordinal1,t1_subset,t3_subset,t7_boole,e13_44__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e14_44__ordinal1),[file(ordinal1,e14_44__ordinal1)]]).

fof(e14_47_1__ordinal1,plain,(
    r1_tarski(c2_47_1__ordinal1,c1_47__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_47__ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,t1_subset,t3_subset,t7_boole,e5_47_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e14_47_1__ordinal1),[file(ordinal1,e14_47_1__ordinal1)]]).

fof(e1_44__ordinal1,plain,(
    ~ ! [A] : 
        ( v3_ordinal1(A)
       => r2_hidden(A,c1_44__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_44__ordinal1,cc1_ordinal1,t1_subset,t7_boole,t38_ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_44__ordinal1),[file(ordinal1,e1_44__ordinal1)]]).

fof(e14_60__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_hidden(B,k2_relat_1(c3_60__ordinal1))
           => r1_ordinal1(B,A) ) )
      & ! [B] : 
          ( v3_ordinal1(B)
         => ( ! [C] : 
                ( v3_ordinal1(C)
               => ( r2_hidden(C,k2_relat_1(c3_60__ordinal1))
                 => r1_ordinal1(C,B) ) )
           => r1_ordinal1(A,B) ) ) ) ),
    inference(mizar_from,[],[reflexivity_r1_tarski,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k2_relat_1,dt_c3_60__ordinal1,cc1_ordinal1,s1_ordinal1__e14_60__ordinal1,e13_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e14_60__ordinal1),[file(ordinal1,e14_60__ordinal1)]]).

fof(e1_47_1__ordinal1,axiom,(
    v4_ordinal1(c1_47__ordinal1) ),
    file(ordinal1,e1_47_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_47_1__ordinal1)]).

fof(e1_47_2__ordinal1,axiom,(
    r2_hidden(c1_47_2__ordinal1,c1_47__ordinal1) ),
    file(ordinal1,e1_47_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_47_2__ordinal1)]).

fof(e1_47_3__ordinal1,axiom,(
    r2_hidden(c1_47_3__ordinal1,k3_tarski(c1_47__ordinal1)) ),
    file(ordinal1,e1_47_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_47_3__ordinal1)]).

fof(e1_47__ordinal1,plain,
    ( v4_ordinal1(c1_47__ordinal1)
   => ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c1_47__ordinal1)
         => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_47_1__ordinal1])],[i1_47_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_47__ordinal1),[file(ordinal1,e1_47__ordinal1)]]).

fof(e1_48_1__ordinal1,axiom,(
    ~ v4_ordinal1(c1_48__ordinal1) ),
    file(ordinal1,e1_48_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_48_1__ordinal1)]).

fof(e1_48__ordinal1,plain,(
    ~ ( ~ v4_ordinal1(c1_48__ordinal1)
      & ! [A] : 
          ( v3_ordinal1(A)
         => c1_48__ordinal1 != k1_ordinal1(A) ) ) ),
    inference(discharge_asm,[discharged([e1_48_1__ordinal1])],[i1_48_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_48__ordinal1),[file(ordinal1,e1_48__ordinal1)]]).

fof(e1_4__ordinal1,axiom,
    ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
    & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
    & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
    & r2_hidden(c4_4__ordinal1,c5_4__ordinal1)
    & r2_hidden(c5_4__ordinal1,c6_4__ordinal1)
    & r2_hidden(c6_4__ordinal1,c1_4__ordinal1) ),
    file(ordinal1,e1_4__ordinal1),
    [assumption,axiom,file(ordinal1,e1_4__ordinal1)]).

fof(e15_20__ordinal1,plain,(
    r2_hidden(c1_20__ordinal1,c2_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c2_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e14_20__ordinal1,e9_20__ordinal1,e12_20__ordinal1,d10_xboole_0]),
    [lemma_conjecture,file(ordinal1,e15_20__ordinal1),[file(ordinal1,e15_20__ordinal1)]]).

fof(e15_23__ordinal1,plain,(
    r2_hidden(c2_23__ordinal1,c1_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_23__ordinal1,dt_c2_23__ordinal1,dt_c4_23__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e14_23__ordinal1,e9_23__ordinal1,e11_23__ordinal1,t21_ordinal1]),
    [lemma_conjecture,file(ordinal1,e15_23__ordinal1),[file(ordinal1,e15_23__ordinal1)]]).

fof(e1_53_1__ordinal1,plain,(
    ? [A] : m1_subset_1(A,k1_relat_1(c2_53__ordinal1)) ),
    inference(mizar_by,[],[antisymmetry_r2_hidden,t1_subset,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t7_boole,t8_boole,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t6_boole,existence_m1_subset_1,dt_k1_relat_1,dt_m1_subset_1,dt_c2_53__ordinal1,de_c2_53__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_53_1__ordinal1),[file(ordinal1,e1_53_1__ordinal1)]]).

fof(e1_53__ordinal1,plain,
    ( v1_relat_1(k1_xboole_0)
    & v1_funct_1(k1_xboole_0) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,t2_subset,antisymmetry_r2_hidden,t1_subset,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t7_boole,t8_boole,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t6_boole]),
    [lemma_conjecture,file(ordinal1,e1_53__ordinal1),[file(ordinal1,e1_53__ordinal1)]]).

fof(e15_44__ordinal1,plain,(
    r2_hidden(c5_44__ordinal1,c4_44__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c4_44__ordinal1,dt_c5_44__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e14_44__ordinal1,e13_44__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e15_44__ordinal1),[file(ordinal1,e15_44__ordinal1)]]).

fof(e15_47_1__ordinal1,plain,(
    r2_hidden(k1_ordinal1(c1_47_1__ordinal1),c1_47__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_47__ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e14_47_1__ordinal1,e5_47_1__ordinal1,e13_47_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e15_47_1__ordinal1),[file(ordinal1,e15_47_1__ordinal1)]]).

fof(e1_54__ordinal1,axiom,(
    v3_ordinal1(k1_relat_1(c1_54__ordinal1)) ),
    file(ordinal1,e1_54__ordinal1),
    [assumption,axiom,file(ordinal1,e1_54__ordinal1)]).

fof(e15_60__ordinal1,plain,
    ( ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,k2_relat_1(c3_60__ordinal1))
         => r1_ordinal1(A,c5_60__ordinal1) ) )
    & ! [A] : 
        ( v3_ordinal1(A)
       => ( ! [B] : 
              ( v3_ordinal1(B)
             => ( r2_hidden(B,k2_relat_1(c3_60__ordinal1))
               => r1_ordinal1(B,A) ) )
         => r1_ordinal1(c5_60__ordinal1,A) ) ) ),
    inference(consider,[],[dh_c5_60,e14_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e15_60__ordinal1),[file(ordinal1,e15_60__ordinal1)]]).

fof(e1_56__ordinal1,axiom,(
    r1_tarski(c1_56__ordinal1,c2_56__ordinal1) ),
    file(ordinal1,e1_56__ordinal1),
    [assumption,axiom,file(ordinal1,e1_56__ordinal1)]).

fof(e1_58__ordinal1,plain,(
    r1_tarski(k2_relat_1(c2_58__ordinal1),c1_58__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,reflexivity_r1_tarski,existence_m1_ordinal1,dt_k2_relat_1,dt_m1_ordinal1,dt_c1_58__ordinal1,dt_c2_58__ordinal1,rc4_ordinal1,rc1_funct_1,t3_subset,d8_ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_58__ordinal1),[file(ordinal1,e1_58__ordinal1)]]).

fof(e1_5__ordinal1,axiom,(
    r2_hidden(c1_5__ordinal1,c2_5__ordinal1) ),
    file(ordinal1,e1_5__ordinal1),
    [assumption,axiom,file(ordinal1,e1_5__ordinal1)]).

fof(e1_60_1_1__ordinal1,axiom,(
    r2_hidden(c1_60_1_1__ordinal1,k3_tarski(c1_60__ordinal1)) ),
    file(ordinal1,e1_60_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_1_1__ordinal1)]).

fof(e1_60_1__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k3_tarski(c1_60__ordinal1))
        & ! [B,C] : k4_tarski(B,C) != A ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_1_1__ordinal1])],[i1_60_1_1__ordinal1]),dh_c1_60_1_1]),
    [lemma_conjecture,file(ordinal1,e1_60_1__ordinal1),[file(ordinal1,e1_60_1__ordinal1)]]).

fof(e1_60_2__ordinal1,axiom,
    ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
    & ! [A] : 
        ( ( v1_relat_1(A)
          & v1_funct_1(A)
          & v5_ordinal1(A) )
       => ( A = c1_60_2__ordinal1
         => k1_relat_1(A) = c2_60_2__ordinal1 ) )
    & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
    & ! [A] : 
        ( ( v1_relat_1(A)
          & v1_funct_1(A)
          & v5_ordinal1(A) )
       => ( A = c1_60_2__ordinal1
         => k1_relat_1(A) = c3_60_2__ordinal1 ) ) ),
    file(ordinal1,e1_60_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_2__ordinal1)]).

fof(e1_60_3__ordinal1,axiom,(
    r2_hidden(k4_tarski(c1_60_3__ordinal1,c2_60_3__ordinal1),c3_60__ordinal1) ),
    file(ordinal1,e1_60_3__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_3__ordinal1)]).

fof(e1_60_4__ordinal1,axiom,(
    r2_hidden(c1_60_4__ordinal1,k2_relat_1(c3_60__ordinal1)) ),
    file(ordinal1,e1_60_4__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_4__ordinal1)]).

fof(e1_60_5_1_1__ordinal1,axiom,(
    r2_hidden(c1_60_5_1_1__ordinal1,k1_relat_1(c2_60__ordinal1)) ),
    file(ordinal1,e1_60_5_1_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_5_1_1__ordinal1)]).

fof(e1_60_5_1_2_1__ordinal1,axiom,(
    r2_hidden(c1_60_5_1_2_1__ordinal1,c1_60__ordinal1) ),
    file(ordinal1,e1_60_5_1_2_1__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_5_1_2_1__ordinal1)]).

fof(e1_60_5_1_2_2__ordinal1,axiom,(
    r2_hidden(c1_60_5_1_2_2__ordinal1,k2_relat_1(c3_60__ordinal1)) ),
    file(ordinal1,e1_60_5_1_2_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_5_1_2_2__ordinal1)]).

fof(e1_60_5_1_2__ordinal1,axiom,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A) )
     => ~ ( r2_hidden(A,c1_60__ordinal1)
          & r2_hidden(c2_60_5_1__ordinal1,k1_relat_1(A)) ) ) ),
    file(ordinal1,e1_60_5_1_2__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60_5_1_2__ordinal1)]).

fof(e1_60_5_1__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k1_relat_1(c2_60__ordinal1))
     => r2_hidden(A,c5_60__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_5_1_1__ordinal1])],[i1_60_5_1_1__ordinal1]),dh_c1_60_5_1_1]),
    [lemma_conjecture,file(ordinal1,e1_60_5_1__ordinal1),[file(ordinal1,e1_60_5_1__ordinal1)]]).

fof(e1_60_5__ordinal1,plain,(
    k1_relat_1(c2_60__ordinal1) = c5_60__ordinal1 ),
    inference(conclusion,[],[cc2_ordinal1,rc1_ordinal1,cc1_ordinal1,rc1_funct_1,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c2_60__ordinal1,dt_c5_60__ordinal1,d3_tarski,d10_xboole_0,e1_60_5_1__ordinal1,i1_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e1_60_5__ordinal1),[file(ordinal1,e1_60_5__ordinal1)]]).

fof(e1_60__ordinal1,axiom,(
    ! [A] : 
      ( r2_hidden(A,c1_60__ordinal1)
     => ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A) ) ) ),
    file(ordinal1,e1_60__ordinal1),
    [assumption,axiom,file(ordinal1,e1_60__ordinal1)]).

fof(e16_44__ordinal1,plain,(
    r2_hidden(c4_44__ordinal1,k1_ordinal1(c2_44__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_44__ordinal1,dt_c2_44__ordinal1,dt_c3_44__ordinal1,dt_c4_44__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e4_44__ordinal1,e10_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e16_44__ordinal1),[file(ordinal1,e16_44__ordinal1)]]).

fof(e1_64__ordinal1,axiom,
    ( ~ r2_xboole_0(c1_64__ordinal1,c2_64__ordinal1)
    & c1_64__ordinal1 != c2_64__ordinal1
    & ~ r2_xboole_0(c2_64__ordinal1,c1_64__ordinal1) ),
    file(ordinal1,e1_64__ordinal1),
    [assumption,axiom,file(ordinal1,e1_64__ordinal1)]).

fof(e16_60__ordinal1,plain,(
    v5_ordinal1(c2_60__ordinal1) ),
    inference(conclusion,[],[cc2_ordinal1,rc1_ordinal1,dt_k1_relat_1,dt_c2_60__ordinal1,cc1_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,d7_ordinal1,e2_60_5__ordinal1,i1_60_5__ordinal1]),
    [lemma_conjecture,file(ordinal1,e16_60__ordinal1),[file(ordinal1,e16_60__ordinal1)]]).

fof(e17_44__ordinal1,plain,(
    r1_ordinal1(c4_44__ordinal1,k1_ordinal1(c2_44__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c2_44__ordinal1,dt_c4_44__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e16_44__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e17_44__ordinal1),[file(ordinal1,e17_44__ordinal1)]]).

fof(e17_60__ordinal1,plain,
    ( v1_relat_1(k3_tarski(c1_60__ordinal1))
    & v1_funct_1(k3_tarski(c1_60__ordinal1))
    & v5_ordinal1(k3_tarski(c1_60__ordinal1)) ),
    inference(mizar_by,[],[dt_k3_tarski,dt_c1_60__ordinal1,dt_c2_60__ordinal1,de_c2_60__ordinal1,rc4_ordinal1,rc1_funct_1,e16_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e17_60__ordinal1),[file(ordinal1,e17_60__ordinal1)]]).

fof(e18_44__ordinal1,plain,(
    r2_hidden(c5_44__ordinal1,c3_44__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_44__ordinal1,dt_c2_44__ordinal1,dt_c3_44__ordinal1,dt_c4_44__ordinal1,dt_c5_44__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e17_44__ordinal1,e4_44__ordinal1,e12_44__ordinal1,e15_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e18_44__ordinal1),[file(ordinal1,e18_44__ordinal1)]]).

fof(e1_8__ordinal1,plain,(
    r2_hidden(c1_8__ordinal1,k1_tarski(c1_8__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_8__ordinal1,t1_subset,t7_boole,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e1_8__ordinal1),[file(ordinal1,e1_8__ordinal1)]]).

fof(e19_44__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,t8_boole,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c3_44__ordinal1,dt_c4_44__ordinal1,dt_c5_44__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e18_44__ordinal1,e10_44__ordinal1,e13_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e19_44__ordinal1),[file(ordinal1,e19_44__ordinal1)]]).

fof(e1_9__ordinal1,axiom,(
    k1_ordinal1(c1_9__ordinal1) = k1_ordinal1(c2_9__ordinal1) ),
    file(ordinal1,e1_9__ordinal1),
    [assumption,axiom,file(ordinal1,e1_9__ordinal1)]).

fof(e2_10_1__ordinal1,plain,(
    r2_hidden(c1_10__ordinal1,k2_xboole_0(c2_10__ordinal1,k1_tarski(c2_10__ordinal1))) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_10__ordinal1,dt_c2_10__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e1_10_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_10_1__ordinal1),[file(ordinal1,e2_10_1__ordinal1)]]).

fof(e2_10__ordinal1,axiom,
    ( r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
    | c1_10__ordinal1 = c2_10__ordinal1 ),
    file(ordinal1,e2_10__ordinal1),
    [assumption,axiom,file(ordinal1,e2_10__ordinal1)]).

fof(e2_11__ordinal1,plain,(
    r2_hidden(c1_11__ordinal1,k1_ordinal1(c1_11__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_11__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_11__ordinal1),[file(ordinal1,e2_11__ordinal1)]]).

fof(e2_19__ordinal1,plain,(
    r1_tarski(c1_19__ordinal1,c2_19__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_19__ordinal1,dt_c2_19__ordinal1,dt_c3_19__ordinal1,t1_subset,t3_subset,t7_boole,e1_19__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_19__ordinal1),[file(ordinal1,e2_19__ordinal1)]]).

fof(e2_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
      & ! [B] : 
          ~ ( r2_hidden(B,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
            & r2_hidden(B,A) ) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k1_enumset1,dt_c1_1__ordinal1,dt_c2_1__ordinal1,dt_c3_1__ordinal1,t1_subset,t7_boole,e1_1__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e2_1__ordinal1),[file(ordinal1,e2_1__ordinal1)]]).

fof(e2_20_1__ordinal1,plain,(
    r1_tarski(c2_20__ordinal1,c1_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,antisymmetry_r2_hidden,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc4_funct_1,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,rc1_relat_1,fc3_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t7_boole,t8_boole,reflexivity_r1_tarski,dt_k1_xboole_0,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t3_subset,t4_boole,t6_boole,e1_20_1__ordinal1,t37_xboole_1]),
    [lemma_conjecture,file(ordinal1,e2_20_1__ordinal1),[file(ordinal1,e2_20_1__ordinal1)]]).

fof(e2_20_2__ordinal1,plain,(
    ~ r2_hidden(c1_20_2__ordinal1,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c1_20_2__ordinal1,dt_c2_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t7_boole,e1_20_2__ordinal1,e8_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_20_2__ordinal1),[file(ordinal1,e2_20_2__ordinal1)]]).

fof(e2_20_3__ordinal1,plain,(
    ? [A] : 
      ( A = c1_20_3__ordinal1
      & r2_hidden(A,c1_20__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c1_20_3__ordinal1,t1_subset,t7_boole,e1_20_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_20_3__ordinal1),[file(ordinal1,e2_20_3__ordinal1)]]).

fof(e2_20__ordinal1,plain,(
    r1_tarski(c1_20__ordinal1,c2_20__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,t3_subset,e1_20__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e2_20__ordinal1),[file(ordinal1,e2_20__ordinal1)]]).

fof(e2_21__ordinal1,plain,(
    r1_tarski(c2_21__ordinal1,c3_21__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_21__ordinal1,dt_c2_21__ordinal1,dt_c3_21__ordinal1,t1_subset,t3_subset,t7_boole,e1_21__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_21__ordinal1),[file(ordinal1,e2_21__ordinal1)]]).

fof(e2_22_1__ordinal1,axiom,(
    ~ r1_tarski(c1_22_1__ordinal1,c1_22__ordinal1) ),
    file(ordinal1,e2_22_1__ordinal1),
    [assumption,axiom,file(ordinal1,e2_22_1__ordinal1)]).

fof(e2_22__ordinal1,plain,(
    r1_tarski(c1_22__ordinal1,c2_22__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_22__ordinal1,dt_c2_22__ordinal1,t1_subset,t3_subset,t7_boole,e1_22__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_22__ordinal1),[file(ordinal1,e2_22__ordinal1)]]).

fof(e2_23_1__ordinal1,plain,(
    ~ r2_hidden(c1_23_1__ordinal1,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_23__ordinal1,dt_c1_23_1__ordinal1,dt_c2_23__ordinal1,dt_c4_23__ordinal1,t1_subset,t7_boole,e1_23_1__ordinal1,e8_23__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_23_1__ordinal1),[file(ordinal1,e2_23_1__ordinal1)]]).

fof(e2_23__ordinal1,plain,(
    ~ r2_xboole_0(c1_23__ordinal1,c2_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_23__ordinal1,dt_c2_23__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_23__ordinal1,t21_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_23__ordinal1),[file(ordinal1,e2_23__ordinal1)]]).

fof(e2_25__ordinal1,plain,(
    r3_xboole_0(c1_25__ordinal1,c2_25__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,symmetry_r3_xboole_0,reflexivity_r3_xboole_0,redefinition_r1_ordinal1,dt_c1_25__ordinal1,dt_c2_25__ordinal1,t3_subset,e1_25__ordinal1,d9_xboole_0]),
    [lemma_conjecture,file(ordinal1,e2_25__ordinal1),[file(ordinal1,e2_25__ordinal1)]]).

fof(e2_26__ordinal1,plain,
    ( r1_ordinal1(c1_26__ordinal1,c2_26__ordinal1)
    | r2_hidden(c2_26__ordinal1,c1_26__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c1_26__ordinal1,dt_c2_26__ordinal1,t1_subset,t3_subset,t7_boole,e1_26__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_26__ordinal1),[file(ordinal1,e2_26__ordinal1)]]).

fof(e2_2__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
      & ! [B] : 
          ~ ( r2_hidden(B,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
            & r2_hidden(B,A) ) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k2_enumset1,dt_c1_2__ordinal1,dt_c2_2__ordinal1,dt_c3_2__ordinal1,dt_c4_2__ordinal1,t1_subset,t7_boole,e1_2__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e2_2__ordinal1),[file(ordinal1,e2_2__ordinal1)]]).

fof(e2_30_1__ordinal1,plain,
    ( r2_hidden(c1_30_1__ordinal1,k1_tarski(c1_30__ordinal1))
   => c1_30_1__ordinal1 = c1_30__ordinal1 ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_30__ordinal1,dt_c1_30_1__ordinal1,t1_subset,t7_boole,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e2_30_1__ordinal1),[file(ordinal1,e2_30_1__ordinal1)]]).

fof(e2_30_2_1__ordinal1,plain,(
    r1_tarski(c1_30_2__ordinal1,c1_30__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_30__ordinal1,dt_c1_30_2__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e1_30_2_1__ordinal1,e1_30__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_30_2_1__ordinal1),[file(ordinal1,e2_30_2_1__ordinal1)]]).

fof(e2_30_2__ordinal1,plain,
    ( r2_hidden(c1_30_2__ordinal1,c1_30__ordinal1)
   => r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_30_2_1__ordinal1])],[i1_30_2_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_30_2__ordinal1),[file(ordinal1,e2_30_2__ordinal1)]]).

fof(e2_30_3__ordinal1,plain,
    ( r2_hidden(c1_30_3__ordinal1,c1_30__ordinal1)
    | c1_30_3__ordinal1 = c1_30__ordinal1 ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_30__ordinal1,dt_c1_30_3__ordinal1,dt_c2_30_3__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e1_30_3__ordinal1,e2_30__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_30_3__ordinal1),[file(ordinal1,e2_30_3__ordinal1)]]).

fof(e2_30__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k1_ordinal1(c1_30__ordinal1))
        & ~ r2_hidden(A,c1_30__ordinal1)
        & A != c1_30__ordinal1 ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_30_1__ordinal1])],[i1_30_1__ordinal1]),dh_c1_30_1]),
    [lemma_conjecture,file(ordinal1,e2_30__ordinal1),[file(ordinal1,e2_30__ordinal1)]]).

fof(e2_3_1_1_1_1__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_1__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_1__ordinal1,c1_3_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_1__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,de_c1_3_1_1_1_1__ordinal1,t1_subset,t7_boole,e1_3__ordinal1,e1_3_1_1_1_1__ordinal1,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_3_1_1_1_1__ordinal1),[file(ordinal1,e2_3_1_1_1_1__ordinal1)]]).

fof(e2_3_1_1_1_2__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_2__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_2__ordinal1,c1_3_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_2__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,de_c1_3_1_1_1_2__ordinal1,t1_subset,t7_boole,e1_3__ordinal1,e1_3_1_1_1_2__ordinal1,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_3_1_1_1_2__ordinal1),[file(ordinal1,e2_3_1_1_1_2__ordinal1)]]).

fof(e2_3_1_1_1_3__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_3__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_3__ordinal1,c1_3_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_3__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,de_c1_3_1_1_1_3__ordinal1,t1_subset,t7_boole,e1_3__ordinal1,e1_3_1_1_1_3__ordinal1,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_3_1_1_1_3__ordinal1),[file(ordinal1,e2_3_1_1_1_3__ordinal1)]]).

fof(e2_3_1_1_1_4__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_4__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_4__ordinal1,c1_3_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_4__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,de_c1_3_1_1_1_4__ordinal1,t1_subset,t7_boole,e1_3__ordinal1,e1_3_1_1_1_4__ordinal1,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_3_1_1_1_4__ordinal1),[file(ordinal1,e2_3_1_1_1_4__ordinal1)]]).

fof(e2_3_1_1_1_5__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_5__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_5__ordinal1,c1_3_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_5__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,de_c1_3_1_1_1_5__ordinal1,t1_subset,t7_boole,e1_3__ordinal1,e1_3_1_1_1_5__ordinal1,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_3_1_1_1_5__ordinal1),[file(ordinal1,e2_3_1_1_1_5__ordinal1)]]).

fof(e2_31_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c1_31_1__ordinal1,A)
      & r2_hidden(A,c1_31__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_31__ordinal1,dt_c1_31_1__ordinal1,t1_subset,t7_boole,e1_31_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e2_31_1__ordinal1),[file(ordinal1,e2_31_1__ordinal1)]]).

fof(e2_3_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(percases,[],[i1_3_1_1_1__ordinal1,i2_3_1_1_1__ordinal1,i3_3_1_1_1__ordinal1,i4_3_1_1_1__ordinal1,i5_3_1_1_1__ordinal1,e1_3_1_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_3_1__ordinal1),[file(ordinal1,e2_3_1__ordinal1)]]).

fof(e2_31__ordinal1,plain,(
    v3_ordinal1(c1_31__ordinal1) ),
    inference(mizar_by,[],[dt_c1_31__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,e1_31__ordinal1,d4_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_31__ordinal1),[file(ordinal1,e2_31__ordinal1)]]).

fof(e2_34_1__ordinal1,plain,(
    r1_tarski(c1_34_1__ordinal1,c1_34__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_34__ordinal1,dt_c1_34_1__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e1_34_1__ordinal1,e1_34__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_34_1__ordinal1),[file(ordinal1,e2_34_1__ordinal1)]]).

fof(e2_34__ordinal1,plain,(
    v1_ordinal1(c1_34__ordinal1) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_34_1__ordinal1])],[d2_ordinal1,i1_34_1__ordinal1]),reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_34__ordinal1,dh_c1_34_1]),
    [lemma_conjecture,file(ordinal1,e2_34__ordinal1),[file(ordinal1,e2_34__ordinal1)]]).

fof(e2_35__ordinal1,axiom,
    ( r1_tarski(c1_35__ordinal1,c2_35__ordinal1)
    & c1_35__ordinal1 != k1_xboole_0 ),
    file(ordinal1,e2_35__ordinal1),
    [assumption,axiom,file(ordinal1,e2_35__ordinal1)]).

fof(e2_36_1__ordinal1,plain,(
    r1_ordinal1(c1_36__ordinal1,c2_36__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c1_36__ordinal1,dt_c2_36__ordinal1,t1_subset,t3_subset,t7_boole,e1_36_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_36_1__ordinal1),[file(ordinal1,e2_36_1__ordinal1)]]).

fof(e2_36__ordinal1,axiom,(
    r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1) ),
    file(ordinal1,e2_36__ordinal1),
    [assumption,axiom,file(ordinal1,e2_36__ordinal1)]).

fof(e2_37_1__ordinal1,plain,(
    r2_hidden(c1_37__ordinal1,k2_xboole_0(c2_37__ordinal1,k1_tarski(c2_37__ordinal1))) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_37__ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e1_37_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_37_1__ordinal1),[file(ordinal1,e2_37_1__ordinal1)]]).

fof(e2_37__ordinal1,axiom,(
    r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1) ),
    file(ordinal1,e2_37__ordinal1),
    [assumption,axiom,file(ordinal1,e2_37__ordinal1)]).

fof(e2_3__ordinal1,plain,(
    r2_hidden(c1_3__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,t1_subset,t7_boole,d3_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_3__ordinal1),[file(ordinal1,e2_3__ordinal1)]]).

fof(e2_40_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c1_40_1__ordinal1,A)
      & r2_hidden(A,c1_40__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dt_c1_40_1__ordinal1,t1_subset,t7_boole,e1_40_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e2_40_1__ordinal1),[file(ordinal1,e2_40_1__ordinal1)]]).

fof(e2_40__ordinal1,plain,(
    v1_ordinal1(k3_tarski(c1_40__ordinal1)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_40_1__ordinal1])],[d2_ordinal1,i1_40_1__ordinal1]),reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dh_c1_40_1]),
    [lemma_conjecture,file(ordinal1,e2_40__ordinal1),[file(ordinal1,e2_40__ordinal1)]]).

fof(e2_4_1_1_1_1__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_1__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_1__ordinal1,c1_4_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_1__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,de_c1_4_1_1_1_1__ordinal1,t1_subset,t7_boole,e1_4__ordinal1,e1_4_1_1_1_1__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4_1_1_1_1__ordinal1),[file(ordinal1,e2_4_1_1_1_1__ordinal1)]]).

fof(e2_4_1_1_1_2__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_2__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_2__ordinal1,c1_4_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_2__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,de_c1_4_1_1_1_2__ordinal1,t1_subset,t7_boole,e1_4__ordinal1,e1_4_1_1_1_2__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4_1_1_1_2__ordinal1),[file(ordinal1,e2_4_1_1_1_2__ordinal1)]]).

fof(e2_4_1_1_1_3__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_3__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_3__ordinal1,c1_4_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_3__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,de_c1_4_1_1_1_3__ordinal1,t1_subset,t7_boole,e1_4__ordinal1,e1_4_1_1_1_3__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4_1_1_1_3__ordinal1),[file(ordinal1,e2_4_1_1_1_3__ordinal1)]]).

fof(e2_4_1_1_1_4__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_4__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_4__ordinal1,c1_4_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_4__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,de_c1_4_1_1_1_4__ordinal1,t1_subset,t7_boole,e1_4__ordinal1,e1_4_1_1_1_4__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4_1_1_1_4__ordinal1),[file(ordinal1,e2_4_1_1_1_4__ordinal1)]]).

fof(e2_4_1_1_1_5__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_5__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_5__ordinal1,c1_4_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_5__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,de_c1_4_1_1_1_5__ordinal1,t1_subset,t7_boole,e1_4__ordinal1,e1_4_1_1_1_5__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4_1_1_1_5__ordinal1),[file(ordinal1,e2_4_1_1_1_5__ordinal1)]]).

fof(e2_4_1_1_1_6__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_6__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_6__ordinal1,c1_4_1__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_6__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,de_c1_4_1_1_1_6__ordinal1,t1_subset,t7_boole,e1_4__ordinal1,e1_4_1_1_1_6__ordinal1,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4_1_1_1_6__ordinal1),[file(ordinal1,e2_4_1_1_1_6__ordinal1)]]).

fof(e2_4_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(percases,[],[i1_4_1_1_1__ordinal1,i2_4_1_1_1__ordinal1,i3_4_1_1_1__ordinal1,i4_4_1_1_1__ordinal1,i5_4_1_1_1__ordinal1,i6_4_1_1_1__ordinal1,e1_4_1_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_4_1__ordinal1),[file(ordinal1,e2_4_1__ordinal1)]]).

fof(e2_41__ordinal1,plain,(
    v3_ordinal1(k3_tarski(c1_41__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_41__ordinal1,cc1_ordinal1,fc4_ordinal1,t1_subset,t7_boole,e1_41__ordinal1,t35_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_41__ordinal1),[file(ordinal1,e2_41__ordinal1)]]).

fof(e2_42_1_1__ordinal1,plain,(
    v3_ordinal1(c1_42_1_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_42_1__ordinal1,dt_c1_42_1_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_42_1_1__ordinal1,e2_42_1__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_42_1_1__ordinal1),[file(ordinal1,e2_42_1_1__ordinal1)]]).

fof(e2_42_1__ordinal1,plain,(
    v3_ordinal1(c1_42_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_42__ordinal1,dt_c1_42_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_42_1__ordinal1,e2_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_42_1__ordinal1),[file(ordinal1,e2_42_1__ordinal1)]]).

fof(e2_42_2__ordinal1,plain,
    ( v3_ordinal1(c1_42_2__ordinal1)
    & v3_ordinal1(c2_42_2__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_42__ordinal1,dt_c1_42_2__ordinal1,dt_c2_42_2__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_42_2__ordinal1,e2_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_42_2__ordinal1),[file(ordinal1,e2_42_2__ordinal1)]]).

fof(e2_42__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c1_42__ordinal1)
    <=> v3_ordinal1(A) ) ),
    inference(consider,[],[dh_c1_42,e1_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_42__ordinal1),[file(ordinal1,e2_42__ordinal1)]]).

fof(e2_43_1__ordinal1,plain,(
    r2_hidden(c1_43_1__ordinal1,c1_43__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_43__ordinal1,dt_c1_43_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_43_1__ordinal1,e2_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_43_1__ordinal1),[file(ordinal1,e2_43_1__ordinal1)]]).

fof(e2_43__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => r2_hidden(A,c1_43__ordinal1) ) ),
    inference(consider,[],[dh_c1_43,e1_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_43__ordinal1),[file(ordinal1,e2_43__ordinal1)]]).

fof(e2_44__ordinal1,plain,(
    ~ r2_hidden(c2_44__ordinal1,c1_44__ordinal1) ),
    inference(consider,[],[dh_c2_44,e1_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_44__ordinal1),[file(ordinal1,e2_44__ordinal1)]]).

fof(e2_47_1__ordinal1,plain,(
    c1_47__ordinal1 = k3_tarski(c1_47__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,cc1_ordinal1,fc4_ordinal1,dt_k3_tarski,dt_c1_47__ordinal1,e1_47_1__ordinal1,d6_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_47_1__ordinal1),[file(ordinal1,e2_47_1__ordinal1)]]).

fof(e2_47_2__ordinal1,plain,(
    v3_ordinal1(c1_47_2__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_47__ordinal1,dt_c1_47_2__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_47_2__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_47_2__ordinal1),[file(ordinal1,e2_47_2__ordinal1)]]).

fof(e2_47_3__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c1_47_3__ordinal1,A)
      & r2_hidden(A,c1_47__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_47__ordinal1,dt_c1_47_3__ordinal1,t1_subset,t7_boole,e1_47_3__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e2_47_3__ordinal1),[file(ordinal1,e2_47_3__ordinal1)]]).

fof(e2_47__ordinal1,axiom,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(A,c1_47__ordinal1)
       => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) ) ),
    file(ordinal1,e2_47__ordinal1),
    [assumption,axiom,file(ordinal1,e2_47__ordinal1)]).

fof(e2_48_1__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & r2_hidden(A,c1_48__ordinal1)
      & ~ r2_hidden(k1_ordinal1(A),c1_48__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_48__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e1_48_1__ordinal1,t41_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_48_1__ordinal1),[file(ordinal1,e2_48_1__ordinal1)]]).

fof(e2_48__ordinal1,axiom,(
    ? [A] : 
      ( v3_ordinal1(A)
      & c1_48__ordinal1 = k1_ordinal1(A) ) ),
    file(ordinal1,e2_48__ordinal1),
    [assumption,axiom,file(ordinal1,e2_48__ordinal1)]).

fof(e2_4__ordinal1,plain,(
    r2_hidden(c1_4__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,t1_subset,t7_boole,d4_enumset1]),
    [lemma_conjecture,file(ordinal1,e2_4__ordinal1),[file(ordinal1,e2_4__ordinal1)]]).

fof(e2_53_1__ordinal1,axiom,(
    k1_relat_1(c2_53__ordinal1) != k1_xboole_0 ),
    file(ordinal1,e2_53_1__ordinal1),
    [assumption,axiom,file(ordinal1,e2_53_1__ordinal1)]).

fof(e2_53__ordinal1,plain,(
    k1_relat_1(c2_53__ordinal1) = k1_xboole_0 ),
    inference(discharge_asm,[discharged([e2_53_1__ordinal1])],[i1_53_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_53__ordinal1),[file(ordinal1,e2_53__ordinal1)]]).

fof(e2_54__ordinal1,plain,
    ( v1_relat_1(c1_54__ordinal1)
    & v1_funct_1(c1_54__ordinal1)
    & v5_ordinal1(c1_54__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_k1_relat_1,dt_c1_54__ordinal1,cc1_ordinal1,rc4_ordinal1,rc1_funct_1,e1_54__ordinal1,d7_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_54__ordinal1),[file(ordinal1,e2_54__ordinal1)]]).

fof(e2_56__ordinal1,plain,(
    r1_tarski(k2_relat_1(c3_56__ordinal1),c1_56__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,reflexivity_r1_tarski,existence_m1_ordinal1,dt_k2_relat_1,dt_m1_ordinal1,dt_c1_56__ordinal1,dt_c3_56__ordinal1,rc4_ordinal1,rc1_funct_1,t3_subset,d8_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_56__ordinal1),[file(ordinal1,e2_56__ordinal1)]]).

fof(e2_58__ordinal1,plain,(
    m1_ordinal1(k2_ordinal1(c2_58__ordinal1,c3_58__ordinal1),c1_58__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_k7_relat_1,dt_m1_subset_1,cc1_ordinal1,rc4_ordinal1,rc1_funct_1,fc4_funct_1,reflexivity_r1_tarski,existence_m1_ordinal1,redefinition_k2_ordinal1,dt_k2_ordinal1,dt_k2_relat_1,dt_m1_ordinal1,dt_c1_58__ordinal1,dt_c2_58__ordinal1,dt_c3_58__ordinal1,t3_subset,e1_58__ordinal1,t47_ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_58__ordinal1),[file(ordinal1,e2_58__ordinal1)]]).

fof(e2_5__ordinal1,axiom,(
    r1_tarski(c2_5__ordinal1,c1_5__ordinal1) ),
    file(ordinal1,e2_5__ordinal1),
    [assumption,axiom,file(ordinal1,e2_5__ordinal1)]).

fof(e2_60_1_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c1_60_1_1__ordinal1,A)
      & r2_hidden(A,c1_60__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_60__ordinal1,dt_c1_60_1_1__ordinal1,t1_subset,t7_boole,e1_60_1_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e2_60_1_1__ordinal1),[file(ordinal1,e2_60_1_1__ordinal1)]]).

fof(e2_60_1__ordinal1,axiom,
    ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
    & r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),k3_tarski(c1_60__ordinal1)) ),
    file(ordinal1,e2_60_1__ordinal1),
    [assumption,axiom,file(ordinal1,e2_60_1__ordinal1)]).

fof(e2_60_2__ordinal1,plain,
    ( v1_relat_1(c1_60_2__ordinal1)
    & v1_funct_1(c1_60_2__ordinal1)
    & v5_ordinal1(c1_60_2__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c1_60__ordinal1,dt_c1_60_2__ordinal1,dt_c2_60_2__ordinal1,dt_c3_60_2__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,t1_subset,t7_boole,e1_60_2__ordinal1,e1_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_60_2__ordinal1),[file(ordinal1,e2_60_2__ordinal1)]]).

fof(e2_60_3__ordinal1,plain,
    ( r2_hidden(c1_60_3__ordinal1,c1_60__ordinal1)
    & ! [A] : 
        ( ( v1_relat_1(A)
          & v1_funct_1(A)
          & v5_ordinal1(A) )
       => ( A = c1_60_3__ordinal1
         => k1_relat_1(A) = c2_60_3__ordinal1 ) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_3__ordinal1,dt_c2_60_3__ordinal1,dt_c3_60__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e1_60_3__ordinal1,e7_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_60_3__ordinal1),[file(ordinal1,e2_60_3__ordinal1)]]).

fof(e2_60_4__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k1_relat_1(c3_60__ordinal1))
      & c1_60_4__ordinal1 = k1_funct_1(c3_60__ordinal1,A) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc6_relat_1,fc7_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_funct_1,dt_k1_relat_1,dt_k2_relat_1,dt_c1_60_4__ordinal1,dt_c3_60__ordinal1,rc1_funct_1,t1_subset,t7_boole,e1_60_4__ordinal1,d5_funct_1]),
    [lemma_conjecture,file(ordinal1,e2_60_4__ordinal1),[file(ordinal1,e2_60_4__ordinal1)]]).

fof(e2_60_5_1_1__ordinal1,plain,(
    ? [A] : r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,A),c2_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_k3_tarski,dt_m1_subset_1,dt_c1_60__ordinal1,cc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60_5_1_1__ordinal1,dt_c2_60__ordinal1,de_c2_60__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e1_60_5_1_1__ordinal1,d4_relat_1]),
    [lemma_conjecture,file(ordinal1,e2_60_5_1_1__ordinal1),[file(ordinal1,e2_60_5_1_1__ordinal1)]]).

fof(e2_60_5_1_2_1__ordinal1,plain,(
    ~ r2_hidden(c2_60_5_1__ordinal1,k1_relat_1(c1_60_5_1_2_1__ordinal1)) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,dt_c1_60_5_1__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c1_60__ordinal1,dt_c1_60_5_1_2_1__ordinal1,dt_c2_60_5_1__ordinal1,de_c2_60_5_1__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,t1_subset,t7_boole,e1_60_5_1_2_1__ordinal1,e1_60_5_1_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_60_5_1_2_1__ordinal1),[file(ordinal1,e2_60_5_1_2_1__ordinal1)]]).

fof(e2_60_5_1_2_2__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k1_relat_1(c3_60__ordinal1))
      & c1_60_5_1_2_2__ordinal1 = k1_funct_1(c3_60__ordinal1,A) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc6_relat_1,fc7_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_funct_1,dt_k1_relat_1,dt_k2_relat_1,dt_c1_60_5_1_2_2__ordinal1,dt_c3_60__ordinal1,rc1_funct_1,t1_subset,t7_boole,e1_60_5_1_2_2__ordinal1,d5_funct_1]),
    [lemma_conjecture,file(ordinal1,e2_60_5_1_2_2__ordinal1),[file(ordinal1,e2_60_5_1_2_2__ordinal1)]]).

fof(e2_60_5_1_2__ordinal1,plain,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A) )
     => ( r2_hidden(A,c1_60__ordinal1)
       => r1_ordinal1(k1_relat_1(A),c2_60_5_1__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_5_1_2_1__ordinal1])],[i1_60_5_1_2_1__ordinal1]),dh_c1_60_5_1_2_1]),
    [lemma_conjecture,file(ordinal1,e2_60_5_1_2__ordinal1),[file(ordinal1,e2_60_5_1_2__ordinal1)]]).

fof(e2_60_5_1__ordinal1,axiom,(
    r2_hidden(c1_60_5_1__ordinal1,c5_60__ordinal1) ),
    file(ordinal1,e2_60_5_1__ordinal1),
    [assumption,axiom,file(ordinal1,e2_60_5_1__ordinal1)]).

fof(e2_60_5__ordinal1,plain,(
    v3_ordinal1(k1_relat_1(c2_60__ordinal1)) ),
    inference(mizar_by,[],[dt_k3_tarski,dt_c1_60__ordinal1,cc2_ordinal1,rc1_ordinal1,fc4_ordinal1,rc1_funct_1,dt_k1_relat_1,dt_c2_60__ordinal1,dt_c5_60__ordinal1,de_c2_60__ordinal1,cc1_ordinal1,e1_60_5__ordinal1]),
    [lemma_conjecture,file(ordinal1,e2_60_5__ordinal1),[file(ordinal1,e2_60_5__ordinal1)]]).

fof(e2_60__ordinal1,axiom,(
    v6_ordinal1(c1_60__ordinal1) ),
    file(ordinal1,e2_60__ordinal1),
    [assumption,axiom,file(ordinal1,e2_60__ordinal1)]).

fof(e2_64__ordinal1,plain,
    ( ~ r1_ordinal1(c1_64__ordinal1,c2_64__ordinal1)
    & ~ r1_ordinal1(c2_64__ordinal1,c1_64__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,redefinition_r1_ordinal1,dt_c1_64__ordinal1,dt_c2_64__ordinal1,t3_subset,e1_64__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e2_64__ordinal1),[file(ordinal1,e2_64__ordinal1)]]).

fof(e2_8__ordinal1,plain,(
    r2_hidden(c1_8__ordinal1,k2_xboole_0(c1_8__ordinal1,k1_tarski(c1_8__ordinal1))) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_tarski,dt_k2_xboole_0,dt_c1_8__ordinal1,t1_subset,t7_boole,e1_8__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e2_8__ordinal1),[file(ordinal1,e2_8__ordinal1)]]).

fof(e2_9__ordinal1,axiom,(
    c1_9__ordinal1 != c2_9__ordinal1 ),
    file(ordinal1,e2_9__ordinal1),
    [assumption,axiom,file(ordinal1,e2_9__ordinal1)]).

fof(e3_10_1__ordinal1,plain,
    ( r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
    | r2_hidden(c1_10__ordinal1,k1_tarski(c2_10__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_tarski,dt_k2_xboole_0,dt_c1_10__ordinal1,dt_c2_10__ordinal1,t1_subset,t7_boole,e2_10_1__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e3_10_1__ordinal1),[file(ordinal1,e3_10_1__ordinal1)]]).

fof(e3_10__ordinal1,plain,
    ( r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
    | r2_hidden(c1_10__ordinal1,k1_tarski(c2_10__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_10__ordinal1,dt_c2_10__ordinal1,t1_subset,t7_boole,e2_10__ordinal1,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e3_10__ordinal1),[file(ordinal1,e3_10__ordinal1)]]).

fof(e3_11__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_11__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e2_11__ordinal1,e1_11__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_11__ordinal1),[file(ordinal1,e3_11__ordinal1)]]).

fof(e3_19__ordinal1,plain,(
    r2_hidden(c3_19__ordinal1,c2_19__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_19__ordinal1,dt_c2_19__ordinal1,dt_c3_19__ordinal1,t1_subset,t3_subset,t7_boole,e2_19__ordinal1,e1_19__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_19__ordinal1),[file(ordinal1,e3_19__ordinal1)]]).

fof(e3_1__ordinal1,plain,(
    r2_hidden(c4_1__ordinal1,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1)) ),
    inference(consider,[],[dh_c4_1,e2_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_1__ordinal1),[file(ordinal1,e3_1__ordinal1)]]).

fof(e3_20_1__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,t3_subset,e2_20_1__ordinal1,e1_20__ordinal1,t60_xboole_1]),
    [lemma_conjecture,file(ordinal1,e3_20_1__ordinal1),[file(ordinal1,e3_20_1__ordinal1)]]).

fof(e3_20_2__ordinal1,plain,(
    r2_hidden(c1_20_2__ordinal1,c1_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c1_20_2__ordinal1,dt_c2_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e2_20_2__ordinal1,e10_20__ordinal1,e1_20_2__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e3_20_2__ordinal1),[file(ordinal1,e3_20_2__ordinal1)]]).

fof(e3_20_3__ordinal1,plain,
    ( c2_20_3__ordinal1 = c1_20_3__ordinal1
    & r2_hidden(c2_20_3__ordinal1,c1_20__ordinal1) ),
    inference(consider,[],[dh_c2_20_3,e2_20_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_20_3__ordinal1),[file(ordinal1,e3_20_3__ordinal1)]]).

fof(e3_20__ordinal1,plain,(
    ? [A] : m1_subset_1(A,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1)) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,cc1_ordinal1,existence_m1_subset_1,dt_k4_xboole_0,dt_m1_subset_1,dt_c1_20__ordinal1,dt_c2_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_20__ordinal1),[file(ordinal1,e3_20__ordinal1)]]).

fof(e3_21__ordinal1,plain,
    ( r1_tarski(c1_21__ordinal1,c3_21__ordinal1)
    & c1_21__ordinal1 != c3_21__ordinal1 ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_21__ordinal1,dt_c2_21__ordinal1,dt_c3_21__ordinal1,t1_subset,t3_subset,t7_boole,e2_21__ordinal1,e1_21__ordinal1,t7_ordinal1,t1_xboole_1]),
    [lemma_conjecture,file(ordinal1,e3_21__ordinal1),[file(ordinal1,e3_21__ordinal1)]]).

fof(e3_22_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,c1_22_1__ordinal1)
      & ~ r2_hidden(A,c1_22__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,t1_subset,t3_subset,t7_boole,e2_22_1__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e3_22_1__ordinal1),[file(ordinal1,e3_22_1__ordinal1)]]).

fof(e3_22__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(A,c1_22__ordinal1)
        & r2_hidden(B,c1_22__ordinal1)
        & ~ r2_hidden(A,B)
        & A != B
        & ~ r2_hidden(B,A) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_22__ordinal1,dt_c2_22__ordinal1,t1_subset,t3_subset,t7_boole,e2_22__ordinal1,d3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_22__ordinal1),[file(ordinal1,e3_22__ordinal1)]]).

fof(e3_23_1__ordinal1,plain,(
    r2_hidden(c1_23_1__ordinal1,c2_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_23__ordinal1,dt_c1_23_1__ordinal1,dt_c2_23__ordinal1,dt_c4_23__ordinal1,t1_subset,t3_subset,t7_boole,e2_23_1__ordinal1,e10_23__ordinal1,e1_23_1__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e3_23_1__ordinal1),[file(ordinal1,e3_23_1__ordinal1)]]).

fof(e3_23__ordinal1,plain,(
    ~ r1_tarski(c1_23__ordinal1,c2_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_23__ordinal1,dt_c2_23__ordinal1,t1_subset,t3_subset,t7_boole,e2_23__ordinal1,e1_23__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e3_23__ordinal1),[file(ordinal1,e3_23__ordinal1)]]).

fof(e3_2__ordinal1,plain,(
    r2_hidden(c5_2__ordinal1,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1)) ),
    inference(consider,[],[dh_c5_2,e2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_2__ordinal1),[file(ordinal1,e3_2__ordinal1)]]).

fof(e3_30_1__ordinal1,plain,
    ( r2_hidden(c1_30_1__ordinal1,c1_30__ordinal1)
    | c1_30_1__ordinal1 = c1_30__ordinal1 ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_30__ordinal1,dt_c1_30_1__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e2_30_1__ordinal1,e1_30_1__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e3_30_1__ordinal1),[file(ordinal1,e3_30_1__ordinal1)]]).

fof(e3_30_2_1__ordinal1,plain,(
    r1_tarski(c1_30__ordinal1,k2_xboole_0(c1_30__ordinal1,k1_tarski(c1_30__ordinal1))) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,dt_k1_tarski,dt_k2_xboole_0,dt_c1_30__ordinal1,t3_subset,t7_xboole_1]),
    [lemma_conjecture,file(ordinal1,e3_30_2_1__ordinal1),[file(ordinal1,e3_30_2_1__ordinal1)]]).

fof(e3_30_2__ordinal1,plain,
    ( c1_30_2__ordinal1 = c1_30__ordinal1
   => r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,dt_k1_ordinal1,dt_k2_xboole_0,dt_c1_30__ordinal1,dt_c1_30_2__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,t7_xboole_1]),
    [lemma_conjecture,file(ordinal1,e3_30_2__ordinal1),[file(ordinal1,e3_30_2__ordinal1)]]).

fof(e3_30_3__ordinal1,plain,
    ( r2_hidden(c2_30_3__ordinal1,c1_30__ordinal1)
    | c2_30_3__ordinal1 = c1_30__ordinal1 ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_30__ordinal1,dt_c1_30_3__ordinal1,dt_c2_30_3__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e2_30__ordinal1,e1_30_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_30_3__ordinal1),[file(ordinal1,e3_30_3__ordinal1)]]).

fof(e3_30__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k1_ordinal1(c1_30__ordinal1))
     => r1_tarski(A,k1_ordinal1(c1_30__ordinal1)) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_30_2__ordinal1])],[i1_30_2__ordinal1]),dh_c1_30_2]),
    [lemma_conjecture,file(ordinal1,e3_30__ordinal1),[file(ordinal1,e3_30__ordinal1)]]).

fof(e3_31_1__ordinal1,plain,
    ( r2_hidden(c1_31_1__ordinal1,c2_31_1__ordinal1)
    & r2_hidden(c2_31_1__ordinal1,c1_31__ordinal1) ),
    inference(consider,[],[dh_c2_31_1,e2_31_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_31_1__ordinal1),[file(ordinal1,e3_31_1__ordinal1)]]).

fof(e3_3_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,t1_subset,t7_boole,e2_3_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_3_1__ordinal1),[file(ordinal1,e3_3_1__ordinal1)]]).

fof(e3_31__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k3_tarski(c1_31__ordinal1))
     => r1_tarski(A,k3_tarski(c1_31__ordinal1)) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_31_1__ordinal1])],[i1_31_1__ordinal1]),dh_c1_31_1]),
    [lemma_conjecture,file(ordinal1,e3_31__ordinal1),[file(ordinal1,e3_31__ordinal1)]]).

fof(e3_34__ordinal1,axiom,
    ( r2_hidden(c2_34__ordinal1,c1_34__ordinal1)
    & r2_hidden(c3_34__ordinal1,c1_34__ordinal1) ),
    file(ordinal1,e3_34__ordinal1),
    [assumption,axiom,file(ordinal1,e3_34__ordinal1)]).

fof(e3_35__ordinal1,plain,(
    r2_hidden(c3_35__ordinal1,c1_35__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_xboole_0,dt_c1_35__ordinal1,dt_c2_35__ordinal1,dt_c3_35__ordinal1,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t1_subset,t3_subset,t6_boole,t7_boole,e2_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_35__ordinal1),[file(ordinal1,e3_35__ordinal1)]]).

fof(e3_36_1__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k1_tarski(c1_36__ordinal1))
     => r2_hidden(A,c2_36__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_36__ordinal1,dt_c2_36__ordinal1,t1_subset,t7_boole,e1_36_1__ordinal1,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e3_36_1__ordinal1),[file(ordinal1,e3_36_1__ordinal1)]]).

fof(e3_36__ordinal1,plain,(
    r2_hidden(c1_36__ordinal1,k1_ordinal1(c1_36__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_36__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_36__ordinal1),[file(ordinal1,e3_36__ordinal1)]]).

fof(e3_37_1__ordinal1,plain,
    ( r2_hidden(c1_37__ordinal1,c2_37__ordinal1)
    | r2_hidden(c1_37__ordinal1,k1_tarski(c2_37__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_tarski,dt_k2_xboole_0,dt_c1_37__ordinal1,dt_c2_37__ordinal1,t1_subset,t7_boole,e2_37_1__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e3_37_1__ordinal1),[file(ordinal1,e3_37_1__ordinal1)]]).

fof(e3_37__ordinal1,axiom,(
    ~ r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1)) ),
    file(ordinal1,e3_37__ordinal1),
    [assumption,axiom,file(ordinal1,e3_37__ordinal1)]).

fof(e3_3__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
              & r2_hidden(B,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_3_1__ordinal1])],[i1_3_1__ordinal1]),dh_c1_3_1]),
    [lemma_conjecture,file(ordinal1,e3_3__ordinal1),[file(ordinal1,e3_3__ordinal1)]]).

fof(e3_40_1__ordinal1,plain,
    ( r2_hidden(c1_40_1__ordinal1,c2_40_1__ordinal1)
    & r2_hidden(c2_40_1__ordinal1,c1_40__ordinal1) ),
    inference(consider,[],[dh_c2_40_1,e2_40_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_40_1__ordinal1),[file(ordinal1,e3_40_1__ordinal1)]]).

fof(e3_40__ordinal1,axiom,
    ( r2_hidden(c2_40__ordinal1,k3_tarski(c1_40__ordinal1))
    & r2_hidden(c3_40__ordinal1,k3_tarski(c1_40__ordinal1)) ),
    file(ordinal1,e3_40__ordinal1),
    [assumption,axiom,file(ordinal1,e3_40__ordinal1)]).

fof(e3_4_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,t1_subset,t7_boole,e2_4_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_4_1__ordinal1),[file(ordinal1,e3_4_1__ordinal1)]]).

fof(e3_41__ordinal1,plain,(
    v3_ordinal1(k1_ordinal1(k3_tarski(c1_41__ordinal1))) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,t2_subset,antisymmetry_r2_hidden,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,dt_k1_tarski,dt_k2_xboole_0,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t6_boole,t7_boole,t8_boole,dt_k1_ordinal1,dt_k3_tarski,dt_c1_41__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,fc4_ordinal1,d1_ordinal1,e2_41__ordinal1,t29_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_41__ordinal1),[file(ordinal1,e3_41__ordinal1)]]).

fof(e3_42_1_1__ordinal1,plain,(
    r2_hidden(c1_42_1_1__ordinal1,c1_42__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_42__ordinal1,dt_c1_42_1_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e2_42_1_1__ordinal1,e2_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_42_1_1__ordinal1),[file(ordinal1,e3_42_1_1__ordinal1)]]).

fof(e3_42_1__ordinal1,plain,(
    r1_tarski(c1_42_1__ordinal1,c1_42__ordinal1) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_42_1_1__ordinal1])],[d3_tarski,i1_42_1_1__ordinal1]),reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_42__ordinal1,dt_c1_42_1__ordinal1,dh_c1_42_1_1]),
    [lemma_conjecture,file(ordinal1,e3_42_1__ordinal1),[file(ordinal1,e3_42_1__ordinal1)]]).

fof(e3_42_2__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_42_2__ordinal1,c2_42_2__ordinal1)
      & c1_42_2__ordinal1 != c2_42_2__ordinal1
      & ~ r2_hidden(c2_42_2__ordinal1,c1_42_2__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_42_2__ordinal1,dt_c2_42_2__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e2_42_2__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_42_2__ordinal1),[file(ordinal1,e3_42_2__ordinal1)]]).

fof(e3_42__ordinal1,plain,(
    v1_ordinal1(c1_42__ordinal1) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_42_1__ordinal1])],[d2_ordinal1,i1_42_1__ordinal1]),reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_42__ordinal1,dh_c1_42_1]),
    [lemma_conjecture,file(ordinal1,e3_42__ordinal1),[file(ordinal1,e3_42__ordinal1)]]).

fof(e3_43_1__ordinal1,plain,(
    r2_hidden(c1_43_1__ordinal1,c2_43__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_43__ordinal1,dt_c1_43_1__ordinal1,dt_c2_43__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e2_43_1__ordinal1,e4_43__ordinal1,e1_43_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_43_1__ordinal1),[file(ordinal1,e3_43_1__ordinal1)]]).

fof(e3_43__ordinal1,plain,(
    ? [A] : 
    ! [B] : 
      ( r2_hidden(B,A)
    <=> ( r2_hidden(B,c1_43__ordinal1)
        & v3_ordinal1(B) ) ) ),
    inference(mizar_from,[],[cc2_ordinal1,rc1_ordinal1,antisymmetry_r2_hidden,dt_c1_43__ordinal1,cc1_ordinal1,s1_xboole_0__e3_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_43__ordinal1),[file(ordinal1,e3_43__ordinal1)]]).

fof(e3_44__ordinal1,plain,(
    ? [A] : 
    ! [B] : 
      ( r2_hidden(B,A)
    <=> ( r2_hidden(B,k1_ordinal1(c2_44__ordinal1))
        & ~ r2_hidden(B,c1_44__ordinal1) ) ) ),
    inference(mizar_from,[],[rc2_ordinal1,rc3_funct_1,cc2_ordinal1,rc1_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,rc2_relat_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_44__ordinal1,dt_c2_44__ordinal1,fc1_ordinal1,s1_xboole_0__e3_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_44__ordinal1),[file(ordinal1,e3_44__ordinal1)]]).

fof(e3_47_1__ordinal1,axiom,(
    r2_hidden(c1_47_1__ordinal1,c1_47__ordinal1) ),
    file(ordinal1,e3_47_1__ordinal1),
    [assumption,axiom,file(ordinal1,e3_47_1__ordinal1)]).

fof(e3_47_2__ordinal1,plain,(
    r2_hidden(k1_ordinal1(c1_47_2__ordinal1),c1_47__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_47__ordinal1,dt_c1_47_2__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e2_47_2__ordinal1,e2_47__ordinal1,e1_47_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_47_2__ordinal1),[file(ordinal1,e3_47_2__ordinal1)]]).

fof(e3_47_3__ordinal1,plain,
    ( r2_hidden(c1_47_3__ordinal1,c2_47_3__ordinal1)
    & r2_hidden(c2_47_3__ordinal1,c1_47__ordinal1) ),
    inference(consider,[],[dh_c2_47_3,e2_47_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_47_3__ordinal1),[file(ordinal1,e3_47_3__ordinal1)]]).

fof(e3_47__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c1_47__ordinal1)
     => r2_hidden(A,k3_tarski(c1_47__ordinal1)) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_47_2__ordinal1])],[i1_47_2__ordinal1]),dh_c1_47_2]),
    [lemma_conjecture,file(ordinal1,e3_47__ordinal1),[file(ordinal1,e3_47__ordinal1)]]).

fof(e3_48_1__ordinal1,plain,
    ( r2_hidden(c1_48_1__ordinal1,c1_48__ordinal1)
    & ~ r2_hidden(k1_ordinal1(c1_48_1__ordinal1),c1_48__ordinal1) ),
    inference(consider,[],[dh_c1_48_1,e2_48_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_48_1__ordinal1),[file(ordinal1,e3_48_1__ordinal1)]]).

fof(e3_48__ordinal1,plain,(
    c1_48__ordinal1 = k1_ordinal1(c2_48__ordinal1) ),
    inference(consider,[],[dh_c2_48,e2_48__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_48__ordinal1),[file(ordinal1,e3_48__ordinal1)]]).

fof(e3_4__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
        & ! [B] : 
            ~ ( r2_hidden(B,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
              & r2_hidden(B,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_4_1__ordinal1])],[i1_4_1__ordinal1]),dh_c1_4_1]),
    [lemma_conjecture,file(ordinal1,e3_4__ordinal1),[file(ordinal1,e3_4__ordinal1)]]).

fof(e3_53_1__ordinal1,plain,(
    ? [A] : r2_hidden(k4_tarski(c1_53_1__ordinal1,A),c2_53__ordinal1) ),
    inference(mizar_by,[],[commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k1_xboole_0,dt_k4_tarski,dt_c1_53_1__ordinal1,dt_c2_53__ordinal1,de_c2_53__ordinal1,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_zfmisc_1,fc1_xboole_0,t1_subset,t6_boole,t7_boole,d5_tarski,e2_53_1__ordinal1,d4_relat_1]),
    [lemma_conjecture,file(ordinal1,e3_53_1__ordinal1),[file(ordinal1,e3_53_1__ordinal1)]]).

fof(e3_53__ordinal1,plain,
    ( v1_relat_1(c2_53__ordinal1)
    & v1_funct_1(c2_53__ordinal1)
    & v5_ordinal1(c2_53__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,t2_subset,antisymmetry_r2_hidden,t1_subset,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t7_boole,t8_boole,dt_k1_relat_1,dt_k1_xboole_0,dt_c2_53__ordinal1,de_c2_53__ordinal1,cc1_ordinal1,fc2_ordinal1,rc4_ordinal1,rc1_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t6_boole,e2_53__ordinal1,d7_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_53__ordinal1),[file(ordinal1,e3_53__ordinal1)]]).

fof(e3_54__ordinal1,plain,(
    m1_ordinal1(c1_54__ordinal1,k2_relat_1(c1_54__ordinal1)) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,reflexivity_r1_tarski,existence_m1_ordinal1,dt_k2_relat_1,dt_m1_ordinal1,dt_c1_54__ordinal1,rc4_ordinal1,rc1_funct_1,t3_subset,e2_54__ordinal1,d8_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_54__ordinal1),[file(ordinal1,e3_54__ordinal1)]]).

fof(e3_56__ordinal1,plain,(
    r1_tarski(k2_relat_1(c3_56__ordinal1),c2_56__ordinal1) ),
    inference(mizar_by,[],[rc4_ordinal1,rc1_funct_1,existence_m1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_ordinal1,dt_m1_subset_1,reflexivity_r1_tarski,dt_k2_relat_1,dt_c1_56__ordinal1,dt_c2_56__ordinal1,dt_c3_56__ordinal1,t3_subset,e2_56__ordinal1,e1_56__ordinal1,t1_xboole_1]),
    [lemma_conjecture,file(ordinal1,e3_56__ordinal1),[file(ordinal1,e3_56__ordinal1)]]).

fof(e3_5__ordinal1,plain,(
    r2_hidden(c1_5__ordinal1,c1_5__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_5__ordinal1,dt_c2_5__ordinal1,t1_subset,t3_subset,t7_boole,e2_5__ordinal1,e1_5__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_5__ordinal1),[file(ordinal1,e3_5__ordinal1)]]).

fof(e3_60_1_1__ordinal1,plain,
    ( r2_hidden(c1_60_1_1__ordinal1,c2_60_1_1__ordinal1)
    & r2_hidden(c2_60_1_1__ordinal1,c1_60__ordinal1) ),
    inference(consider,[],[dh_c2_60_1_1,e2_60_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_1_1__ordinal1),[file(ordinal1,e3_60_1_1__ordinal1)]]).

fof(e3_60_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),A)
      & r2_hidden(A,c1_60__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1__ordinal1,dt_c2_60_1__ordinal1,dt_c3_60_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e2_60_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e3_60_1__ordinal1),[file(ordinal1,e3_60_1__ordinal1)]]).

fof(e3_60_2__ordinal1,plain,
    ( k1_relat_1(c4_60_2__ordinal1) = c2_60_2__ordinal1
    & k1_relat_1(c4_60_2__ordinal1) = c3_60_2__ordinal1 ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c1_60__ordinal1,dt_c1_60_2__ordinal1,dt_c2_60_2__ordinal1,dt_c3_60_2__ordinal1,dt_c4_60_2__ordinal1,de_c4_60_2__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,t1_subset,t7_boole,e1_60_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_2__ordinal1),[file(ordinal1,e3_60_2__ordinal1)]]).

fof(e3_60_3__ordinal1,plain,
    ( v1_relat_1(c1_60_3__ordinal1)
    & v1_funct_1(c1_60_3__ordinal1)
    & v5_ordinal1(c1_60_3__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c1_60__ordinal1,dt_c1_60_3__ordinal1,dt_c2_60_3__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,t1_subset,t7_boole,e2_60_3__ordinal1,e1_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_3__ordinal1),[file(ordinal1,e3_60_3__ordinal1)]]).

fof(e3_60_4__ordinal1,plain,
    ( r2_hidden(c2_60_4__ordinal1,k1_relat_1(c3_60__ordinal1))
    & c1_60_4__ordinal1 = k1_funct_1(c3_60__ordinal1,c2_60_4__ordinal1) ),
    inference(consider,[],[dh_c2_60_4,e2_60_4__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_4__ordinal1),[file(ordinal1,e3_60_4__ordinal1)]]).

fof(e3_60_5_1_1__ordinal1,plain,(
    r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,c2_60_5_1_1__ordinal1),c2_60__ordinal1) ),
    inference(consider,[],[dh_c2_60_5_1_1,e2_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_5_1_1__ordinal1),[file(ordinal1,e3_60_5_1_1__ordinal1)]]).

fof(e3_60_5_1_2_1__ordinal1,plain,(
    r1_ordinal1(k1_relat_1(c1_60_5_1_2_1__ordinal1),c2_60_5_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,dt_c1_60_5_1__ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_relat_1,dt_c1_60_5_1_2_1__ordinal1,dt_c2_60_5_1__ordinal1,de_c2_60_5_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e2_60_5_1_2_1__ordinal1,t26_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_5_1_2_1__ordinal1),[file(ordinal1,e3_60_5_1_2_1__ordinal1)]]).

fof(e3_60_5_1_2_2__ordinal1,plain,
    ( r2_hidden(c2_60_5_1_2_2__ordinal1,k1_relat_1(c3_60__ordinal1))
    & c1_60_5_1_2_2__ordinal1 = k1_funct_1(c3_60__ordinal1,c2_60_5_1_2_2__ordinal1) ),
    inference(consider,[],[dh_c2_60_5_1_2_2,e2_60_5_1_2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_5_1_2_2__ordinal1),[file(ordinal1,e3_60_5_1_2_2__ordinal1)]]).

fof(e3_60_5_1_2__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(A,k2_relat_1(c3_60__ordinal1))
       => r1_ordinal1(A,c2_60_5_1__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_5_1_2_2__ordinal1])],[i1_60_5_1_2_2__ordinal1]),dh_c1_60_5_1_2_2]),
    [lemma_conjecture,file(ordinal1,e3_60_5_1_2__ordinal1),[file(ordinal1,e3_60_5_1_2__ordinal1)]]).

fof(e3_60_5_1__ordinal1,plain,(
    v3_ordinal1(c1_60_5_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_60_5_1__ordinal1,dt_c5_60__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e2_60_5_1__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60_5_1__ordinal1),[file(ordinal1,e3_60_5_1__ordinal1)]]).

fof(e3_60__ordinal1,plain,
    ( v1_relat_1(k3_tarski(c1_60__ordinal1))
    & v1_funct_1(k3_tarski(c1_60__ordinal1)) ),
    inference(conclusion,[],[cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc3_funct_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,antisymmetry_r2_hidden,dt_k3_tarski,dt_k4_tarski,dt_c1_60__ordinal1,rc1_funct_1,fc1_zfmisc_1,d1_relat_1,e1_60_1__ordinal1,i1_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_60__ordinal1),[file(ordinal1,e3_60__ordinal1)]]).

fof(e3_64__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,reflexivity_r1_tarski,cc1_ordinal1,t3_subset,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,redefinition_r1_ordinal1,dt_c1_64__ordinal1,dt_c2_64__ordinal1,e2_64__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_64__ordinal1),[file(ordinal1,e3_64__ordinal1)]]).

fof(e3_8__ordinal1,plain,(
    r2_hidden(c1_8__ordinal1,k1_ordinal1(c1_8__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_8__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e2_8__ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_8__ordinal1),[file(ordinal1,e3_8__ordinal1)]]).

fof(e3_9__ordinal1,plain,(
    r2_hidden(c1_9__ordinal1,k1_ordinal1(c1_9__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_9__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e3_9__ordinal1),[file(ordinal1,e3_9__ordinal1)]]).

fof(e4_10_1__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
      & c1_10__ordinal1 != c2_10__ordinal1 ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_10__ordinal1,dt_c2_10__ordinal1,t1_subset,t7_boole,e3_10_1__ordinal1,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e4_10_1__ordinal1),[file(ordinal1,e4_10_1__ordinal1)]]).

fof(e4_10__ordinal1,plain,(
    r2_hidden(c1_10__ordinal1,k2_xboole_0(c2_10__ordinal1,k1_tarski(c2_10__ordinal1))) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_tarski,dt_k2_xboole_0,dt_c1_10__ordinal1,dt_c2_10__ordinal1,t1_subset,t7_boole,e3_10__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e4_10__ordinal1),[file(ordinal1,e4_10__ordinal1)]]).

fof(e4_1__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k1_enumset1(c1_1__ordinal1,c2_1__ordinal1,c3_1__ordinal1))
        & r2_hidden(A,c4_1__ordinal1) ) ),
    inference(consider,[],[dh_c4_1,e2_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_1__ordinal1),[file(ordinal1,e4_1__ordinal1)]]).

fof(e4_20_3__ordinal1,plain,(
    r1_tarski(c2_20_3__ordinal1,c1_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c1_20_3__ordinal1,dt_c2_20_3__ordinal1,t1_subset,t3_subset,t7_boole,e3_20_3__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_20_3__ordinal1),[file(ordinal1,e4_20_3__ordinal1)]]).

fof(e4_20__ordinal1,plain,(
    k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1) != k1_xboole_0 ),
    inference(discharge_asm,[discharged([e1_20_1__ordinal1])],[i1_20_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_20__ordinal1),[file(ordinal1,e4_20__ordinal1)]]).

fof(e4_21__ordinal1,plain,(
    r2_xboole_0(c1_21__ordinal1,c3_21__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_21__ordinal1,dt_c3_21__ordinal1,t3_subset,e3_21__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e4_21__ordinal1),[file(ordinal1,e4_21__ordinal1)]]).

fof(e4_22_1__ordinal1,plain,
    ( r2_hidden(c2_22_1__ordinal1,c1_22_1__ordinal1)
    & ~ r2_hidden(c2_22_1__ordinal1,c1_22__ordinal1) ),
    inference(consider,[],[dh_c2_22_1,e3_22_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_22_1__ordinal1),[file(ordinal1,e4_22_1__ordinal1)]]).

fof(e4_22__ordinal1,plain,(
    v2_ordinal1(c1_22__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_22__ordinal1,t1_subset,t7_boole,e3_22__ordinal1,d3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_22__ordinal1),[file(ordinal1,e4_22__ordinal1)]]).

fof(e4_23__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,c1_23__ordinal1)
      & ~ r2_hidden(A,c2_23__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_23__ordinal1,dt_c2_23__ordinal1,t1_subset,t3_subset,t7_boole,e3_23__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e4_23__ordinal1),[file(ordinal1,e4_23__ordinal1)]]).

fof(e4_2__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k2_enumset1(c1_2__ordinal1,c2_2__ordinal1,c3_2__ordinal1,c4_2__ordinal1))
        & r2_hidden(A,c5_2__ordinal1) ) ),
    inference(consider,[],[dh_c5_2,e2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_2__ordinal1),[file(ordinal1,e4_2__ordinal1)]]).

fof(e4_30_2_1__ordinal1,plain,(
    r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_30__ordinal1,dt_c1_30_2__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,e3_30_2_1__ordinal1,e2_30_2_1__ordinal1,t1_xboole_1]),
    [lemma_conjecture,file(ordinal1,e4_30_2_1__ordinal1),[file(ordinal1,e4_30_2_1__ordinal1)]]).

fof(e4_30_2__ordinal1,plain,(
    r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_30__ordinal1,dt_c1_30_2__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e3_30_2__ordinal1,e2_30__ordinal1,e1_30_2__ordinal1,e2_30_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_30_2__ordinal1),[file(ordinal1,e4_30_2__ordinal1)]]).

fof(e4_30_3__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_30_3__ordinal1,c2_30_3__ordinal1)
      & c1_30_3__ordinal1 != c2_30_3__ordinal1
      & ~ r2_hidden(c2_30_3__ordinal1,c1_30_3__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_30__ordinal1,dt_c1_30_3__ordinal1,dt_c2_30_3__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e3_30_3__ordinal1,e1_30__ordinal1,e2_30_3__ordinal1,d3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_30_3__ordinal1),[file(ordinal1,e4_30_3__ordinal1)]]).

fof(e4_30__ordinal1,plain,(
    v1_ordinal1(k1_ordinal1(c1_30__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_30__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e3_30__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_30__ordinal1),[file(ordinal1,e4_30__ordinal1)]]).

fof(e4_31_1__ordinal1,plain,(
    r2_hidden(c2_31_1__ordinal1,c2_31__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_31__ordinal1,dt_c1_31_1__ordinal1,dt_c2_31__ordinal1,dt_c2_31_1__ordinal1,de_c2_31__ordinal1,t1_subset,t7_boole,e3_31_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_31_1__ordinal1),[file(ordinal1,e4_31_1__ordinal1)]]).

fof(e4_31__ordinal1,axiom,
    ( r2_hidden(c3_31__ordinal1,k3_tarski(c1_31__ordinal1))
    & r2_hidden(c4_31__ordinal1,k3_tarski(c1_31__ordinal1)) ),
    file(ordinal1,e4_31__ordinal1),
    [assumption,axiom,file(ordinal1,e4_31__ordinal1)]).

fof(e4_34__ordinal1,plain,
    ( v3_ordinal1(c2_34__ordinal1)
    & v3_ordinal1(c3_34__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_34__ordinal1,dt_c2_34__ordinal1,dt_c3_34__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e3_34__ordinal1,e1_34__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_34__ordinal1),[file(ordinal1,e4_34__ordinal1)]]).

fof(e4_35__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,c1_35__ordinal1)
      & ! [B] : 
          ~ ( r2_hidden(B,c1_35__ordinal1)
            & r2_hidden(B,A) ) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_35__ordinal1,dt_c3_35__ordinal1,t1_subset,t7_boole,e3_35__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e4_35__ordinal1),[file(ordinal1,e4_35__ordinal1)]]).

fof(e4_36_1__ordinal1,plain,(
    r1_tarski(k1_tarski(c1_36__ordinal1),c2_36__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_36__ordinal1,dt_c2_36__ordinal1,t1_subset,t3_subset,t7_boole,e3_36_1__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e4_36_1__ordinal1),[file(ordinal1,e4_36_1__ordinal1)]]).

fof(e4_36__ordinal1,plain,(
    r2_hidden(c1_36__ordinal1,c2_36__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_36__ordinal1,dt_c2_36__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e3_36__ordinal1,e2_36__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_36__ordinal1),[file(ordinal1,e4_36__ordinal1)]]).

fof(e4_37_1__ordinal1,plain,(
    r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_tarski,dt_c1_37__ordinal1,dt_c2_37__ordinal1,t1_subset,t3_subset,t7_boole,e3_37_1__ordinal1,d2_ordinal1,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e4_37_1__ordinal1),[file(ordinal1,e4_37_1__ordinal1)]]).

fof(e4_37__ordinal1,plain,
    ( c1_37__ordinal1 = k1_ordinal1(c2_37__ordinal1)
    | r2_hidden(k1_ordinal1(c2_37__ordinal1),c1_37__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_37__ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e3_37__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_37__ordinal1),[file(ordinal1,e4_37__ordinal1)]]).

fof(e4_3__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,t1_subset,t7_boole,e3_3__ordinal1,e2_3__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e4_3__ordinal1),[file(ordinal1,e4_3__ordinal1)]]).

fof(e4_40_1__ordinal1,plain,(
    v3_ordinal1(c2_40_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_40__ordinal1,dt_c1_40_1__ordinal1,dt_c2_40_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_40__ordinal1,e3_40_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_40_1__ordinal1),[file(ordinal1,e4_40_1__ordinal1)]]).

fof(e4_40__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c2_40__ordinal1,A)
      & r2_hidden(A,c1_40__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dt_c2_40__ordinal1,dt_c3_40__ordinal1,t1_subset,t7_boole,e3_40__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e4_40__ordinal1),[file(ordinal1,e4_40__ordinal1)]]).

fof(e4_41__ordinal1,axiom,(
    r2_hidden(c3_41__ordinal1,c1_41__ordinal1) ),
    file(ordinal1,e4_41__ordinal1),
    [assumption,axiom,file(ordinal1,e4_41__ordinal1)]).

fof(e4_42__ordinal1,plain,(
    v2_ordinal1(c1_42__ordinal1) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_42_2__ordinal1])],[d3_ordinal1,i1_42_2__ordinal1]),antisymmetry_r2_hidden,dt_c1_42__ordinal1,dh_c1_42_2]),
    [lemma_conjecture,file(ordinal1,e4_42__ordinal1),[file(ordinal1,e4_42__ordinal1)]]).

fof(e4_43__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c2_43__ordinal1)
    <=> ( r2_hidden(A,c1_43__ordinal1)
        & v3_ordinal1(A) ) ) ),
    inference(consider,[],[dh_c2_43,e3_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_43__ordinal1),[file(ordinal1,e4_43__ordinal1)]]).

fof(e4_44__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c3_44__ordinal1)
    <=> ( r2_hidden(A,k1_ordinal1(c2_44__ordinal1))
        & ~ r2_hidden(A,c1_44__ordinal1) ) ) ),
    inference(consider,[],[dh_c3_44,e3_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_44__ordinal1),[file(ordinal1,e4_44__ordinal1)]]).

fof(e4_47_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c1_47_1__ordinal1,A)
      & r2_hidden(A,c1_47__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_47__ordinal1,dt_c1_47_1__ordinal1,t1_subset,t7_boole,e3_47_1__ordinal1,e2_47_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e4_47_1__ordinal1),[file(ordinal1,e4_47_1__ordinal1)]]).

fof(e4_47_2__ordinal1,plain,(
    r2_hidden(c1_47_2__ordinal1,k1_ordinal1(c1_47_2__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_47_2__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_47_2__ordinal1),[file(ordinal1,e4_47_2__ordinal1)]]).

fof(e4_47_3__ordinal1,plain,(
    r1_tarski(c2_47_3__ordinal1,c1_47__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_47__ordinal1,dt_c1_47_3__ordinal1,dt_c2_47_3__ordinal1,t1_subset,t3_subset,t7_boole,e3_47_3__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_47_3__ordinal1),[file(ordinal1,e4_47_3__ordinal1)]]).

fof(e4_47__ordinal1,plain,(
    r1_ordinal1(c1_47__ordinal1,k3_tarski(c1_47__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k3_tarski,dt_c1_47__ordinal1,t1_subset,t3_subset,t7_boole,e3_47__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e4_47__ordinal1),[file(ordinal1,e4_47__ordinal1)]]).

fof(e4_48_1__ordinal1,axiom,(
    c1_48__ordinal1 != k1_ordinal1(c1_48_1__ordinal1) ),
    file(ordinal1,e4_48_1__ordinal1),
    [assumption,axiom,file(ordinal1,e4_48_1__ordinal1)]).

fof(e4_48__ordinal1,plain,(
    r2_hidden(c2_48__ordinal1,c1_48__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c2_48__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e3_48__ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_48__ordinal1),[file(ordinal1,e4_48__ordinal1)]]).

fof(e4_4__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,t1_subset,t7_boole,e3_4__ordinal1,e2_4__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e4_4__ordinal1),[file(ordinal1,e4_4__ordinal1)]]).

fof(e4_53_1__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,rc3_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_relat_1,dt_k1_tarski,dt_k1_xboole_0,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,fc2_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,fc4_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,fc12_relat_1,fc1_xboole_0,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_53_1__ordinal1,dt_c2_53__ordinal1,de_c2_53__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e3_53_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_53_1__ordinal1),[file(ordinal1,e4_53_1__ordinal1)]]).

fof(e4_53__ordinal1,plain,(
    k2_relat_1(c3_53__ordinal1) = k1_xboole_0 ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,t2_subset,antisymmetry_r2_hidden,t1_subset,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,rc4_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc6_relat_1,fc7_relat_1,fc8_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t7_boole,t8_boole,dt_k1_relat_1,dt_k1_xboole_0,dt_k2_relat_1,dt_c2_53__ordinal1,dt_c3_53__ordinal1,de_c2_53__ordinal1,de_c3_53__ordinal1,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t6_boole,e2_53__ordinal1,t65_relat_1]),
    [lemma_conjecture,file(ordinal1,e4_53__ordinal1),[file(ordinal1,e4_53__ordinal1)]]).

fof(e4_5__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_5__ordinal1,t1_subset,t7_boole,e3_5__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_5__ordinal1),[file(ordinal1,e4_5__ordinal1)]]).

fof(e4_60_1_1__ordinal1,plain,
    ( v1_relat_1(c2_60_1_1__ordinal1)
    & v1_funct_1(c2_60_1_1__ordinal1)
    & v5_ordinal1(c2_60_1_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_60__ordinal1,dt_c1_60_1_1__ordinal1,dt_c2_60_1_1__ordinal1,rc4_ordinal1,rc1_funct_1,t1_subset,t7_boole,e1_60__ordinal1,e3_60_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60_1_1__ordinal1),[file(ordinal1,e4_60_1_1__ordinal1)]]).

fof(e4_60_1__ordinal1,plain,
    ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),c4_60_1__ordinal1)
    & r2_hidden(c4_60_1__ordinal1,c1_60__ordinal1) ),
    inference(consider,[],[dh_c4_60_1,e3_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60_1__ordinal1),[file(ordinal1,e4_60_1__ordinal1)]]).

fof(e4_60_2__ordinal1,plain,(
    c2_60_2__ordinal1 = c3_60_2__ordinal1 ),
    inference(mizar_by,[],[cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,dt_c1_60_2__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,dt_k1_relat_1,dt_c2_60_2__ordinal1,dt_c3_60_2__ordinal1,dt_c4_60_2__ordinal1,de_c4_60_2__ordinal1,e3_60_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60_2__ordinal1),[file(ordinal1,e4_60_2__ordinal1)]]).

fof(e4_60_3__ordinal1,plain,(
    k1_relat_1(c3_60_3__ordinal1) = c2_60_3__ordinal1 ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_3__ordinal1,dt_c2_60_3__ordinal1,dt_c3_60__ordinal1,dt_c3_60_3__ordinal1,de_c3_60_3__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e7_60__ordinal1,e1_60_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60_3__ordinal1),[file(ordinal1,e4_60_3__ordinal1)]]).

fof(e4_60_4__ordinal1,plain,(
    r2_hidden(k4_tarski(c2_60_4__ordinal1,c1_60_4__ordinal1),c3_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_funct_1,dt_k1_relat_1,dt_k4_tarski,dt_c1_60_4__ordinal1,dt_c2_60_4__ordinal1,dt_c3_60__ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e3_60_4__ordinal1,t8_funct_1]),
    [lemma_conjecture,file(ordinal1,e4_60_4__ordinal1),[file(ordinal1,e4_60_4__ordinal1)]]).

fof(e4_60_5_1_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,c2_60_5_1_1__ordinal1),A)
      & r2_hidden(A,c1_60__ordinal1) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1_1__ordinal1,dt_c2_60__ordinal1,dt_c2_60_5_1_1__ordinal1,de_c2_60__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e3_60_5_1_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e4_60_5_1_1__ordinal1),[file(ordinal1,e4_60_5_1_1__ordinal1)]]).

fof(e4_60_5_1_2_2__ordinal1,plain,(
    r2_hidden(k4_tarski(c2_60_5_1_2_2__ordinal1,c1_60_5_1_2_2__ordinal1),c3_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_funct_1,dt_k1_relat_1,dt_k4_tarski,dt_c1_60_5_1_2_2__ordinal1,dt_c2_60_5_1_2_2__ordinal1,dt_c3_60__ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e3_60_5_1_2_2__ordinal1,t8_funct_1]),
    [lemma_conjecture,file(ordinal1,e4_60_5_1_2_2__ordinal1),[file(ordinal1,e4_60_5_1_2_2__ordinal1)]]).

fof(e4_60_5_1_2__ordinal1,plain,(
    r1_ordinal1(c5_60__ordinal1,c2_60_5_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,dt_c1_60_5_1__ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc6_relat_1,fc8_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k2_relat_1,dt_c2_60_5_1__ordinal1,dt_c3_60__ordinal1,dt_c5_60__ordinal1,de_c2_60_5_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e3_60_5_1_2__ordinal1,e15_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60_5_1_2__ordinal1),[file(ordinal1,e4_60_5_1_2__ordinal1)]]).

fof(e4_60_5_1__ordinal1,plain,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & v5_ordinal1(A)
      & r2_hidden(A,c1_60__ordinal1)
      & r2_hidden(c2_60_5_1__ordinal1,k1_relat_1(A)) ) ),
    inference(discharge_asm,[discharged([e1_60_5_1_2__ordinal1])],[i1_60_5_1_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60_5_1__ordinal1),[file(ordinal1,e4_60_5_1__ordinal1)]]).

fof(e4_60__ordinal1,plain,
    ( v1_relat_1(k3_tarski(c1_60__ordinal1))
    & v1_funct_1(k3_tarski(c1_60__ordinal1)) ),
    inference(mizar_by,[],[dt_k3_tarski,dt_c1_60__ordinal1,rc1_funct_1,e3_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_60__ordinal1),[file(ordinal1,e4_60__ordinal1)]]).

fof(e4_9__ordinal1,plain,(
    r2_hidden(c1_9__ordinal1,k2_xboole_0(c2_9__ordinal1,k1_tarski(c2_9__ordinal1))) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_9__ordinal1,dt_c2_9__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e3_9__ordinal1,e1_9__ordinal1]),
    [lemma_conjecture,file(ordinal1,e4_9__ordinal1),[file(ordinal1,e4_9__ordinal1)]]).

fof(e5_10__ordinal1,plain,(
    r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_10__ordinal1,dt_c2_10__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e4_10__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_10__ordinal1),[file(ordinal1,e5_10__ordinal1)]]).

fof(e5_1__ordinal1,plain,(
    ~ ( c4_1__ordinal1 != c1_1__ordinal1
      & c4_1__ordinal1 != c2_1__ordinal1
      & c4_1__ordinal1 != c3_1__ordinal1 ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_enumset1,dt_c1_1__ordinal1,dt_c2_1__ordinal1,dt_c3_1__ordinal1,dt_c4_1__ordinal1,t1_subset,t7_boole,e3_1__ordinal1,d1_enumset1]),
    [lemma_conjecture,file(ordinal1,e5_1__ordinal1),[file(ordinal1,e5_1__ordinal1)]]).

fof(e5_20_3__ordinal1,plain,(
    ~ r2_hidden(c4_20__ordinal1,c2_20_3__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,dt_c2_20_3__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e4_20_3__ordinal1,e7_20__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e5_20_3__ordinal1),[file(ordinal1,e5_20_3__ordinal1)]]).

fof(e5_20__ordinal1,plain,(
    r2_hidden(c3_20__ordinal1,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc4_funct_1,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,rc1_relat_1,fc3_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t8_boole,antisymmetry_r2_hidden,dt_k1_xboole_0,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,dt_c3_20__ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t1_subset,t3_boole,t4_boole,t6_boole,t7_boole,e4_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_20__ordinal1),[file(ordinal1,e5_20__ordinal1)]]).

fof(e5_21__ordinal1,plain,(
    r2_hidden(c1_21__ordinal1,c3_21__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_c1_21__ordinal1,dt_c3_21__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e4_21__ordinal1,t21_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_21__ordinal1),[file(ordinal1,e5_21__ordinal1)]]).

fof(e5_22_1__ordinal1,plain,(
    r2_hidden(c2_22_1__ordinal1,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,dt_c2_22_1__ordinal1,t1_subset,t7_boole,e4_22_1__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e5_22_1__ordinal1),[file(ordinal1,e5_22_1__ordinal1)]]).

fof(e5_22__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c1_22__ordinal1)
     => r1_tarski(A,c1_22__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_22_1__ordinal1])],[i1_22_1__ordinal1]),dh_c1_22_1]),
    [lemma_conjecture,file(ordinal1,e5_22__ordinal1),[file(ordinal1,e5_22__ordinal1)]]).

fof(e5_23__ordinal1,plain,
    ( r2_hidden(c3_23__ordinal1,c1_23__ordinal1)
    & ~ r2_hidden(c3_23__ordinal1,c2_23__ordinal1) ),
    inference(consider,[],[dh_c3_23,e4_23__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_23__ordinal1),[file(ordinal1,e5_23__ordinal1)]]).

fof(e5_2__ordinal1,plain,(
    ~ ( c5_2__ordinal1 != c1_2__ordinal1
      & c5_2__ordinal1 != c2_2__ordinal1
      & c5_2__ordinal1 != c3_2__ordinal1
      & c5_2__ordinal1 != c4_2__ordinal1 ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k2_enumset1,dt_c1_2__ordinal1,dt_c2_2__ordinal1,dt_c3_2__ordinal1,dt_c4_2__ordinal1,dt_c5_2__ordinal1,t1_subset,t7_boole,e3_2__ordinal1,d2_enumset1]),
    [lemma_conjecture,file(ordinal1,e5_2__ordinal1),[file(ordinal1,e5_2__ordinal1)]]).

fof(e5_30__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(A,k1_ordinal1(c1_30__ordinal1))
        & r2_hidden(B,k1_ordinal1(c1_30__ordinal1))
        & ~ r2_hidden(A,B)
        & A != B
        & ~ r2_hidden(B,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_30_3__ordinal1])],[i1_30_3__ordinal1]),dh_c1_30_3]),
    [lemma_conjecture,file(ordinal1,e5_30__ordinal1),[file(ordinal1,e5_30__ordinal1)]]).

fof(e5_31_1__ordinal1,plain,(
    v3_ordinal1(c2_31_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,dt_c1_31__ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c2_31__ordinal1,dt_c2_31_1__ordinal1,de_c2_31__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e4_31_1__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_31_1__ordinal1),[file(ordinal1,e5_31_1__ordinal1)]]).

fof(e5_31__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c3_31__ordinal1,A)
      & r2_hidden(A,c1_31__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_31__ordinal1,dt_c3_31__ordinal1,dt_c4_31__ordinal1,t1_subset,t7_boole,e4_31__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e5_31__ordinal1),[file(ordinal1,e5_31__ordinal1)]]).

fof(e5_34__ordinal1,plain,(
    ~ ( ~ r2_hidden(c2_34__ordinal1,c3_34__ordinal1)
      & c2_34__ordinal1 != c3_34__ordinal1
      & ~ r2_hidden(c3_34__ordinal1,c2_34__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c2_34__ordinal1,dt_c3_34__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e4_34__ordinal1,t24_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_34__ordinal1),[file(ordinal1,e5_34__ordinal1)]]).

fof(e5_35__ordinal1,plain,
    ( r2_hidden(c4_35__ordinal1,c1_35__ordinal1)
    & ! [A] : 
        ~ ( r2_hidden(A,c1_35__ordinal1)
          & r2_hidden(A,c4_35__ordinal1) ) ),
    inference(consider,[],[dh_c4_35,e4_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_35__ordinal1),[file(ordinal1,e5_35__ordinal1)]]).

fof(e5_36_1__ordinal1,plain,(
    r1_tarski(k2_xboole_0(c1_36__ordinal1,k1_tarski(c1_36__ordinal1)),c2_36__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,redefinition_r1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_36__ordinal1,dt_c2_36__ordinal1,t3_subset,e4_36_1__ordinal1,e2_36_1__ordinal1,t8_xboole_1]),
    [lemma_conjecture,file(ordinal1,e5_36_1__ordinal1),[file(ordinal1,e5_36_1__ordinal1)]]).

fof(e5_37__ordinal1,plain,(
    r2_hidden(c2_37__ordinal1,k1_ordinal1(c2_37__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_37__ordinal1),[file(ordinal1,e5_37__ordinal1)]]).

fof(e5_40_1__ordinal1,plain,(
    r1_tarski(c1_40_1__ordinal1,c2_40_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_40__ordinal1,dt_c1_40_1__ordinal1,dt_c2_40_1__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e4_40_1__ordinal1,e3_40_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_40_1__ordinal1),[file(ordinal1,e5_40_1__ordinal1)]]).

fof(e5_40__ordinal1,plain,
    ( r2_hidden(c2_40__ordinal1,c4_40__ordinal1)
    & r2_hidden(c4_40__ordinal1,c1_40__ordinal1) ),
    inference(consider,[],[dh_c4_40,e4_40__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_40__ordinal1),[file(ordinal1,e5_40__ordinal1)]]).

fof(e5_41__ordinal1,plain,(
    v3_ordinal1(c3_41__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_41__ordinal1,dt_c3_41__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e4_41__ordinal1,e1_41__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_41__ordinal1),[file(ordinal1,e5_41__ordinal1)]]).

fof(e5_42__ordinal1,plain,(
    v3_ordinal1(c1_42__ordinal1) ),
    inference(mizar_by,[],[dt_c1_42__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,e4_42__ordinal1,e3_42__ordinal1,d4_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_42__ordinal1),[file(ordinal1,e5_42__ordinal1)]]).

fof(e5_43__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => r2_hidden(A,c2_43__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_43_1__ordinal1])],[i1_43_1__ordinal1]),dh_c1_43_1]),
    [lemma_conjecture,file(ordinal1,e5_43__ordinal1),[file(ordinal1,e5_43__ordinal1)]]).

fof(e5_44__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c3_44__ordinal1)
     => r2_hidden(A,k1_ordinal1(c2_44__ordinal1)) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_44__ordinal1,dt_c2_44__ordinal1,dt_c3_44__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e4_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_44__ordinal1),[file(ordinal1,e5_44__ordinal1)]]).

fof(e5_47_1__ordinal1,plain,
    ( r2_hidden(c1_47_1__ordinal1,c2_47_1__ordinal1)
    & r2_hidden(c2_47_1__ordinal1,c1_47__ordinal1) ),
    inference(consider,[],[dh_c2_47_1,e4_47_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_47_1__ordinal1),[file(ordinal1,e5_47_1__ordinal1)]]).

fof(e5_47_2__ordinal1,plain,(
    r2_hidden(c1_47_2__ordinal1,k3_tarski(c1_47__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k3_tarski,dt_c1_47__ordinal1,dt_c1_47_2__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e4_47_2__ordinal1,e3_47_2__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e5_47_2__ordinal1),[file(ordinal1,e5_47_2__ordinal1)]]).

fof(e5_47_3__ordinal1,plain,(
    r2_hidden(c1_47_3__ordinal1,c1_47__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_47__ordinal1,dt_c1_47_3__ordinal1,dt_c2_47_3__ordinal1,t1_subset,t3_subset,t7_boole,e4_47_3__ordinal1,e3_47_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_47_3__ordinal1),[file(ordinal1,e5_47_3__ordinal1)]]).

fof(e5_47__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k3_tarski(c1_47__ordinal1))
     => r2_hidden(A,c1_47__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_47_3__ordinal1])],[i1_47_3__ordinal1]),dh_c1_47_3]),
    [lemma_conjecture,file(ordinal1,e5_47__ordinal1),[file(ordinal1,e5_47__ordinal1)]]).

fof(e5_48_1__ordinal1,plain,(
    r1_ordinal1(k1_ordinal1(c1_48_1__ordinal1),c1_48__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c1_48_1__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e3_48_1__ordinal1,t33_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_48_1__ordinal1),[file(ordinal1,e5_48_1__ordinal1)]]).

fof(e5_48__ordinal1,plain,(
    ~ r2_hidden(k1_ordinal1(c2_48__ordinal1),c1_48__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c2_48__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e3_48__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_48__ordinal1),[file(ordinal1,e5_48__ordinal1)]]).

fof(e5_53__ordinal1,plain,(
    r1_tarski(k2_relat_1(c3_53__ordinal1),c1_53__ordinal1) ),
    inference(mizar_by,[],[antisymmetry_r2_hidden,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,dt_c2_53__ordinal1,de_c2_53__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,rc4_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc6_relat_1,fc8_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t7_boole,t8_boole,reflexivity_r1_tarski,dt_k1_xboole_0,dt_k2_relat_1,dt_c1_53__ordinal1,dt_c3_53__ordinal1,de_c3_53__ordinal1,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t3_subset,t6_boole,e4_53__ordinal1,t2_xboole_1]),
    [lemma_conjecture,file(ordinal1,e5_53__ordinal1),[file(ordinal1,e5_53__ordinal1)]]).

fof(e5_60_1_1__ordinal1,plain,
    ( c3_60_1_1__ordinal1 = c3_60_1_1__ordinal1
    & ! [A] : 
        ~ ( r2_hidden(A,c3_60_1_1__ordinal1)
          & ! [B,C] : k4_tarski(B,C) != A ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,dt_c2_60_1_1__ordinal1,cc3_ordinal1,rc4_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c3_60_1_1__ordinal1,de_c3_60_1_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,d1_relat_1]),
    [lemma_conjecture,file(ordinal1,e5_60_1_1__ordinal1),[file(ordinal1,e5_60_1_1__ordinal1)]]).

fof(e5_60_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),A)
      & r2_hidden(A,c1_60__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1__ordinal1,dt_c2_60_1__ordinal1,dt_c3_60_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e2_60_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e5_60_1__ordinal1),[file(ordinal1,e5_60_1__ordinal1)]]).

fof(e5_60_3__ordinal1,plain,(
    v3_ordinal1(c2_60_3__ordinal1) ),
    inference(mizar_by,[],[dt_c1_60_3__ordinal1,cc2_ordinal1,rc1_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,dt_k1_relat_1,dt_c2_60_3__ordinal1,dt_c3_60_3__ordinal1,de_c3_60_3__ordinal1,cc1_ordinal1,e4_60_3__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_60_3__ordinal1),[file(ordinal1,e5_60_3__ordinal1)]]).

fof(e5_60_4__ordinal1,plain,(
    v3_ordinal1(c1_60_4__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_60_4__ordinal1,dt_c2_60_4__ordinal1,dt_c3_60__ordinal1,cc1_ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e4_60_4__ordinal1,e8_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_60_4__ordinal1),[file(ordinal1,e5_60_4__ordinal1)]]).

fof(e5_60_5_1_1__ordinal1,plain,
    ( r2_hidden(k4_tarski(c1_60_5_1_1__ordinal1,c2_60_5_1_1__ordinal1),c3_60_5_1_1__ordinal1)
    & r2_hidden(c3_60_5_1_1__ordinal1,c1_60__ordinal1) ),
    inference(consider,[],[dh_c3_60_5_1_1,e4_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_60_5_1_1__ordinal1),[file(ordinal1,e5_60_5_1_1__ordinal1)]]).

fof(e5_60_5_1_2_2__ordinal1,plain,(
    r2_hidden(c2_60_5_1_2_2__ordinal1,c1_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1_2_2__ordinal1,dt_c2_60_5_1_2_2__ordinal1,dt_c3_60__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e4_60_5_1_2_2__ordinal1,e7_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_60_5_1_2_2__ordinal1),[file(ordinal1,e5_60_5_1_2_2__ordinal1)]]).

fof(e5_60_5_1_2__ordinal1,plain,(
    r1_ordinal1(c2_60_5_1__ordinal1,c5_60__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c1_60_5_1__ordinal1,dt_c2_60_5_1__ordinal1,dt_c5_60__ordinal1,de_c2_60_5_1__ordinal1,t1_subset,t3_subset,t7_boole,e2_60_5_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_60_5_1_2__ordinal1),[file(ordinal1,e5_60_5_1_2__ordinal1)]]).

fof(e5_60_5_1__ordinal1,plain,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & v5_ordinal1(A)
      & r2_hidden(A,c1_60__ordinal1)
      & r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(A)) ) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c1_60__ordinal1,dt_c1_60_5_1__ordinal1,dt_c2_60_5_1__ordinal1,de_c2_60_5_1__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,t1_subset,t7_boole,e4_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e5_60_5_1__ordinal1),[file(ordinal1,e5_60_5_1__ordinal1)]]).

fof(e5_60__ordinal1,plain,(
    ! [A,B,C] : 
      ( ( r2_hidden(A,c1_60__ordinal1)
        & ! [D] : 
            ( ( v1_relat_1(D)
              & v1_funct_1(D)
              & v5_ordinal1(D) )
           => ( D = A
             => k1_relat_1(D) = B ) )
        & r2_hidden(A,c1_60__ordinal1)
        & ! [D] : 
            ( ( v1_relat_1(D)
              & v1_funct_1(D)
              & v5_ordinal1(D) )
           => ( D = A
             => k1_relat_1(D) = C ) ) )
     => B = C ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_2__ordinal1])],[i1_60_2__ordinal1]),dh_c1_60_2]),
    [lemma_conjecture,file(ordinal1,e5_60__ordinal1),[file(ordinal1,e5_60__ordinal1)]]).

fof(e5_9__ordinal1,plain,
    ( r2_hidden(c1_9__ordinal1,c2_9__ordinal1)
    | r2_hidden(c1_9__ordinal1,k1_tarski(c2_9__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_tarski,dt_k2_xboole_0,dt_c1_9__ordinal1,dt_c2_9__ordinal1,t1_subset,t7_boole,e4_9__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e5_9__ordinal1),[file(ordinal1,e5_9__ordinal1)]]).

fof(e6_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_1__ordinal1,c2_1__ordinal1)
      & r2_hidden(c2_1__ordinal1,c3_1__ordinal1)
      & r2_hidden(c3_1__ordinal1,c1_1__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_enumset1,dt_c1_1__ordinal1,dt_c2_1__ordinal1,dt_c3_1__ordinal1,dt_c4_1__ordinal1,t1_subset,t7_boole,e5_1__ordinal1,e1_1__ordinal1,e4_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_1__ordinal1),[file(ordinal1,e6_1__ordinal1)]]).

fof(e6_20_3__ordinal1,plain,(
    r2_hidden(c1_20_3__ordinal1,c4_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_20__ordinal1,dt_c1_20_3__ordinal1,dt_c2_20__ordinal1,dt_c2_20_3__ordinal1,dt_c4_20__ordinal1,t1_subset,t3_subset,t7_boole,e5_20_3__ordinal1,e2_20__ordinal1,e9_20__ordinal1,e3_20_3__ordinal1,d3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_20_3__ordinal1),[file(ordinal1,e6_20_3__ordinal1)]]).

fof(e6_20__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
      & ! [B] : 
          ~ ( r2_hidden(B,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
            & r2_hidden(B,A) ) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,dt_c3_20__ordinal1,t1_subset,t7_boole,e5_20__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e6_20__ordinal1),[file(ordinal1,e6_20__ordinal1)]]).

fof(e6_22_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
      & ! [B] : 
          ~ ( r2_hidden(B,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
            & r2_hidden(B,A) ) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,dt_c2_22_1__ordinal1,t1_subset,t7_boole,e5_22_1__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e6_22_1__ordinal1),[file(ordinal1,e6_22_1__ordinal1)]]).

fof(e6_22__ordinal1,plain,(
    v1_ordinal1(c1_22__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_22__ordinal1,t1_subset,t3_subset,t7_boole,e5_22__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_22__ordinal1),[file(ordinal1,e6_22__ordinal1)]]).

fof(e6_23__ordinal1,plain,(
    r2_hidden(c3_23__ordinal1,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_23__ordinal1,dt_c2_23__ordinal1,dt_c3_23__ordinal1,t1_subset,t7_boole,e5_23__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e6_23__ordinal1),[file(ordinal1,e6_23__ordinal1)]]).

fof(e6_2__ordinal1,plain,(
    ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
      & r2_hidden(c2_2__ordinal1,c3_2__ordinal1)
      & r2_hidden(c3_2__ordinal1,c4_2__ordinal1)
      & r2_hidden(c4_2__ordinal1,c1_2__ordinal1) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k2_enumset1,dt_c1_2__ordinal1,dt_c2_2__ordinal1,dt_c3_2__ordinal1,dt_c4_2__ordinal1,dt_c5_2__ordinal1,t1_subset,t7_boole,e5_2__ordinal1,e1_2__ordinal1,e4_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_2__ordinal1),[file(ordinal1,e6_2__ordinal1)]]).

fof(e6_30__ordinal1,plain,(
    v2_ordinal1(k1_ordinal1(c1_30__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_30__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e5_30__ordinal1,d3_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_30__ordinal1),[file(ordinal1,e6_30__ordinal1)]]).

fof(e6_31_1__ordinal1,plain,(
    r1_ordinal1(c3_31_1__ordinal1,c2_31__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c1_31__ordinal1,dt_c1_31_1__ordinal1,dt_c2_31__ordinal1,dt_c2_31_1__ordinal1,dt_c3_31_1__ordinal1,de_c2_31__ordinal1,de_c3_31_1__ordinal1,t1_subset,t3_subset,t7_boole,e3_31_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_31_1__ordinal1),[file(ordinal1,e6_31_1__ordinal1)]]).

fof(e6_31__ordinal1,plain,
    ( r2_hidden(c3_31__ordinal1,c5_31__ordinal1)
    & r2_hidden(c5_31__ordinal1,c1_31__ordinal1) ),
    inference(consider,[],[dh_c5_31,e5_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_31__ordinal1),[file(ordinal1,e6_31__ordinal1)]]).

fof(e6_35__ordinal1,plain,(
    v3_ordinal1(c4_35__ordinal1) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_xboole_0,dt_c1_35__ordinal1,dt_c2_35__ordinal1,dt_c4_35__ordinal1,cc1_ordinal1,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t1_subset,t3_subset,t6_boole,t7_boole,e2_35__ordinal1,e5_35__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_35__ordinal1),[file(ordinal1,e6_35__ordinal1)]]).

fof(e6_36_1__ordinal1,plain,(
    r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_36__ordinal1,dt_c2_36__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,e5_36_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_36_1__ordinal1),[file(ordinal1,e6_36_1__ordinal1)]]).

fof(e6_37__ordinal1,plain,(
    r1_ordinal1(c2_37__ordinal1,k1_ordinal1(c2_37__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e5_37__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_37__ordinal1),[file(ordinal1,e6_37__ordinal1)]]).

fof(e6_40_1__ordinal1,axiom,(
    r2_hidden(c3_40_1__ordinal1,c1_40_1__ordinal1) ),
    file(ordinal1,e6_40_1__ordinal1),
    [assumption,axiom,file(ordinal1,e6_40_1__ordinal1)]).

fof(e6_40__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c3_40__ordinal1,A)
      & r2_hidden(A,c1_40__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dt_c2_40__ordinal1,dt_c3_40__ordinal1,t1_subset,t7_boole,e3_40__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e6_40__ordinal1),[file(ordinal1,e6_40__ordinal1)]]).

fof(e6_41__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c4_41__ordinal1)
     => r2_hidden(A,k3_tarski(c1_41__ordinal1)) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_41__ordinal1,dt_c3_41__ordinal1,dt_c4_41__ordinal1,de_c4_41__ordinal1,t1_subset,t7_boole,e4_41__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e6_41__ordinal1),[file(ordinal1,e6_41__ordinal1)]]).

fof(e6_42__ordinal1,plain,(
    r2_hidden(c1_42__ordinal1,c1_42__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_42__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e5_42__ordinal1,e2_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_42__ordinal1),[file(ordinal1,e6_42__ordinal1)]]).

fof(e6_43__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,c2_43__ordinal1)
    <=> v3_ordinal1(A) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_43__ordinal1,dt_c2_43__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e5_43__ordinal1,e4_43__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_43__ordinal1),[file(ordinal1,e6_43__ordinal1)]]).

fof(e6_44__ordinal1,plain,(
    r1_tarski(c3_44__ordinal1,k1_ordinal1(c2_44__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c2_44__ordinal1,dt_c3_44__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e5_44__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e6_44__ordinal1),[file(ordinal1,e6_44__ordinal1)]]).

fof(e6_47_1__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k1_tarski(c1_47_1__ordinal1))
     => r2_hidden(A,c2_47_1__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_47__ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,t1_subset,t7_boole,e5_47_1__ordinal1,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e6_47_1__ordinal1),[file(ordinal1,e6_47_1__ordinal1)]]).

fof(e6_47__ordinal1,plain,(
    r1_ordinal1(k3_tarski(c1_47__ordinal1),c1_47__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k3_tarski,dt_c1_47__ordinal1,t1_subset,t3_subset,t7_boole,e5_47__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e6_47__ordinal1),[file(ordinal1,e6_47__ordinal1)]]).

fof(e6_48_1__ordinal1,plain,(
    r2_xboole_0(k1_ordinal1(c1_48_1__ordinal1),c1_48__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c1_48_1__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,e5_48_1__ordinal1,e4_48_1__ordinal1,d8_xboole_0]),
    [lemma_conjecture,file(ordinal1,e6_48_1__ordinal1),[file(ordinal1,e6_48_1__ordinal1)]]).

fof(e6_48__ordinal1,plain,(
    ~ v4_ordinal1(c1_48__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c2_48__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e5_48__ordinal1,e4_48__ordinal1,t41_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_48__ordinal1),[file(ordinal1,e6_48__ordinal1)]]).

fof(e6_53__ordinal1,plain,(
    m1_ordinal1(k1_xboole_0,c1_53__ordinal1) ),
    inference(mizar_by,[],[antisymmetry_r2_hidden,t1_subset,t4_subset,t5_subset,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,dt_c2_53__ordinal1,de_c2_53__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc6_relat_1,fc8_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t7_boole,t8_boole,reflexivity_r1_tarski,existence_m1_ordinal1,dt_k1_xboole_0,dt_k2_relat_1,dt_m1_ordinal1,dt_c1_53__ordinal1,dt_c3_53__ordinal1,de_c3_53__ordinal1,fc2_ordinal1,rc4_ordinal1,rc1_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t3_subset,t6_boole,e5_53__ordinal1,d8_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_53__ordinal1),[file(ordinal1,e6_53__ordinal1)]]).

fof(e6_60_1_1__ordinal1,plain,(
    ? [A,B] : k4_tarski(A,B) = c1_60_1_1__ordinal1 ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,rc4_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1_1__ordinal1,dt_c2_60_1_1__ordinal1,dt_c3_60_1_1__ordinal1,de_c3_60_1_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e5_60_1_1__ordinal1,e3_60_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_60_1_1__ordinal1),[file(ordinal1,e6_60_1_1__ordinal1)]]).

fof(e6_60_1__ordinal1,plain,
    ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),c5_60_1__ordinal1)
    & r2_hidden(c5_60_1__ordinal1,c1_60__ordinal1) ),
    inference(consider,[],[dh_c5_60_1,e5_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_60_1__ordinal1),[file(ordinal1,e6_60_1__ordinal1)]]).

fof(e6_60_5_1_1__ordinal1,plain,
    ( v1_relat_1(c3_60_5_1_1__ordinal1)
    & v1_funct_1(c3_60_5_1_1__ordinal1)
    & v5_ordinal1(c3_60_5_1_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1_1__ordinal1,dt_c2_60_5_1_1__ordinal1,dt_c3_60_5_1_1__ordinal1,rc4_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e1_60__ordinal1,e5_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_60_5_1_1__ordinal1),[file(ordinal1,e6_60_5_1_1__ordinal1)]]).

fof(e6_60_5_1_2_2__ordinal1,plain,
    ( v1_relat_1(c2_60_5_1_2_2__ordinal1)
    & v1_funct_1(c2_60_5_1_2_2__ordinal1)
    & v5_ordinal1(c2_60_5_1_2_2__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_60__ordinal1,dt_c2_60_5_1_2_2__ordinal1,rc4_ordinal1,rc1_funct_1,t1_subset,t7_boole,e5_60_5_1_2_2__ordinal1,e1_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_60_5_1_2_2__ordinal1),[file(ordinal1,e6_60_5_1_2_2__ordinal1)]]).

fof(e6_60_5_1_2__ordinal1,plain,(
    c5_60__ordinal1 = c1_60_5_1__ordinal1 ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,redefinition_r1_ordinal1,dt_c1_60_5_1__ordinal1,dt_c2_60_5_1__ordinal1,dt_c5_60__ordinal1,de_c2_60_5_1__ordinal1,t3_subset,e5_60_5_1_2__ordinal1,e4_60_5_1_2__ordinal1,d10_xboole_0]),
    [lemma_conjecture,file(ordinal1,e6_60_5_1_2__ordinal1),[file(ordinal1,e6_60_5_1_2__ordinal1)]]).

fof(e6_60_5_1__ordinal1,plain,
    ( r2_hidden(c3_60_5_1__ordinal1,c1_60__ordinal1)
    & r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(c3_60_5_1__ordinal1)) ),
    inference(consider,[],[dh_c3_60_5_1,e5_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_60_5_1__ordinal1),[file(ordinal1,e6_60_5_1__ordinal1)]]).

fof(e6_60__ordinal1,plain,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & ! [B,C] : 
          ( r2_hidden(k4_tarski(B,C),A)
        <=> ( r2_hidden(B,c1_60__ordinal1)
            & r2_hidden(B,c1_60__ordinal1)
            & ! [D] : 
                ( ( v1_relat_1(D)
                  & v1_funct_1(D)
                  & v5_ordinal1(D) )
               => ( D = B
                 => k1_relat_1(D) = C ) ) ) ) ) ),
    inference(mizar_from,[],[rc2_ordinal1,rc3_funct_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,fc1_zfmisc_1,s1_funct_1__e6_60__ordinal1,e5_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_60__ordinal1),[file(ordinal1,e6_60__ordinal1)]]).

fof(e6_9__ordinal1,plain,(
    r2_hidden(c2_9__ordinal1,k1_ordinal1(c2_9__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c2_9__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e6_9__ordinal1),[file(ordinal1,e6_9__ordinal1)]]).

fof(e7_20__ordinal1,plain,(
    r2_hidden(c4_20__ordinal1,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1)) ),
    inference(consider,[],[dh_c4_20,e6_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_20__ordinal1),[file(ordinal1,e7_20__ordinal1)]]).

fof(e7_22_1__ordinal1,plain,
    ( r2_hidden(c3_22_1__ordinal1,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
    & ! [A] : 
        ~ ( r2_hidden(A,k4_xboole_0(c1_22_1__ordinal1,c1_22__ordinal1))
          & r2_hidden(A,c3_22_1__ordinal1) ) ),
    inference(consider,[],[dh_c3_22_1,e6_22_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_22_1__ordinal1),[file(ordinal1,e7_22_1__ordinal1)]]).

fof(e7_22__ordinal1,plain,(
    v3_ordinal1(c1_22__ordinal1) ),
    inference(mizar_by,[],[dt_c1_22__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,e6_22__ordinal1,e4_22__ordinal1,d4_ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_22__ordinal1),[file(ordinal1,e7_22__ordinal1)]]).

fof(e7_23__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
      & ! [B] : 
          ~ ( r2_hidden(B,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
            & r2_hidden(B,A) ) ) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_23__ordinal1,dt_c2_23__ordinal1,dt_c3_23__ordinal1,t1_subset,t7_boole,e6_23__ordinal1,t7_tarski]),
    [lemma_conjecture,file(ordinal1,e7_23__ordinal1),[file(ordinal1,e7_23__ordinal1)]]).

fof(e7_30__ordinal1,plain,(
    v3_ordinal1(k1_ordinal1(c1_30__ordinal1)) ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,t2_subset,antisymmetry_r2_hidden,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,dt_k1_tarski,dt_k2_xboole_0,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t6_boole,t7_boole,t8_boole,dt_k1_ordinal1,dt_c1_30__ordinal1,fc1_ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,d1_ordinal1,e6_30__ordinal1,e4_30__ordinal1,d4_ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_30__ordinal1),[file(ordinal1,e7_30__ordinal1)]]).

fof(e7_31_1__ordinal1,plain,(
    r1_tarski(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k3_tarski,dt_c1_31__ordinal1,dt_c1_31_1__ordinal1,dt_c2_31__ordinal1,dt_c2_31_1__ordinal1,dt_c3_31_1__ordinal1,de_c2_31__ordinal1,de_c3_31_1__ordinal1,t1_subset,t3_subset,t7_boole,e6_31_1__ordinal1,e3_31_1__ordinal1,t92_zfmisc_1]),
    [lemma_conjecture,file(ordinal1,e7_31_1__ordinal1),[file(ordinal1,e7_31_1__ordinal1)]]).

fof(e7_31__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(c4_31__ordinal1,A)
      & r2_hidden(A,c1_31__ordinal1) ) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_31__ordinal1,dt_c3_31__ordinal1,dt_c4_31__ordinal1,t1_subset,t7_boole,e4_31__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e7_31__ordinal1),[file(ordinal1,e7_31__ordinal1)]]).

fof(e7_35__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & A = c4_35__ordinal1 ) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,dt_c4_35__ordinal1,cc1_ordinal1,e6_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_35__ordinal1),[file(ordinal1,e7_35__ordinal1)]]).

fof(e7_37__ordinal1,plain,(
    r1_ordinal1(k1_ordinal1(c2_37__ordinal1),c2_37__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c1_37__ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e2_37__ordinal1,e4_37__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_37__ordinal1),[file(ordinal1,e7_37__ordinal1)]]).

fof(e7_40_1__ordinal1,plain,(
    r2_hidden(c3_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dt_c1_40_1__ordinal1,dt_c2_40_1__ordinal1,dt_c3_40_1__ordinal1,t1_subset,t3_subset,t7_boole,e6_40_1__ordinal1,e3_40_1__ordinal1,e5_40_1__ordinal1,d4_tarski]),
    [lemma_conjecture,file(ordinal1,e7_40_1__ordinal1),[file(ordinal1,e7_40_1__ordinal1)]]).

fof(e7_40__ordinal1,plain,
    ( r2_hidden(c3_40__ordinal1,c5_40__ordinal1)
    & r2_hidden(c5_40__ordinal1,c1_40__ordinal1) ),
    inference(consider,[],[dh_c5_40,e6_40__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_40__ordinal1),[file(ordinal1,e7_40__ordinal1)]]).

fof(e7_41__ordinal1,plain,(
    r1_tarski(c4_41__ordinal1,k3_tarski(c1_41__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,dt_c3_41__ordinal1,cc1_ordinal1,cc3_ordinal1,fc4_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_41__ordinal1,dt_c4_41__ordinal1,de_c4_41__ordinal1,t1_subset,t3_subset,t7_boole,e6_41__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e7_41__ordinal1),[file(ordinal1,e7_41__ordinal1)]]).

fof(e7_42__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_42__ordinal1,t1_subset,t7_boole,e6_42__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_42__ordinal1),[file(ordinal1,e7_42__ordinal1)]]).

fof(e7_43__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c2_43__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e6_43__ordinal1,t37_ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_43__ordinal1),[file(ordinal1,e7_43__ordinal1)]]).

fof(e7_44__ordinal1,plain,(
    r2_hidden(c2_44__ordinal1,k1_ordinal1(c2_44__ordinal1)) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_c2_44__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,t10_ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_44__ordinal1),[file(ordinal1,e7_44__ordinal1)]]).

fof(e7_47_1__ordinal1,plain,(
    r1_tarski(k1_tarski(c1_47_1__ordinal1),c2_47_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,t1_subset,t3_subset,t7_boole,e6_47_1__ordinal1,d3_tarski]),
    [lemma_conjecture,file(ordinal1,e7_47_1__ordinal1),[file(ordinal1,e7_47_1__ordinal1)]]).

fof(e7_47__ordinal1,plain,(
    c1_47__ordinal1 = k3_tarski(c1_47__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,fc4_ordinal1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,redefinition_r1_ordinal1,dt_k3_tarski,dt_c1_47__ordinal1,t3_subset,e6_47__ordinal1,e4_47__ordinal1,d10_xboole_0]),
    [lemma_conjecture,file(ordinal1,e7_47__ordinal1),[file(ordinal1,e7_47__ordinal1)]]).

fof(e7_48_1__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,irreflexivity_r2_xboole_0,antisymmetry_r2_xboole_0,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c1_48_1__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,t1_subset,t7_boole,d1_ordinal1,e6_48_1__ordinal1,e3_48_1__ordinal1,t21_ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_48_1__ordinal1),[file(ordinal1,e7_48_1__ordinal1)]]).

fof(e7_60_1__ordinal1,plain,
    ( v1_relat_1(c4_60_1__ordinal1)
    & v1_funct_1(c4_60_1__ordinal1)
    & v5_ordinal1(c4_60_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1__ordinal1,dt_c2_60_1__ordinal1,dt_c4_60_1__ordinal1,rc4_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e1_60__ordinal1,e4_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_60_1__ordinal1),[file(ordinal1,e7_60_1__ordinal1)]]).

fof(e7_60_5_1_1__ordinal1,plain,(
    r2_hidden(c1_60_5_1_1__ordinal1,k1_relat_1(c4_60_5_1_1__ordinal1)) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1_1__ordinal1,dt_c2_60_5_1_1__ordinal1,dt_c3_60_5_1_1__ordinal1,dt_c4_60_5_1_1__ordinal1,de_c4_60_5_1_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e5_60_5_1_1__ordinal1,d4_relat_1]),
    [lemma_conjecture,file(ordinal1,e7_60_5_1_1__ordinal1),[file(ordinal1,e7_60_5_1_1__ordinal1)]]).

fof(e7_60_5_1_2_2__ordinal1,plain,
    ( r2_hidden(c3_60_5_1_2_2__ordinal1,c1_60__ordinal1)
    & k1_relat_1(c3_60_5_1_2_2__ordinal1) = c1_60_5_1_2_2__ordinal1 ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1_2_2__ordinal1,dt_c2_60_5_1_2_2__ordinal1,dt_c3_60__ordinal1,dt_c3_60_5_1_2_2__ordinal1,de_c3_60_5_1_2_2__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e7_60__ordinal1,e4_60_5_1_2_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_60_5_1_2_2__ordinal1),[file(ordinal1,e7_60_5_1_2_2__ordinal1)]]).

fof(e7_60_5_1_2__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_60_5_1__ordinal1,dt_c5_60__ordinal1,t1_subset,t7_boole,e6_60_5_1_2__ordinal1,e2_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_60_5_1_2__ordinal1),[file(ordinal1,e7_60_5_1_2__ordinal1)]]).

fof(e7_60_5_1__ordinal1,plain,(
    r1_tarski(c3_60_5_1__ordinal1,c2_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,fc4_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k3_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1__ordinal1,dt_c2_60__ordinal1,dt_c3_60_5_1__ordinal1,de_c2_60__ordinal1,t1_subset,t3_subset,t7_boole,e6_60_5_1__ordinal1,t92_zfmisc_1]),
    [lemma_conjecture,file(ordinal1,e7_60_5_1__ordinal1),[file(ordinal1,e7_60_5_1__ordinal1)]]).

fof(e7_60__ordinal1,plain,(
    ! [A,B] : 
      ( r2_hidden(k4_tarski(A,B),c3_60__ordinal1)
    <=> ( r2_hidden(A,c1_60__ordinal1)
        & r2_hidden(A,c1_60__ordinal1)
        & ! [C] : 
            ( ( v1_relat_1(C)
              & v1_funct_1(C)
              & v5_ordinal1(C) )
           => ( C = A
             => k1_relat_1(C) = B ) ) ) ) ),
    inference(consider,[],[dh_c3_60,e6_60__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_60__ordinal1),[file(ordinal1,e7_60__ordinal1)]]).

fof(e7_9__ordinal1,plain,(
    r2_hidden(c2_9__ordinal1,k2_xboole_0(c1_9__ordinal1,k1_tarski(c1_9__ordinal1))) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_tarski,dt_k2_xboole_0,dt_c1_9__ordinal1,dt_c2_9__ordinal1,fc1_ordinal1,t1_subset,t7_boole,d1_ordinal1,e6_9__ordinal1,e1_9__ordinal1]),
    [lemma_conjecture,file(ordinal1,e7_9__ordinal1),[file(ordinal1,e7_9__ordinal1)]]).

fof(e8_20__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(A,k4_xboole_0(c2_20__ordinal1,c1_20__ordinal1))
        & r2_hidden(A,c4_20__ordinal1) ) ),
    inference(consider,[],[dh_c4_20,e6_20__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_20__ordinal1),[file(ordinal1,e8_20__ordinal1)]]).

fof(e8_22_1__ordinal1,plain,
    ( r2_hidden(c3_22_1__ordinal1,c1_22_1__ordinal1)
    & ~ r2_hidden(c3_22_1__ordinal1,c1_22__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,dt_c3_22_1__ordinal1,t1_subset,t7_boole,e7_22_1__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e8_22_1__ordinal1),[file(ordinal1,e8_22_1__ordinal1)]]).

fof(e8_23__ordinal1,plain,
    ( r2_hidden(c4_23__ordinal1,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
    & ! [A] : 
        ~ ( r2_hidden(A,k4_xboole_0(c1_23__ordinal1,c2_23__ordinal1))
          & r2_hidden(A,c4_23__ordinal1) ) ),
    inference(consider,[],[dh_c4_23,e7_23__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_23__ordinal1),[file(ordinal1,e8_23__ordinal1)]]).

fof(e8_31__ordinal1,plain,
    ( r2_hidden(c4_31__ordinal1,c6_31__ordinal1)
    & r2_hidden(c6_31__ordinal1,c1_31__ordinal1) ),
    inference(consider,[],[dh_c6_31,e7_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_31__ordinal1),[file(ordinal1,e8_31__ordinal1)]]).

fof(e8_35__ordinal1,plain,(
    c5_35__ordinal1 = c4_35__ordinal1 ),
    inference(consider,[],[dh_c5_35,e7_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_35__ordinal1),[file(ordinal1,e8_35__ordinal1)]]).

fof(e8_37__ordinal1,plain,(
    k1_ordinal1(c2_37__ordinal1) = c2_37__ordinal1 ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,antisymmetry_r2_hidden,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,t4_subset,t5_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t7_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,t3_subset,d1_ordinal1,e7_37__ordinal1,e6_37__ordinal1,d10_xboole_0]),
    [lemma_conjecture,file(ordinal1,e8_37__ordinal1),[file(ordinal1,e8_37__ordinal1)]]).

fof(e8_40__ordinal1,plain,
    ( v3_ordinal1(c4_40__ordinal1)
    & v3_ordinal1(c5_40__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_40__ordinal1,dt_c2_40__ordinal1,dt_c3_40__ordinal1,dt_c4_40__ordinal1,dt_c5_40__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e1_40__ordinal1,e5_40__ordinal1,e7_40__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_40__ordinal1),[file(ordinal1,e8_40__ordinal1)]]).

fof(e8_41__ordinal1,plain,(
    r2_hidden(c3_41__ordinal1,c2_41__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_k3_tarski,dt_c1_41__ordinal1,dt_c2_41__ordinal1,dt_c3_41__ordinal1,dt_c4_41__ordinal1,de_c2_41__ordinal1,de_c4_41__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,fc4_ordinal1,t1_subset,t3_subset,t7_boole,d1_ordinal1,e7_41__ordinal1,e2_41__ordinal1,t34_ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_41__ordinal1),[file(ordinal1,e8_41__ordinal1)]]).

fof(e8_44__ordinal1,plain,(
    c3_44__ordinal1 != k1_xboole_0 ),
    inference(mizar_by,[],[commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k2_xboole_0,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,fc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,fc2_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t1_boole,t2_subset,t8_boole,antisymmetry_r2_hidden,dt_k1_ordinal1,dt_k1_xboole_0,dt_c1_44__ordinal1,dt_c2_44__ordinal1,dt_c3_44__ordinal1,fc1_ordinal1,fc2_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t1_subset,t6_boole,t7_boole,d1_ordinal1,e7_44__ordinal1,e2_44__ordinal1,e4_44__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_44__ordinal1),[file(ordinal1,e8_44__ordinal1)]]).

fof(e8_47_1__ordinal1,plain,(
    v3_ordinal1(c2_47_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_47__ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e5_47_1__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_47_1__ordinal1),[file(ordinal1,e8_47_1__ordinal1)]]).

fof(e8_47__ordinal1,plain,(
    v4_ordinal1(c1_47__ordinal1) ),
    inference(mizar_by,[],[cc2_ordinal1,rc1_ordinal1,cc1_ordinal1,fc4_ordinal1,dt_k3_tarski,dt_c1_47__ordinal1,e7_47__ordinal1,d6_ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_47__ordinal1),[file(ordinal1,e8_47__ordinal1)]]).

fof(e8_60_1__ordinal1,plain,
    ( v1_relat_1(c5_60_1__ordinal1)
    & v1_funct_1(c5_60_1__ordinal1)
    & v5_ordinal1(c5_60_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1__ordinal1,dt_c3_60_1__ordinal1,dt_c5_60_1__ordinal1,rc4_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e1_60__ordinal1,e6_60_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_60_1__ordinal1),[file(ordinal1,e8_60_1__ordinal1)]]).

fof(e8_60_5_1_1__ordinal1,plain,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A) )
     => ( A = c4_60_5_1_1__ordinal1
       => k1_relat_1(A) = k1_relat_1(c4_60_5_1_1__ordinal1) ) ) ),
    inference(mizar_by,[],[dt_c3_60_5_1_1__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,dt_k1_relat_1,dt_c4_60_5_1_1__ordinal1,de_c4_60_5_1_1__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1]),
    [lemma_conjecture,file(ordinal1,e8_60_5_1_1__ordinal1),[file(ordinal1,e8_60_5_1_1__ordinal1)]]).

fof(e8_60_5_1_2_2__ordinal1,plain,(
    r1_ordinal1(c1_60_5_1_2_2__ordinal1,c2_60_5_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,dt_k1_zfmisc_1,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t4_subset,t5_subset,reflexivity_r1_tarski,existence_m1_subset_1,dt_m1_subset_1,dt_c1_60_5_1__ordinal1,dt_c2_60_5_1_2_2__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t3_subset,t6_boole,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_relat_1,dt_c1_60__ordinal1,dt_c1_60_5_1_2_2__ordinal1,dt_c2_60_5_1__ordinal1,dt_c3_60_5_1_2_2__ordinal1,de_c2_60_5_1__ordinal1,de_c3_60_5_1_2_2__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,t1_subset,t7_boole,e7_60_5_1_2_2__ordinal1,e2_60_5_1_2__ordinal1]),
    [lemma_conjecture,file(ordinal1,e8_60_5_1_2_2__ordinal1),[file(ordinal1,e8_60_5_1_2_2__ordinal1)]]).

fof(e8_60_5_1__ordinal1,plain,(
    ? [A] : r2_hidden(k4_tarski(c1_60_5_1__ordinal1,A),c3_60_5_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1__ordinal1,dt_c3_60_5_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e6_60_5_1__ordinal1,d4_relat_1]),
    [lemma_conjecture,file(ordinal1,e8_60_5_1__ordinal1),[file(ordinal1,e8_60_5_1__ordinal1)]]).

fof(e8_60__ordinal1,plain,(
    ! [A,B] : 
      ( r2_hidden(k4_tarski(A,B),c3_60__ordinal1)
     => v3_ordinal1(B) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_3__ordinal1])],[i1_60_3__ordinal1]),dh_c1_60_3]),
    [lemma_conjecture,file(ordinal1,e8_60__ordinal1),[file(ordinal1,e8_60__ordinal1)]]).

fof(e8_9__ordinal1,plain,
    ( r2_hidden(c2_9__ordinal1,c1_9__ordinal1)
    | r2_hidden(c2_9__ordinal1,k1_tarski(c1_9__ordinal1)) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t2_subset,t6_boole,t8_boole,commutativity_k2_xboole_0,idempotence_k2_xboole_0,antisymmetry_r2_hidden,dt_k1_tarski,dt_k2_xboole_0,dt_c1_9__ordinal1,dt_c2_9__ordinal1,t1_subset,t7_boole,e7_9__ordinal1,d2_xboole_0]),
    [lemma_conjecture,file(ordinal1,e8_9__ordinal1),[file(ordinal1,e8_9__ordinal1)]]).

fof(e9_20__ordinal1,plain,
    ( r2_hidden(c4_20__ordinal1,c2_20__ordinal1)
    & ~ r2_hidden(c4_20__ordinal1,c1_20__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_20__ordinal1,dt_c2_20__ordinal1,dt_c4_20__ordinal1,t1_subset,t7_boole,e7_20__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e9_20__ordinal1),[file(ordinal1,e9_20__ordinal1)]]).

fof(e9_22_1__ordinal1,plain,(
    r1_tarski(c1_22_1__ordinal1,c2_22__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_22__ordinal1,dt_c1_22_1__ordinal1,dt_c2_22__ordinal1,t1_subset,t3_subset,t7_boole,e2_22__ordinal1,e1_22_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_22_1__ordinal1),[file(ordinal1,e9_22_1__ordinal1)]]).

fof(e9_23__ordinal1,plain,
    ( r2_hidden(c4_23__ordinal1,c1_23__ordinal1)
    & ~ r2_hidden(c4_23__ordinal1,c2_23__ordinal1) ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc3_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t3_boole,t4_boole,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k4_xboole_0,dt_c1_23__ordinal1,dt_c2_23__ordinal1,dt_c4_23__ordinal1,t1_subset,t7_boole,e8_23__ordinal1,d4_xboole_0]),
    [lemma_conjecture,file(ordinal1,e9_23__ordinal1),[file(ordinal1,e9_23__ordinal1)]]).

fof(e9_31__ordinal1,plain,
    ( r2_hidden(c5_31__ordinal1,c2_31__ordinal1)
    & r2_hidden(c6_31__ordinal1,c2_31__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_31__ordinal1,dt_c2_31__ordinal1,dt_c3_31__ordinal1,dt_c4_31__ordinal1,dt_c5_31__ordinal1,dt_c6_31__ordinal1,de_c2_31__ordinal1,t1_subset,t7_boole,e6_31__ordinal1,e8_31__ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_31__ordinal1),[file(ordinal1,e9_31__ordinal1)]]).

fof(e9_35__ordinal1,plain,(
    r2_hidden(c5_35__ordinal1,c1_35__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_ordinal1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_c1_35__ordinal1,dt_c4_35__ordinal1,dt_c5_35__ordinal1,t1_subset,t7_boole,e5_35__ordinal1,e8_35__ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_35__ordinal1),[file(ordinal1,e9_35__ordinal1)]]).

fof(e9_37__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[existence_m1_subset_1,dt_m1_subset_1,rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,t2_subset,antisymmetry_r2_hidden,dt_k1_xboole_0,cc2_ordinal1,rc1_ordinal1,fc2_ordinal1,rc3_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc2_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t1_boole,t1_subset,commutativity_k2_xboole_0,idempotence_k2_xboole_0,dt_k1_tarski,dt_k2_xboole_0,cc1_ordinal1,cc3_ordinal1,fc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t6_boole,t7_boole,t8_boole,dt_k1_ordinal1,dt_c2_37__ordinal1,fc1_ordinal1,d1_ordinal1,e8_37__ordinal1,t14_ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_37__ordinal1),[file(ordinal1,e9_37__ordinal1)]]).

fof(e9_40__ordinal1,plain,
    ( v3_ordinal1(c2_40__ordinal1)
    & v3_ordinal1(c3_40__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,antisymmetry_r2_hidden,dt_c1_40__ordinal1,dt_c2_40__ordinal1,dt_c3_40__ordinal1,dt_c4_40__ordinal1,dt_c5_40__ordinal1,cc1_ordinal1,t1_subset,t7_boole,e8_40__ordinal1,e5_40__ordinal1,e7_40__ordinal1,t23_ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_40__ordinal1),[file(ordinal1,e9_40__ordinal1)]]).

fof(e9_44__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & r2_hidden(A,c3_44__ordinal1)
      & ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_hidden(B,c3_44__ordinal1)
           => r1_ordinal1(A,B) ) ) ) ),
    inference(mizar_by,[],[commutativity_k2_xboole_0,idempotence_k2_xboole_0,existence_m1_subset_1,dt_k1_tarski,dt_k1_zfmisc_1,dt_k2_xboole_0,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,cc3_ordinal1,rc3_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc3_funct_1,rc4_funct_1,rc1_relat_1,fc2_relat_1,cc1_relat_1,rc2_relat_1,rc3_relat_1,rc1_xboole_0,rc2_xboole_0,fc2_xboole_0,fc3_xboole_0,t1_boole,t2_subset,t4_subset,t5_subset,t8_boole,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_k1_ordinal1,dt_k1_xboole_0,dt_c2_44__ordinal1,dt_c3_44__ordinal1,fc1_ordinal1,cc1_ordinal1,fc2_ordinal1,fc3_ordinal1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,t1_subset,t3_subset,t6_boole,t7_boole,d1_ordinal1,e8_44__ordinal1,e6_44__ordinal1,t32_ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_44__ordinal1),[file(ordinal1,e9_44__ordinal1)]]).

fof(e9_47_1__ordinal1,plain,(
    r1_tarski(c1_47_1__ordinal1,c2_47_1__ordinal1) ),
    inference(mizar_by,[],[rc2_ordinal1,rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,fc2_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,t8_boole,existence_m1_subset_1,dt_k1_zfmisc_1,dt_m1_subset_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t4_subset,t5_subset,t6_boole,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_47__ordinal1,dt_c1_47_1__ordinal1,dt_c2_47_1__ordinal1,cc1_ordinal1,t1_subset,t3_subset,t7_boole,e8_47_1__ordinal1,e5_47_1__ordinal1,d2_ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_47_1__ordinal1),[file(ordinal1,e9_47_1__ordinal1)]]).

fof(e9_60_1__ordinal1,plain,(
    r3_xboole_0(c6_60_1__ordinal1,c7_60_1__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc2_ordinal1,fc2_ordinal1,rc3_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc3_ordinal1,rc4_ordinal1,rc1_funct_1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,symmetry_r3_xboole_0,reflexivity_r3_xboole_0,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_1__ordinal1,dt_c2_60_1__ordinal1,dt_c3_60_1__ordinal1,dt_c4_60_1__ordinal1,dt_c5_60_1__ordinal1,dt_c6_60_1__ordinal1,dt_c7_60_1__ordinal1,de_c6_60_1__ordinal1,de_c7_60_1__ordinal1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e2_60__ordinal1,e4_60_1__ordinal1,e6_60_1__ordinal1,d9_ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_60_1__ordinal1),[file(ordinal1,e9_60_1__ordinal1)]]).

fof(e9_60_5_1_1__ordinal1,plain,(
    r2_hidden(k4_tarski(c4_60_5_1_1__ordinal1,k1_relat_1(c4_60_5_1_1__ordinal1)),c3_60__ordinal1) ),
    inference(mizar_by,[],[rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc2_ordinal1,fc2_ordinal1,rc3_funct_1,fc4_relat_1,fc12_relat_1,fc1_xboole_0,commutativity_k2_tarski,existence_m1_subset_1,dt_k1_tarski,dt_k2_tarski,dt_m1_subset_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,cc1_relat_1,rc2_relat_1,fc5_relat_1,fc7_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_relat_1,dt_k4_tarski,dt_c1_60__ordinal1,dt_c1_60_5_1_1__ordinal1,dt_c2_60_5_1_1__ordinal1,dt_c3_60__ordinal1,dt_c3_60_5_1_1__ordinal1,dt_c4_60_5_1_1__ordinal1,de_c4_60_5_1_1__ordinal1,rc4_ordinal1,fc5_ordinal1,rc1_funct_1,fc1_zfmisc_1,t1_subset,t7_boole,d5_tarski,e8_60_5_1_1__ordinal1,e7_60__ordinal1,e5_60_5_1_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_60_5_1_1__ordinal1),[file(ordinal1,e9_60_5_1_1__ordinal1)]]).

fof(e9_60_5_1__ordinal1,plain,(
    r2_hidden(k4_tarski(c1_60_5_1__ordinal1,c4_60_5_1__ordinal1),c3_60_5_1__ordinal1) ),
    inference(consider,[],[dh_c4_60_5_1,e8_60_5_1__ordinal1]),
    [lemma_conjecture,file(ordinal1,e9_60_5_1__ordinal1),[file(ordinal1,e9_60_5_1__ordinal1)]]).

fof(e9_60__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(A,k2_relat_1(c3_60__ordinal1))
     => v3_ordinal1(A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_4__ordinal1])],[i1_60_4__ordinal1]),dh_c1_60_4]),
    [lemma_conjecture,file(ordinal1,e9_60__ordinal1),[file(ordinal1,e9_60__ordinal1)]]).

fof(e9_9__ordinal1,plain,(
    ~ $true ),
    inference(mizar_by,[],[rc3_funct_1,rc4_funct_1,rc3_relat_1,dt_k1_xboole_0,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,fc4_relat_1,rc2_relat_1,fc12_relat_1,fc1_xboole_0,existence_m1_subset_1,dt_m1_subset_1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,t2_subset,t6_boole,t8_boole,antisymmetry_r2_hidden,dt_k1_tarski,dt_c1_9__ordinal1,dt_c2_9__ordinal1,t1_subset,t7_boole,e8_9__ordinal1,e2_9__ordinal1,e5_9__ordinal1,d1_tarski]),
    [lemma_conjecture,file(ordinal1,e9_9__ordinal1),[file(ordinal1,e9_9__ordinal1)]]).

fof(existence_m1_ordinal1,axiom,(
    ! [A] : 
    ? [B] : m1_ordinal1(B,A) ),
    file(ordinal1,m1_ordinal1),
    [lemma_conjecture,axiom,file(ordinal1,m1_ordinal1)]).

fof(existence_m1_subset_1,axiom,(
    ! [A] : 
    ? [B] : m1_subset_1(B,A) ),
    file(subset_1,m1_subset_1),
    [lemma_conjecture,axiom,file(subset_1,m1_subset_1)]).

fof(fc12_relat_1,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_relat_1(k1_xboole_0)
    & v3_relat_1(k1_xboole_0) ),
    file(relat_1,fc12_relat_1),
    [theorem,axiom,file(relat_1,fc12_relat_1)]).

fof(fc1_ordinal1,axiom,(
    ! [A] : ~ v1_xboole_0(k1_ordinal1(A)) ),
    file(ordinal1,fc1_ordinal1),
    [theorem,axiom,file(ordinal1,fc1_ordinal1)]).

fof(fc1_xboole_0,axiom,(
    v1_xboole_0(k1_xboole_0) ),
    file(xboole_0,fc1_xboole_0),
    [theorem,axiom,file(xboole_0,fc1_xboole_0)]).

fof(fc1_zfmisc_1,axiom,(
    ! [A,B] : ~ v1_xboole_0(k4_tarski(A,B)) ),
    file(zfmisc_1,fc1_zfmisc_1),
    [theorem,axiom,file(zfmisc_1,fc1_zfmisc_1)]).

fof(fc2_ordinal1,axiom,
    ( v1_relat_1(k1_xboole_0)
    & v3_relat_1(k1_xboole_0)
    & v1_funct_1(k1_xboole_0)
    & v2_funct_1(k1_xboole_0)
    & v1_xboole_0(k1_xboole_0)
    & v1_ordinal1(k1_xboole_0)
    & v2_ordinal1(k1_xboole_0)
    & v3_ordinal1(k1_xboole_0) ),
    file(ordinal1,fc2_ordinal1),
    [theorem,axiom,file(ordinal1,fc2_ordinal1)]).

fof(fc2_relat_1,axiom,(
    ! [A,B] : 
      ( ( v1_relat_1(A)
        & v1_relat_1(B) )
     => v1_relat_1(k2_xboole_0(A,B)) ) ),
    file(relat_1,fc2_relat_1),
    [theorem,axiom,file(relat_1,fc2_relat_1)]).

fof(fc2_xboole_0,axiom,(
    ! [A,B] : 
      ( ~ v1_xboole_0(A)
     => ~ v1_xboole_0(k2_xboole_0(A,B)) ) ),
    file(xboole_0,fc2_xboole_0),
    [theorem,axiom,file(xboole_0,fc2_xboole_0)]).

fof(fc3_ordinal1,axiom,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( ~ v1_xboole_0(k1_ordinal1(A))
        & v1_ordinal1(k1_ordinal1(A))
        & v2_ordinal1(k1_ordinal1(A))
        & v3_ordinal1(k1_ordinal1(A)) ) ) ),
    file(ordinal1,fc3_ordinal1),
    [theorem,axiom,file(ordinal1,fc3_ordinal1)]).

fof(fc3_relat_1,axiom,(
    ! [A,B] : 
      ( ( v1_relat_1(A)
        & v1_relat_1(B) )
     => v1_relat_1(k4_xboole_0(A,B)) ) ),
    file(relat_1,fc3_relat_1),
    [theorem,axiom,file(relat_1,fc3_relat_1)]).

fof(fc3_xboole_0,axiom,(
    ! [A,B] : 
      ( ~ v1_xboole_0(A)
     => ~ v1_xboole_0(k2_xboole_0(B,A)) ) ),
    file(xboole_0,fc3_xboole_0),
    [theorem,axiom,file(xboole_0,fc3_xboole_0)]).

fof(fc4_funct_1,axiom,(
    ! [A,B] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A) )
     => ( v1_relat_1(k7_relat_1(A,B))
        & v1_funct_1(k7_relat_1(A,B)) ) ) ),
    file(funct_1,fc4_funct_1),
    [theorem,axiom,file(funct_1,fc4_funct_1)]).

fof(fc4_ordinal1,axiom,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( v1_ordinal1(k3_tarski(A))
        & v2_ordinal1(k3_tarski(A))
        & v3_ordinal1(k3_tarski(A)) ) ) ),
    file(ordinal1,fc4_ordinal1),
    [theorem,axiom,file(ordinal1,fc4_ordinal1)]).

fof(fc4_relat_1,axiom,
    ( v1_xboole_0(k1_xboole_0)
    & v1_relat_1(k1_xboole_0) ),
    file(relat_1,fc4_relat_1),
    [theorem,axiom,file(relat_1,fc4_relat_1)]).

fof(fc5_ordinal1,axiom,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A) )
     => ( v1_ordinal1(k1_relat_1(A))
        & v2_ordinal1(k1_relat_1(A))
        & v3_ordinal1(k1_relat_1(A)) ) ) ),
    file(ordinal1,fc5_ordinal1),
    [theorem,axiom,file(ordinal1,fc5_ordinal1)]).

fof(fc5_relat_1,axiom,(
    ! [A] : 
      ( ( ~ v1_xboole_0(A)
        & v1_relat_1(A) )
     => ~ v1_xboole_0(k1_relat_1(A)) ) ),
    file(relat_1,fc5_relat_1),
    [theorem,axiom,file(relat_1,fc5_relat_1)]).

fof(fc6_relat_1,axiom,(
    ! [A] : 
      ( ( ~ v1_xboole_0(A)
        & v1_relat_1(A) )
     => ~ v1_xboole_0(k2_relat_1(A)) ) ),
    file(relat_1,fc6_relat_1),
    [theorem,axiom,file(relat_1,fc6_relat_1)]).

fof(fc7_relat_1,axiom,(
    ! [A] : 
      ( v1_xboole_0(A)
     => ( v1_xboole_0(k1_relat_1(A))
        & v1_relat_1(k1_relat_1(A)) ) ) ),
    file(relat_1,fc7_relat_1),
    [theorem,axiom,file(relat_1,fc7_relat_1)]).

fof(fc8_relat_1,axiom,(
    ! [A] : 
      ( v1_xboole_0(A)
     => ( v1_xboole_0(k2_relat_1(A))
        & v1_relat_1(k2_relat_1(A)) ) ) ),
    file(relat_1,fc8_relat_1),
    [theorem,axiom,file(relat_1,fc8_relat_1)]).

fof(i1_10_1__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
      & c1_10__ordinal1 != c2_10__ordinal1 ) ),
    inference(conclusion,[],[e4_10_1__ordinal1,i2_10_1__ordinal1]),
    [thesis,file(ordinal1,i1_10_1__ordinal1),[file(ordinal1,i1_10_1__ordinal1)]]).

fof(i1_10__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(c1_10__ordinal1,k1_ordinal1(A))
    <=> ( r2_hidden(c1_10__ordinal1,A)
        | c1_10__ordinal1 = A ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_10__ordinal1])],[i2_10__ordinal1]),dh_c2_10]),
    [thesis,file(ordinal1,i1_10__ordinal1),[file(ordinal1,i1_10__ordinal1)]]).

fof(i1_11__ordinal1,plain,(
    c1_11__ordinal1 != k1_ordinal1(c1_11__ordinal1) ),
    inference(discharge_asm,[discharged([e1_11__ordinal1])],[i2_11__ordinal1]),
    [thesis,file(ordinal1,i1_11__ordinal1),[file(ordinal1,i1_11__ordinal1)]]).

fof(i1_19__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v1_ordinal1(B)
         => ( ( r2_hidden(B,c1_19__ordinal1)
              & r2_hidden(c1_19__ordinal1,A) )
           => r2_hidden(B,A) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_19__ordinal1])],[i2_19__ordinal1]),dh_c2_19]),
    [thesis,file(ordinal1,i1_19__ordinal1),[file(ordinal1,i1_19__ordinal1)]]).

fof(i1_1__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(c1_1__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,c1_1__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_1__ordinal1])],[i2_1__ordinal1]),dh_c2_1]),
    [thesis,file(ordinal1,i1_1__ordinal1),[file(ordinal1,i1_1__ordinal1)]]).

fof(i1_20_1__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e3_20_1__ordinal1,i2_20_1__ordinal1]),
    [thesis,file(ordinal1,i1_20_1__ordinal1),[file(ordinal1,i1_20_1__ordinal1)]]).

fof(i1_20_2__ordinal1,plain,
    ( r2_hidden(c1_20_2__ordinal1,c4_20__ordinal1)
   => r2_hidden(c1_20_2__ordinal1,c1_20__ordinal1) ),
    inference(discharge_asm,[discharged([e1_20_2__ordinal1])],[i2_20_2__ordinal1]),
    [thesis,file(ordinal1,i1_20_2__ordinal1),[file(ordinal1,i1_20_2__ordinal1)]]).

fof(i1_20_3__ordinal1,plain,
    ( r2_hidden(c1_20_3__ordinal1,c1_20__ordinal1)
   => r2_hidden(c1_20_3__ordinal1,c4_20__ordinal1) ),
    inference(discharge_asm,[discharged([e1_20_3__ordinal1])],[i2_20_3__ordinal1]),
    [thesis,file(ordinal1,i1_20_3__ordinal1),[file(ordinal1,i1_20_3__ordinal1)]]).

fof(i1_20__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_xboole_0(c1_20__ordinal1,A)
       => r2_hidden(c1_20__ordinal1,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_20__ordinal1])],[i2_20__ordinal1]),dh_c2_20]),
    [thesis,file(ordinal1,i1_20__ordinal1),[file(ordinal1,i1_20__ordinal1)]]).

fof(i1_21__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ( ( r1_tarski(c1_21__ordinal1,A)
              & r2_hidden(A,B) )
           => r2_hidden(c1_21__ordinal1,B) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_21__ordinal1,dt_c3_21__ordinal1])],[i2_21__ordinal1]),dh_c2_21,dh_c3_21]),
    [thesis,file(ordinal1,i1_21__ordinal1),[file(ordinal1,i1_21__ordinal1)]]).

fof(i1_22_1__ordinal1,plain,
    ( r2_hidden(c1_22_1__ordinal1,c1_22__ordinal1)
   => r1_tarski(c1_22_1__ordinal1,c1_22__ordinal1) ),
    inference(discharge_asm,[discharged([e1_22_1__ordinal1])],[i2_22_1__ordinal1]),
    [thesis,file(ordinal1,i1_22_1__ordinal1),[file(ordinal1,i1_22_1__ordinal1)]]).

fof(i1_22__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(c1_22__ordinal1,A)
       => v3_ordinal1(c1_22__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_22__ordinal1])],[i2_22__ordinal1]),dh_c2_22]),
    [thesis,file(ordinal1,i1_22__ordinal1),[file(ordinal1,i1_22__ordinal1)]]).

fof(i1_23_1__ordinal1,plain,
    ( r2_hidden(c1_23_1__ordinal1,c4_23__ordinal1)
   => r2_hidden(c1_23_1__ordinal1,c2_23__ordinal1) ),
    inference(discharge_asm,[discharged([e1_23_1__ordinal1])],[i2_23_1__ordinal1]),
    [thesis,file(ordinal1,i1_23_1__ordinal1),[file(ordinal1,i1_23_1__ordinal1)]]).

fof(i1_23__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ~ ( ~ r2_hidden(c1_23__ordinal1,A)
          & c1_23__ordinal1 != A
          & ~ r2_hidden(A,c1_23__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_23__ordinal1])],[i2_23__ordinal1]),dh_c2_23]),
    [thesis,file(ordinal1,i1_23__ordinal1),[file(ordinal1,i1_23__ordinal1)]]).

fof(i1_25__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => r3_xboole_0(c1_25__ordinal1,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_25__ordinal1])],[i2_25__ordinal1]),dh_c2_25]),
    [thesis,file(ordinal1,i1_25__ordinal1),[file(ordinal1,i1_25__ordinal1)]]).

fof(i1_26__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r1_ordinal1(c1_26__ordinal1,A)
        | r2_hidden(A,c1_26__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_26__ordinal1])],[i2_26__ordinal1]),dh_c2_26]),
    [thesis,file(ordinal1,i1_26__ordinal1),[file(ordinal1,i1_26__ordinal1)]]).

fof(i1_2__ordinal1,plain,(
    ! [A,B,C] : 
      ~ ( r2_hidden(c1_2__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,c1_2__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_2__ordinal1])],[i2_2__ordinal1]),dh_c2_2]),
    [thesis,file(ordinal1,i1_2__ordinal1),[file(ordinal1,i1_2__ordinal1)]]).

fof(i1_30_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_30_1__ordinal1,k1_ordinal1(c1_30__ordinal1))
      & ~ r2_hidden(c1_30_1__ordinal1,c1_30__ordinal1)
      & c1_30_1__ordinal1 != c1_30__ordinal1 ) ),
    inference(discharge_asm,[discharged([e1_30_1__ordinal1])],[i2_30_1__ordinal1]),
    [thesis,file(ordinal1,i1_30_1__ordinal1),[file(ordinal1,i1_30_1__ordinal1)]]).

fof(i1_30_2_1__ordinal1,plain,(
    r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(conclusion,[],[e4_30_2_1__ordinal1,i2_30_2_1__ordinal1]),
    [thesis,file(ordinal1,i1_30_2_1__ordinal1),[file(ordinal1,i1_30_2_1__ordinal1)]]).

fof(i1_30_2__ordinal1,plain,
    ( r2_hidden(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1))
   => r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_30_2__ordinal1])],[i2_30_2__ordinal1]),
    [thesis,file(ordinal1,i1_30_2__ordinal1),[file(ordinal1,i1_30_2__ordinal1)]]).

fof(i1_30_3__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
        & r2_hidden(c2_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
        & ~ r2_hidden(c1_30_3__ordinal1,c2_30_3__ordinal1)
        & c1_30_3__ordinal1 != c2_30_3__ordinal1
        & ~ r2_hidden(c2_30_3__ordinal1,c1_30_3__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_30_3__ordinal1])],[i2_30_3__ordinal1]),dh_c2_30_3]),
    [thesis,file(ordinal1,i1_30_3__ordinal1),[file(ordinal1,i1_30_3__ordinal1)]]).

fof(i1_30__ordinal1,plain,
    ( v3_ordinal1(c1_30__ordinal1)
   => v3_ordinal1(k1_ordinal1(c1_30__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_30__ordinal1])],[i2_30__ordinal1]),
    [thesis,file(ordinal1,i1_30__ordinal1),[file(ordinal1,i1_30__ordinal1)]]).

fof(i1_3_1_1_1_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_1__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,i2_3_1_1_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_3_1_1_1_1__ordinal1),[file(ordinal1,i1_3_1_1_1_1__ordinal1)]]).

fof(i1_3_1_1_1_2__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_2__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,i2_3_1_1_1_2__ordinal1]),
    [thesis,file(ordinal1,i1_3_1_1_1_2__ordinal1),[file(ordinal1,i1_3_1_1_1_2__ordinal1)]]).

fof(i1_3_1_1_1_3__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_3__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,i2_3_1_1_1_3__ordinal1]),
    [thesis,file(ordinal1,i1_3_1_1_1_3__ordinal1),[file(ordinal1,i1_3_1_1_1_3__ordinal1)]]).

fof(i1_3_1_1_1_4__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_4__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,i2_3_1_1_1_4__ordinal1]),
    [thesis,file(ordinal1,i1_3_1_1_1_4__ordinal1),[file(ordinal1,i1_3_1_1_1_4__ordinal1)]]).

fof(i1_3_1_1_1_5__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k3_enumset1,dt_c1_3__ordinal1,dt_c1_3_1__ordinal1,dt_c1_3_1_1_1_5__ordinal1,dt_c2_3__ordinal1,dt_c3_3__ordinal1,dt_c4_3__ordinal1,dt_c5_3__ordinal1,i2_3_1_1_1_5__ordinal1]),
    [thesis,file(ordinal1,i1_3_1_1_1_5__ordinal1),[file(ordinal1,i1_3_1_1_1_5__ordinal1)]]).

fof(i1_3_1_1_1__ordinal1,plain,(
    ~ ( c1_3_1__ordinal1 = c1_3__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
            & r2_hidden(A,c1_3_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_3_1_1_1_1__ordinal1])],[i1_3_1_1_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_3_1_1_1__ordinal1),[file(ordinal1,i1_3_1_1_1__ordinal1)]]).

fof(i1_31_1__ordinal1,plain,
    ( r2_hidden(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1))
   => r1_tarski(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_31_1__ordinal1])],[i2_31_1__ordinal1]),
    [thesis,file(ordinal1,i1_31_1__ordinal1),[file(ordinal1,i1_31_1__ordinal1)]]).

fof(i1_3_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_3_1__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & ! [A] : 
          ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
            & r2_hidden(A,c1_3_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_3_1__ordinal1])],[i2_3_1__ordinal1]),
    [thesis,file(ordinal1,i1_3_1__ordinal1),[file(ordinal1,i1_3_1__ordinal1)]]).

fof(i1_31__ordinal1,plain,
    ( v3_ordinal1(c1_31__ordinal1)
   => v3_ordinal1(k3_tarski(c1_31__ordinal1)) ),
    inference(mizar_def_expansion,[],[inference(discharge_asm,[discharged([e1_31__ordinal1])],[i2_31__ordinal1]),dt_k3_tarski,dt_c1_31__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,e1_31__ordinal1,i2_31__ordinal1]),
    [thesis,file(ordinal1,i1_31__ordinal1),[file(ordinal1,i1_31__ordinal1)]]).

fof(i1_34_1__ordinal1,plain,
    ( r2_hidden(c1_34_1__ordinal1,c1_34__ordinal1)
   => r1_tarski(c1_34_1__ordinal1,c1_34__ordinal1) ),
    inference(discharge_asm,[discharged([e1_34_1__ordinal1])],[i2_34_1__ordinal1]),
    [thesis,file(ordinal1,i1_34_1__ordinal1),[file(ordinal1,i1_34_1__ordinal1)]]).

fof(i1_34__ordinal1,plain,
    ( ! [A] : 
        ( r2_hidden(A,c1_34__ordinal1)
       => ( v3_ordinal1(A)
          & r1_tarski(A,c1_34__ordinal1) ) )
   => v3_ordinal1(c1_34__ordinal1) ),
    inference(discharge_asm,[discharged([e1_34__ordinal1])],[i2_34__ordinal1]),
    [thesis,file(ordinal1,i1_34__ordinal1),[file(ordinal1,i1_34__ordinal1)]]).

fof(i1_35__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ~ ( r1_tarski(c1_35__ordinal1,A)
          & c1_35__ordinal1 != k1_xboole_0
          & ! [B] : 
              ( v3_ordinal1(B)
             => ~ ( r2_hidden(B,c1_35__ordinal1)
                  & ! [C] : 
                      ( v3_ordinal1(C)
                     => ( r2_hidden(C,c1_35__ordinal1)
                       => r1_ordinal1(B,C) ) ) ) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_35__ordinal1])],[i2_35__ordinal1]),dh_c2_35]),
    [thesis,file(ordinal1,i1_35__ordinal1),[file(ordinal1,i1_35__ordinal1)]]).

fof(i1_36_1__ordinal1,plain,(
    r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1) ),
    inference(conclusion,[],[e6_36_1__ordinal1,i2_36_1__ordinal1]),
    [thesis,file(ordinal1,i1_36_1__ordinal1),[file(ordinal1,i1_36_1__ordinal1)]]).

fof(i1_36__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(c1_36__ordinal1,A)
      <=> r1_ordinal1(k1_ordinal1(c1_36__ordinal1),A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_36__ordinal1])],[i2_36__ordinal1]),dh_c2_36]),
    [thesis,file(ordinal1,i1_36__ordinal1),[file(ordinal1,i1_36__ordinal1)]]).

fof(i1_37_1__ordinal1,plain,(
    r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1) ),
    inference(conclusion,[],[e4_37_1__ordinal1,i2_37_1__ordinal1]),
    [thesis,file(ordinal1,i1_37_1__ordinal1),[file(ordinal1,i1_37_1__ordinal1)]]).

fof(i1_37__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(c1_37__ordinal1,k1_ordinal1(A))
      <=> r1_ordinal1(c1_37__ordinal1,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_37__ordinal1])],[i2_37__ordinal1]),dh_c2_37]),
    [thesis,file(ordinal1,i1_37__ordinal1),[file(ordinal1,i1_37__ordinal1)]]).

fof(i1_3__ordinal1,plain,(
    ! [A,B,C,D] : 
      ~ ( r2_hidden(c1_3__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,D)
        & r2_hidden(D,c1_3__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_3__ordinal1])],[i2_3__ordinal1]),dh_c2_3]),
    [thesis,file(ordinal1,i1_3__ordinal1),[file(ordinal1,i1_3__ordinal1)]]).

fof(i1_40_1__ordinal1,plain,
    ( r2_hidden(c1_40_1__ordinal1,k3_tarski(c1_40__ordinal1))
   => r1_tarski(c1_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_40_1__ordinal1])],[i2_40_1__ordinal1]),
    [thesis,file(ordinal1,i1_40_1__ordinal1),[file(ordinal1,i1_40_1__ordinal1)]]).

fof(i1_40__ordinal1,plain,
    ( ! [A] : 
        ( r2_hidden(A,c1_40__ordinal1)
       => v3_ordinal1(A) )
   => v3_ordinal1(k3_tarski(c1_40__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_40__ordinal1])],[i2_40__ordinal1]),
    [thesis,file(ordinal1,i1_40__ordinal1),[file(ordinal1,i1_40__ordinal1)]]).

fof(i1_4_1_1_1_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_1__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,i2_4_1_1_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1_1__ordinal1),[file(ordinal1,i1_4_1_1_1_1__ordinal1)]]).

fof(i1_4_1_1_1_2__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_2__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,i2_4_1_1_1_2__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1_2__ordinal1),[file(ordinal1,i1_4_1_1_1_2__ordinal1)]]).

fof(i1_4_1_1_1_3__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_3__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,i2_4_1_1_1_3__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1_3__ordinal1),[file(ordinal1,i1_4_1_1_1_3__ordinal1)]]).

fof(i1_4_1_1_1_4__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_4__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,i2_4_1_1_1_4__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1_4__ordinal1),[file(ordinal1,i1_4_1_1_1_4__ordinal1)]]).

fof(i1_4_1_1_1_5__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_5__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,i2_4_1_1_1_5__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1_5__ordinal1),[file(ordinal1,i1_4_1_1_1_5__ordinal1)]]).

fof(i1_4_1_1_1_6__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(take,[],[antisymmetry_r2_hidden,dt_k4_enumset1,dt_c1_4__ordinal1,dt_c1_4_1__ordinal1,dt_c1_4_1_1_1_6__ordinal1,dt_c2_4__ordinal1,dt_c3_4__ordinal1,dt_c4_4__ordinal1,dt_c5_4__ordinal1,dt_c6_4__ordinal1,i2_4_1_1_1_6__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1_6__ordinal1),[file(ordinal1,i1_4_1_1_1_6__ordinal1)]]).

fof(i1_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 = c1_4__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1_1_1_1__ordinal1])],[i1_4_1_1_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_4_1_1_1__ordinal1),[file(ordinal1,i1_4_1_1_1__ordinal1)]]).

fof(i1_41__ordinal1,plain,(
    ~ ( ! [A] : 
          ( r2_hidden(A,c1_41__ordinal1)
         => v3_ordinal1(A) )
      & ! [A] : 
          ( v3_ordinal1(A)
         => ~ r1_tarski(c1_41__ordinal1,A) ) ) ),
    inference(discharge_asm,[discharged([e1_41__ordinal1])],[i2_41__ordinal1]),
    [thesis,file(ordinal1,i1_41__ordinal1),[file(ordinal1,i1_41__ordinal1)]]).

fof(i1_4_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_4_1__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1__ordinal1])],[i2_4_1__ordinal1]),
    [thesis,file(ordinal1,i1_4_1__ordinal1),[file(ordinal1,i1_4_1__ordinal1)]]).

fof(i1_42_1_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_42_1_1__ordinal1,c1_42_1__ordinal1)
      & ~ r2_hidden(c1_42_1_1__ordinal1,c1_42__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_42_1_1__ordinal1])],[i2_42_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_42_1_1__ordinal1),[file(ordinal1,i1_42_1_1__ordinal1)]]).

fof(i1_42_1__ordinal1,plain,
    ( r2_hidden(c1_42_1__ordinal1,c1_42__ordinal1)
   => r1_tarski(c1_42_1__ordinal1,c1_42__ordinal1) ),
    inference(discharge_asm,[discharged([e1_42_1__ordinal1])],[i2_42_1__ordinal1]),
    [thesis,file(ordinal1,i1_42_1__ordinal1),[file(ordinal1,i1_42_1__ordinal1)]]).

fof(i1_42_2__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_42_2__ordinal1,c1_42__ordinal1)
        & r2_hidden(A,c1_42__ordinal1)
        & ~ r2_hidden(c1_42_2__ordinal1,A)
        & c1_42_2__ordinal1 != A
        & ~ r2_hidden(A,c1_42_2__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_42_2__ordinal1])],[i2_42_2__ordinal1]),dh_c2_42_2]),
    [thesis,file(ordinal1,i1_42_2__ordinal1),[file(ordinal1,i1_42_2__ordinal1)]]).

fof(i1_42__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e7_42__ordinal1,i2_42__ordinal1]),
    [thesis,file(ordinal1,i1_42__ordinal1),[file(ordinal1,i1_42__ordinal1)]]).

fof(i1_43_1__ordinal1,plain,
    ( v3_ordinal1(c1_43_1__ordinal1)
   => r2_hidden(c1_43_1__ordinal1,c2_43__ordinal1) ),
    inference(discharge_asm,[discharged([e1_43_1__ordinal1])],[i2_43_1__ordinal1]),
    [thesis,file(ordinal1,i1_43_1__ordinal1),[file(ordinal1,i1_43_1__ordinal1)]]).

fof(i1_43__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e7_43__ordinal1,i2_43__ordinal1]),
    [thesis,file(ordinal1,i1_43__ordinal1),[file(ordinal1,i1_43__ordinal1)]]).

fof(i1_44__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & ~ r2_hidden(A,c1_44__ordinal1)
      & ! [B] : 
          ( v3_ordinal1(B)
         => ( ~ r2_hidden(B,c1_44__ordinal1)
           => r1_ordinal1(A,B) ) ) ) ),
    inference(take,[],[reflexivity_r1_tarski,cc2_ordinal1,rc1_ordinal1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c1_44__ordinal1,dt_c4_44__ordinal1,cc1_ordinal1,i2_44__ordinal1]),
    [thesis,file(ordinal1,i1_44__ordinal1),[file(ordinal1,i1_44__ordinal1)]]).

fof(i1_47_1__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(A,c1_47__ordinal1)
       => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_47_1__ordinal1])],[i2_47_1__ordinal1]),dh_c1_47_1]),
    [thesis,file(ordinal1,i1_47_1__ordinal1),[file(ordinal1,i1_47_1__ordinal1)]]).

fof(i1_47_2__ordinal1,plain,
    ( r2_hidden(c1_47_2__ordinal1,c1_47__ordinal1)
   => r2_hidden(c1_47_2__ordinal1,k3_tarski(c1_47__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_47_2__ordinal1])],[i2_47_2__ordinal1]),
    [thesis,file(ordinal1,i1_47_2__ordinal1),[file(ordinal1,i1_47_2__ordinal1)]]).

fof(i1_47_3__ordinal1,plain,
    ( r2_hidden(c1_47_3__ordinal1,k3_tarski(c1_47__ordinal1))
   => r2_hidden(c1_47_3__ordinal1,c1_47__ordinal1) ),
    inference(discharge_asm,[discharged([e1_47_3__ordinal1])],[i2_47_3__ordinal1]),
    [thesis,file(ordinal1,i1_47_3__ordinal1),[file(ordinal1,i1_47_3__ordinal1)]]).

fof(i1_47__ordinal1,plain,
    ( v4_ordinal1(c1_47__ordinal1)
  <=> ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c1_47__ordinal1)
         => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) ) ),
    inference(conclusion,[],[e1_47__ordinal1,i2_47__ordinal1]),
    [thesis,file(ordinal1,i1_47__ordinal1),[file(ordinal1,i1_47__ordinal1)]]).

fof(i1_48_1__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & c1_48__ordinal1 = k1_ordinal1(A) ) ),
    inference(take,[],[rc2_ordinal1,rc3_funct_1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,rc2_relat_1,cc2_ordinal1,rc1_ordinal1,cc3_ordinal1,rc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,dt_k1_ordinal1,dt_c1_48__ordinal1,dt_c1_48_1__ordinal1,fc1_ordinal1,cc1_ordinal1,fc3_ordinal1,i2_48_1__ordinal1]),
    [thesis,file(ordinal1,i1_48_1__ordinal1),[file(ordinal1,i1_48_1__ordinal1)]]).

fof(i1_48__ordinal1,plain,
    ( ~ ( ~ v4_ordinal1(c1_48__ordinal1)
        & ! [A] : 
            ( v3_ordinal1(A)
           => c1_48__ordinal1 != k1_ordinal1(A) ) )
    & ~ ( ? [A] : 
            ( v3_ordinal1(A)
            & c1_48__ordinal1 = k1_ordinal1(A) )
        & v4_ordinal1(c1_48__ordinal1) ) ),
    inference(conclusion,[],[e1_48__ordinal1,i2_48__ordinal1]),
    [thesis,file(ordinal1,i1_48__ordinal1),[file(ordinal1,i1_48__ordinal1)]]).

fof(i1_4__ordinal1,plain,(
    ! [A,B,C,D,E] : 
      ~ ( r2_hidden(c1_4__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,D)
        & r2_hidden(D,E)
        & r2_hidden(E,c1_4__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_4__ordinal1])],[i2_4__ordinal1]),dh_c2_4]),
    [thesis,file(ordinal1,i1_4__ordinal1),[file(ordinal1,i1_4__ordinal1)]]).

fof(i1_53_1__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e4_53_1__ordinal1,i2_53_1__ordinal1]),
    [thesis,file(ordinal1,i1_53_1__ordinal1),[file(ordinal1,i1_53_1__ordinal1)]]).

fof(i1_53__ordinal1,plain,(
    m1_ordinal1(k1_xboole_0,c1_53__ordinal1) ),
    inference(conclusion,[],[e6_53__ordinal1,i2_53__ordinal1]),
    [thesis,file(ordinal1,i1_53__ordinal1),[file(ordinal1,i1_53__ordinal1)]]).

fof(i1_54__ordinal1,plain,
    ( v3_ordinal1(k1_relat_1(c1_54__ordinal1))
   => m1_ordinal1(c1_54__ordinal1,k2_relat_1(c1_54__ordinal1)) ),
    inference(discharge_asm,[discharged([e1_54__ordinal1])],[i2_54__ordinal1]),
    [thesis,file(ordinal1,i1_54__ordinal1),[file(ordinal1,i1_54__ordinal1)]]).

fof(i1_56__ordinal1,plain,(
    ! [A] : 
      ( r1_tarski(c1_56__ordinal1,A)
     => ! [B] : 
          ( m1_ordinal1(B,c1_56__ordinal1)
         => m1_ordinal1(B,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_56__ordinal1])],[i2_56__ordinal1]),dh_c2_56]),
    [thesis,file(ordinal1,i1_56__ordinal1),[file(ordinal1,i1_56__ordinal1)]]).

fof(i1_58__ordinal1,plain,(
    ! [A] : 
      ( m1_ordinal1(A,c1_58__ordinal1)
     => ! [B] : 
          ( v3_ordinal1(B)
         => m1_ordinal1(k2_ordinal1(A,B),c1_58__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_58__ordinal1])],[i2_58__ordinal1]),dh_c2_58]),
    [thesis,file(ordinal1,i1_58__ordinal1),[file(ordinal1,i1_58__ordinal1)]]).

fof(i1_5__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_5__ordinal1,A)
        & r1_tarski(A,c1_5__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_5__ordinal1])],[i2_5__ordinal1]),dh_c2_5]),
    [thesis,file(ordinal1,i1_5__ordinal1),[file(ordinal1,i1_5__ordinal1)]]).

fof(i1_60_1_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_60_1_1__ordinal1,k3_tarski(c1_60__ordinal1))
      & ! [A,B] : k4_tarski(A,B) != c1_60_1_1__ordinal1 ) ),
    inference(discharge_asm,[discharged([e1_60_1_1__ordinal1])],[i2_60_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_60_1_1__ordinal1),[file(ordinal1,i1_60_1_1__ordinal1)]]).

fof(i1_60_1__ordinal1,plain,(
    v1_funct_1(k3_tarski(c1_60__ordinal1)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_1__ordinal1])],[d1_funct_1,i2_60_1__ordinal1]),rc2_ordinal1,rc3_funct_1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,rc3_ordinal1,fc4_ordinal1,rc1_funct_1,rc2_funct_1,cc2_funct_1,rc1_relat_1,rc2_relat_1,cc3_ordinal1,cc1_funct_1,cc1_relat_1,rc1_xboole_0,rc2_xboole_0,antisymmetry_r2_hidden,dt_k3_tarski,dt_k4_tarski,dt_c1_60__ordinal1,fc1_zfmisc_1,dh_c1_60_1]),
    [thesis,file(ordinal1,i1_60_1__ordinal1),[file(ordinal1,i1_60_1__ordinal1)]]).

fof(i1_60_2__ordinal1,plain,(
    ! [A,B] : 
      ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
        & ! [C] : 
            ( ( v1_relat_1(C)
              & v1_funct_1(C)
              & v5_ordinal1(C) )
           => ( C = c1_60_2__ordinal1
             => k1_relat_1(C) = A ) )
        & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
        & ! [C] : 
            ( ( v1_relat_1(C)
              & v1_funct_1(C)
              & v5_ordinal1(C) )
           => ( C = c1_60_2__ordinal1
             => k1_relat_1(C) = B ) ) )
     => A = B ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_60_2__ordinal1])],[i2_60_2__ordinal1]),dh_c2_60_2]),
    [thesis,file(ordinal1,i1_60_2__ordinal1),[file(ordinal1,i1_60_2__ordinal1)]]).

fof(i1_60_3__ordinal1,plain,(
    ! [A] : 
      ( r2_hidden(k4_tarski(c1_60_3__ordinal1,A),c3_60__ordinal1)
     => v3_ordinal1(A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_60_3__ordinal1])],[i2_60_3__ordinal1]),dh_c2_60_3]),
    [thesis,file(ordinal1,i1_60_3__ordinal1),[file(ordinal1,i1_60_3__ordinal1)]]).

fof(i1_60_4__ordinal1,plain,
    ( r2_hidden(c1_60_4__ordinal1,k2_relat_1(c3_60__ordinal1))
   => v3_ordinal1(c1_60_4__ordinal1) ),
    inference(discharge_asm,[discharged([e1_60_4__ordinal1])],[i2_60_4__ordinal1]),
    [thesis,file(ordinal1,i1_60_4__ordinal1),[file(ordinal1,i1_60_4__ordinal1)]]).

fof(i1_60_5_1_1__ordinal1,plain,
    ( r2_hidden(c1_60_5_1_1__ordinal1,k1_relat_1(c2_60__ordinal1))
   => r2_hidden(c1_60_5_1_1__ordinal1,c5_60__ordinal1) ),
    inference(discharge_asm,[discharged([e1_60_5_1_1__ordinal1])],[i2_60_5_1_1__ordinal1]),
    [thesis,file(ordinal1,i1_60_5_1_1__ordinal1),[file(ordinal1,i1_60_5_1_1__ordinal1)]]).

fof(i1_60_5_1_2_1__ordinal1,plain,
    ( r2_hidden(c1_60_5_1_2_1__ordinal1,c1_60__ordinal1)
   => r1_ordinal1(k1_relat_1(c1_60_5_1_2_1__ordinal1),c2_60_5_1__ordinal1) ),
    inference(discharge_asm,[discharged([e1_60_5_1_2_1__ordinal1])],[i2_60_5_1_2_1__ordinal1]),
    [thesis,file(ordinal1,i1_60_5_1_2_1__ordinal1),[file(ordinal1,i1_60_5_1_2_1__ordinal1)]]).

fof(i1_60_5_1_2_2__ordinal1,plain,
    ( r2_hidden(c1_60_5_1_2_2__ordinal1,k2_relat_1(c3_60__ordinal1))
   => r1_ordinal1(c1_60_5_1_2_2__ordinal1,c2_60_5_1__ordinal1) ),
    inference(discharge_asm,[discharged([e1_60_5_1_2_2__ordinal1])],[i2_60_5_1_2_2__ordinal1]),
    [thesis,file(ordinal1,i1_60_5_1_2_2__ordinal1),[file(ordinal1,i1_60_5_1_2_2__ordinal1)]]).

fof(i1_60_5_1_2__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e7_60_5_1_2__ordinal1,i2_60_5_1_2__ordinal1]),
    [thesis,file(ordinal1,i1_60_5_1_2__ordinal1),[file(ordinal1,i1_60_5_1_2__ordinal1)]]).

fof(i1_60_5_1__ordinal1,plain,(
    r1_tarski(c5_60__ordinal1,k1_relat_1(c2_60__ordinal1)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60_5_1__ordinal1])],[d3_tarski,i2_60_5_1__ordinal1]),cc2_ordinal1,rc1_ordinal1,cc1_ordinal1,rc1_funct_1,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k1_relat_1,dt_c2_60__ordinal1,dt_c5_60__ordinal1,dh_c1_60_5_1]),
    [thesis,file(ordinal1,i1_60_5_1__ordinal1),[file(ordinal1,i1_60_5_1__ordinal1)]]).

fof(i1_60_5__ordinal1,axiom,(
    $true ),
    file(ordinal1,i1_60_5__ordinal1),
    [thesis,trivial,file(ordinal1,i1_60_5__ordinal1)]).

fof(i1_60__ordinal1,plain,
    ( ( ! [A] : 
          ( r2_hidden(A,c1_60__ordinal1)
         => ( v1_relat_1(A)
            & v1_funct_1(A)
            & v5_ordinal1(A) ) )
      & v6_ordinal1(c1_60__ordinal1) )
   => ( v1_relat_1(k3_tarski(c1_60__ordinal1))
      & v1_funct_1(k3_tarski(c1_60__ordinal1))
      & v5_ordinal1(k3_tarski(c1_60__ordinal1)) ) ),
    inference(discharge_asm,[discharged([e1_60__ordinal1,e2_60__ordinal1])],[i2_60__ordinal1]),
    [thesis,file(ordinal1,i1_60__ordinal1),[file(ordinal1,i1_60__ordinal1)]]).

fof(i1_64__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ~ ( ~ r2_xboole_0(c1_64__ordinal1,A)
          & c1_64__ordinal1 != A
          & ~ r2_xboole_0(A,c1_64__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_64__ordinal1])],[i2_64__ordinal1]),dh_c2_64]),
    [thesis,file(ordinal1,i1_64__ordinal1),[file(ordinal1,i1_64__ordinal1)]]).

fof(i1_8__ordinal1,plain,(
    r2_hidden(c1_8__ordinal1,k1_ordinal1(c1_8__ordinal1)) ),
    inference(conclusion,[],[e3_8__ordinal1,i2_8__ordinal1]),
    [thesis,file(ordinal1,i1_8__ordinal1),[file(ordinal1,i1_8__ordinal1)]]).

fof(i1_9__ordinal1,plain,(
    ! [A] : 
      ( k1_ordinal1(c1_9__ordinal1) = k1_ordinal1(A)
     => c1_9__ordinal1 = A ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_9__ordinal1])],[i2_9__ordinal1]),dh_c2_9]),
    [thesis,file(ordinal1,i1_9__ordinal1),[file(ordinal1,i1_9__ordinal1)]]).

fof(i2_10_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_10_1__ordinal1),
    [thesis,trivial,file(ordinal1,i2_10_1__ordinal1)]).

fof(i2_10__ordinal1,plain,
    ( r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1))
  <=> ( r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
      | c1_10__ordinal1 = c2_10__ordinal1 ) ),
    inference(conclusion,[],[e1_10__ordinal1,i3_10__ordinal1]),
    [thesis,file(ordinal1,i2_10__ordinal1),[file(ordinal1,i2_10__ordinal1)]]).

fof(i2_11__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e3_11__ordinal1,i3_11__ordinal1]),
    [thesis,file(ordinal1,i2_11__ordinal1),[file(ordinal1,i2_11__ordinal1)]]).

fof(i2_19__ordinal1,plain,(
    ! [A] : 
      ( v1_ordinal1(A)
     => ( ( r2_hidden(A,c1_19__ordinal1)
          & r2_hidden(c1_19__ordinal1,c2_19__ordinal1) )
       => r2_hidden(A,c2_19__ordinal1) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_19__ordinal1])],[i3_19__ordinal1]),dh_c3_19]),
    [thesis,file(ordinal1,i2_19__ordinal1),[file(ordinal1,i2_19__ordinal1)]]).

fof(i2_1__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_1__ordinal1,c2_1__ordinal1)
        & r2_hidden(c2_1__ordinal1,A)
        & r2_hidden(A,c1_1__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_1__ordinal1])],[i3_1__ordinal1]),dh_c3_1]),
    [thesis,file(ordinal1,i2_1__ordinal1),[file(ordinal1,i2_1__ordinal1)]]).

fof(i2_20_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_20_1__ordinal1),
    [thesis,trivial,file(ordinal1,i2_20_1__ordinal1)]).

fof(i2_20_2__ordinal1,plain,(
    r2_hidden(c1_20_2__ordinal1,c1_20__ordinal1) ),
    inference(conclusion,[],[e3_20_2__ordinal1,i3_20_2__ordinal1]),
    [thesis,file(ordinal1,i2_20_2__ordinal1),[file(ordinal1,i2_20_2__ordinal1)]]).

fof(i2_20_3__ordinal1,plain,(
    r2_hidden(c1_20_3__ordinal1,c4_20__ordinal1) ),
    inference(conclusion,[],[e6_20_3__ordinal1,i3_20_3__ordinal1]),
    [thesis,file(ordinal1,i2_20_3__ordinal1),[file(ordinal1,i2_20_3__ordinal1)]]).

fof(i2_20__ordinal1,plain,
    ( r2_xboole_0(c1_20__ordinal1,c2_20__ordinal1)
   => r2_hidden(c1_20__ordinal1,c2_20__ordinal1) ),
    inference(discharge_asm,[discharged([e1_20__ordinal1])],[i3_20__ordinal1]),
    [thesis,file(ordinal1,i2_20__ordinal1),[file(ordinal1,i2_20__ordinal1)]]).

fof(i2_21__ordinal1,plain,
    ( ( r1_tarski(c1_21__ordinal1,c2_21__ordinal1)
      & r2_hidden(c2_21__ordinal1,c3_21__ordinal1) )
   => r2_hidden(c1_21__ordinal1,c3_21__ordinal1) ),
    inference(discharge_asm,[discharged([e1_21__ordinal1])],[i3_21__ordinal1]),
    [thesis,file(ordinal1,i2_21__ordinal1),[file(ordinal1,i2_21__ordinal1)]]).

fof(i2_22_1__ordinal1,plain,(
    r1_tarski(c1_22_1__ordinal1,c1_22__ordinal1) ),
    inference(discharge_asm,[discharged([e2_22_1__ordinal1])],[i3_22_1__ordinal1]),
    [thesis,file(ordinal1,i2_22_1__ordinal1),[file(ordinal1,i2_22_1__ordinal1)]]).

fof(i2_22__ordinal1,plain,
    ( r2_hidden(c1_22__ordinal1,c2_22__ordinal1)
   => v3_ordinal1(c1_22__ordinal1) ),
    inference(discharge_asm,[discharged([e1_22__ordinal1])],[i3_22__ordinal1]),
    [thesis,file(ordinal1,i2_22__ordinal1),[file(ordinal1,i2_22__ordinal1)]]).

fof(i2_23_1__ordinal1,plain,(
    r2_hidden(c1_23_1__ordinal1,c2_23__ordinal1) ),
    inference(conclusion,[],[e3_23_1__ordinal1,i3_23_1__ordinal1]),
    [thesis,file(ordinal1,i2_23_1__ordinal1),[file(ordinal1,i2_23_1__ordinal1)]]).

fof(i2_23__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_23__ordinal1,c2_23__ordinal1)
      & c1_23__ordinal1 != c2_23__ordinal1
      & ~ r2_hidden(c2_23__ordinal1,c1_23__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_23__ordinal1])],[i3_23__ordinal1]),
    [thesis,file(ordinal1,i2_23__ordinal1),[file(ordinal1,i2_23__ordinal1)]]).

fof(i2_25__ordinal1,plain,(
    r3_xboole_0(c1_25__ordinal1,c2_25__ordinal1) ),
    inference(conclusion,[],[e2_25__ordinal1,i3_25__ordinal1]),
    [thesis,file(ordinal1,i2_25__ordinal1),[file(ordinal1,i2_25__ordinal1)]]).

fof(i2_26__ordinal1,plain,
    ( r1_ordinal1(c1_26__ordinal1,c2_26__ordinal1)
    | r2_hidden(c2_26__ordinal1,c1_26__ordinal1) ),
    inference(conclusion,[],[e2_26__ordinal1,i3_26__ordinal1]),
    [thesis,file(ordinal1,i2_26__ordinal1),[file(ordinal1,i2_26__ordinal1)]]).

fof(i2_2__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
        & r2_hidden(c2_2__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,c1_2__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_2__ordinal1])],[i3_2__ordinal1]),dh_c3_2]),
    [thesis,file(ordinal1,i2_2__ordinal1),[file(ordinal1,i2_2__ordinal1)]]).

fof(i2_30_1__ordinal1,plain,
    ( r2_hidden(c1_30_1__ordinal1,c1_30__ordinal1)
    | c1_30_1__ordinal1 = c1_30__ordinal1 ),
    inference(conclusion,[],[e3_30_1__ordinal1,i3_30_1__ordinal1]),
    [thesis,file(ordinal1,i2_30_1__ordinal1),[file(ordinal1,i2_30_1__ordinal1)]]).

fof(i2_30_2_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_30_2_1__ordinal1),
    [thesis,trivial,file(ordinal1,i2_30_2_1__ordinal1)]).

fof(i2_30_2__ordinal1,plain,(
    r1_tarski(c1_30_2__ordinal1,k1_ordinal1(c1_30__ordinal1)) ),
    inference(conclusion,[],[e4_30_2__ordinal1,i3_30_2__ordinal1]),
    [thesis,file(ordinal1,i2_30_2__ordinal1),[file(ordinal1,i2_30_2__ordinal1)]]).

fof(i2_30_3__ordinal1,plain,(
    ~ ( r2_hidden(c1_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
      & r2_hidden(c2_30_3__ordinal1,k1_ordinal1(c1_30__ordinal1))
      & ~ r2_hidden(c1_30_3__ordinal1,c2_30_3__ordinal1)
      & c1_30_3__ordinal1 != c2_30_3__ordinal1
      & ~ r2_hidden(c2_30_3__ordinal1,c1_30_3__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_30_3__ordinal1])],[i3_30_3__ordinal1]),
    [thesis,file(ordinal1,i2_30_3__ordinal1),[file(ordinal1,i2_30_3__ordinal1)]]).

fof(i2_30__ordinal1,plain,(
    v3_ordinal1(k1_ordinal1(c1_30__ordinal1)) ),
    inference(conclusion,[],[e7_30__ordinal1,i3_30__ordinal1]),
    [thesis,file(ordinal1,i2_30__ordinal1),[file(ordinal1,i2_30__ordinal1)]]).

fof(i2_3_1_1_1_1__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_1__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_1__ordinal1,c1_3_1__ordinal1) ),
    inference(conclusion,[],[e2_3_1_1_1_1__ordinal1,i3_3_1_1_1_1__ordinal1]),
    [thesis,file(ordinal1,i2_3_1_1_1_1__ordinal1),[file(ordinal1,i2_3_1_1_1_1__ordinal1)]]).

fof(i2_3_1_1_1_2__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_2__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_2__ordinal1,c1_3_1__ordinal1) ),
    inference(conclusion,[],[e2_3_1_1_1_2__ordinal1,i3_3_1_1_1_2__ordinal1]),
    [thesis,file(ordinal1,i2_3_1_1_1_2__ordinal1),[file(ordinal1,i2_3_1_1_1_2__ordinal1)]]).

fof(i2_3_1_1_1_3__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_3__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_3__ordinal1,c1_3_1__ordinal1) ),
    inference(conclusion,[],[e2_3_1_1_1_3__ordinal1,i3_3_1_1_1_3__ordinal1]),
    [thesis,file(ordinal1,i2_3_1_1_1_3__ordinal1),[file(ordinal1,i2_3_1_1_1_3__ordinal1)]]).

fof(i2_3_1_1_1_4__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_4__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_4__ordinal1,c1_3_1__ordinal1) ),
    inference(conclusion,[],[e2_3_1_1_1_4__ordinal1,i3_3_1_1_1_4__ordinal1]),
    [thesis,file(ordinal1,i2_3_1_1_1_4__ordinal1),[file(ordinal1,i2_3_1_1_1_4__ordinal1)]]).

fof(i2_3_1_1_1_5__ordinal1,plain,
    ( r2_hidden(c1_3_1_1_1_5__ordinal1,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
    & r2_hidden(c1_3_1_1_1_5__ordinal1,c1_3_1__ordinal1) ),
    inference(conclusion,[],[e2_3_1_1_1_5__ordinal1,i3_3_1_1_1_5__ordinal1]),
    [thesis,file(ordinal1,i2_3_1_1_1_5__ordinal1),[file(ordinal1,i2_3_1_1_1_5__ordinal1)]]).

fof(i2_3_1_1_1__ordinal1,plain,(
    ~ ( c1_3_1__ordinal1 = c2_3__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
            & r2_hidden(A,c1_3_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_3_1_1_1_2__ordinal1])],[i1_3_1_1_1_2__ordinal1]),
    [thesis,file(ordinal1,i2_3_1_1_1__ordinal1),[file(ordinal1,i2_3_1_1_1__ordinal1)]]).

fof(i2_31_1__ordinal1,plain,(
    r1_tarski(c1_31_1__ordinal1,k3_tarski(c1_31__ordinal1)) ),
    inference(conclusion,[],[e7_31_1__ordinal1,i3_31_1__ordinal1]),
    [thesis,file(ordinal1,i2_31_1__ordinal1),[file(ordinal1,i2_31_1__ordinal1)]]).

fof(i2_3_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
      & r2_hidden(A,c1_3_1__ordinal1) ) ),
    inference(conclusion,[],[e3_3_1__ordinal1,i3_3_1__ordinal1]),
    [thesis,file(ordinal1,i2_3_1__ordinal1),[file(ordinal1,i2_3_1__ordinal1)]]).

fof(i2_31__ordinal1,plain,(
    v3_ordinal1(k3_tarski(c1_31__ordinal1)) ),
    inference(conclusion,[],[reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_31__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,d2_ordinal1,d4_ordinal1,e3_31__ordinal1,i3_31__ordinal1]),
    [thesis,file(ordinal1,i2_31__ordinal1),[file(ordinal1,i2_31__ordinal1)]]).

fof(i2_34_1__ordinal1,plain,(
    r1_tarski(c1_34_1__ordinal1,c1_34__ordinal1) ),
    inference(conclusion,[],[e2_34_1__ordinal1,i3_34_1__ordinal1]),
    [thesis,file(ordinal1,i2_34_1__ordinal1),[file(ordinal1,i2_34_1__ordinal1)]]).

fof(i2_34__ordinal1,plain,(
    v3_ordinal1(c1_34__ordinal1) ),
    inference(conclusion,[],[dt_c1_34__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,d4_ordinal1,e2_34__ordinal1,i3_34__ordinal1]),
    [thesis,file(ordinal1,i2_34__ordinal1),[file(ordinal1,i2_34__ordinal1)]]).

fof(i2_35__ordinal1,plain,(
    ~ ( r1_tarski(c1_35__ordinal1,c2_35__ordinal1)
      & c1_35__ordinal1 != k1_xboole_0
      & ! [A] : 
          ( v3_ordinal1(A)
         => ~ ( r2_hidden(A,c1_35__ordinal1)
              & ! [B] : 
                  ( v3_ordinal1(B)
                 => ( r2_hidden(B,c1_35__ordinal1)
                   => r1_ordinal1(A,B) ) ) ) ) ) ),
    inference(discharge_asm,[discharged([e2_35__ordinal1])],[i3_35__ordinal1]),
    [thesis,file(ordinal1,i2_35__ordinal1),[file(ordinal1,i2_35__ordinal1)]]).

fof(i2_36_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_36_1__ordinal1),
    [thesis,trivial,file(ordinal1,i2_36_1__ordinal1)]).

fof(i2_36__ordinal1,plain,
    ( r2_hidden(c1_36__ordinal1,c2_36__ordinal1)
  <=> r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1) ),
    inference(conclusion,[],[e1_36__ordinal1,i3_36__ordinal1]),
    [thesis,file(ordinal1,i2_36__ordinal1),[file(ordinal1,i2_36__ordinal1)]]).

fof(i2_37_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_37_1__ordinal1),
    [thesis,trivial,file(ordinal1,i2_37_1__ordinal1)]).

fof(i2_37__ordinal1,plain,
    ( r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1))
  <=> r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1) ),
    inference(conclusion,[],[e1_37__ordinal1,i3_37__ordinal1]),
    [thesis,file(ordinal1,i2_37__ordinal1),[file(ordinal1,i2_37__ordinal1)]]).

fof(i2_3__ordinal1,plain,(
    ! [A,B,C] : 
      ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
        & r2_hidden(c2_3__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,c1_3__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_3__ordinal1])],[i3_3__ordinal1]),dh_c3_3]),
    [thesis,file(ordinal1,i2_3__ordinal1),[file(ordinal1,i2_3__ordinal1)]]).

fof(i2_40_1__ordinal1,plain,(
    r1_tarski(c1_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_40_1__ordinal1])],[d3_tarski,i3_40_1__ordinal1]),reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dt_c1_40_1__ordinal1,dh_c3_40_1]),
    [thesis,file(ordinal1,i2_40_1__ordinal1),[file(ordinal1,i2_40_1__ordinal1)]]).

fof(i2_40__ordinal1,plain,(
    v3_ordinal1(k3_tarski(c1_40__ordinal1)) ),
    inference(conclusion,[],[dt_k3_tarski,dt_c1_40__ordinal1,cc1_ordinal1,cc2_ordinal1,rc1_ordinal1,fc4_ordinal1,d4_ordinal1,e2_40__ordinal1,i3_40__ordinal1]),
    [thesis,file(ordinal1,i2_40__ordinal1),[file(ordinal1,i2_40__ordinal1)]]).

fof(i2_4_1_1_1_1__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_1__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_1__ordinal1,c1_4_1__ordinal1) ),
    inference(conclusion,[],[e2_4_1_1_1_1__ordinal1,i3_4_1_1_1_1__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1_1__ordinal1),[file(ordinal1,i2_4_1_1_1_1__ordinal1)]]).

fof(i2_4_1_1_1_2__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_2__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_2__ordinal1,c1_4_1__ordinal1) ),
    inference(conclusion,[],[e2_4_1_1_1_2__ordinal1,i3_4_1_1_1_2__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1_2__ordinal1),[file(ordinal1,i2_4_1_1_1_2__ordinal1)]]).

fof(i2_4_1_1_1_3__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_3__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_3__ordinal1,c1_4_1__ordinal1) ),
    inference(conclusion,[],[e2_4_1_1_1_3__ordinal1,i3_4_1_1_1_3__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1_3__ordinal1),[file(ordinal1,i2_4_1_1_1_3__ordinal1)]]).

fof(i2_4_1_1_1_4__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_4__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_4__ordinal1,c1_4_1__ordinal1) ),
    inference(conclusion,[],[e2_4_1_1_1_4__ordinal1,i3_4_1_1_1_4__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1_4__ordinal1),[file(ordinal1,i2_4_1_1_1_4__ordinal1)]]).

fof(i2_4_1_1_1_5__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_5__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_5__ordinal1,c1_4_1__ordinal1) ),
    inference(conclusion,[],[e2_4_1_1_1_5__ordinal1,i3_4_1_1_1_5__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1_5__ordinal1),[file(ordinal1,i2_4_1_1_1_5__ordinal1)]]).

fof(i2_4_1_1_1_6__ordinal1,plain,
    ( r2_hidden(c1_4_1_1_1_6__ordinal1,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
    & r2_hidden(c1_4_1_1_1_6__ordinal1,c1_4_1__ordinal1) ),
    inference(conclusion,[],[e2_4_1_1_1_6__ordinal1,i3_4_1_1_1_6__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1_6__ordinal1),[file(ordinal1,i2_4_1_1_1_6__ordinal1)]]).

fof(i2_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 = c2_4__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1_1_1_2__ordinal1])],[i1_4_1_1_1_2__ordinal1]),
    [thesis,file(ordinal1,i2_4_1_1_1__ordinal1),[file(ordinal1,i2_4_1_1_1__ordinal1)]]).

fof(i2_4_1__ordinal1,plain,(
    ? [A] : 
      ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
      & r2_hidden(A,c1_4_1__ordinal1) ) ),
    inference(conclusion,[],[e3_4_1__ordinal1,i3_4_1__ordinal1]),
    [thesis,file(ordinal1,i2_4_1__ordinal1),[file(ordinal1,i2_4_1__ordinal1)]]).

fof(i2_41__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & r1_tarski(c1_41__ordinal1,A) ) ),
    inference(take,[],[cc2_ordinal1,rc1_ordinal1,reflexivity_r1_tarski,dt_c1_41__ordinal1,dt_c2_41__ordinal1,cc1_ordinal1,i3_41__ordinal1]),
    [thesis,file(ordinal1,i2_41__ordinal1),[file(ordinal1,i2_41__ordinal1)]]).

fof(i2_42_1_1__ordinal1,plain,(
    r2_hidden(c1_42_1_1__ordinal1,c1_42__ordinal1) ),
    inference(conclusion,[],[e3_42_1_1__ordinal1,i3_42_1_1__ordinal1]),
    [thesis,file(ordinal1,i2_42_1_1__ordinal1),[file(ordinal1,i2_42_1_1__ordinal1)]]).

fof(i2_42_1__ordinal1,plain,(
    r1_tarski(c1_42_1__ordinal1,c1_42__ordinal1) ),
    inference(conclusion,[],[e3_42_1__ordinal1,i3_42_1__ordinal1]),
    [thesis,file(ordinal1,i2_42_1__ordinal1),[file(ordinal1,i2_42_1__ordinal1)]]).

fof(i2_42_2__ordinal1,plain,(
    ~ ( r2_hidden(c1_42_2__ordinal1,c1_42__ordinal1)
      & r2_hidden(c2_42_2__ordinal1,c1_42__ordinal1)
      & ~ r2_hidden(c1_42_2__ordinal1,c2_42_2__ordinal1)
      & c1_42_2__ordinal1 != c2_42_2__ordinal1
      & ~ r2_hidden(c2_42_2__ordinal1,c1_42_2__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_42_2__ordinal1])],[i3_42_2__ordinal1]),
    [thesis,file(ordinal1,i2_42_2__ordinal1),[file(ordinal1,i2_42_2__ordinal1)]]).

fof(i2_42__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_42__ordinal1),
    [thesis,trivial,file(ordinal1,i2_42__ordinal1)]).

fof(i2_43_1__ordinal1,plain,(
    r2_hidden(c1_43_1__ordinal1,c2_43__ordinal1) ),
    inference(conclusion,[],[e3_43_1__ordinal1,i3_43_1__ordinal1]),
    [thesis,file(ordinal1,i2_43_1__ordinal1),[file(ordinal1,i2_43_1__ordinal1)]]).

fof(i2_43__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_43__ordinal1),
    [thesis,trivial,file(ordinal1,i2_43__ordinal1)]).

fof(i2_44__ordinal1,plain,
    ( ~ r2_hidden(c4_44__ordinal1,c1_44__ordinal1)
    & ! [A] : 
        ( v3_ordinal1(A)
       => ( ~ r2_hidden(A,c1_44__ordinal1)
         => r1_ordinal1(c4_44__ordinal1,A) ) ) ),
    inference(conclusion,[],[e11_44__ordinal1,i3_44__ordinal1]),
    [thesis,file(ordinal1,i2_44__ordinal1),[file(ordinal1,i2_44__ordinal1)]]).

fof(i2_47_1__ordinal1,plain,
    ( r2_hidden(c1_47_1__ordinal1,c1_47__ordinal1)
   => r2_hidden(k1_ordinal1(c1_47_1__ordinal1),c1_47__ordinal1) ),
    inference(discharge_asm,[discharged([e3_47_1__ordinal1])],[i3_47_1__ordinal1]),
    [thesis,file(ordinal1,i2_47_1__ordinal1),[file(ordinal1,i2_47_1__ordinal1)]]).

fof(i2_47_2__ordinal1,plain,(
    r2_hidden(c1_47_2__ordinal1,k3_tarski(c1_47__ordinal1)) ),
    inference(conclusion,[],[e5_47_2__ordinal1,i3_47_2__ordinal1]),
    [thesis,file(ordinal1,i2_47_2__ordinal1),[file(ordinal1,i2_47_2__ordinal1)]]).

fof(i2_47_3__ordinal1,plain,(
    r2_hidden(c1_47_3__ordinal1,c1_47__ordinal1) ),
    inference(conclusion,[],[e5_47_3__ordinal1,i3_47_3__ordinal1]),
    [thesis,file(ordinal1,i2_47_3__ordinal1),[file(ordinal1,i2_47_3__ordinal1)]]).

fof(i2_47__ordinal1,plain,
    ( ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c1_47__ordinal1)
         => r2_hidden(k1_ordinal1(A),c1_47__ordinal1) ) )
   => v4_ordinal1(c1_47__ordinal1) ),
    inference(discharge_asm,[discharged([e2_47__ordinal1])],[i3_47__ordinal1]),
    [thesis,file(ordinal1,i2_47__ordinal1),[file(ordinal1,i2_47__ordinal1)]]).

fof(i2_48_1__ordinal1,plain,(
    c1_48__ordinal1 = k1_ordinal1(c1_48_1__ordinal1) ),
    inference(discharge_asm,[discharged([e4_48_1__ordinal1])],[i3_48_1__ordinal1]),
    [thesis,file(ordinal1,i2_48_1__ordinal1),[file(ordinal1,i2_48_1__ordinal1)]]).

fof(i2_48__ordinal1,plain,(
    ~ ( ? [A] : 
          ( v3_ordinal1(A)
          & c1_48__ordinal1 = k1_ordinal1(A) )
      & v4_ordinal1(c1_48__ordinal1) ) ),
    inference(discharge_asm,[discharged([e2_48__ordinal1])],[i3_48__ordinal1]),
    [thesis,file(ordinal1,i2_48__ordinal1),[file(ordinal1,i2_48__ordinal1)]]).

fof(i2_4__ordinal1,plain,(
    ! [A,B,C,D] : 
      ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
        & r2_hidden(c2_4__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,D)
        & r2_hidden(D,c1_4__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_4__ordinal1])],[i3_4__ordinal1]),dh_c3_4]),
    [thesis,file(ordinal1,i2_4__ordinal1),[file(ordinal1,i2_4__ordinal1)]]).

fof(i2_53_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_53_1__ordinal1),
    [thesis,trivial,file(ordinal1,i2_53_1__ordinal1)]).

fof(i2_53__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_53__ordinal1),
    [thesis,trivial,file(ordinal1,i2_53__ordinal1)]).

fof(i2_54__ordinal1,plain,(
    m1_ordinal1(c1_54__ordinal1,k2_relat_1(c1_54__ordinal1)) ),
    inference(conclusion,[],[e3_54__ordinal1,i3_54__ordinal1]),
    [thesis,file(ordinal1,i2_54__ordinal1),[file(ordinal1,i2_54__ordinal1)]]).

fof(i2_56__ordinal1,plain,
    ( r1_tarski(c1_56__ordinal1,c2_56__ordinal1)
   => ! [A] : 
        ( m1_ordinal1(A,c1_56__ordinal1)
       => m1_ordinal1(A,c2_56__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_56__ordinal1])],[i3_56__ordinal1]),
    [thesis,file(ordinal1,i2_56__ordinal1),[file(ordinal1,i2_56__ordinal1)]]).

fof(i2_58__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => m1_ordinal1(k2_ordinal1(c2_58__ordinal1,A),c1_58__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_58__ordinal1])],[i3_58__ordinal1]),dh_c3_58]),
    [thesis,file(ordinal1,i2_58__ordinal1),[file(ordinal1,i2_58__ordinal1)]]).

fof(i2_5__ordinal1,plain,(
    ~ ( r2_hidden(c1_5__ordinal1,c2_5__ordinal1)
      & r1_tarski(c2_5__ordinal1,c1_5__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_5__ordinal1])],[i3_5__ordinal1]),
    [thesis,file(ordinal1,i2_5__ordinal1),[file(ordinal1,i2_5__ordinal1)]]).

fof(i2_60_1_1__ordinal1,plain,(
    ? [A,B] : k4_tarski(A,B) = c1_60_1_1__ordinal1 ),
    inference(conclusion,[],[e6_60_1_1__ordinal1,i3_60_1_1__ordinal1]),
    [thesis,file(ordinal1,i2_60_1_1__ordinal1),[file(ordinal1,i2_60_1_1__ordinal1)]]).

fof(i2_60_1__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,A),k3_tarski(c1_60__ordinal1))
        & r2_hidden(k4_tarski(c1_60_1__ordinal1,B),k3_tarski(c1_60__ordinal1))
        & A != B ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_60_1__ordinal1])],[i3_60_1__ordinal1]),dh_c2_60_1]),
    [thesis,file(ordinal1,i2_60_1__ordinal1),[file(ordinal1,i2_60_1__ordinal1)]]).

fof(i2_60_2__ordinal1,plain,(
    ! [A] : 
      ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
        & ! [B] : 
            ( ( v1_relat_1(B)
              & v1_funct_1(B)
              & v5_ordinal1(B) )
           => ( B = c1_60_2__ordinal1
             => k1_relat_1(B) = c2_60_2__ordinal1 ) )
        & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
        & ! [B] : 
            ( ( v1_relat_1(B)
              & v1_funct_1(B)
              & v5_ordinal1(B) )
           => ( B = c1_60_2__ordinal1
             => k1_relat_1(B) = A ) ) )
     => c2_60_2__ordinal1 = A ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_60_2__ordinal1])],[i3_60_2__ordinal1]),dh_c3_60_2]),
    [thesis,file(ordinal1,i2_60_2__ordinal1),[file(ordinal1,i2_60_2__ordinal1)]]).

fof(i2_60_3__ordinal1,plain,
    ( r2_hidden(k4_tarski(c1_60_3__ordinal1,c2_60_3__ordinal1),c3_60__ordinal1)
   => v3_ordinal1(c2_60_3__ordinal1) ),
    inference(discharge_asm,[discharged([e1_60_3__ordinal1])],[i3_60_3__ordinal1]),
    [thesis,file(ordinal1,i2_60_3__ordinal1),[file(ordinal1,i2_60_3__ordinal1)]]).

fof(i2_60_4__ordinal1,plain,(
    v3_ordinal1(c1_60_4__ordinal1) ),
    inference(conclusion,[],[e5_60_4__ordinal1,i3_60_4__ordinal1]),
    [thesis,file(ordinal1,i2_60_4__ordinal1),[file(ordinal1,i2_60_4__ordinal1)]]).

fof(i2_60_5_1_1__ordinal1,plain,(
    r2_hidden(c1_60_5_1_1__ordinal1,c5_60__ordinal1) ),
    inference(conclusion,[],[e13_60_5_1_1__ordinal1,i3_60_5_1_1__ordinal1]),
    [thesis,file(ordinal1,i2_60_5_1_1__ordinal1),[file(ordinal1,i2_60_5_1_1__ordinal1)]]).

fof(i2_60_5_1_2_1__ordinal1,plain,(
    r1_ordinal1(k1_relat_1(c1_60_5_1_2_1__ordinal1),c2_60_5_1__ordinal1) ),
    inference(conclusion,[],[e3_60_5_1_2_1__ordinal1,i3_60_5_1_2_1__ordinal1]),
    [thesis,file(ordinal1,i2_60_5_1_2_1__ordinal1),[file(ordinal1,i2_60_5_1_2_1__ordinal1)]]).

fof(i2_60_5_1_2_2__ordinal1,plain,(
    r1_ordinal1(c1_60_5_1_2_2__ordinal1,c2_60_5_1__ordinal1) ),
    inference(conclusion,[],[e8_60_5_1_2_2__ordinal1,i3_60_5_1_2_2__ordinal1]),
    [thesis,file(ordinal1,i2_60_5_1_2_2__ordinal1),[file(ordinal1,i2_60_5_1_2_2__ordinal1)]]).

fof(i2_60_5_1_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_60_5_1_2__ordinal1),
    [thesis,trivial,file(ordinal1,i2_60_5_1_2__ordinal1)]).

fof(i2_60_5_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_60_5_1__ordinal1,c5_60__ordinal1)
      & ~ r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(c2_60__ordinal1)) ) ),
    inference(discharge_asm,[discharged([e2_60_5_1__ordinal1])],[i3_60_5_1__ordinal1]),
    [thesis,file(ordinal1,i2_60_5_1__ordinal1),[file(ordinal1,i2_60_5_1__ordinal1)]]).

fof(i2_60__ordinal1,plain,
    ( v1_relat_1(k3_tarski(c1_60__ordinal1))
    & v1_funct_1(k3_tarski(c1_60__ordinal1))
    & v5_ordinal1(k3_tarski(c1_60__ordinal1)) ),
    inference(conclusion,[],[e17_60__ordinal1,i3_60__ordinal1]),
    [thesis,file(ordinal1,i2_60__ordinal1),[file(ordinal1,i2_60__ordinal1)]]).

fof(i2_64__ordinal1,plain,(
    ~ ( ~ r2_xboole_0(c1_64__ordinal1,c2_64__ordinal1)
      & c1_64__ordinal1 != c2_64__ordinal1
      & ~ r2_xboole_0(c2_64__ordinal1,c1_64__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_64__ordinal1])],[i3_64__ordinal1]),
    [thesis,file(ordinal1,i2_64__ordinal1),[file(ordinal1,i2_64__ordinal1)]]).

fof(i2_8__ordinal1,axiom,(
    $true ),
    file(ordinal1,i2_8__ordinal1),
    [thesis,trivial,file(ordinal1,i2_8__ordinal1)]).

fof(i2_9__ordinal1,plain,
    ( k1_ordinal1(c1_9__ordinal1) = k1_ordinal1(c2_9__ordinal1)
   => c1_9__ordinal1 = c2_9__ordinal1 ),
    inference(discharge_asm,[discharged([e1_9__ordinal1,e2_9__ordinal1])],[i3_9__ordinal1]),
    [thesis,file(ordinal1,i2_9__ordinal1),[file(ordinal1,i2_9__ordinal1)]]).

fof(i3_10__ordinal1,plain,
    ( ( r2_hidden(c1_10__ordinal1,c2_10__ordinal1)
      | c1_10__ordinal1 = c2_10__ordinal1 )
   => r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1)) ),
    inference(discharge_asm,[discharged([e2_10__ordinal1])],[i4_10__ordinal1]),
    [thesis,file(ordinal1,i3_10__ordinal1),[file(ordinal1,i3_10__ordinal1)]]).

fof(i3_11__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_11__ordinal1),
    [thesis,trivial,file(ordinal1,i3_11__ordinal1)]).

fof(i3_19__ordinal1,plain,
    ( ( r2_hidden(c3_19__ordinal1,c1_19__ordinal1)
      & r2_hidden(c1_19__ordinal1,c2_19__ordinal1) )
   => r2_hidden(c3_19__ordinal1,c2_19__ordinal1) ),
    inference(discharge_asm,[discharged([e1_19__ordinal1])],[i4_19__ordinal1]),
    [thesis,file(ordinal1,i3_19__ordinal1),[file(ordinal1,i3_19__ordinal1)]]).

fof(i3_1__ordinal1,plain,(
    ~ ( r2_hidden(c1_1__ordinal1,c2_1__ordinal1)
      & r2_hidden(c2_1__ordinal1,c3_1__ordinal1)
      & r2_hidden(c3_1__ordinal1,c1_1__ordinal1) ) ),
    inference(conclusion,[],[e6_1__ordinal1,i4_1__ordinal1]),
    [thesis,file(ordinal1,i3_1__ordinal1),[file(ordinal1,i3_1__ordinal1)]]).

fof(i3_20_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_20_2__ordinal1),
    [thesis,trivial,file(ordinal1,i3_20_2__ordinal1)]).

fof(i3_20_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_20_3__ordinal1),
    [thesis,trivial,file(ordinal1,i3_20_3__ordinal1)]).

fof(i3_20__ordinal1,plain,(
    r2_hidden(c1_20__ordinal1,c2_20__ordinal1) ),
    inference(conclusion,[],[e15_20__ordinal1,i4_20__ordinal1]),
    [thesis,file(ordinal1,i3_20__ordinal1),[file(ordinal1,i3_20__ordinal1)]]).

fof(i3_21__ordinal1,plain,(
    r2_hidden(c1_21__ordinal1,c3_21__ordinal1) ),
    inference(conclusion,[],[e5_21__ordinal1,i4_21__ordinal1]),
    [thesis,file(ordinal1,i3_21__ordinal1),[file(ordinal1,i3_21__ordinal1)]]).

fof(i3_22_1__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e11_22_1__ordinal1,i4_22_1__ordinal1]),
    [thesis,file(ordinal1,i3_22_1__ordinal1),[file(ordinal1,i3_22_1__ordinal1)]]).

fof(i3_22__ordinal1,plain,(
    v3_ordinal1(c1_22__ordinal1) ),
    inference(conclusion,[],[e7_22__ordinal1,i4_22__ordinal1]),
    [thesis,file(ordinal1,i3_22__ordinal1),[file(ordinal1,i3_22__ordinal1)]]).

fof(i3_23_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_23_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_23_1__ordinal1)]).

fof(i3_23__ordinal1,plain,(
    r2_hidden(c2_23__ordinal1,c1_23__ordinal1) ),
    inference(conclusion,[],[e15_23__ordinal1,i4_23__ordinal1]),
    [thesis,file(ordinal1,i3_23__ordinal1),[file(ordinal1,i3_23__ordinal1)]]).

fof(i3_25__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_25__ordinal1),
    [thesis,trivial,file(ordinal1,i3_25__ordinal1)]).

fof(i3_26__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_26__ordinal1),
    [thesis,trivial,file(ordinal1,i3_26__ordinal1)]).

fof(i3_2__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
        & r2_hidden(c2_2__ordinal1,c3_2__ordinal1)
        & r2_hidden(c3_2__ordinal1,A)
        & r2_hidden(A,c1_2__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c4_2__ordinal1])],[i4_2__ordinal1]),dh_c4_2]),
    [thesis,file(ordinal1,i3_2__ordinal1),[file(ordinal1,i3_2__ordinal1)]]).

fof(i3_30_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_30_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_30_1__ordinal1)]).

fof(i3_30_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_30_2__ordinal1),
    [thesis,trivial,file(ordinal1,i3_30_2__ordinal1)]).

fof(i3_30_3__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_30_3__ordinal1,c2_30_3__ordinal1)
      & c1_30_3__ordinal1 != c2_30_3__ordinal1
      & ~ r2_hidden(c2_30_3__ordinal1,c1_30_3__ordinal1) ) ),
    inference(conclusion,[],[e4_30_3__ordinal1,i4_30_3__ordinal1]),
    [thesis,file(ordinal1,i3_30_3__ordinal1),[file(ordinal1,i3_30_3__ordinal1)]]).

fof(i3_30__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_30__ordinal1),
    [thesis,trivial,file(ordinal1,i3_30__ordinal1)]).

fof(i3_3_1_1_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_3_1_1_1_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_3_1_1_1_1__ordinal1)]).

fof(i3_3_1_1_1_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_3_1_1_1_2__ordinal1),
    [thesis,trivial,file(ordinal1,i3_3_1_1_1_2__ordinal1)]).

fof(i3_3_1_1_1_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_3_1_1_1_3__ordinal1),
    [thesis,trivial,file(ordinal1,i3_3_1_1_1_3__ordinal1)]).

fof(i3_3_1_1_1_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_3_1_1_1_4__ordinal1),
    [thesis,trivial,file(ordinal1,i3_3_1_1_1_4__ordinal1)]).

fof(i3_3_1_1_1_5__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_3_1_1_1_5__ordinal1),
    [thesis,trivial,file(ordinal1,i3_3_1_1_1_5__ordinal1)]).

fof(i3_3_1_1_1__ordinal1,plain,(
    ~ ( c1_3_1__ordinal1 = c3_3__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
            & r2_hidden(A,c1_3_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_3_1_1_1_3__ordinal1])],[i1_3_1_1_1_3__ordinal1]),
    [thesis,file(ordinal1,i3_3_1_1_1__ordinal1),[file(ordinal1,i3_3_1_1_1__ordinal1)]]).

fof(i3_31_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_31_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_31_1__ordinal1)]).

fof(i3_3_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_3_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_3_1__ordinal1)]).

fof(i3_31__ordinal1,plain,(
    v2_ordinal1(k3_tarski(c1_31__ordinal1)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_31__ordinal1])],[d3_ordinal1,i4_31__ordinal1]),antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_31__ordinal1,dh_c3_31]),
    [thesis,file(ordinal1,i3_31__ordinal1),[file(ordinal1,i3_31__ordinal1)]]).

fof(i3_34_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_34_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_34_1__ordinal1)]).

fof(i3_34__ordinal1,plain,(
    v2_ordinal1(c1_34__ordinal1) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_34__ordinal1])],[d3_ordinal1,i4_34__ordinal1]),antisymmetry_r2_hidden,dt_c1_34__ordinal1,dh_c2_34]),
    [thesis,file(ordinal1,i3_34__ordinal1),[file(ordinal1,i3_34__ordinal1)]]).

fof(i3_35__ordinal1,plain,(
    ? [A] : 
      ( v3_ordinal1(A)
      & r2_hidden(A,c1_35__ordinal1)
      & ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_hidden(B,c1_35__ordinal1)
           => r1_ordinal1(A,B) ) ) ) ),
    inference(take,[],[reflexivity_r1_tarski,cc2_ordinal1,rc1_ordinal1,reflexivity_r1_ordinal1,connectedness_r1_ordinal1,antisymmetry_r2_hidden,redefinition_r1_ordinal1,dt_c1_35__ordinal1,dt_c5_35__ordinal1,cc1_ordinal1,i4_35__ordinal1]),
    [thesis,file(ordinal1,i3_35__ordinal1),[file(ordinal1,i3_35__ordinal1)]]).

fof(i3_36__ordinal1,plain,
    ( r1_ordinal1(k1_ordinal1(c1_36__ordinal1),c2_36__ordinal1)
   => r2_hidden(c1_36__ordinal1,c2_36__ordinal1) ),
    inference(discharge_asm,[discharged([e2_36__ordinal1])],[i4_36__ordinal1]),
    [thesis,file(ordinal1,i3_36__ordinal1),[file(ordinal1,i3_36__ordinal1)]]).

fof(i3_37__ordinal1,plain,
    ( r1_ordinal1(c1_37__ordinal1,c2_37__ordinal1)
   => r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1)) ),
    inference(discharge_asm,[discharged([e2_37__ordinal1])],[i4_37__ordinal1]),
    [thesis,file(ordinal1,i3_37__ordinal1),[file(ordinal1,i3_37__ordinal1)]]).

fof(i3_3__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
        & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
        & r2_hidden(c3_3__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,c1_3__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c4_3__ordinal1])],[i4_3__ordinal1]),dh_c4_3]),
    [thesis,file(ordinal1,i3_3__ordinal1),[file(ordinal1,i3_3__ordinal1)]]).

fof(i3_40_1__ordinal1,plain,(
    ~ ( r2_hidden(c3_40_1__ordinal1,c1_40_1__ordinal1)
      & ~ r2_hidden(c3_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) ) ),
    inference(discharge_asm,[discharged([e6_40_1__ordinal1])],[i4_40_1__ordinal1]),
    [thesis,file(ordinal1,i3_40_1__ordinal1),[file(ordinal1,i3_40_1__ordinal1)]]).

fof(i3_40__ordinal1,plain,(
    v2_ordinal1(k3_tarski(c1_40__ordinal1)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c2_40__ordinal1])],[d3_ordinal1,i4_40__ordinal1]),antisymmetry_r2_hidden,dt_k3_tarski,dt_c1_40__ordinal1,dh_c2_40]),
    [thesis,file(ordinal1,i3_40__ordinal1),[file(ordinal1,i3_40__ordinal1)]]).

fof(i3_4_1_1_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1_1_1_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1_1_1_1__ordinal1)]).

fof(i3_4_1_1_1_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1_1_1_2__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1_1_1_2__ordinal1)]).

fof(i3_4_1_1_1_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1_1_1_3__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1_1_1_3__ordinal1)]).

fof(i3_4_1_1_1_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1_1_1_4__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1_1_1_4__ordinal1)]).

fof(i3_4_1_1_1_5__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1_1_1_5__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1_1_1_5__ordinal1)]).

fof(i3_4_1_1_1_6__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1_1_1_6__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1_1_1_6__ordinal1)]).

fof(i3_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 = c3_4__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1_1_1_3__ordinal1])],[i1_4_1_1_1_3__ordinal1]),
    [thesis,file(ordinal1,i3_4_1_1_1__ordinal1),[file(ordinal1,i3_4_1_1_1__ordinal1)]]).

fof(i3_4_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_4_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_4_1__ordinal1)]).

fof(i3_41__ordinal1,plain,(
    r1_tarski(c1_41__ordinal1,c2_41__ordinal1) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_41__ordinal1])],[d3_tarski,i4_41__ordinal1]),cc2_ordinal1,rc1_ordinal1,cc1_ordinal1,reflexivity_r1_tarski,antisymmetry_r2_hidden,dt_c1_41__ordinal1,dt_c2_41__ordinal1,dh_c3_41]),
    [thesis,file(ordinal1,i3_41__ordinal1),[file(ordinal1,i3_41__ordinal1)]]).

fof(i3_42_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_42_1_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_42_1_1__ordinal1)]).

fof(i3_42_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_42_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_42_1__ordinal1)]).

fof(i3_42_2__ordinal1,plain,(
    ~ ( ~ r2_hidden(c1_42_2__ordinal1,c2_42_2__ordinal1)
      & c1_42_2__ordinal1 != c2_42_2__ordinal1
      & ~ r2_hidden(c2_42_2__ordinal1,c1_42_2__ordinal1) ) ),
    inference(conclusion,[],[e3_42_2__ordinal1,i4_42_2__ordinal1]),
    [thesis,file(ordinal1,i3_42_2__ordinal1),[file(ordinal1,i3_42_2__ordinal1)]]).

fof(i3_43_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_43_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_43_1__ordinal1)]).

fof(i3_44__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( ~ r2_hidden(A,c1_44__ordinal1)
       => r1_ordinal1(c4_44__ordinal1,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c5_44__ordinal1])],[i4_44__ordinal1]),dh_c5_44]),
    [thesis,file(ordinal1,i3_44__ordinal1),[file(ordinal1,i3_44__ordinal1)]]).

fof(i3_47_1__ordinal1,plain,(
    r2_hidden(k1_ordinal1(c1_47_1__ordinal1),c1_47__ordinal1) ),
    inference(conclusion,[],[e15_47_1__ordinal1,i4_47_1__ordinal1]),
    [thesis,file(ordinal1,i3_47_1__ordinal1),[file(ordinal1,i3_47_1__ordinal1)]]).

fof(i3_47_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_47_2__ordinal1),
    [thesis,trivial,file(ordinal1,i3_47_2__ordinal1)]).

fof(i3_47_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_47_3__ordinal1),
    [thesis,trivial,file(ordinal1,i3_47_3__ordinal1)]).

fof(i3_47__ordinal1,plain,(
    v4_ordinal1(c1_47__ordinal1) ),
    inference(conclusion,[],[e8_47__ordinal1,i4_47__ordinal1]),
    [thesis,file(ordinal1,i3_47__ordinal1),[file(ordinal1,i3_47__ordinal1)]]).

fof(i3_48_1__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e7_48_1__ordinal1,i4_48_1__ordinal1]),
    [thesis,file(ordinal1,i3_48_1__ordinal1),[file(ordinal1,i3_48_1__ordinal1)]]).

fof(i3_48__ordinal1,plain,(
    ~ v4_ordinal1(c1_48__ordinal1) ),
    inference(conclusion,[],[e6_48__ordinal1,i4_48__ordinal1]),
    [thesis,file(ordinal1,i3_48__ordinal1),[file(ordinal1,i3_48__ordinal1)]]).

fof(i3_4__ordinal1,plain,(
    ! [A,B,C] : 
      ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
        & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
        & r2_hidden(c3_4__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,c1_4__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c4_4__ordinal1])],[i4_4__ordinal1]),dh_c4_4]),
    [thesis,file(ordinal1,i3_4__ordinal1),[file(ordinal1,i3_4__ordinal1)]]).

fof(i3_54__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_54__ordinal1),
    [thesis,trivial,file(ordinal1,i3_54__ordinal1)]).

fof(i3_56__ordinal1,plain,(
    ! [A] : 
      ( m1_ordinal1(A,c1_56__ordinal1)
     => m1_ordinal1(A,c2_56__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_56__ordinal1])],[i4_56__ordinal1]),dh_c3_56]),
    [thesis,file(ordinal1,i3_56__ordinal1),[file(ordinal1,i3_56__ordinal1)]]).

fof(i3_58__ordinal1,plain,(
    m1_ordinal1(k2_ordinal1(c2_58__ordinal1,c3_58__ordinal1),c1_58__ordinal1) ),
    inference(conclusion,[],[e2_58__ordinal1,i4_58__ordinal1]),
    [thesis,file(ordinal1,i3_58__ordinal1),[file(ordinal1,i3_58__ordinal1)]]).

fof(i3_5__ordinal1,plain,(
    ~ r1_tarski(c2_5__ordinal1,c1_5__ordinal1) ),
    inference(discharge_asm,[discharged([e2_5__ordinal1])],[i4_5__ordinal1]),
    [thesis,file(ordinal1,i3_5__ordinal1),[file(ordinal1,i3_5__ordinal1)]]).

fof(i3_60_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_60_1_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_60_1_1__ordinal1)]).

fof(i3_60_1__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
        & r2_hidden(k4_tarski(c1_60_1__ordinal1,A),k3_tarski(c1_60__ordinal1))
        & c2_60_1__ordinal1 != A ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_60_1__ordinal1])],[i4_60_1__ordinal1]),dh_c3_60_1]),
    [thesis,file(ordinal1,i3_60_1__ordinal1),[file(ordinal1,i3_60_1__ordinal1)]]).

fof(i3_60_2__ordinal1,plain,
    ( ( r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
      & ! [A] : 
          ( ( v1_relat_1(A)
            & v1_funct_1(A)
            & v5_ordinal1(A) )
         => ( A = c1_60_2__ordinal1
           => k1_relat_1(A) = c2_60_2__ordinal1 ) )
      & r2_hidden(c1_60_2__ordinal1,c1_60__ordinal1)
      & ! [A] : 
          ( ( v1_relat_1(A)
            & v1_funct_1(A)
            & v5_ordinal1(A) )
         => ( A = c1_60_2__ordinal1
           => k1_relat_1(A) = c3_60_2__ordinal1 ) ) )
   => c2_60_2__ordinal1 = c3_60_2__ordinal1 ),
    inference(discharge_asm,[discharged([e1_60_2__ordinal1])],[i4_60_2__ordinal1]),
    [thesis,file(ordinal1,i3_60_2__ordinal1),[file(ordinal1,i3_60_2__ordinal1)]]).

fof(i3_60_3__ordinal1,plain,(
    v3_ordinal1(c2_60_3__ordinal1) ),
    inference(conclusion,[],[e5_60_3__ordinal1,i4_60_3__ordinal1]),
    [thesis,file(ordinal1,i3_60_3__ordinal1),[file(ordinal1,i3_60_3__ordinal1)]]).

fof(i3_60_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_60_4__ordinal1),
    [thesis,trivial,file(ordinal1,i3_60_4__ordinal1)]).

fof(i3_60_5_1_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_60_5_1_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_60_5_1_1__ordinal1)]).

fof(i3_60_5_1_2_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_60_5_1_2_1__ordinal1),
    [thesis,trivial,file(ordinal1,i3_60_5_1_2_1__ordinal1)]).

fof(i3_60_5_1_2_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_60_5_1_2_2__ordinal1),
    [thesis,trivial,file(ordinal1,i3_60_5_1_2_2__ordinal1)]).

fof(i3_60_5_1__ordinal1,plain,(
    r2_hidden(c1_60_5_1__ordinal1,k1_relat_1(c2_60__ordinal1)) ),
    inference(conclusion,[],[e10_60_5_1__ordinal1,i4_60_5_1__ordinal1]),
    [thesis,file(ordinal1,i3_60_5_1__ordinal1),[file(ordinal1,i3_60_5_1__ordinal1)]]).

fof(i3_60__ordinal1,axiom,(
    $true ),
    file(ordinal1,i3_60__ordinal1),
    [thesis,trivial,file(ordinal1,i3_60__ordinal1)]).

fof(i3_64__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e3_64__ordinal1,i4_64__ordinal1]),
    [thesis,file(ordinal1,i3_64__ordinal1),[file(ordinal1,i3_64__ordinal1)]]).

fof(i3_9__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e9_9__ordinal1,i4_9__ordinal1]),
    [thesis,file(ordinal1,i3_9__ordinal1),[file(ordinal1,i3_9__ordinal1)]]).

fof(i4_10__ordinal1,plain,(
    r2_hidden(c1_10__ordinal1,k1_ordinal1(c2_10__ordinal1)) ),
    inference(conclusion,[],[e5_10__ordinal1,i5_10__ordinal1]),
    [thesis,file(ordinal1,i4_10__ordinal1),[file(ordinal1,i4_10__ordinal1)]]).

fof(i4_19__ordinal1,plain,(
    r2_hidden(c3_19__ordinal1,c2_19__ordinal1) ),
    inference(conclusion,[],[e3_19__ordinal1,i5_19__ordinal1]),
    [thesis,file(ordinal1,i4_19__ordinal1),[file(ordinal1,i4_19__ordinal1)]]).

fof(i4_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_1__ordinal1),
    [thesis,trivial,file(ordinal1,i4_1__ordinal1)]).

fof(i4_20__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_20__ordinal1),
    [thesis,trivial,file(ordinal1,i4_20__ordinal1)]).

fof(i4_21__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_21__ordinal1),
    [thesis,trivial,file(ordinal1,i4_21__ordinal1)]).

fof(i4_22_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_22_1__ordinal1),
    [thesis,trivial,file(ordinal1,i4_22_1__ordinal1)]).

fof(i4_22__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_22__ordinal1),
    [thesis,trivial,file(ordinal1,i4_22__ordinal1)]).

fof(i4_23__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_23__ordinal1),
    [thesis,trivial,file(ordinal1,i4_23__ordinal1)]).

fof(i4_2__ordinal1,plain,(
    ~ ( r2_hidden(c1_2__ordinal1,c2_2__ordinal1)
      & r2_hidden(c2_2__ordinal1,c3_2__ordinal1)
      & r2_hidden(c3_2__ordinal1,c4_2__ordinal1)
      & r2_hidden(c4_2__ordinal1,c1_2__ordinal1) ) ),
    inference(conclusion,[],[e6_2__ordinal1,i5_2__ordinal1]),
    [thesis,file(ordinal1,i4_2__ordinal1),[file(ordinal1,i4_2__ordinal1)]]).

fof(i4_30_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_30_3__ordinal1),
    [thesis,trivial,file(ordinal1,i4_30_3__ordinal1)]).

fof(i4_3_1_1_1__ordinal1,plain,(
    ~ ( c1_3_1__ordinal1 = c4_3__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
            & r2_hidden(A,c1_3_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_3_1_1_1_4__ordinal1])],[i1_3_1_1_1_4__ordinal1]),
    [thesis,file(ordinal1,i4_3_1_1_1__ordinal1),[file(ordinal1,i4_3_1_1_1__ordinal1)]]).

fof(i4_31__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c3_31__ordinal1,k3_tarski(c1_31__ordinal1))
        & r2_hidden(A,k3_tarski(c1_31__ordinal1))
        & ~ r2_hidden(c3_31__ordinal1,A)
        & c3_31__ordinal1 != A
        & ~ r2_hidden(A,c3_31__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c4_31__ordinal1])],[i5_31__ordinal1]),dh_c4_31]),
    [thesis,file(ordinal1,i4_31__ordinal1),[file(ordinal1,i4_31__ordinal1)]]).

fof(i4_34__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c2_34__ordinal1,c1_34__ordinal1)
        & r2_hidden(A,c1_34__ordinal1)
        & ~ r2_hidden(c2_34__ordinal1,A)
        & c2_34__ordinal1 != A
        & ~ r2_hidden(A,c2_34__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_34__ordinal1])],[i5_34__ordinal1]),dh_c3_34]),
    [thesis,file(ordinal1,i4_34__ordinal1),[file(ordinal1,i4_34__ordinal1)]]).

fof(i4_35__ordinal1,plain,
    ( r2_hidden(c5_35__ordinal1,c1_35__ordinal1)
    & ! [A] : 
        ( v3_ordinal1(A)
       => ( r2_hidden(A,c1_35__ordinal1)
         => r1_ordinal1(c5_35__ordinal1,A) ) ) ),
    inference(conclusion,[],[e9_35__ordinal1,i5_35__ordinal1]),
    [thesis,file(ordinal1,i4_35__ordinal1),[file(ordinal1,i4_35__ordinal1)]]).

fof(i4_36__ordinal1,plain,(
    r2_hidden(c1_36__ordinal1,c2_36__ordinal1) ),
    inference(conclusion,[],[e4_36__ordinal1,i5_36__ordinal1]),
    [thesis,file(ordinal1,i4_36__ordinal1),[file(ordinal1,i4_36__ordinal1)]]).

fof(i4_37__ordinal1,plain,(
    r2_hidden(c1_37__ordinal1,k1_ordinal1(c2_37__ordinal1)) ),
    inference(discharge_asm,[discharged([e3_37__ordinal1])],[i5_37__ordinal1]),
    [thesis,file(ordinal1,i4_37__ordinal1),[file(ordinal1,i4_37__ordinal1)]]).

fof(i4_3__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
        & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
        & r2_hidden(c3_3__ordinal1,c4_3__ordinal1)
        & r2_hidden(c4_3__ordinal1,A)
        & r2_hidden(A,c1_3__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c5_3__ordinal1])],[i5_3__ordinal1]),dh_c5_3]),
    [thesis,file(ordinal1,i4_3__ordinal1),[file(ordinal1,i4_3__ordinal1)]]).

fof(i4_40_1__ordinal1,plain,(
    r2_hidden(c3_40_1__ordinal1,k3_tarski(c1_40__ordinal1)) ),
    inference(conclusion,[],[e7_40_1__ordinal1,i5_40_1__ordinal1]),
    [thesis,file(ordinal1,i4_40_1__ordinal1),[file(ordinal1,i4_40_1__ordinal1)]]).

fof(i4_40__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c2_40__ordinal1,k3_tarski(c1_40__ordinal1))
        & r2_hidden(A,k3_tarski(c1_40__ordinal1))
        & ~ r2_hidden(c2_40__ordinal1,A)
        & c2_40__ordinal1 != A
        & ~ r2_hidden(A,c2_40__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c3_40__ordinal1])],[i5_40__ordinal1]),dh_c3_40]),
    [thesis,file(ordinal1,i4_40__ordinal1),[file(ordinal1,i4_40__ordinal1)]]).

fof(i4_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 = c4_4__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1_1_1_4__ordinal1])],[i1_4_1_1_1_4__ordinal1]),
    [thesis,file(ordinal1,i4_4_1_1_1__ordinal1),[file(ordinal1,i4_4_1_1_1__ordinal1)]]).

fof(i4_41__ordinal1,plain,(
    ~ ( r2_hidden(c3_41__ordinal1,c1_41__ordinal1)
      & ~ r2_hidden(c3_41__ordinal1,c2_41__ordinal1) ) ),
    inference(discharge_asm,[discharged([e4_41__ordinal1])],[i5_41__ordinal1]),
    [thesis,file(ordinal1,i4_41__ordinal1),[file(ordinal1,i4_41__ordinal1)]]).

fof(i4_42_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_42_2__ordinal1),
    [thesis,trivial,file(ordinal1,i4_42_2__ordinal1)]).

fof(i4_44__ordinal1,plain,
    ( ~ r2_hidden(c5_44__ordinal1,c1_44__ordinal1)
   => r1_ordinal1(c4_44__ordinal1,c5_44__ordinal1) ),
    inference(discharge_asm,[discharged([e12_44__ordinal1])],[i5_44__ordinal1]),
    [thesis,file(ordinal1,i4_44__ordinal1),[file(ordinal1,i4_44__ordinal1)]]).

fof(i4_47_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_47_1__ordinal1),
    [thesis,trivial,file(ordinal1,i4_47_1__ordinal1)]).

fof(i4_47__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_47__ordinal1),
    [thesis,trivial,file(ordinal1,i4_47__ordinal1)]).

fof(i4_48_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_48_1__ordinal1),
    [thesis,trivial,file(ordinal1,i4_48_1__ordinal1)]).

fof(i4_48__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_48__ordinal1),
    [thesis,trivial,file(ordinal1,i4_48__ordinal1)]).

fof(i4_4__ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
        & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
        & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
        & r2_hidden(c4_4__ordinal1,A)
        & r2_hidden(A,B)
        & r2_hidden(B,c1_4__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c5_4__ordinal1])],[i5_4__ordinal1]),dh_c5_4]),
    [thesis,file(ordinal1,i4_4__ordinal1),[file(ordinal1,i4_4__ordinal1)]]).

fof(i4_56__ordinal1,plain,(
    m1_ordinal1(c3_56__ordinal1,c2_56__ordinal1) ),
    inference(conclusion,[],[dt_c1_56__ordinal1,reflexivity_r1_tarski,dt_k2_relat_1,dt_m1_ordinal1,dt_c2_56__ordinal1,dt_c3_56__ordinal1,rc4_ordinal1,rc1_funct_1,d8_ordinal1,e3_56__ordinal1,i5_56__ordinal1]),
    [thesis,file(ordinal1,i4_56__ordinal1),[file(ordinal1,i4_56__ordinal1)]]).

fof(i4_58__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_58__ordinal1),
    [thesis,trivial,file(ordinal1,i4_58__ordinal1)]).

fof(i4_5__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e4_5__ordinal1,i5_5__ordinal1]),
    [thesis,file(ordinal1,i4_5__ordinal1),[file(ordinal1,i4_5__ordinal1)]]).

fof(i4_60_1__ordinal1,plain,(
    ~ ( r2_hidden(k4_tarski(c1_60_1__ordinal1,c2_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
      & r2_hidden(k4_tarski(c1_60_1__ordinal1,c3_60_1__ordinal1),k3_tarski(c1_60__ordinal1))
      & c2_60_1__ordinal1 != c3_60_1__ordinal1 ) ),
    inference(discharge_asm,[discharged([e2_60_1__ordinal1])],[i5_60_1__ordinal1]),
    [thesis,file(ordinal1,i4_60_1__ordinal1),[file(ordinal1,i4_60_1__ordinal1)]]).

fof(i4_60_2__ordinal1,plain,(
    c2_60_2__ordinal1 = c3_60_2__ordinal1 ),
    inference(conclusion,[],[e4_60_2__ordinal1,i5_60_2__ordinal1]),
    [thesis,file(ordinal1,i4_60_2__ordinal1),[file(ordinal1,i4_60_2__ordinal1)]]).

fof(i4_60_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_60_3__ordinal1),
    [thesis,trivial,file(ordinal1,i4_60_3__ordinal1)]).

fof(i4_60_5_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_60_5_1__ordinal1),
    [thesis,trivial,file(ordinal1,i4_60_5_1__ordinal1)]).

fof(i4_64__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_64__ordinal1),
    [thesis,trivial,file(ordinal1,i4_64__ordinal1)]).

fof(i4_9__ordinal1,axiom,(
    $true ),
    file(ordinal1,i4_9__ordinal1),
    [thesis,trivial,file(ordinal1,i4_9__ordinal1)]).

fof(i5_10__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_10__ordinal1),
    [thesis,trivial,file(ordinal1,i5_10__ordinal1)]).

fof(i5_19__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_19__ordinal1),
    [thesis,trivial,file(ordinal1,i5_19__ordinal1)]).

fof(i5_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_2__ordinal1),
    [thesis,trivial,file(ordinal1,i5_2__ordinal1)]).

fof(i5_3_1_1_1__ordinal1,plain,(
    ~ ( c1_3_1__ordinal1 = c5_3__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k3_enumset1(c1_3__ordinal1,c2_3__ordinal1,c3_3__ordinal1,c4_3__ordinal1,c5_3__ordinal1))
            & r2_hidden(A,c1_3_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_3_1_1_1_5__ordinal1])],[i1_3_1_1_1_5__ordinal1]),
    [thesis,file(ordinal1,i5_3_1_1_1__ordinal1),[file(ordinal1,i5_3_1_1_1__ordinal1)]]).

fof(i5_31__ordinal1,plain,(
    ~ ( r2_hidden(c3_31__ordinal1,k3_tarski(c1_31__ordinal1))
      & r2_hidden(c4_31__ordinal1,k3_tarski(c1_31__ordinal1))
      & ~ r2_hidden(c3_31__ordinal1,c4_31__ordinal1)
      & c3_31__ordinal1 != c4_31__ordinal1
      & ~ r2_hidden(c4_31__ordinal1,c3_31__ordinal1) ) ),
    inference(discharge_asm,[discharged([e4_31__ordinal1])],[i6_31__ordinal1]),
    [thesis,file(ordinal1,i5_31__ordinal1),[file(ordinal1,i5_31__ordinal1)]]).

fof(i5_34__ordinal1,plain,(
    ~ ( r2_hidden(c2_34__ordinal1,c1_34__ordinal1)
      & r2_hidden(c3_34__ordinal1,c1_34__ordinal1)
      & ~ r2_hidden(c2_34__ordinal1,c3_34__ordinal1)
      & c2_34__ordinal1 != c3_34__ordinal1
      & ~ r2_hidden(c3_34__ordinal1,c2_34__ordinal1) ) ),
    inference(discharge_asm,[discharged([e3_34__ordinal1])],[i6_34__ordinal1]),
    [thesis,file(ordinal1,i5_34__ordinal1),[file(ordinal1,i5_34__ordinal1)]]).

fof(i5_35__ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( r2_hidden(A,c1_35__ordinal1)
       => r1_ordinal1(c5_35__ordinal1,A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c6_35__ordinal1])],[i6_35__ordinal1]),dh_c6_35]),
    [thesis,file(ordinal1,i5_35__ordinal1),[file(ordinal1,i5_35__ordinal1)]]).

fof(i5_36__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_36__ordinal1),
    [thesis,trivial,file(ordinal1,i5_36__ordinal1)]).

fof(i5_37__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e9_37__ordinal1,i6_37__ordinal1]),
    [thesis,file(ordinal1,i5_37__ordinal1),[file(ordinal1,i5_37__ordinal1)]]).

fof(i5_3__ordinal1,plain,(
    ~ ( r2_hidden(c1_3__ordinal1,c2_3__ordinal1)
      & r2_hidden(c2_3__ordinal1,c3_3__ordinal1)
      & r2_hidden(c3_3__ordinal1,c4_3__ordinal1)
      & r2_hidden(c4_3__ordinal1,c5_3__ordinal1)
      & r2_hidden(c5_3__ordinal1,c1_3__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_3__ordinal1])],[i6_3__ordinal1]),
    [thesis,file(ordinal1,i5_3__ordinal1),[file(ordinal1,i5_3__ordinal1)]]).

fof(i5_40_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_40_1__ordinal1),
    [thesis,trivial,file(ordinal1,i5_40_1__ordinal1)]).

fof(i5_40__ordinal1,plain,(
    ~ ( r2_hidden(c2_40__ordinal1,k3_tarski(c1_40__ordinal1))
      & r2_hidden(c3_40__ordinal1,k3_tarski(c1_40__ordinal1))
      & ~ r2_hidden(c2_40__ordinal1,c3_40__ordinal1)
      & c2_40__ordinal1 != c3_40__ordinal1
      & ~ r2_hidden(c3_40__ordinal1,c2_40__ordinal1) ) ),
    inference(discharge_asm,[discharged([e3_40__ordinal1])],[i6_40__ordinal1]),
    [thesis,file(ordinal1,i5_40__ordinal1),[file(ordinal1,i5_40__ordinal1)]]).

fof(i5_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 = c5_4__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1_1_1_5__ordinal1])],[i1_4_1_1_1_5__ordinal1]),
    [thesis,file(ordinal1,i5_4_1_1_1__ordinal1),[file(ordinal1,i5_4_1_1_1__ordinal1)]]).

fof(i5_41__ordinal1,plain,(
    r2_hidden(c3_41__ordinal1,c2_41__ordinal1) ),
    inference(conclusion,[],[e8_41__ordinal1,i6_41__ordinal1]),
    [thesis,file(ordinal1,i5_41__ordinal1),[file(ordinal1,i5_41__ordinal1)]]).

fof(i5_44__ordinal1,plain,(
    r1_ordinal1(c4_44__ordinal1,c5_44__ordinal1) ),
    inference(discharge_asm,[discharged([e13_44__ordinal1])],[i6_44__ordinal1]),
    [thesis,file(ordinal1,i5_44__ordinal1),[file(ordinal1,i5_44__ordinal1)]]).

fof(i5_4__ordinal1,plain,(
    ! [A] : 
      ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
        & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
        & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
        & r2_hidden(c4_4__ordinal1,c5_4__ordinal1)
        & r2_hidden(c5_4__ordinal1,A)
        & r2_hidden(A,c1_4__ordinal1) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c6_4__ordinal1])],[i6_4__ordinal1]),dh_c6_4]),
    [thesis,file(ordinal1,i5_4__ordinal1),[file(ordinal1,i5_4__ordinal1)]]).

fof(i5_56__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_56__ordinal1),
    [thesis,trivial,file(ordinal1,i5_56__ordinal1)]).

fof(i5_5__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_5__ordinal1),
    [thesis,trivial,file(ordinal1,i5_5__ordinal1)]).

fof(i5_60_1__ordinal1,plain,(
    c2_60_1__ordinal1 = c3_60_1__ordinal1 ),
    inference(conclusion,[],[e11_60_1__ordinal1,i6_60_1__ordinal1]),
    [thesis,file(ordinal1,i5_60_1__ordinal1),[file(ordinal1,i5_60_1__ordinal1)]]).

fof(i5_60_2__ordinal1,axiom,(
    $true ),
    file(ordinal1,i5_60_2__ordinal1),
    [thesis,trivial,file(ordinal1,i5_60_2__ordinal1)]).

fof(i6_31__ordinal1,plain,(
    ~ ( ~ r2_hidden(c3_31__ordinal1,c4_31__ordinal1)
      & c3_31__ordinal1 != c4_31__ordinal1
      & ~ r2_hidden(c4_31__ordinal1,c3_31__ordinal1) ) ),
    inference(conclusion,[],[e13_31__ordinal1,i7_31__ordinal1]),
    [thesis,file(ordinal1,i6_31__ordinal1),[file(ordinal1,i6_31__ordinal1)]]).

fof(i6_34__ordinal1,plain,(
    ~ ( ~ r2_hidden(c2_34__ordinal1,c3_34__ordinal1)
      & c2_34__ordinal1 != c3_34__ordinal1
      & ~ r2_hidden(c3_34__ordinal1,c2_34__ordinal1) ) ),
    inference(conclusion,[],[e5_34__ordinal1,i7_34__ordinal1]),
    [thesis,file(ordinal1,i6_34__ordinal1),[file(ordinal1,i6_34__ordinal1)]]).

fof(i6_35__ordinal1,plain,
    ( r2_hidden(c6_35__ordinal1,c1_35__ordinal1)
   => r1_ordinal1(c5_35__ordinal1,c6_35__ordinal1) ),
    inference(discharge_asm,[discharged([e10_35__ordinal1])],[i7_35__ordinal1]),
    [thesis,file(ordinal1,i6_35__ordinal1),[file(ordinal1,i6_35__ordinal1)]]).

fof(i6_37__ordinal1,axiom,(
    $true ),
    file(ordinal1,i6_37__ordinal1),
    [thesis,trivial,file(ordinal1,i6_37__ordinal1)]).

fof(i6_3__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e4_3__ordinal1,i7_3__ordinal1]),
    [thesis,file(ordinal1,i6_3__ordinal1),[file(ordinal1,i6_3__ordinal1)]]).

fof(i6_40__ordinal1,plain,(
    ~ ( ~ r2_hidden(c2_40__ordinal1,c3_40__ordinal1)
      & c2_40__ordinal1 != c3_40__ordinal1
      & ~ r2_hidden(c3_40__ordinal1,c2_40__ordinal1) ) ),
    inference(conclusion,[],[e10_40__ordinal1,i7_40__ordinal1]),
    [thesis,file(ordinal1,i6_40__ordinal1),[file(ordinal1,i6_40__ordinal1)]]).

fof(i6_4_1_1_1__ordinal1,plain,(
    ~ ( c1_4_1__ordinal1 = c6_4__ordinal1
      & ! [A] : 
          ~ ( r2_hidden(A,k4_enumset1(c1_4__ordinal1,c2_4__ordinal1,c3_4__ordinal1,c4_4__ordinal1,c5_4__ordinal1,c6_4__ordinal1))
            & r2_hidden(A,c1_4_1__ordinal1) ) ) ),
    inference(discharge_asm,[discharged([e1_4_1_1_1_6__ordinal1])],[i1_4_1_1_1_6__ordinal1]),
    [thesis,file(ordinal1,i6_4_1_1_1__ordinal1),[file(ordinal1,i6_4_1_1_1__ordinal1)]]).

fof(i6_41__ordinal1,axiom,(
    $true ),
    file(ordinal1,i6_41__ordinal1),
    [thesis,trivial,file(ordinal1,i6_41__ordinal1)]).

fof(i6_44__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e19_44__ordinal1,i7_44__ordinal1]),
    [thesis,file(ordinal1,i6_44__ordinal1),[file(ordinal1,i6_44__ordinal1)]]).

fof(i6_4__ordinal1,plain,(
    ~ ( r2_hidden(c1_4__ordinal1,c2_4__ordinal1)
      & r2_hidden(c2_4__ordinal1,c3_4__ordinal1)
      & r2_hidden(c3_4__ordinal1,c4_4__ordinal1)
      & r2_hidden(c4_4__ordinal1,c5_4__ordinal1)
      & r2_hidden(c5_4__ordinal1,c6_4__ordinal1)
      & r2_hidden(c6_4__ordinal1,c1_4__ordinal1) ) ),
    inference(discharge_asm,[discharged([e1_4__ordinal1])],[i7_4__ordinal1]),
    [thesis,file(ordinal1,i6_4__ordinal1),[file(ordinal1,i6_4__ordinal1)]]).

fof(i6_60_1__ordinal1,axiom,(
    $true ),
    file(ordinal1,i6_60_1__ordinal1),
    [thesis,trivial,file(ordinal1,i6_60_1__ordinal1)]).

fof(i7_31__ordinal1,axiom,(
    $true ),
    file(ordinal1,i7_31__ordinal1),
    [thesis,trivial,file(ordinal1,i7_31__ordinal1)]).

fof(i7_34__ordinal1,axiom,(
    $true ),
    file(ordinal1,i7_34__ordinal1),
    [thesis,trivial,file(ordinal1,i7_34__ordinal1)]).

fof(i7_35__ordinal1,plain,(
    r1_ordinal1(c5_35__ordinal1,c6_35__ordinal1) ),
    inference(conclusion,[],[e13_35__ordinal1,i8_35__ordinal1]),
    [thesis,file(ordinal1,i7_35__ordinal1),[file(ordinal1,i7_35__ordinal1)]]).

fof(i7_3__ordinal1,axiom,(
    $true ),
    file(ordinal1,i7_3__ordinal1),
    [thesis,trivial,file(ordinal1,i7_3__ordinal1)]).

fof(i7_40__ordinal1,axiom,(
    $true ),
    file(ordinal1,i7_40__ordinal1),
    [thesis,trivial,file(ordinal1,i7_40__ordinal1)]).

fof(i7_44__ordinal1,axiom,(
    $true ),
    file(ordinal1,i7_44__ordinal1),
    [thesis,trivial,file(ordinal1,i7_44__ordinal1)]).

fof(i7_4__ordinal1,plain,(
    ~ $true ),
    inference(conclusion,[],[e4_4__ordinal1,i8_4__ordinal1]),
    [thesis,file(ordinal1,i7_4__ordinal1),[file(ordinal1,i7_4__ordinal1)]]).

fof(i8_35__ordinal1,axiom,(
    $true ),
    file(ordinal1,i8_35__ordinal1),
    [thesis,trivial,file(ordinal1,i8_35__ordinal1)]).

fof(i8_4__ordinal1,axiom,(
    $true ),
    file(ordinal1,i8_4__ordinal1),
    [thesis,trivial,file(ordinal1,i8_4__ordinal1)]).

fof(idempotence_k2_xboole_0,axiom,(
    ! [A,B] : k2_xboole_0(A,A) = A ),
    file(xboole_0,k2_xboole_0),
    [theorem,axiom,file(xboole_0,k2_xboole_0)]).

fof(irreflexivity_r2_xboole_0,axiom,(
    ! [A,B] : ~ r2_xboole_0(A,A) ),
    file(xboole_0,r2_xboole_0),
    [theorem,axiom,file(xboole_0,r2_xboole_0)]).

fof(rc1_funct_1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A) ) ),
    file(funct_1,rc1_funct_1),
    [theorem,axiom,file(funct_1,rc1_funct_1)]).

fof(rc1_ordinal1,axiom,(
    ? [A] : 
      ( v1_ordinal1(A)
      & v2_ordinal1(A)
      & v3_ordinal1(A) ) ),
    file(ordinal1,rc1_ordinal1),
    [theorem,axiom,file(ordinal1,rc1_ordinal1)]).

fof(rc1_relat_1,axiom,(
    ? [A] : 
      ( v1_xboole_0(A)
      & v1_relat_1(A) ) ),
    file(relat_1,rc1_relat_1),
    [theorem,axiom,file(relat_1,rc1_relat_1)]).

fof(rc1_xboole_0,axiom,(
    ? [A] : v1_xboole_0(A) ),
    file(xboole_0,rc1_xboole_0),
    [theorem,axiom,file(xboole_0,rc1_xboole_0)]).

fof(rc2_funct_1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_xboole_0(A)
      & v1_funct_1(A) ) ),
    file(funct_1,rc2_funct_1),
    [theorem,axiom,file(funct_1,rc2_funct_1)]).

fof(rc2_ordinal1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & v2_funct_1(A)
      & v1_xboole_0(A)
      & v1_ordinal1(A)
      & v2_ordinal1(A)
      & v3_ordinal1(A) ) ),
    file(ordinal1,rc2_ordinal1),
    [theorem,axiom,file(ordinal1,rc2_ordinal1)]).

fof(rc2_relat_1,axiom,(
    ? [A] : 
      ( ~ v1_xboole_0(A)
      & v1_relat_1(A) ) ),
    file(relat_1,rc2_relat_1),
    [theorem,axiom,file(relat_1,rc2_relat_1)]).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ v1_xboole_0(A) ),
    file(xboole_0,rc2_xboole_0),
    [theorem,axiom,file(xboole_0,rc2_xboole_0)]).

fof(rc3_funct_1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & v2_funct_1(A) ) ),
    file(funct_1,rc3_funct_1),
    [theorem,axiom,file(funct_1,rc3_funct_1)]).

fof(rc3_ordinal1,axiom,(
    ? [A] : 
      ( ~ v1_xboole_0(A)
      & v1_ordinal1(A)
      & v2_ordinal1(A)
      & v3_ordinal1(A) ) ),
    file(ordinal1,rc3_ordinal1),
    [theorem,axiom,file(ordinal1,rc3_ordinal1)]).

fof(rc3_relat_1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v3_relat_1(A) ) ),
    file(relat_1,rc3_relat_1),
    [theorem,axiom,file(relat_1,rc3_relat_1)]).

fof(rc4_funct_1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v3_relat_1(A)
      & v1_funct_1(A) ) ),
    file(funct_1,rc4_funct_1),
    [theorem,axiom,file(funct_1,rc4_funct_1)]).

fof(rc4_ordinal1,axiom,(
    ? [A] : 
      ( v1_relat_1(A)
      & v1_funct_1(A)
      & v5_ordinal1(A) ) ),
    file(ordinal1,rc4_ordinal1),
    [theorem,axiom,file(ordinal1,rc4_ordinal1)]).

fof(redefinition_k2_ordinal1,axiom,(
    ! [A,B] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A)
        & v5_ordinal1(A)
        & v3_ordinal1(B) )
     => k2_ordinal1(A,B) = k7_relat_1(A,B) ) ),
    file(ordinal1,k2_ordinal1),
    [definition,axiom,file(ordinal1,k2_ordinal1)]).

fof(redefinition_r1_ordinal1,axiom,(
    ! [A,B] : 
      ( ( v3_ordinal1(A)
        & v3_ordinal1(B) )
     => ( r1_ordinal1(A,B)
      <=> r1_tarski(A,B) ) ) ),
    file(ordinal1,r1_ordinal1),
    [definition,axiom,file(ordinal1,r1_ordinal1)]).

fof(reflexivity_r1_ordinal1,axiom,(
    ! [A,B] : 
      ( ( v3_ordinal1(A)
        & v3_ordinal1(B) )
     => r1_ordinal1(A,A) ) ),
    file(ordinal1,r1_ordinal1),
    [theorem,axiom,file(ordinal1,r1_ordinal1)]).

fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : r1_tarski(A,A) ),
    file(tarski,r1_tarski),
    [theorem,axiom,file(tarski,r1_tarski)]).

fof(reflexivity_r3_xboole_0,axiom,(
    ! [A,B] : r3_xboole_0(A,A) ),
    file(xboole_0,r3_xboole_0),
    [theorem,axiom,file(xboole_0,r3_xboole_0)]).

fof(s1_funct_1__e6_60__ordinal1,axiom,
    ( ! [A,B,C] : 
        ( ( r2_hidden(A,c1_60__ordinal1)
          & ! [D] : 
              ( ( v1_relat_1(D)
                & v1_funct_1(D)
                & v5_ordinal1(D) )
             => ( D = A
               => k1_relat_1(D) = B ) )
          & r2_hidden(A,c1_60__ordinal1)
          & ! [E] : 
              ( ( v1_relat_1(E)
                & v1_funct_1(E)
                & v5_ordinal1(E) )
             => ( E = A
               => k1_relat_1(E) = C ) ) )
       => B = C )
   => ? [A] : 
        ( v1_relat_1(A)
        & v1_funct_1(A)
        & ! [B,C] : 
            ( r2_hidden(k4_tarski(B,C),A)
          <=> ( r2_hidden(B,c1_60__ordinal1)
              & r2_hidden(B,c1_60__ordinal1)
              & ! [F] : 
                  ( ( v1_relat_1(F)
                    & v1_funct_1(F)
                    & v5_ordinal1(F) )
                 => ( F = B
                   => k1_relat_1(F) = C ) ) ) ) ) ),
    file(ordinal1,s1_funct_1__e6_60__ordinal1),
    [theorem,axiom,file(ordinal1,s1_funct_1__e6_60__ordinal1)]).

fof(s1_ordinal1__e14_60__ordinal1,axiom,
    ( ? [A] : 
        ( v3_ordinal1(A)
        & ! [B] : 
            ( v3_ordinal1(B)
           => ( r2_hidden(B,k2_relat_1(c3_60__ordinal1))
             => r1_ordinal1(B,A) ) ) )
   => ? [A] : 
        ( v3_ordinal1(A)
        & ! [C] : 
            ( v3_ordinal1(C)
           => ( r2_hidden(C,k2_relat_1(c3_60__ordinal1))
             => r1_ordinal1(C,A) ) )
        & ! [D] : 
            ( v3_ordinal1(D)
           => ( ! [E] : 
                  ( v3_ordinal1(E)
                 => ( r2_hidden(E,k2_relat_1(c3_60__ordinal1))
                   => r1_ordinal1(E,D) ) )
             => r1_ordinal1(A,D) ) ) ) ),
    file(ordinal1,s1_ordinal1__e14_60__ordinal1),
    [theorem,axiom,file(ordinal1,s1_ordinal1__e14_60__ordinal1)]).

fof(s1_xboole_0__e3_43__ordinal1,axiom,(
    ? [A] : 
    ! [B] : 
      ( r2_hidden(B,A)
    <=> ( r2_hidden(B,c1_43__ordinal1)
        & v3_ordinal1(B) ) ) ),
    file(ordinal1,s1_xboole_0__e3_43__ordinal1),
    [theorem,axiom,file(ordinal1,s1_xboole_0__e3_43__ordinal1)]).

fof(s1_xboole_0__e3_44__ordinal1,axiom,(
    ? [A] : 
    ! [B] : 
      ( r2_hidden(B,A)
    <=> ( r2_hidden(B,k1_ordinal1(c2_44__ordinal1))
        & ~ r2_hidden(B,c1_44__ordinal1) ) ) ),
    file(ordinal1,s1_xboole_0__e3_44__ordinal1),
    [theorem,axiom,file(ordinal1,s1_xboole_0__e3_44__ordinal1)]).

fof(symmetry_r3_xboole_0,axiom,(
    ! [A,B] : 
      ( r3_xboole_0(A,B)
     => r3_xboole_0(B,A) ) ),
    file(xboole_0,r3_xboole_0),
    [theorem,axiom,file(xboole_0,r3_xboole_0)]).

fof(t10_ordinal1,plain,(
    ! [A] : r2_hidden(A,k1_ordinal1(A)) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_8__ordinal1])],[i1_8__ordinal1]),dh_c1_8]),
    [theorem,file(ordinal1,t10_ordinal1),[file(ordinal1,t10_ordinal1)]]).

fof(t12_ordinal1,plain,(
    ! [A,B] : 
      ( k1_ordinal1(A) = k1_ordinal1(B)
     => A = B ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_9__ordinal1])],[i1_9__ordinal1]),dh_c1_9]),
    [theorem,file(ordinal1,t12_ordinal1),[file(ordinal1,t12_ordinal1)]]).

fof(t13_ordinal1,plain,(
    ! [A,B] : 
      ( r2_hidden(A,k1_ordinal1(B))
    <=> ( r2_hidden(A,B)
        | A = B ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_10__ordinal1])],[i1_10__ordinal1]),dh_c1_10]),
    [theorem,file(ordinal1,t13_ordinal1),[file(ordinal1,t13_ordinal1)]]).

fof(t14_ordinal1,plain,(
    ! [A] : A != k1_ordinal1(A) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_11__ordinal1])],[i1_11__ordinal1]),dh_c1_11]),
    [theorem,file(ordinal1,t14_ordinal1),[file(ordinal1,t14_ordinal1)]]).

fof(t19_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ! [C] : 
              ( v1_ordinal1(C)
             => ( ( r2_hidden(C,A)
                  & r2_hidden(A,B) )
               => r2_hidden(C,B) ) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_19__ordinal1])],[i1_19__ordinal1]),dh_c1_19]),
    [theorem,file(ordinal1,t19_ordinal1),[file(ordinal1,t19_ordinal1)]]).

fof(t1_boole,axiom,(
    ! [A] : k2_xboole_0(A,k1_xboole_0) = A ),
    file(boole,t1_boole),
    [theorem,axiom,file(boole,t1_boole)]).

fof(t1_subset,axiom,(
    ! [A,B] : 
      ( r2_hidden(A,B)
     => m1_subset_1(A,B) ) ),
    file(subset,t1_subset),
    [theorem,axiom,file(subset,t1_subset)]).

fof(t1_xboole_1,axiom,(
    ! [A,B,C] : 
      ( ( r1_tarski(A,B)
        & r1_tarski(B,C) )
     => r1_tarski(A,C) ) ),
    file(xboole_1,t1_xboole_1),
    [theorem,axiom,file(xboole_1,t1_xboole_1)]).

fof(t21_ordinal1,plain,(
    ! [A] : 
      ( v1_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_xboole_0(A,B)
           => r2_hidden(A,B) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_20__ordinal1])],[i1_20__ordinal1]),dh_c1_20]),
    [theorem,file(ordinal1,t21_ordinal1),[file(ordinal1,t21_ordinal1)]]).

fof(t22_ordinal1,plain,(
    ! [A] : 
      ( v1_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ! [C] : 
              ( v3_ordinal1(C)
             => ( ( r1_tarski(A,B)
                  & r2_hidden(B,C) )
               => r2_hidden(A,C) ) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_21__ordinal1])],[i1_21__ordinal1]),dh_c1_21]),
    [theorem,file(ordinal1,t22_ordinal1),[file(ordinal1,t22_ordinal1)]]).

fof(t23_ordinal1,plain,(
    ! [A,B] : 
      ( v3_ordinal1(B)
     => ( r2_hidden(A,B)
       => v3_ordinal1(A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_22__ordinal1])],[i1_22__ordinal1]),dh_c1_22]),
    [theorem,file(ordinal1,t23_ordinal1),[file(ordinal1,t23_ordinal1)]]).

fof(t24_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ~ ( ~ r2_hidden(A,B)
              & A != B
              & ~ r2_hidden(B,A) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_23__ordinal1])],[i1_23__ordinal1]),dh_c1_23]),
    [theorem,file(ordinal1,t24_ordinal1),[file(ordinal1,t24_ordinal1)]]).

fof(t25_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => r3_xboole_0(A,B) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_25__ordinal1])],[i1_25__ordinal1]),dh_c1_25]),
    [theorem,file(ordinal1,t25_ordinal1),[file(ordinal1,t25_ordinal1)]]).

fof(t26_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ( r1_ordinal1(A,B)
            | r2_hidden(B,A) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_26__ordinal1])],[i1_26__ordinal1]),dh_c1_26]),
    [theorem,file(ordinal1,t26_ordinal1),[file(ordinal1,t26_ordinal1)]]).

fof(t29_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => v3_ordinal1(k1_ordinal1(A)) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_30__ordinal1])],[i1_30__ordinal1]),dh_c1_30]),
    [theorem,file(ordinal1,t29_ordinal1),[file(ordinal1,t29_ordinal1)]]).

fof(t2_subset,axiom,(
    ! [A,B] : 
      ( m1_subset_1(A,B)
     => ( v1_xboole_0(B)
        | r2_hidden(A,B) ) ) ),
    file(subset,t2_subset),
    [theorem,axiom,file(subset,t2_subset)]).

fof(t2_xboole_1,axiom,(
    ! [A] : r1_tarski(k1_xboole_0,A) ),
    file(xboole_1,t2_xboole_1),
    [theorem,axiom,file(xboole_1,t2_xboole_1)]).

fof(t30_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => v3_ordinal1(k3_tarski(A)) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_31__ordinal1])],[i1_31__ordinal1]),dh_c1_31]),
    [theorem,file(ordinal1,t30_ordinal1),[file(ordinal1,t30_ordinal1)]]).

fof(t31_ordinal1,plain,(
    ! [A] : 
      ( ! [B] : 
          ( r2_hidden(B,A)
         => ( v3_ordinal1(B)
            & r1_tarski(B,A) ) )
     => v3_ordinal1(A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_34__ordinal1])],[i1_34__ordinal1]),dh_c1_34]),
    [theorem,file(ordinal1,t31_ordinal1),[file(ordinal1,t31_ordinal1)]]).

fof(t32_ordinal1,plain,(
    ! [A,B] : 
      ( v3_ordinal1(B)
     => ~ ( r1_tarski(A,B)
          & A != k1_xboole_0
          & ! [C] : 
              ( v3_ordinal1(C)
             => ~ ( r2_hidden(C,A)
                  & ! [D] : 
                      ( v3_ordinal1(D)
                     => ( r2_hidden(D,A)
                       => r1_ordinal1(C,D) ) ) ) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_35__ordinal1])],[i1_35__ordinal1]),dh_c1_35]),
    [theorem,file(ordinal1,t32_ordinal1),[file(ordinal1,t32_ordinal1)]]).

fof(t33_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_hidden(A,B)
          <=> r1_ordinal1(k1_ordinal1(A),B) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_36__ordinal1])],[i1_36__ordinal1]),dh_c1_36]),
    [theorem,file(ordinal1,t33_ordinal1),[file(ordinal1,t33_ordinal1)]]).

fof(t34_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ( r2_hidden(A,k1_ordinal1(B))
          <=> r1_ordinal1(A,B) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_37__ordinal1])],[i1_37__ordinal1]),dh_c1_37]),
    [theorem,file(ordinal1,t34_ordinal1),[file(ordinal1,t34_ordinal1)]]).

fof(t35_ordinal1,plain,(
    ! [A] : 
      ( ! [B] : 
          ( r2_hidden(B,A)
         => v3_ordinal1(B) )
     => v3_ordinal1(k3_tarski(A)) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_40__ordinal1])],[i1_40__ordinal1]),dh_c1_40]),
    [theorem,file(ordinal1,t35_ordinal1),[file(ordinal1,t35_ordinal1)]]).

fof(t36_ordinal1,plain,(
    ! [A] : 
      ~ ( ! [B] : 
            ( r2_hidden(B,A)
           => v3_ordinal1(B) )
        & ! [B] : 
            ( v3_ordinal1(B)
           => ~ r1_tarski(A,B) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_41__ordinal1])],[i1_41__ordinal1]),dh_c1_41]),
    [theorem,file(ordinal1,t36_ordinal1),[file(ordinal1,t36_ordinal1)]]).

fof(t37_ordinal1,plain,(
    ! [A] : 
      ~ ! [B] : 
          ( r2_hidden(B,A)
        <=> v3_ordinal1(B) ) ),
    inference(discharge_asm,[discharged([e1_42__ordinal1])],[i1_42__ordinal1]),
    [theorem,file(ordinal1,t37_ordinal1),[file(ordinal1,t37_ordinal1)]]).

fof(t37_xboole_1,axiom,(
    ! [A,B] : 
      ( k4_xboole_0(A,B) = k1_xboole_0
    <=> r1_tarski(A,B) ) ),
    file(xboole_1,t37_xboole_1),
    [theorem,axiom,file(xboole_1,t37_xboole_1)]).

fof(t38_ordinal1,plain,(
    ! [A] : 
      ~ ! [B] : 
          ( v3_ordinal1(B)
         => r2_hidden(B,A) ) ),
    inference(discharge_asm,[discharged([e1_43__ordinal1])],[i1_43__ordinal1]),
    [theorem,file(ordinal1,t38_ordinal1),[file(ordinal1,t38_ordinal1)]]).

fof(t39_ordinal1,plain,(
    ! [A] : 
    ? [B] : 
      ( v3_ordinal1(B)
      & ~ r2_hidden(B,A)
      & ! [C] : 
          ( v3_ordinal1(C)
         => ( ~ r2_hidden(C,A)
           => r1_ordinal1(B,C) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_44__ordinal1])],[i1_44__ordinal1]),dh_c1_44]),
    [theorem,file(ordinal1,t39_ordinal1),[file(ordinal1,t39_ordinal1)]]).

fof(t3_boole,axiom,(
    ! [A] : k4_xboole_0(A,k1_xboole_0) = A ),
    file(boole,t3_boole),
    [theorem,axiom,file(boole,t3_boole)]).

fof(t3_ordinal1,plain,(
    ! [A,B,C] : 
      ~ ( r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_1__ordinal1])],[i1_1__ordinal1]),dh_c1_1]),
    [theorem,file(ordinal1,t3_ordinal1),[file(ordinal1,t3_ordinal1)]]).

fof(t3_subset,axiom,(
    ! [A,B] : 
      ( m1_subset_1(A,k1_zfmisc_1(B))
    <=> r1_tarski(A,B) ) ),
    file(subset,t3_subset),
    [theorem,axiom,file(subset,t3_subset)]).

fof(t41_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( v4_ordinal1(A)
      <=> ! [B] : 
            ( v3_ordinal1(B)
           => ( r2_hidden(B,A)
             => r2_hidden(k1_ordinal1(B),A) ) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_47__ordinal1])],[i1_47__ordinal1]),dh_c1_47]),
    [theorem,file(ordinal1,t41_ordinal1),[file(ordinal1,t41_ordinal1)]]).

fof(t42_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ( ~ ( ~ v4_ordinal1(A)
            & ! [B] : 
                ( v3_ordinal1(B)
               => A != k1_ordinal1(B) ) )
        & ~ ( ? [B] : 
                ( v3_ordinal1(B)
                & A = k1_ordinal1(B) )
            & v4_ordinal1(A) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_48__ordinal1])],[i1_48__ordinal1]),dh_c1_48]),
    [theorem,file(ordinal1,t42_ordinal1),[file(ordinal1,t42_ordinal1)]]).

fof(t45_ordinal1,plain,(
    ! [A] : m1_ordinal1(k1_xboole_0,A) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_53__ordinal1])],[i1_53__ordinal1]),dh_c1_53]),
    [theorem,file(ordinal1,t45_ordinal1),[file(ordinal1,t45_ordinal1)]]).

fof(t46_ordinal1,plain,(
    ! [A] : 
      ( ( v1_relat_1(A)
        & v1_funct_1(A) )
     => ( v3_ordinal1(k1_relat_1(A))
       => m1_ordinal1(A,k2_relat_1(A)) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_54__ordinal1])],[i1_54__ordinal1]),dh_c1_54]),
    [theorem,file(ordinal1,t46_ordinal1),[file(ordinal1,t46_ordinal1)]]).

fof(t47_ordinal1,plain,(
    ! [A,B] : 
      ( r1_tarski(A,B)
     => ! [C] : 
          ( m1_ordinal1(C,A)
         => m1_ordinal1(C,B) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_56__ordinal1])],[i1_56__ordinal1]),dh_c1_56]),
    [theorem,file(ordinal1,t47_ordinal1),[file(ordinal1,t47_ordinal1)]]).

fof(t48_ordinal1,plain,(
    ! [A,B] : 
      ( m1_ordinal1(B,A)
     => ! [C] : 
          ( v3_ordinal1(C)
         => m1_ordinal1(k2_ordinal1(B,C),A) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_58__ordinal1])],[i1_58__ordinal1]),dh_c1_58]),
    [theorem,file(ordinal1,t48_ordinal1),[file(ordinal1,t48_ordinal1)]]).

fof(t49_ordinal1,plain,(
    ! [A] : 
      ( ( ! [B] : 
            ( r2_hidden(B,A)
           => ( v1_relat_1(B)
              & v1_funct_1(B)
              & v5_ordinal1(B) ) )
        & v6_ordinal1(A) )
     => ( v1_relat_1(k3_tarski(A))
        & v1_funct_1(k3_tarski(A))
        & v5_ordinal1(k3_tarski(A)) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_60__ordinal1])],[i1_60__ordinal1]),dh_c1_60]),
    [theorem,file(ordinal1,t49_ordinal1),[file(ordinal1,t49_ordinal1)]]).

fof(t4_boole,axiom,(
    ! [A] : k4_xboole_0(k1_xboole_0,A) = k1_xboole_0 ),
    file(boole,t4_boole),
    [theorem,axiom,file(boole,t4_boole)]).

fof(t4_ordinal1,plain,(
    ! [A,B,C,D] : 
      ~ ( r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,D)
        & r2_hidden(D,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_2__ordinal1])],[i1_2__ordinal1]),dh_c1_2]),
    [theorem,file(ordinal1,t4_ordinal1),[file(ordinal1,t4_ordinal1)]]).

fof(t4_subset,axiom,(
    ! [A,B,C] : 
      ( ( r2_hidden(A,B)
        & m1_subset_1(B,k1_zfmisc_1(C)) )
     => m1_subset_1(A,C) ) ),
    file(subset,t4_subset),
    [theorem,axiom,file(subset,t4_subset)]).

fof(t50_ordinal1,plain,(
    ! [A] : 
      ( v3_ordinal1(A)
     => ! [B] : 
          ( v3_ordinal1(B)
         => ~ ( ~ r2_xboole_0(A,B)
              & A != B
              & ~ r2_xboole_0(B,A) ) ) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_64__ordinal1])],[i1_64__ordinal1]),dh_c1_64]),
    [theorem,file(ordinal1,t50_ordinal1),[file(ordinal1,t50_ordinal1)]]).

fof(t5_ordinal1,plain,(
    ! [A,B,C,D,E] : 
      ~ ( r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,D)
        & r2_hidden(D,E)
        & r2_hidden(E,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_3__ordinal1])],[i1_3__ordinal1]),dh_c1_3]),
    [theorem,file(ordinal1,t5_ordinal1),[file(ordinal1,t5_ordinal1)]]).

fof(t5_subset,axiom,(
    ! [A,B,C] : 
      ~ ( r2_hidden(A,B)
        & m1_subset_1(B,k1_zfmisc_1(C))
        & v1_xboole_0(C) ) ),
    file(subset,t5_subset),
    [theorem,axiom,file(subset,t5_subset)]).

fof(t60_xboole_1,axiom,(
    ! [A,B] : 
      ~ ( r1_tarski(A,B)
        & r2_xboole_0(B,A) ) ),
    file(xboole_1,t60_xboole_1),
    [theorem,axiom,file(xboole_1,t60_xboole_1)]).

fof(t65_relat_1,axiom,(
    ! [A] : 
      ( v1_relat_1(A)
     => ( k1_relat_1(A) = k1_xboole_0
      <=> k2_relat_1(A) = k1_xboole_0 ) ) ),
    file(relat_1,t65_relat_1),
    [theorem,axiom,file(relat_1,t65_relat_1)]).

fof(t6_boole,axiom,(
    ! [A] : 
      ( v1_xboole_0(A)
     => A = k1_xboole_0 ) ),
    file(boole,t6_boole),
    [theorem,axiom,file(boole,t6_boole)]).

fof(t6_ordinal1,plain,(
    ! [A,B,C,D,E,F] : 
      ~ ( r2_hidden(A,B)
        & r2_hidden(B,C)
        & r2_hidden(C,D)
        & r2_hidden(D,E)
        & r2_hidden(E,F)
        & r2_hidden(F,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_4__ordinal1])],[i1_4__ordinal1]),dh_c1_4]),
    [theorem,file(ordinal1,t6_ordinal1),[file(ordinal1,t6_ordinal1)]]).

fof(t7_boole,axiom,(
    ! [A,B] : 
      ~ ( r2_hidden(A,B)
        & v1_xboole_0(B) ) ),
    file(boole,t7_boole),
    [theorem,axiom,file(boole,t7_boole)]).

fof(t7_ordinal1,plain,(
    ! [A,B] : 
      ~ ( r2_hidden(A,B)
        & r1_tarski(B,A) ) ),
    inference(let,[],[inference(discharge_asm,[discharged([dt_c1_5__ordinal1])],[i1_5__ordinal1]),dh_c1_5]),
    [theorem,file(ordinal1,t7_ordinal1),[file(ordinal1,t7_ordinal1)]]).

fof(t7_tarski,axiom,(
    ! [A,B] : 
      ~ ( r2_hidden(A,B)
        & ! [C] : 
            ~ ( r2_hidden(C,B)
              & ! [D] : 
                  ~ ( r2_hidden(D,B)
                    & r2_hidden(D,C) ) ) ) ),
    file(tarski,t7_tarski),
    [theorem,axiom,file(tarski,t7_tarski)]).

fof(t7_xboole_1,axiom,(
    ! [A,B] : r1_tarski(A,k2_xboole_0(A,B)) ),
    file(xboole_1,t7_xboole_1),
    [theorem,axiom,file(xboole_1,t7_xboole_1)]).

fof(t8_boole,axiom,(
    ! [A,B] : 
      ~ ( v1_xboole_0(A)
        & A != B
        & v1_xboole_0(B) ) ),
    file(boole,t8_boole),
    [theorem,axiom,file(boole,t8_boole)]).

fof(t8_funct_1,axiom,(
    ! [A,B,C] : 
      ( ( v1_relat_1(C)
        & v1_funct_1(C) )
     => ( r2_hidden(k4_tarski(A,B),C)
      <=> ( r2_hidden(A,k1_relat_1(C))
          & B = k1_funct_1(C,A) ) ) ) ),
    file(funct_1,t8_funct_1),
    [theorem,axiom,file(funct_1,t8_funct_1)]).

fof(t8_xboole_1,axiom,(
    ! [A,B,C] : 
      ( ( r1_tarski(A,B)
        & r1_tarski(C,B) )
     => r1_tarski(k2_xboole_0(A,C),B) ) ),
    file(xboole_1,t8_xboole_1),
    [theorem,axiom,file(xboole_1,t8_xboole_1)]).

fof(t92_zfmisc_1,axiom,(
    ! [A,B] : 
      ( r2_hidden(A,B)
     => r1_tarski(A,k3_tarski(B)) ) ),
    file(zfmisc_1,t92_zfmisc_1),
    [theorem,axiom,file(zfmisc_1,t92_zfmisc_1)]).
