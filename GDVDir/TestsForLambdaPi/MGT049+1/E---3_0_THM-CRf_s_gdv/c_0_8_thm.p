fof(c_0_5,axiom,
    ~ ! [X1,X4,X5] :
        ( ( organization(X1)
          & greater(age(X1,X5),age(X1,X4)) )
       => position(X1,X5) = position(X1,X4) ),
    inference(assume_negation,[status(cth)],[lemma_6]),
    [verified(cth)] ).
fof(c_0_8,conjecture,
    ( organization(esk1_0)
    & greater(age(esk1_0,esk3_0),age(esk1_0,esk2_0))
    & position(esk1_0,esk3_0) != position(esk1_0,esk2_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]) ).
