/^[^0-9]/d
/^ *$/d
s/\([0-9]*\) /fof(\1,ROLE,/
/\[goal]/s/ROLE/conjecture/
/\[assumption]/s/ROLE/axiom/
/deny([0-9]*)/s/ROLE/negated_conjecture/
s/ROLE/plain/
s/ #[^\.]*\././
s/\. *\[goal]\. */)./
s/\. *\[assumption]\. */)./
/xx(/s/\. *\[\([a-z]*\)/. [\1_xx/
s/,xx([^)]*)//
s/\. *\[\([a-z_]*\)\([^]]*\)]\. */,inference(\1,[status(thm)],PARENTS==\1\2==))./
/deny([0-9]*)/s/status(thm)/status(cth)/
/\$F/s/#.*\[/[/
s/\$F/$false/
s/PARENTS==resolve(\([0-9]*\),.*,\([0-9]*\),.*)==/[\1,\2]/
/PARENTS/s/,*flip([^)]*)//g
s/PARENTS==copy(\([0-9]*\))==/[\1]/
s/PARENTS==deny(\([0-9]*\))==/[\1]/
s/PARENTS==para(\([0-9]*\)([^)]*),\([0-9]*\)([^)]*))==/[\1,\2]/
s/PARENTS==para_xx(\([0-9]*\)([^)]*),\([0-9]*\)([^)]*))==/[\1,\2]/
s/PARENTS==hyper(\([0-9]*\),[^0-9]*,\([0-9]*\),[^0-9]*,\([0-9]*\).*)==/[\1,\2,\3]/
s/PARENTS==hyper(\([0-9]*\),[^0-9]*,\([0-9]*\).*)==/[\1,\2]/
s/PARENTS==ur(\([0-9]*\),[^0-9]*,\([0-9]*\).*)==/[\1,\2]/
s/\([,( ]\)u\([0-9]*\)\([,) ]\)/\1U\2\3/g
s/\([,( ]\)v\([0-9]*\)\([,) ]\)/\1V\2\3/g
s/\([,( ]\)w\([0-9]*\)\([,) ]\)/\1W\2\3/g
s/\([,( ]\)x\([0-9]*\)\([,) ]\)/\1X\2\3/g
s/\([,( ]\)y\([0-9]*\)\([,) ]\)/\1Y\2\3/g
s/\([,( ]\)z\([0-9]*\)\([,) ]\)/\1Z\2\3/g
s/\([,( ]\)u\([0-9]*\)$/\1U\2/g
s/\([,( ]\)v\([0-9]*\)$/\1V\2/g
s/\([,( ]\)w\([0-9]*\)$/\1W\2/g
s/\([,( ]\)x\([0-9]*\)$/\1X\2/g
s/\([,( ]\)y\([0-9]*\)$/\1Y\2/g
s/\([,( ]\)z\([0-9]*\)$/\1Z\2/g
