fof(c_0_15,axiom,
    ! [X1] : ~ distinct_points(X1,X1),
    inference(split_conjunct,[status(thm)],[c_0_10]),
    [verified(thm)] ).
fof(c_0_16,axiom,
    ! [X1] :
      ( distinct_points(esk1_0,X1)
      | distinct_points(esk2_0,X1) ),
    inference(spm,[status(thm)],[c_0_11,c_0_12]),
    [verified(thm)] ).
fof(c_0_19,conjecture,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]) ).
