fof(c_0_11,axiom,
    ! [X2,X3,X1] :
      ( distinct_points(X1,X3)
      | distinct_points(X2,X3)
      | ~ distinct_points(X1,X2) ),
    inference(split_conjunct,[status(thm)],[c_0_7]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    distinct_points(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_16,conjecture,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]) ).
