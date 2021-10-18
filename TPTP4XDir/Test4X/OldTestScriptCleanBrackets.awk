#!/bin/awk -f
BEGIN {
#---Count nesting of surplus ()
    SurplusBracketLevel = 0;
}
{
    if ($1 == "LPAREN") {
        SurplusBracketLevel++;
    } else if ($1 == "RPAREN") {
        SurplusBracketLevel--;
    } else if (SurplusBracketLevel > 0) {
        if ( \
$1 == "<fof_logic_formula>" || \
$1 == "<fof_unitary_formula>" || \
$1 == "<tff_logic_formula>" || \
$1 == "<tff_unitary_formula>" ) {
        } else {
            print;
        }
    } else {
        print;
    }
}
