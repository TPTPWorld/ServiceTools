%----Declarations to fool Vampire when processing this file directly
tff('$ki_world_type',type,$ki_world: $tType).
tff('$ki_local_world_decl',type,$ki_local_world: $ki_world).
tff('$ki_accessible_decl',type,$ki_accessible: ($ki_world * $ki_world) > $o).
tff('$ki_world_is_decl',type,$ki_world_is: ($ki_world * $o) > $o).

% SZS output start Interpretation
%------------------------------------------------------------------------------
%----Declarations to fool Vampire when processing this file directly
% tff('$ki_world_type',type,$ki_world: $tType).
% tff('$ki_local_world_decl',type,$ki_local_world: $ki_world).
% tff('$ki_accessible_decl',type,$ki_accessible: ($ki_world * $ki_world) > $o).
% tff('$ki_world_is_decl',type,$ki_world_is: ($ki_world * $o) > $o).

tff(fruit_type,type,fruit: $tType).
tff(apple_decl,type,apple: fruit).
tff(banana_decl,type,banana: fruit).
tff(healthy_decl,type,healthy: fruit > $o).
tff(rotten_decl,type,rotten: fruit > $o).

tff(w1_decl,type,w1: $ki_world).
tff(w2_decl,type,w2: $ki_world).
tff(d_fruit_type,type,d_fruit: $tType).
tff(d2fruit_decl,type, d2fruit: d_fruit > fruit ).
tff(d_apple_decl,type,d_apple: d_fruit).
tff(d_banana_decl,type,d_banana: d_fruit).

tff(fruity_worlds,axiom,
    ( ( ! [W: $ki_world] : ( W = w1 | W = w2 )
      & $ki_local_world = w1
      & $ki_accessible(w1,w1)     %----Logic is M
      & $ki_accessible(w2,w2)
      & $ki_accessible(w1,w2) )
    & ( $ki_world_is(w1,
          ( ( ! [F: fruit] : ? [DF: d_fruit] : F = d2fruit(DF)
            & ! [DF: d_fruit] : ( DF = d_apple | DF = d_banana )
            & $distinct(d_apple,d_banana)
            & ? [DP: d_fruit] : ( DP = d_apple )
            & ? [DP: d_fruit] : ( DP = d_banana )
            & ! [DF1: d_fruit,DF2: d_fruit] :
                ( d2fruit(DF1) = d2fruit(DF2) => DF1 = DF2 ) )
          & ( apple = d2fruit(d_apple)
            & banana = d2fruit(d_banana) )
          & ( healthy(d2fruit(d_apple))
            & healthy(d2fruit(d_banana))
            & ~ rotten(d2fruit(d_apple))
            & rotten(d2fruit(d_banana)) ) ) ) )
    & ( $ki_world_is(w2,
          ( ( ! [F: fruit] : ? [DF: d_fruit] : F = d2fruit(DF)
            & ! [DF: d_fruit] : ( DF = d_apple | DF = d_banana )
            & $distinct(d_apple,d_banana)
            & ? [DP: d_fruit] : ( DP = d_apple )
            & ? [DP: d_fruit] : ( DP = d_banana )
            & ! [DF1: d_fruit,DF2: d_fruit] :
                ( d2fruit(DF1) = d2fruit(DF2) => DF1 = DF2 ) )
          & ( apple = d2fruit(d_apple)
            & banana = d2fruit(d_banana) )
          & ( healthy(d2fruit(d_apple))
            & healthy(d2fruit(d_banana))
            & ~ rotten(d2fruit(d_apple))
            & ~ rotten(d2fruit(d_banana)) ) ) ) ) ) ).
