fof(c_0_18,axiom,
    ! [X2,X1] :
      ( apart_point_and_line(X1,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X2,line_connecting(esk1_0,esk2_0))
      | apart_point_and_line(X1,esk3_0)
      | apart_point_and_line(X2,esk3_0)
      | ~ distinct_points(X1,X2) ),
    inference(spm,[status(thm)],[c_0_13,c_0_14]),
    [verified(thm)] ).
fof(c_0_19,axiom,
    distinct_points(esk2_0,esk1_0),
    inference(spm,[status(thm)],[c_0_15,c_0_16]),
    [verified(thm)] ).
fof(c_0_20,axiom,
    ~ apart_point_and_line(esk2_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_21,axiom,
    ~ apart_point_and_line(esk1_0,esk3_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_23,conjecture,
    ( apart_point_and_line(esk1_0,line_connecting(esk1_0,esk2_0))
    | apart_point_and_line(esk2_0,line_connecting(esk1_0,esk2_0)) ),
    inference(sr,[status(thm)],[inference(sr,[status(thm)],[inference(spm,[status(thm)],[c_0_18,c_0_19]),c_0_20]),c_0_21]) ).
