%------------------------------------------------------------------------------
% File       : SPASS---3.01
% Problem    : SOT_rpkBw1 : v?.?.?
% Transform  : none
% Format     : dfg
% Command    : SPASS -PGiven=0 -PProblem=0 -DocProof -TimeLimit=%d %s

% Computer   : quoll.cs.miami.edu
% Model      : i686 i686
% CPU        : Intel(R) Xeon(R) CPU            5140  @ 2.33GHz @ 2327MHz
% Memory     : 822.5MB
% OS         : Linux 2.6.18-1.2798.fc6
% CPULimit   : -1s
% DateTime   : Fri Dec 19 07:38:38 EST 2008

% Result     : Unsatisfiable 0s
% Output     : Refutation 0s
% Verified   : 
% Statistics : Number of clauses     :   33 (  53 expanded)
%              Number of leaves      :   12 (  24 expanded)
%              Depth                 :    6
%              Number of atoms       :   47 (  90 expanded)
%              Maximal clause size   :    4 (   1 average)
%              Maximal term depth    :    2 (   1 average)

% Comments   : 
%------------------------------------------------------------------------------
cnf(4,axiom,
    ( lives__dfg(skc1) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(5,axiom,
    ( killed__dfg(skc1,agatha__dfg) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(6,axiom,
    ( butler__dfg != agatha__dfg ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(7,axiom,
    ( ~ killed__dfg(agatha__dfg,agatha__dfg) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(8,axiom,
    ( ~ hates__dfg(U,skf1(U)) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(9,axiom,
    ( richer__dfg(U,agatha__dfg)
    | hates__dfg(butler__dfg,U) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(10,axiom,
    ( U = butler__dfg
    | hates__dfg(agatha__dfg,U) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(11,axiom,
    ( ~ hates__dfg(agatha__dfg,U)
    | hates__dfg(butler__dfg,U) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(12,axiom,
    ( ~ killed__dfg(U,V)
    | hates__dfg(U,V) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(13,axiom,
    ( ~ hates__dfg(agatha__dfg,U)
    | ~ hates__dfg(charles__dfg,U) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(14,axiom,
    ( ~ killed__dfg(U,V)
    | ~ richer__dfg(U,V) ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(15,axiom,
    ( ~ lives__dfg(U)
    | U = agatha__dfg
    | U = butler__dfg
    | U = charles__dfg ),
    file('/tmp/SystemOnTPTPFormReply30166/SOT_rpkBw1',unknown),
    []).

cnf(17,plain,
    ( richer__dfg(skf1(butler__dfg),agatha__dfg) ),
    inference(res,[status(thm)],[9,8,theory(equality)]),
    [iquote('0:Res:9.1,8.0')]).

cnf(21,plain,
    ( ~ hates__dfg(agatha__dfg,skf1(butler__dfg)) ),
    inference(res,[status(thm)],[11,8,theory(equality)]),
    [iquote('0:Res:11.1,8.0')]).

cnf(25,plain,
    ( skf1(butler__dfg) = butler__dfg ),
    inference(res,[status(thm)],[10,21,theory(equality)]),
    [iquote('0:Res:10.1,21.0')]).

cnf(26,plain,
    ( richer__dfg(butler__dfg,agatha__dfg) ),
    inference(rew,[status(thm)],[25,17,theory(equality)]),
    [iquote('0:Rew:25.0,17.0')]).

cnf(31,plain,
    ( ~ killed__dfg(charles__dfg,U)
    | ~ hates__dfg(agatha__dfg,U) ),
    inference(res,[status(thm)],[12,13,theory(equality)]),
    [iquote('0:Res:12.1,13.1')]).

cnf(38,plain,
    ( ~ killed__dfg(charles__dfg,U)
    | U = butler__dfg ),
    inference(res,[status(thm)],[10,31,theory(equality)]),
    [iquote('0:Res:10.1,31.1')]).

cnf(39,plain,
    ( ~ richer__dfg(skc1,agatha__dfg) ),
    inference(res,[status(thm)],[5,14,theory(equality)]),
    [iquote('0:Res:5.0,14.0')]).

cnf(43,plain,
    ( skc1 = agatha__dfg
    | skc1 = butler__dfg
    | skc1 = charles__dfg ),
    inference(ems,[status(thm)],[15,4]),
    [iquote('0:EmS:15.0,4.0')]).

cnf(44,plain,
    ( skc1 = agatha__dfg ),
    inference(spt,[spt(sr_split,[position(l)])],[43]),
    [iquote('1:Spt:43.0')]).

cnf(46,plain,
    ( killed__dfg(agatha__dfg,agatha__dfg) ),
    inference(rew,[status(thm)],[44,5,theory(equality)]),
    [iquote('1:Rew:44.0,5.0')]).

cnf(48,plain,
    ( $false ),
    inference(mrr,[status(thm)],[46,7]),
    [iquote('1:MRR:46.0,7.0')]).

cnf(49,plain,
    ( skc1 != agatha__dfg ),
    inference(spt,[spt(sr_split,[position(a)])],[48,44]),
    [iquote('1:Spt:48.0,43.0,44.0')]).

cnf(50,plain,
    ( skc1 = butler__dfg
    | skc1 = charles__dfg ),
    inference(spt,[spt(sr_split,[position(r)])],[43]),
    [iquote('1:Spt:48.0,43.1,43.2')]).

cnf(51,plain,
    ( skc1 = butler__dfg ),
    inference(spt,[spt(sr_split,[position(rl)])],[50]),
    [iquote('2:Spt:50.0')]).

cnf(54,plain,
    ( ~ richer__dfg(butler__dfg,agatha__dfg) ),
    inference(rew,[status(thm)],[51,39,theory(equality)]),
    [iquote('2:Rew:51.0,39.0')]).

cnf(56,plain,
    ( $false ),
    inference(mrr,[status(thm)],[54,26]),
    [iquote('2:MRR:54.0,26.0')]).

cnf(57,plain,
    ( skc1 != butler__dfg ),
    inference(spt,[spt(sr_split,[position(ra)])],[56,51]),
    [iquote('2:Spt:56.0,50.0,51.0')]).

cnf(58,plain,
    ( skc1 = charles__dfg ),
    inference(spt,[spt(sr_split,[position(rr)])],[50]),
    [iquote('2:Spt:56.0,50.1')]).

cnf(60,plain,
    ( killed__dfg(charles__dfg,agatha__dfg) ),
    inference(rew,[status(thm)],[58,5,theory(equality)]),
    [iquote('2:Rew:58.0,5.0')]).

cnf(67,plain,
    ( butler__dfg = agatha__dfg ),
    inference(res,[status(thm)],[60,38,theory(equality)]),
    [iquote('2:Res:60.0,38.0')]).

cnf(68,plain,
    ( $false ),
    inference(mrr,[status(thm)],[67,6]),
    [iquote('2:MRR:67.0,6.0')]).

%------------------------------------------------------------------------------
