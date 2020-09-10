% this file was automatically generated by tstp_tools.pl

fof(pel55_1,axiom,
    ( ? [X] :
        ( lives(X)
        & killed(X,agatha) ) )).

fof(pel55_2_1,axiom,
    ( lives(agatha) )).

fof(pel55_2_2,axiom,
    ( lives(butler) )).

fof(pel55_2_3,axiom,
    ( lives(charles) )).

fof(pel55_3,axiom,
    ( ! [X] :
        ( lives(X)
       => ( X = agatha
          | X = butler
          | X = charles ) ) )).

fof(pel55_4,axiom,
    ( ! [X,Y] :
        ( killed(X,Y)
       => hates(X,Y) ) )).

fof(pel55_5,axiom,
    ( ! [X,Y] :
        ( killed(X,Y)
       => ~ richer(X,Y) ) )).

fof(pel55_6,axiom,
    ( ! [X] :
        ( hates(agatha,X)
       => ~ hates(charles,X) ) )).

fof(pel55_7,axiom,
    ( ! [X] :
        ( X != butler
       => hates(agatha,X) ) )).

fof(pel55_8,axiom,
    ( ! [X] :
        ( ~ richer(X,agatha)
       => hates(butler,X) ) )).

fof(pel55_9,axiom,
    ( ! [X] :
        ( hates(agatha,X)
       => hates(butler,X) ) )).

fof(pel55_10,axiom,
    ( ! [X] :
      ? [Y] : ~ hates(X,Y) )).

fof(pel55_11,axiom,
    (  agatha != butler )).

cnf(c_0_159,negated_conjecture,
    ( hates(esk15_0,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_158]),
    [obviousness(1.00),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(1.00),focus(1.00),weight(0.90),ancestors(15),usefulness(ignored),interesting(1.00),iteration(1)]).

cnf(c_0_165,negated_conjecture,
    ( hates(esk16_0,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_164]),
    [obviousness(1.00),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(1.00),focus(1.00),weight(0.90),ancestors(17),usefulness(ignored),interesting(1.00),iteration(1)]).

cnf(c_0_152,negated_conjecture,
    ( hates(esk13_0,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_151]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(1.00),focus(1.00),weight(0.90),ancestors(13),usefulness(ignored),interesting(0.88),iteration(1)]).

cnf(c_0_155,negated_conjecture,
    ( hates(esk14_0,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_154]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(1.00),focus(1.00),weight(0.90),ancestors(14),usefulness(ignored),interesting(0.88),iteration(1)]).

cnf(c_0_304,negated_conjecture,
    ( lives(esk47_0) ),
    inference(split_conjunct,[status(thm)],[c_0_300]),
    [obviousness(0.75),complexity(0.80),intensity(1.00),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(58),usefulness(ignored),interesting(0.84),iteration(1)]).

cnf(c_0_133,plain,
    ( ~ richer(X1,X2)
    | ~ killed(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_132]),
    [obviousness(0.75),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.50),focus(1.00),weight(0.90),ancestors(6),usefulness(ignored),interesting(0.82),iteration(1)]).

cnf(c_0_148,plain,
    ( ~ hates(X1,esk12_1(X1)) ),
    inference(split_conjunct,[status(thm)],[c_0_147]),
    [obviousness(0.75),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.50),focus(1.00),weight(0.90),ancestors(11),usefulness(ignored),interesting(0.81),iteration(1)]).

cnf(c_0_161,negated_conjecture,
    ( hates(esk10_0,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_160]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(1.00),focus(1.00),weight(0.90),ancestors(16),usefulness(ignored),interesting(0.81),iteration(1)]).

fof(c_0_157,negated_conjecture,(
    ? [X3] : 
    ! [X4] : hates(X3,X4) ),
    inference(variable_rename,[status(thm)],[c_0_156]),
    [obviousness(0.50),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(15),usefulness(1.00),interesting(0.79),iteration(1)]).

fof(c_0_163,negated_conjecture,(
    ? [X4] : 
    ! [X5] : hates(X4,X5) ),
    inference(variable_rename,[status(thm)],[c_0_162]),
    [obviousness(0.50),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(17),usefulness(1.00),interesting(0.79),iteration(1)]).

cnf(c_0_291,negated_conjecture,
    ( lives(esk45_0) ),
    inference(split_conjunct,[status(thm)],[c_0_287]),
    [obviousness(0.50),complexity(0.80),intensity(1.00),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(56),usefulness(ignored),interesting(0.78),iteration(1)]).

cnf(c_0_297,negated_conjecture,
    ( lives(esk46_0) ),
    inference(split_conjunct,[status(thm)],[c_0_293]),
    [obviousness(0.50),complexity(0.80),intensity(1.00),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(57),usefulness(ignored),interesting(0.78),iteration(1)]).

cnf(c_0_228,negated_conjecture,
    ( hates(charles,esk35_0) ),
    inference(split_conjunct,[status(thm)],[c_0_227]),
    [obviousness(1.00),complexity(0.60),intensity(0.89),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(39),usefulness(ignored),interesting(0.77),iteration(1)]).

cnf(c_0_229,negated_conjecture,
    ( hates(agatha,esk35_0) ),
    inference(split_conjunct,[status(thm)],[c_0_227]),
    [obviousness(1.00),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(39),usefulness(ignored),interesting(0.77),iteration(1)]).

cnf(c_0_241,negated_conjecture,
    ( hates(charles,esk37_0) ),
    inference(split_conjunct,[status(thm)],[c_0_240]),
    [obviousness(1.00),complexity(0.60),intensity(0.89),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(42),usefulness(ignored),interesting(0.77),iteration(1)]).

cnf(c_0_242,negated_conjecture,
    ( hates(agatha,esk37_0) ),
    inference(split_conjunct,[status(thm)],[c_0_240]),
    [obviousness(1.00),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(42),usefulness(ignored),interesting(0.77),iteration(1)]).

fof(c_0_158,negated_conjecture,(
    ! [X4] : hates(esk15_0,X4) ),
    inference(skolemize,[status(esa)],[c_0_157]),
    [obviousness(0.75),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(15),usefulness(1.00),interesting(0.76),iteration(1)]).

fof(c_0_164,negated_conjecture,(
    ! [X5] : hates(esk16_0,X5) ),
    inference(skolemize,[status(esa)],[c_0_163]),
    [obviousness(0.75),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(17),usefulness(1.00),interesting(0.76),iteration(1)]).

cnf(c_0_130,plain,
    ( hates(X1,X2)
    | ~ killed(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_129]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.93),adaptivity(0.50),focus(1.00),weight(0.90),ancestors(5),usefulness(ignored),interesting(0.75),iteration(1)]).

cnf(c_0_302,negated_conjecture,
    ( esk47_0 != butler ),
    inference(split_conjunct,[status(thm)],[c_0_300]),
    [obviousness(0.75),complexity(0.60),intensity(1.00),surprisingness(0.79),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(58),usefulness(ignored),interesting(0.74),iteration(1)]).

cnf(c_0_303,negated_conjecture,
    ( esk47_0 != agatha ),
    inference(split_conjunct,[status(thm)],[c_0_300]),
    [obviousness(0.75),complexity(0.60),intensity(1.00),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(58),usefulness(ignored),interesting(0.74),iteration(1)]).

fof(c_0_146,plain,(
    ! [X3] : 
    ? [X4] : ~ hates(X3,X4) ),
    inference(variable_rename,[status(thm)],[c_0_88]),
    [obviousness(0.25),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(11),usefulness(1.00),interesting(0.73),iteration(1)]).

fof(c_0_156,negated_conjecture,(
    ? [X1] : 
    ! [X2] : hates(X1,X2) ),
    inference(fof_nnf,[status(thm)],[c_0_89]),
    [obviousness(0.25),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(15),usefulness(1.00),interesting(0.73),iteration(1)]).

fof(c_0_162,negated_conjecture,(
    ? [X2] : 
    ! [X3] : hates(X2,X3) ),
    inference(fof_nnf,[status(thm)],[c_0_90]),
    [obviousness(0.25),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(17),usefulness(1.00),interesting(0.73),iteration(1)]).

cnf(c_0_301,negated_conjecture,
    ( esk47_0 != charles ),
    inference(split_conjunct,[status(thm)],[c_0_300]),
    [obviousness(0.75),complexity(0.60),intensity(1.00),surprisingness(0.77),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(58),usefulness(ignored),interesting(0.73),iteration(1)]).

fof(c_0_132,plain,(
    ! [X3,X4] : 
      ( ~ killed(X3,X4)
      | ~ richer(X3,X4) ) ),
    inference(variable_rename,[status(thm)],[c_0_131]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(6),usefulness(1.00),interesting(0.71),iteration(1)]).

fof(c_0_147,plain,(
    ! [X3] : ~ hates(X3,esk12_1(X3)) ),
    inference(skolemize,[status(esa)],[c_0_146]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(11),usefulness(1.00),interesting(0.71),iteration(1)]).

cnf(c_0_212,negated_conjecture,
    ( ~ hates(butler,esk32_0) ),
    inference(split_conjunct,[status(thm)],[c_0_211]),
    [obviousness(0.75),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(34),usefulness(ignored),interesting(0.71),iteration(1)]).

cnf(c_0_213,negated_conjecture,
    ( hates(agatha,esk32_0) ),
    inference(split_conjunct,[status(thm)],[c_0_211]),
    [obviousness(0.75),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(34),usefulness(ignored),interesting(0.71),iteration(1)]).

cnf(c_0_223,negated_conjecture,
    ( ~ hates(butler,esk34_0) ),
    inference(split_conjunct,[status(thm)],[c_0_222]),
    [obviousness(0.75),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(38),usefulness(ignored),interesting(0.71),iteration(1)]).

cnf(c_0_224,negated_conjecture,
    ( hates(agatha,esk34_0) ),
    inference(split_conjunct,[status(thm)],[c_0_222]),
    [obviousness(0.75),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(38),usefulness(ignored),interesting(0.71),iteration(1)]).

cnf(c_0_236,negated_conjecture,
    ( ~ hates(butler,esk36_0) ),
    inference(split_conjunct,[status(thm)],[c_0_235]),
    [obviousness(0.75),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(41),usefulness(ignored),interesting(0.71),iteration(1)]).

cnf(c_0_237,negated_conjecture,
    ( hates(agatha,esk36_0) ),
    inference(split_conjunct,[status(thm)],[c_0_235]),
    [obviousness(0.75),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(41),usefulness(ignored),interesting(0.71),iteration(1)]).

cnf(c_0_136,plain,
    ( ~ hates(charles,X1)
    | ~ hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_135]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.81),adaptivity(0.50),focus(1.00),weight(0.70),ancestors(7),usefulness(ignored),interesting(0.69),iteration(1)]).

fof(c_0_88,plain,(
    ! [X1] : 
    ? [X2] : ~ hates(X1,X2) ),
    inference(fof_simplification,[status(thm)],[c_0_12]),
    [obviousness(0.00),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(11),usefulness(1.00),interesting(0.68),iteration(1)]).

fof(c_0_89,negated_conjecture,(
    ~ ! [X1] : 
      ? [X2] : ~ hates(X1,X2) ),
    inference(fof_simplification,[status(thm)],[c_0_16]),
    [obviousness(0.00),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(15),usefulness(1.00),interesting(0.68),iteration(1)]).

fof(c_0_90,negated_conjecture,(
    ~ ! [X2] : 
      ? [X3] : ~ hates(X2,X3) ),
    inference(fof_simplification,[status(thm)],[c_0_18]),
    [obviousness(0.00),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(17),usefulness(1.00),interesting(0.68),iteration(1)]).

fof(c_0_150,negated_conjecture,(
    ? [X3] : 
    ! [X4] : hates(X3,X4) ),
    inference(variable_rename,[status(thm)],[c_0_14]),
    [obviousness(0.00),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(13),usefulness(1.00),interesting(0.68),iteration(1)]).

fof(c_0_153,negated_conjecture,(
    ? [X3] : 
    ! [X4] : hates(X3,X4) ),
    inference(variable_rename,[status(thm)],[c_0_15]),
    [obviousness(0.00),complexity(1.00),intensity(0.38),surprisingness(1.00),adaptivity(0.00),focus(1.00),weight(1.00),ancestors(14),usefulness(1.00),interesting(0.68),iteration(1)]).

cnf(c_0_289,negated_conjecture,
    ( esk45_0 != butler ),
    inference(split_conjunct,[status(thm)],[c_0_287]),
    [obviousness(0.50),complexity(0.60),intensity(1.00),surprisingness(0.79),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(56),usefulness(ignored),interesting(0.68),iteration(1)]).

cnf(c_0_295,negated_conjecture,
    ( esk46_0 != butler ),
    inference(split_conjunct,[status(thm)],[c_0_293]),
    [obviousness(0.50),complexity(0.60),intensity(1.00),surprisingness(0.79),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(57),usefulness(ignored),interesting(0.68),iteration(1)]).

cnf(c_0_288,negated_conjecture,
    ( esk45_0 != charles ),
    inference(split_conjunct,[status(thm)],[c_0_287]),
    [obviousness(0.50),complexity(0.60),intensity(1.00),surprisingness(0.77),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(56),usefulness(ignored),interesting(0.67),iteration(1)]).

cnf(c_0_290,negated_conjecture,
    ( esk45_0 != agatha ),
    inference(split_conjunct,[status(thm)],[c_0_287]),
    [obviousness(0.50),complexity(0.60),intensity(1.00),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(56),usefulness(ignored),interesting(0.67),iteration(1)]).

cnf(c_0_294,negated_conjecture,
    ( esk46_0 != charles ),
    inference(split_conjunct,[status(thm)],[c_0_293]),
    [obviousness(0.50),complexity(0.60),intensity(1.00),surprisingness(0.77),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(57),usefulness(ignored),interesting(0.67),iteration(1)]).

cnf(c_0_296,negated_conjecture,
    ( esk46_0 != agatha ),
    inference(split_conjunct,[status(thm)],[c_0_293]),
    [obviousness(0.50),complexity(0.60),intensity(1.00),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(57),usefulness(ignored),interesting(0.67),iteration(1)]).

fof(c_0_131,plain,(
    ! [X1,X2] : 
      ( ~ killed(X1,X2)
      | ~ richer(X1,X2) ) ),
    inference(fof_nnf,[status(thm)],[c_0_85]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(6),usefulness(1.00),interesting(0.66),iteration(1)]).

fof(c_0_181,negated_conjecture,(
    ? [X3,X4] : 
      ( killed(X3,X4)
      & richer(X3,X4) ) ),
    inference(fof_nnf,[status(thm)],[c_0_95]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(24),usefulness(1.00),interesting(0.66),iteration(1)]).

cnf(c_0_184,negated_conjecture,
    ( richer(esk23_0,esk24_0) ),
    inference(split_conjunct,[status(thm)],[c_0_183]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(24),usefulness(ignored),interesting(0.66),iteration(1)]).

cnf(c_0_185,negated_conjecture,
    ( killed(esk23_0,esk24_0) ),
    inference(split_conjunct,[status(thm)],[c_0_183]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(24),usefulness(ignored),interesting(0.66),iteration(1)]).

fof(c_0_198,negated_conjecture,(
    ? [X1,X2] : 
      ( killed(X1,X2)
      & richer(X1,X2) ) ),
    inference(fof_nnf,[status(thm)],[c_0_100]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(30),usefulness(1.00),interesting(0.66),iteration(1)]).

cnf(c_0_201,negated_conjecture,
    ( richer(esk29_0,esk30_0) ),
    inference(split_conjunct,[status(thm)],[c_0_200]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(30),usefulness(ignored),interesting(0.66),iteration(1)]).

cnf(c_0_202,negated_conjecture,
    ( killed(esk29_0,esk30_0) ),
    inference(split_conjunct,[status(thm)],[c_0_200]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(30),usefulness(ignored),interesting(0.66),iteration(1)]).

cnf(c_0_308,negated_conjecture,
    ( lives(esk1_0) ),
    inference(split_conjunct,[status(thm)],[c_0_60]),
    [obviousness(0.00),complexity(0.80),intensity(1.00),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(59),usefulness(ignored),interesting(0.66),iteration(1)]).

fof(c_0_129,plain,(
    ! [X3,X4] : 
      ( ~ killed(X3,X4)
      | hates(X3,X4) ) ),
    inference(variable_rename,[status(thm)],[c_0_128]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.93),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(5),usefulness(1.00),interesting(0.65),iteration(1)]).

fof(c_0_151,negated_conjecture,(
    ! [X4] : hates(esk13_0,X4) ),
    inference(skolemize,[status(esa)],[c_0_150]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(13),usefulness(1.00),interesting(0.65),iteration(1)]).

fof(c_0_154,negated_conjecture,(
    ! [X4] : hates(esk14_0,X4) ),
    inference(skolemize,[status(esa)],[c_0_153]),
    [obviousness(0.25),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(14),usefulness(1.00),interesting(0.65),iteration(1)]).

cnf(c_0_206,negated_conjecture,
    ( hates(agatha,esk31_0) ),
    inference(split_conjunct,[status(thm)],[c_0_204]),
    [obviousness(0.50),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(31),usefulness(ignored),interesting(0.65),iteration(1)]).

cnf(c_0_208,negated_conjecture,
    ( ~ killed(X1,agatha)
    | ~ lives(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_207]),
    [obviousness(0.50),complexity(0.60),intensity(0.38),surprisingness(0.80),adaptivity(0.50),focus(1.00),weight(0.80),ancestors(32),usefulness(ignored),interesting(0.65),iteration(1)]).

cnf(c_0_217,negated_conjecture,
    ( hates(agatha,esk33_0) ),
    inference(split_conjunct,[status(thm)],[c_0_215]),
    [obviousness(0.50),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(35),usefulness(ignored),interesting(0.65),iteration(1)]).

cnf(c_0_145,plain,
    ( hates(butler,X1)
    | ~ hates(agatha,X1) ),
    inference(split_conjunct,[status(thm)],[c_0_144]),
    [obviousness(0.50),complexity(0.60),intensity(0.38),surprisingness(0.86),adaptivity(0.50),focus(1.00),weight(0.70),ancestors(10),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_205,negated_conjecture,
    ( hates(charles,esk31_0) ),
    inference(split_conjunct,[status(thm)],[c_0_204]),
    [obviousness(0.50),complexity(0.60),intensity(0.89),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(31),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_216,negated_conjecture,
    ( hates(charles,esk33_0) ),
    inference(split_conjunct,[status(thm)],[c_0_215]),
    [obviousness(0.50),complexity(0.60),intensity(0.89),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(35),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_262,negated_conjecture,
    ( ~ hates(butler,esk42_0) ),
    inference(split_conjunct,[status(thm)],[c_0_261]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(47),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_263,negated_conjecture,
    ( ~ richer(esk42_0,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_261]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(47),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_276,negated_conjecture,
    ( ~ hates(butler,esk44_0) ),
    inference(split_conjunct,[status(thm)],[c_0_275]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(51),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_277,negated_conjecture,
    ( ~ richer(esk44_0,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_275]),
    [obviousness(1.00),complexity(0.60),intensity(0.38),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(51),usefulness(ignored),interesting(0.64),iteration(1)]).

cnf(c_0_121,plain,
    ( lives(esk11_0) ),
    inference(split_conjunct,[status(thm)],[c_0_119]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(0),usefulness(ignored),interesting(0.63),iteration(1)]).

fof(c_0_85,plain,(
    ! [X1,X2] : 
      ( killed(X1,X2)
     => ~ richer(X1,X2) ) ),
    inference(fof_simplification,[status(thm)],[c_0_7]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(6),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_91,negated_conjecture,(
    ? [X1,X2] : 
      ( killed(X1,X2)
      & ~ hates(X1,X2) ) ),
    inference(fof_simplification,[status(thm)],[c_0_20]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.93),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(19),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_92,negated_conjecture,(
    ~ lives(agatha) ),
    inference(fof_simplification,[status(thm)],[c_0_22]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(21),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_93,negated_conjecture,(
    ~ lives(butler) ),
    inference(fof_simplification,[status(thm)],[c_0_23]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(22),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_94,negated_conjecture,(
    ~ lives(charles) ),
    inference(fof_simplification,[status(thm)],[c_0_24]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(23),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_95,negated_conjecture,(
    ~ ! [X3,X4] : 
        ( killed(X3,X4)
       => ~ richer(X3,X4) ) ),
    inference(fof_simplification,[status(thm)],[c_0_25]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(24),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_96,negated_conjecture,(
    ? [X3,X4] : 
      ( killed(X3,X4)
      & ~ hates(X3,X4) ) ),
    inference(fof_simplification,[status(thm)],[c_0_26]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.93),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(25),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_97,negated_conjecture,(
    ~ lives(agatha) ),
    inference(fof_simplification,[status(thm)],[c_0_27]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(26),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_98,negated_conjecture,(
    ~ lives(butler) ),
    inference(fof_simplification,[status(thm)],[c_0_28]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(27),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_99,negated_conjecture,(
    ~ lives(charles) ),
    inference(fof_simplification,[status(thm)],[c_0_29]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(28),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_100,negated_conjecture,(
    ~ ! [X1,X2] : 
        ( killed(X1,X2)
       => ~ richer(X1,X2) ) ),
    inference(fof_simplification,[status(thm)],[c_0_31]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(30),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_128,plain,(
    ! [X1,X2] : 
      ( ~ killed(X1,X2)
      | hates(X1,X2) ) ),
    inference(fof_nnf,[status(thm)],[c_0_6]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.93),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(5),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_135,plain,(
    ! [X2] : 
      ( ~ hates(agatha,X2)
      | ~ hates(charles,X2) ) ),
    inference(variable_rename,[status(thm)],[c_0_134]),
    [obviousness(0.50),complexity(0.60),intensity(0.38),surprisingness(0.81),adaptivity(0.00),focus(1.00),weight(0.70),ancestors(7),usefulness(1.00),interesting(0.60),iteration(1)]).

cnf(c_0_142,plain,
    ( hates(butler,X1)
    | richer(X1,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_141]),
    [obviousness(0.75),complexity(0.40),intensity(0.38),surprisingness(0.64),adaptivity(0.50),focus(1.00),weight(0.70),ancestors(9),usefulness(ignored),interesting(0.60),iteration(1)]).

fof(c_0_160,negated_conjecture,(
    ! [X2] : hates(esk10_0,X2) ),
    inference(variable_rename,[status(thm)],[c_0_17]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.92),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(16),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_182,negated_conjecture,(
    ? [X5,X6] : 
      ( killed(X5,X6)
      & richer(X5,X6) ) ),
    inference(variable_rename,[status(thm)],[c_0_181]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(24),usefulness(0.50),interesting(0.60),iteration(1)]).

fof(c_0_193,negated_conjecture,(
    ? [X1,X2] : 
      ( killed(X1,X2)
      & ~ hates(X1,X2) ) ),
    inference(fof_nnf,[status(thm)],[c_0_30]),
    [obviousness(0.00),complexity(0.80),intensity(0.38),surprisingness(0.93),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(29),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_199,negated_conjecture,(
    ? [X3,X4] : 
      ( killed(X3,X4)
      & richer(X3,X4) ) ),
    inference(variable_rename,[status(thm)],[c_0_198]),
    [obviousness(0.50),complexity(0.80),intensity(0.38),surprisingness(0.94),adaptivity(0.00),focus(1.00),weight(0.90),ancestors(30),usefulness(0.50),interesting(0.60),iteration(1)]).

fof(c_0_226,negated_conjecture,(
    ? [X2] : 
      ( hates(agatha,X2)
      & hates(charles,X2) ) ),
    inference(variable_rename,[status(thm)],[c_0_225]),
    [obviousness(0.50),complexity(0.60),intensity(0.38),surprisingness(0.81),adaptivity(0.00),focus(1.00),weight(0.70),ancestors(39),usefulness(1.00),interesting(0.60),iteration(1)]).

fof(c_0_239,negated_conjecture,(
    ? [X2] : 
      ( hates(agatha,X2)
      & hates(charles,X2) ) ),
    inference(variable_rename,[status(thm)],[c_0_238]),
    [obviousness(0.50),complexity(0.60),intensity(0.38),surprisingness(0.81),adaptivity(0.00),focus(1.00),weight(0.70),ancestors(42),usefulness(1.00),interesting(0.60),iteration(1)]).

cnf(c_0_172,negated_conjecture,
    ( ~ hates(esk19_0,esk20_0) ),
    inference(split_conjunct,[status(thm)],[c_0_171]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(19),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_173,negated_conjecture,
    ( killed(esk19_0,esk20_0) ),
    inference(split_conjunct,[status(thm)],[c_0_171]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(19),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_188,negated_conjecture,
    ( ~ hates(esk25_0,esk26_0) ),
    inference(split_conjunct,[status(thm)],[c_0_187]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(25),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_189,negated_conjecture,
    ( killed(esk25_0,esk26_0) ),
    inference(split_conjunct,[status(thm)],[c_0_187]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(25),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_196,negated_conjecture,
    ( ~ hates(esk27_0,esk28_0) ),
    inference(split_conjunct,[status(thm)],[c_0_195]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(29),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_197,negated_conjecture,
    ( killed(esk27_0,esk28_0) ),
    inference(split_conjunct,[status(thm)],[c_0_195]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.83),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(29),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_272,negated_conjecture,
    ( hates(agatha,esk9_0) ),
    inference(split_conjunct,[status(thm)],[c_0_113]),
    [obviousness(0.25),complexity(0.60),intensity(0.89),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(50),usefulness(ignored),interesting(0.59),iteration(1)]).

cnf(c_0_245,negated_conjecture,
    ( ~ hates(butler,esk38_0) ),
    inference(split_conjunct,[status(thm)],[c_0_244]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(43),usefulness(ignored),interesting(0.58),iteration(1)]).

cnf(c_0_246,negated_conjecture,
    ( ~ richer(esk38_0,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_244]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(43),usefulness(ignored),interesting(0.58),iteration(1)]).

cnf(c_0_249,negated_conjecture,
    ( ~ hates(agatha,esk39_0) ),
    inference(split_conjunct,[status(thm)],[c_0_248]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(44),usefulness(ignored),interesting(0.58),iteration(1)]).

cnf(c_0_250,negated_conjecture,
    ( esk39_0 != butler ),
    inference(split_conjunct,[status(thm)],[c_0_248]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.79),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(44),usefulness(ignored),interesting(0.58),iteration(1)]).

cnf(c_0_253,negated_conjecture,
    ( ~ hates(butler,esk40_0) ),
    inference(split_conjunct,[status(thm)],[c_0_252]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.78),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(45),usefulness(ignored),interesting(0.58),iteration(1)]).

cnf(c_0_254,negated_conjecture,
    ( ~ richer(esk40_0,agatha) ),
    inference(split_conjunct,[status(thm)],[c_0_252]),
    [obviousness(0.75),complexity(0.60),intensity(0.38),surprisingness(0.76),adaptivity(0.00),focus(1.00),weight(0.80),ancestors(45),usefulness(ignored),interesting(0.58),iteration(1)]).
