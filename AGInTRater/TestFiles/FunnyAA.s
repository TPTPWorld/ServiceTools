fof(1,axiom,(
    ! [X1] : 
    ? [X1] : 
      ( lives(X1)
      & killed(X1,agatha) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_1)).

fof(5,axiom,(
    ! [X1,X1] : 
      ( lives(X1)
     => ( X1 = agatha
        | X1 = butler
        | X1 = charles ) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_3)).

fof(6,axiom,(
    ! [X2,X1,X1,X2] : 
      ( killed(X1,X2)
     => hates(X1,X2) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_4)).

fof(7,axiom,(
    ! [X2,X1,X1,X2] : 
      ( killed(X1,X2)
     => ~ richer(X1,X2) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_5)).

fof(8,axiom,(
    ! [X1,X1] : 
      ( hates(agatha,X1)
     => ~ hates(charles,X1) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_6)).

fof(9,axiom,(
    ! [X1,X1] : 
      ( X1 != butler
     => hates(agatha,X1) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_7)).

fof(10,axiom,(
    ! [X1,X1] : 
      ( ~ richer(X1,agatha)
     => hates(butler,X1) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_8)).

fof(11,axiom,(
    ! [X1,X1] : 
      ( hates(agatha,X1)
     => hates(butler,X1) ) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_9)).

fof(12,axiom,(
    ! [X2,X1,X1] : 
    ? [X2] : ~ hates(X1,X2) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_10)).

fof(13,axiom,(
    agatha != butler ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55_11)).

fof(14,conjecture,(
    killed(agatha,agatha) ),
    file('/tmp/SystemOnTPTP27097/SOT_e0S8Sw.p',pel55)).

fof(15,negated_conjecture,(
    ~ killed(agatha,agatha) ),
    inference(assume_negation,[status(cth)],[14])).

fof(16,plain,(
    ! [X2,X1,X1,X2] : 
      ( killed(X1,X2)
     => ~ richer(X1,X2) ) ),
    inference(fof_simplification,[status(thm)],[7,theory(equality)])).

fof(17,plain,(
    ! [X1,X1] : 
      ( hates(agatha,X1)
     => ~ hates(charles,X1) ) ),
    inference(fof_simplification,[status(thm)],[8,theory(equality)])).

fof(18,plain,(
    ! [X1,X1] : 
      ( ~ richer(X1,agatha)
     => hates(butler,X1) ) ),
    inference(fof_simplification,[status(thm)],[10,theory(equality)])).

fof(19,plain,(
    ! [X2,X1,X1] : 
    ? [X2] : ~ hates(X1,X2) ),
    inference(fof_simplification,[status(thm)],[12,theory(equality)])).

fof(20,negated_conjecture,(
    ~ killed(agatha,agatha) ),
    inference(fof_simplification,[status(thm)],[15,theory(equality)])).

fof(21,plain,(
    ! [X2] : 
    ? [X3] : 
      ( lives(X3)
      & killed(X3,agatha) ) ),
    inference(variable_rename,[status(thm)],[1])).

fof(22,plain,(
    ! [X2] : 
      ( lives(esk1_1(X2))
      & killed(esk1_1(X2),agatha) ) ),
    inference(skolemize,[status(sab)],[21])).

cnf(23,plain,
    ( killed(esk1_1(X1),agatha) ),
    inference(split_conjunct,[status(thm)],[22])).

cnf(24,plain,
    ( lives(esk1_1(X1)) ),
    inference(split_conjunct,[status(thm)],[22])).

fof(28,plain,(
    ! [X1,X1] : 
      ( ~ lives(X1)
      | X1 = agatha
      | X1 = butler
      | X1 = charles ) ),
    inference(fof_nnf,[status(thm)],[5])).

fof(29,plain,(
    ! [X2,X3] : 
      ( ~ lives(X3)
      | X3 = agatha
      | X3 = butler
      | X3 = charles ) ),
    inference(variable_rename,[status(thm)],[28])).

cnf(30,plain,
    ( X1 = charles
    | X1 = butler
    | X1 = agatha
    | ~ lives(X1) ),
    inference(split_conjunct,[status(thm)],[29])).

fof(31,plain,(
    ! [X2,X1,X1,X2] : 
      ( ~ killed(X1,X2)
      | hates(X1,X2) ) ),
    inference(fof_nnf,[status(thm)],[6])).

fof(32,plain,(
    ! [X3,X4,X5,X6] : 
      ( ~ killed(X5,X6)
      | hates(X5,X6) ) ),
    inference(variable_rename,[status(thm)],[31])).

cnf(33,plain,
    ( hates(X1,X2)
    | ~ killed(X1,X2) ),
    inference(split_conjunct,[status(thm)],[32])).

fof(34,plain,(
    ! [X2,X1,X1,X2] : 
      ( ~ killed(X1,X2)
      | ~ richer(X1,X2) ) ),
    inference(fof_nnf,[status(thm)],[16])).

fof(35,plain,(
    ! [X3,X4,X5,X6] : 
      ( ~ killed(X5,X6)
      | ~ richer(X5,X6) ) ),
    inference(variable_rename,[status(thm)],[34])).

cnf(36,plain,
    ( ~ richer(X1,X2)
    | ~ killed(X1,X2) ),
    inference(split_conjunct,[status(thm)],[35])).

fof(37,plain,(
    ! [X1,X1] : 
      ( ~ hates(agatha,X1)
      | ~ hates(charles,X1) ) ),
    inference(fof_nnf,[status(thm)],[17])).

fof(38,plain,(
    ! [X2,X3] : 
      ( ~ hates(agatha,X3)
      | ~ hates(charles,X3) ) ),
    inference(variable_rename,[status(thm)],[37])).

cnf(39,plain,
    ( ~ hates(charles,X1)
    | ~ hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[38])).

fof(40,plain,(
    ! [X1,X1] : 
      ( X1 = butler
      | hates(agatha,X1) ) ),
    inference(fof_nnf,[status(thm)],[9])).

fof(41,plain,(
    ! [X2,X3] : 
      ( X3 = butler
      | hates(agatha,X3) ) ),
    inference(variable_rename,[status(thm)],[40])).

cnf(42,plain,
    ( hates(agatha,X1)
    | X1 = butler ),
    inference(split_conjunct,[status(thm)],[41])).

fof(43,plain,(
    ! [X1,X1] : 
      ( richer(X1,agatha)
      | hates(butler,X1) ) ),
    inference(fof_nnf,[status(thm)],[18])).

fof(44,plain,(
    ! [X2,X3] : 
      ( richer(X3,agatha)
      | hates(butler,X3) ) ),
    inference(variable_rename,[status(thm)],[43])).

cnf(45,plain,
    ( hates(butler,X1)
    | richer(X1,agatha) ),
    inference(split_conjunct,[status(thm)],[44])).

fof(46,plain,(
    ! [X1,X1] : 
      ( ~ hates(agatha,X1)
      | hates(butler,X1) ) ),
    inference(fof_nnf,[status(thm)],[11])).

fof(47,plain,(
    ! [X2,X3] : 
      ( ~ hates(agatha,X3)
      | hates(butler,X3) ) ),
    inference(variable_rename,[status(thm)],[46])).

cnf(48,plain,
    ( hates(butler,X1)
    | ~ hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[47])).

fof(49,plain,(
    ! [X3,X4,X5] : 
    ? [X6] : ~ hates(X5,X6) ),
    inference(variable_rename,[status(thm)],[19])).

fof(50,plain,(
    ! [X3,X4,X5] : ~ hates(X5,esk2_3(X3,X4,X5)) ),
    inference(skolemize,[status(sab)],[49])).

cnf(51,plain,
    ( ~ hates(X1,esk2_3(X2,X3,X1)) ),
    inference(split_conjunct,[status(thm)],[50])).

cnf(52,plain,
    ( agatha != butler ),
    inference(split_conjunct,[status(thm)],[13])).

cnf(53,negated_conjecture,
    ( ~ killed(agatha,agatha) ),
    inference(split_conjunct,[status(thm)],[20])).

cnf(54,plain,
    ( charles = esk1_1(X1)
    | butler = esk1_1(X1)
    | agatha = esk1_1(X1) ),
    inference(spm,[status(thm)],[30,24,theory(equality)])).

cnf(57,plain,
    ( hates(butler,X1)
    | ~ killed(X1,agatha) ),
    inference(spm,[status(thm)],[36,45,theory(equality)])).

cnf(58,plain,
    ( ~ hates(agatha,esk2_3(X1,X2,butler)) ),
    inference(spm,[status(thm)],[51,48,theory(equality)])).

cnf(63,plain,
    ( killed(charles,agatha)
    | esk1_1(X1) = agatha
    | esk1_1(X1) = butler ),
    inference(spm,[status(thm)],[23,54,theory(equality)])).

cnf(68,plain,
    ( butler = esk2_3(X1,X2,butler) ),
    inference(spm,[status(thm)],[58,42,theory(equality)])).

cnf(69,plain,
    ( ~ hates(butler,butler) ),
    inference(spm,[status(thm)],[51,68,theory(equality)])).

cnf(73,plain,
    ( killed(butler,agatha)
    | esk1_1(X1) = agatha
    | killed(charles,agatha) ),
    inference(spm,[status(thm)],[23,63,theory(equality)])).

cnf(79,plain,
    ( killed(agatha,agatha)
    | killed(charles,agatha)
    | killed(butler,agatha) ),
    inference(spm,[status(thm)],[23,73,theory(equality)])).

cnf(85,plain,
    ( killed(charles,agatha)
    | killed(butler,agatha) ),
    inference(sr,[status(thm)],[79,53,theory(equality)])).

cnf(97,plain,
    ( hates(charles,agatha)
    | killed(butler,agatha) ),
    inference(spm,[status(thm)],[33,85,theory(equality)])).

cnf(100,plain,
    ( hates(butler,butler)
    | hates(charles,agatha) ),
    inference(spm,[status(thm)],[57,97,theory(equality)])).

cnf(107,plain,
    ( hates(charles,agatha) ),
    inference(sr,[status(thm)],[100,69,theory(equality)])).

cnf(108,plain,
    ( ~ hates(agatha,agatha) ),
    inference(spm,[status(thm)],[39,107,theory(equality)])).

cnf(118,plain,
    ( butler = agatha ),
    inference(spm,[status(thm)],[108,42,theory(equality)])).

cnf(119,plain,
    ( $false ),
    inference(sr,[status(thm)],[118,52,theory(equality)])).

cnf(120,plain,
    ( $false ),
    119,
    [proof]).

