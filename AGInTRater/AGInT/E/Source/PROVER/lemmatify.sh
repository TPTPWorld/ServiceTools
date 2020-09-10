#!/bin/sh

echo "I'm alive"

name=`basename $1`

steps=5000
cat /dev/null > $name\.lemmas

while test -f lemmatify.sh; do
    echo $steps
    eprover --tptp-format --memory-limit=192 $* $name\.lemmas -l4 -T$steps > $name\.pcl
    echo Looking for lemmas 
    epcllemma -f -R0.0003 -Q0 --no-reference-weights -H2 $name\.pcl --tptp-out |tee -a $name\.lemmas
    # epcllemma -f -R0.0003 -Q0 $name\.pcl --tptp-out |tee $name\.lemmas
    steps=`expr $steps \* 10 / 9`
done



