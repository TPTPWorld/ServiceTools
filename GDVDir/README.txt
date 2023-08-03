Command to create LambdaPi files and just create the obligation .p files ...
GDV -g -K TestsForLambdaPi/GEO173+2 -l -i TestsForLambdaPi/GEO173+2/GEO173+2.p TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s

Command to also verify using ZenonModulo, which requires a full 
SystemOnTPTP installation
GDV -f -t 60 -p ZenonModulo---0.4.2 -K TestsForLambdaPi/GEO173+2 -l -i TestsForLambdaPi/GEO173+2/GEO173+2.p TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s

GDV -f -t 60 -p ZenonModulo---0.4.2 -K TestsForLambdaPi/TUT001+1 -l -i TestsForLambdaPi/TUT001+1/TUT001+1.p TestsForLambdaPi/TUT001+1/E---3_0_THM-CRf_s

Command to understand the flags
GDV -h

Note that the -K flag requires a path starting from your LambdaPi directory somwhere above the 
example directory, e.g., here the example directory is GEO173+2, and I start from TestsForLambdaPi.

To get opam going ...
    eval `opam env`

To test a proof
    lambdapi check Proof.lp



#!/bin/sh

for f in `ls *.p`
do
    case $f in
        c_0_*_thm.p) opt='';;
        *) opt='-check-axiom';;
    esac
    echo zenon_modulo $opt $f
    ~/src/zenon_modulo/zenon_modulo -q -sig TUT001+1.E---3_0_THM-CRf_s_gdv.Signature -itptp -olpterm -neg-conj c_0_5 $opt $f > ${f%.p}.lp
done

