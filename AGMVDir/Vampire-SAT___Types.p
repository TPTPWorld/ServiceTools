%----Declarations to fool Vampire when processing this file directly
tff('$ki_world_type',type,$ki_world: $tType).
tff('$ki_local_world_decl',type,$ki_local_world: $ki_world).
tff('$ki_accessible_decl',type,$ki_accessible: ($ki_world * $ki_world) > $o).
tff('$ki_world_is_decl',type,$ki_world_is: ($ki_world * $o) > $o).
