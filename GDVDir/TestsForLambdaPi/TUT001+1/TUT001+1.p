fof(country_usa,axiom, country(usa) ).
fof(country_big_city,axiom,
    ! [C] : ( country(C) => ( big_city(capital_of(C)) & beautiful(capital_of(C)) ) ) ).
fof(usa_capital_axiom,axiom, 
    city(capital_of(usa)) ).
fof(crime_axiom,axiom,
    ! [C] : ( big_city(C) => has_crime(C) ) ).
fof(big_city_city,axiom,
    ! [C] : ( big_city(C) => city(C) ) ).

fof(some_beautiful_crime,conjecture,
    ? [C] : ( city(C) & beautiful(C) & has_crime(C) ) ).
