fof(c_0_8,axiom,
    ( organization(esk1_0)
    & greater(age(esk1_0,esk3_0),age(esk1_0,esk2_0))
    & position(esk1_0,esk3_0) != position(esk1_0,esk2_0) ),
    inference(skolemize,[status(esa)],[inference(variable_rename,[status(thm)],[inference(fof_nnf,[status(thm)],[c_0_5])])]),
    [verified(esa)] ).
fof(c_0_11,conjecture,
    position(esk1_0,esk3_0) != position(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]) ).
