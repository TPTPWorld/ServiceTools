fof(some_beautiful_crime,axiom,
    ? [X1] :
      ( city(X1)
      & beautiful(X1)
      & has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',some_beautiful_crime) ).
fof(c_0_5,conjecture,
    ~ ~ ? [X1] :
          ( city(X1)
          & beautiful(X1)
          & has_crime(X1) ),
    inference(assume_negation,[status(cth)],[some_beautiful_crime]),
    [nnpp(c_0_5)] ).
