fof(c_0_11,axiom,
    position(esk1_0,esk3_0) != position(esk1_0,esk2_0),
    inference(split_conjunct,[status(thm)],[c_0_8]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    ! [X2,X1] : position(esk1_0,X1) = position(esk1_0,X2),
    inference(spm,[status(thm)],[c_0_9,c_0_10]),
    [verified(thm)] ).
fof(c_0_12,axiom,
    ! [X2,X1] : position(esk1_0,X1) = position(esk1_0,X2),
    inference(spm,[status(thm)],[c_0_9,c_0_10]),
    [verified(thm)] ).
fof(c_0_13,conjecture,
    $false,
    inference(cn,[status(thm)],[inference(rw,[status(thm)],[inference(rw,[status(thm)],[c_0_11,c_0_12]),c_0_12])]),
    [proof] ).
