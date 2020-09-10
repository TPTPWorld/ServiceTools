cnf(22,axiom,
    ( ~ s__BodyOfWater(X)
    | s__WaterArea(X) ),
    file('FloodingCopenhagen+tff2fof.tptp',kb_SUMO_MILO_Domains_9582)).

cnf(23,axiom,
    ( ~ s__Sea(X)
    | s__BodyOfWater(X) ),
    file('FloodingCopenhagen+tff2fof.tptp',kb_SUMO_MILO_Domains_9679)).

cnf(28,axiom,
    ( ~ s__City(X)
    | ~ is_instance(X,s__CoastalCitiesClass)
    | s__Sea('SKOLEMAABH16'(X)) ),
    file('FloodingCopenhagen+tff2fof.tptp',coastal_cities_near_water)).

cnf(29,axiom,
    ( ~ s__City(X)
    | ~ is_instance(X,s__CoastalCitiesClass)
    | s__orientation(X,'SKOLEMAABH16'(X),s__Near) ),
    file('FloodingCopenhagen+tff2fof.tptp',coastal_cities_near_water)).

cnf(30,axiom,
    ( ~ s__WaterArea(X)
    | ~ s__City(Y)
    | ~ s__orientation(Y,X,s__Near)
    | s__capability(s__Flooding__t,s__located__m,Y) ),
    file('FloodingCopenhagen+tff2fof.tptp',flood_near_water)).

cnf(31,negated_conjecture,
    ( ~ s__City(X)
    | ~ s__Nation(Y)
    | ~ s__SymbolicString(Z)
    | ~ s__SymbolicString(U)
    | ~ s__SymbolicString(V)
    | ~ s__SymbolicString(W)
    | ~ is_instance(Y,s__OECDMemberEconomiesClass)
    | ~ capital_city(X,Y)
    | ~ look_different(X,s__Moscow)
    | ~ latlong(X,X1,Y1,Z,U)
    | ~ latlong(s__Moscow,Z1,U1,V,W)
    | ~ s__capability(s__Flooding__t,s__located__m,X) ),
    file('FloodingCopenhagen+tff2fof.tptp',where)).

cnf(34,axiom,
    ( is_instance(s__Copenhagen,s__CoastalCitiesClass) ),
    file('FloodingCopenhagen+tff2fof.tptp',copenhagen_coastal)).

cnf(36,axiom,
    ( s__Nation(s__Denmark) ),
    file('FloodingCopenhagen+tff2fof.tptp',s__Denmark_type)).

cnf(37,axiom,
    ( is_instance(s__Denmark,s__OECDMemberEconomiesClass) ),
    file('FloodingCopenhagen+tff2fof.tptp',s__Denmark_OECD)).

cnf(38,axiom,
    ( s__City(s__Copenhagen) ),
    file('FloodingCopenhagen+tff2fof.tptp',s__Copenhagen_type)).

cnf(39,axiom,
    ( capital_city(s__Copenhagen,s__Denmark) ),
    file('FloodingCopenhagen+tff2fof.tptp',s__Copenhagen_s__Denmark)).

cnf(40,axiom,
    ( s__SymbolicString(copenhagen) ),
    file('FloodingCopenhagen+tff2fof.tptp',copenhagen_type)).

cnf(41,axiom,
    ( s__SymbolicString(dk) ),
    file('FloodingCopenhagen+tff2fof.tptp',dk_type)).

cnf(42,axiom,
    ( latlong(s__Copenhagen,55.67631,12.569355,copenhagen,dk) ),
    file('FloodingCopenhagen+tff2fof.tptp',latlong_s__Copenhagen)).

cnf(43,axiom,
    ( s__SymbolicString(moscow) ),
    file('FloodingCopenhagen+tff2fof.tptp',moscow_type)).

cnf(44,axiom,
    ( s__SymbolicString(ru) ),
    file('FloodingCopenhagen+tff2fof.tptp',ru_type)).

cnf(45,axiom,
    ( latlong(s__Moscow,55.75695,37.614975,moscow,ru) ),
    file('FloodingCopenhagen+tff2fof.tptp',latlong_s__Moscow)).

cnf(46,axiom,
    ( look_different(s__Copenhagen,s__Moscow) ),
    file('FloodingCopenhagen+tff2fof.tptp',s__Copenhagen_not_s__Moscow)).

cnf(77,plain,
    ( s__Sea('SKOLEMAABH16'(s__Copenhagen)) ),
    inference('HYPERRESOLVE',[status(thm)],[28,38,34])).

cnf(78,plain,
    ( s__orientation(s__Copenhagen,'SKOLEMAABH16'(s__Copenhagen),s__Near) ),
    inference('HYPERRESOLVE',[status(thm)],[29,38,34])).

cnf(106,plain,
    ( s__BodyOfWater('SKOLEMAABH16'(s__Copenhagen)) ),
    inference('HYPERRESOLVE',[status(thm)],[23,77])).

cnf(107,plain,
    ( s__WaterArea('SKOLEMAABH16'(s__Copenhagen)) ),
    inference('HYPERRESOLVE',[status(thm)],[22,106])).

cnf(111,plain,
    ( s__capability(s__Flooding__t,s__located__m,s__Copenhagen) ),
    inference('HYPERRESOLVE',[status(thm)],[30,78,107,38])).

cnf(112,plain,
    ( $false ),
    inference('HYPERRESOLVE',[status(thm)],[31,111,38,36,40,41,43,44,37,39,46,42,45])).


