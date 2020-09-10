#!/usr/bin/perl -w

if (scalar(@ARGV) < 1) {
  die "Usage: rate.pl axioms_file < formula_stream\n";
}

$AGInTDir = "/home/graph/tptp/Systems/AGInT---4.0/agint";
$axfile = $ARGV[0];

use POSIX;
use File::Temp qw/ :mktemp  /;

($fh0, $tfile0) = mkstemp( "/tmp/tmpfileXXXXX" );
($fh1, $tfile1) = mkstemp( "/tmp/tmpfileXXXXX" );
($fh2, $tfile2) = mkstemp( "/tmp/tmpfileXXXXX" );
($fh3, $tfile3) = mkstemp( "/tmp/tmpfileXXXXX" );
($fh4, $tfile4) = mkstemp( "/tmp/tmpfileXXXXX" );
close($fh0);
close($fh1);
close($fh2);
close($fh3);
close($fh4);
END {
    unlink $tfile0, $tfile1, $tfile2, $tfile3, $tfile4;
}

system("$AGInTDir/PostOrderTree -- > $tfile0");

system("$AGInTDir/ftest $axfile 15 $tfile1 $tfile2 < $tfile0 > $tfile3");

system("$AGInTDir/stest $tfile3 $tfile1 $tfile2 > $tfile4");

system("$AGInTDir/SortByUsefulInfoField interesting -f $tfile4");


