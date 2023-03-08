% SZS output start Interpretation
%------------------------------------------------------------------------------
fof(equality_lost,interpretation,
    ( ! [X] : ( X = "a" | X = "f" | X = "john" | X = "gotA") 
    & ( a = "a"
      & f = "f"
      & john = "john"
      & grade("a") = "a"
      & grade("f") = "a"
      & grade("john") = "f"
      & grade("gotA") = "a" ) 
    & ( ~ human("a")
      & ~ human("f")
      & human("john")
      & human("gotA")
      & ~ created_equal("a","a")
      & ~ created_equal("a","f")
      & ~ created_equal("a","john")
      & ~ created_equal("a","gotA")
      & ~ created_equal("f","a")
      & ~ created_equal("f","f")
      & ~ created_equal("f","john")
      & ~ created_equal("f","gotA")
      & ~ created_equal("john","a")
      & ~ created_equal("john","f")
      & created_equal("john","john")
      & created_equal("john","gotA")
      & ~ created_equal("gotA","a")
      & ~ created_equal("gotA","f")
      & created_equal("gotA","john")
      & created_equal("gotA","gotA") ) ) ).

%------------------------------------------------------------------------------
% SZS output end Interpretation
% SZS output start ListOfFormulae
%------------------------------------------------------------------------------
%----All (hu)men are created equal. John is a human. John got an F grade.
%----There is someone (a human) who got an A grade. An A grade is not 
%----equal to an F grade. Grades are not human. Therefore, it is not the 
%----case being created equal is the same as really being equal.

fof(all_created_equal,axiom,
    ! [H1,H2] :
      ( ( human(H1)
        & human(H2) )
     => created_equal(H1,H2) ) ).

fof(john,axiom,
    human(john) ).

fof(john_failed,axiom,
    grade(john) = f ).

fof(someone_got_an_a,axiom,
    ? [H] :
      ( human(H)
      & grade(H) = a ) ).

fof(distinct_grades,axiom,
    a != f ).

fof(grades_not_human,axiom,
    ! [G] : ~ human(grade(G)) ).

fof(equality_lost,conjecture,
    ! [H1,H2] :
      ( ( human(H1)
        & human(H2)
        & created_equal(H1,H2) )
    <=> H1 = H2 ) ).

%------------------------------------------------------------------------------
% SZS output end ListOfFormulae
