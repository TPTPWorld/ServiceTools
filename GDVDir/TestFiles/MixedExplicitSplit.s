cnf(10,initial,
    ( consecutive(thursday,friday) ),
    file('PUZ018-1.dfg',unknown),
    []).

cnf(130,axiom,
    ( all_on(wednesday)
    | all_on(monday) )  ).

cnf(134,derived,
    ( all_on(wednesday) ),
    inference(spt,[spt(sr_split,[position(l)])],[130]),
    [iquote('1:Spt:130.0')]).

cnf(2375,axiom,
    ( ~all_on(wednesday)
    | ~consecutive(tuesday,wednesday) )   ).

cnf(2379,derived,
    ( ~consecutive(tuesday,wednesday) ),
    inference(ssi,[status(thm)],[2375,134]),
    [iquote('2:SSi:2375.0,134.0')]).

cnf(12223,derived,
    ( all_on(monday) ),
    inference(spt,[spt(sr_split,[position(r)])],[130]),
    [iquote('1:Spt:12221.0,130.1')]).

cnf(14030,derived,
    ( ~consecutive(thursday,U) ),
    inference(mrr,[status(thm)],[2379,12223]),
    [iquote('2:MRR:13960.1,8.0')]).

cnf(14031,derived,
    ( $false ),
    inference(unc,[status(thm)],[14030,10]),
    [iquote('2:UnC:14030.0,10.0')]).

