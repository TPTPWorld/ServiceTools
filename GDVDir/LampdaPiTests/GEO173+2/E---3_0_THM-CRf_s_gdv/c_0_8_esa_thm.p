fof(c_0_8,axiom,
    ( distinct_points(esk1_0,esk2_0)
    & convergent_lines(esk3_0,esk4_0)
    & distinct_lines(esk3_0,line_connecting(esk1_0,esk2_0))
    & ~ apart_point_and_line(esk1_0,esk3_0)
    & ~ apart_point_and_line(esk2_0,esk3_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).
fof(c_0_5,conjecture,
    ~ ! [X1,X2,X4,X5] :
        ( ( distinct_points(X1,X2)
          & convergent_lines(X4,X5)
          & distinct_lines(X4,line_connecting(X1,X2)) )
       => ( apart_point_and_line(X1,X4)
          | apart_point_and_line(X2,X4) ) ),
    inference(assume_negation,[status(cth)],[con]),
    [verified(cth)] ).
