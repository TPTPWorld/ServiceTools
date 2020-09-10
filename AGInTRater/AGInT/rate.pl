#!/usr/bin/perl -w

if (scalar(@ARGV) < 2) {
  die "axioms_file formula_file\n";
}

$axfile = $ARGV[0];
$formulae = $ARGV[1];

use POSIX;
use File::Temp qw/ :mktemp  /;

($fh4, $tfile4) = mkstemp( "/tmp/tmpfileXXXXX" );
close($fh4);

system("./discover $axfile 15 < $formulae > $tfile4");

print "$tfile4 \n";

system("/home/graph/tptp/ServiceTools/JJUsers/SortByUsefulInfoField interesting f $tfile4");
