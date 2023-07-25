%------------------------------------------------------------------------------
fof(some_beautiful_crime,conjecture,
    ? [X1] :
      ( city(X1)
      & beautiful(X1)
      & has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',some_beautiful_crime) ).

fof(country_big_city,axiom,
    ! [X1] :
      ( country(X1)
     => ( big_city(capital_of(X1))
        & beautiful(capital_of(X1)) ) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',country_big_city) ).

fof(crime_axiom,axiom,
    ! [X1] :
      ( big_city(X1)
     => has_crime(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',crime_axiom) ).

fof(big_city_city,axiom,
    ! [X1] :
      ( big_city(X1)
     => city(X1) ),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',big_city_city) ).

fof(country_usa,axiom,
    country(usa),
    file('/tmp/tmp.BJIDJiIgjN/E---3.1_13943',country_usa) ).

fof(c_0_5,negated_conjecture,
    ~ ? [X1] :
        ( city(X1)
        & beautiful(X1)
        & has_crime(X1) ),
    inference(assume_negation,[status(cth)],[some_beautiful_crime]) ).

fof(c_0_6,negated_conjecture,
    ! [X2] :
      ( ~ city(X2)
      | ~ beautiful(X2)
      | ~ has_crime(X2) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])]) ).

fof(c_0_7,plain,
    ! [X4] :
      ( ( big_city(capital_of(X4))
        | ~ country(X4) )
      & ( beautiful(capital_of(X4))
        | ~ country(X4) ) ),
    inference(distribute,[status(thm)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[country_big_city])])]) ).

cnf(c_0_8,negated_conjecture,
    ( ~ city(X1)
    | ~ beautiful(X1)
    | ~ has_crime(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_6]) ).

cnf(c_0_9,plain,
    ( beautiful(capital_of(X1))
    | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

fof(c_0_10,plain,
    ! [X3] :
      ( ~ big_city(X3)
      | has_crime(X3) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[crime_axiom])]) ).

fof(c_0_11,plain,
    ! [X5] :
      ( ~ big_city(X5)
      | city(X5) ),
    inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[big_city_city])]) ).

cnf(c_0_12,negated_conjecture,
    ( ~ has_crime(capital_of(X1))
    | ~ city(capital_of(X1))
    | ~ country(X1) ),
    inference(spm,[status(thm)],[c_0_8,c_0_9]) ).

cnf(c_0_13,plain,
    ( has_crime(X1)
    | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_10]) ).

cnf(c_0_14,plain,
    ( city(X1)
    | ~ big_city(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_11]) ).

cnf(c_0_15,plain,
    ( big_city(capital_of(X1))
    | ~ country(X1) ),
    inference(split_conjunct,[status(thm)],[c_0_7]) ).

cnf(c_0_16,negated_conjecture,
    ( ~ big_city(capital_of(X1))
    | ~ country(X1) ),
    inference(csr,[status(thm)],[inference(spm,[status(thm)],[c_0_12,c_0_13]),c_0_14]) ).

cnf(c_0_17,plain,
    country(usa),
    inference(split_conjunct,[status(thm)],[country_usa]) ).

cnf(c_0_18,plain,
    ~ country(X1),
    inference(csr,[status(thm)],[c_0_15,c_0_16]) ).

cnf(c_0_19,plain,
    $false,
    inference(sr,[status(thm)],[c_0_17,c_0_18]),
    [proof] ).

%------------------------------------------------------------------------------
