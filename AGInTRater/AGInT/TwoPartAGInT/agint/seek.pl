#!/usr/bin/perl -w

################################################
# Author: Yury Puzis			       #
# Started: June 2003			       #
# Modified: 09/20/06			       #
################################################


use POSIX;
use File::Temp qw/ :mktemp  /;

$AGInTDir = "/home/graph/tptp/Systems/AGInT---4.0/agint";

require("$AGInTDir/../common/tstp_tools2.pl");

my ($sys) = "/home/graph/tptp/SystemExecution/SystemOnTPTP -q1";
my ($TpAddr) = "/home/graph/tptp/TPTP/TPTP2X/tptp2X";

$GlobalInterrupted = 0;
my %Options = ("-p" => "unknown", "-a" => "E---0.99", "-i" => 10000,
	       "-t" => 3600, "-l" => 15, "-q" => 0 );
my $ProverCall = "/home/graph/tptp/Systems/$Options{'-a'}s/eprover -l4 --sos-uses-input-types --print-statistics -x'(1*Defaultweight(SimulateSOS))' -WNoSelection --memory-limit=192 --tstp-out --tstp-in " ;

while (scalar(@ARGV) > 1) { 
    $Key = shift(@ARGV);
    $Options{$Key} = shift(@ARGV); 
}
  
if ($Options{'-p'} eq "unknown") {
  die "ERROR: use -p to specify axiom file\n";
}

if (!-e"$Options{'-p'}") {
  #generating file; adding equality to the file, if nessesary
  $dir = substr($Options{'-p'},0,3);
  if (-e"$dir/$Options{'-p'}+noeq.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+noeq.tptp"; 
  }
  if (-e"$dir/$Options{'-p'}+noeq+cnf_otter.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+noeq+cnf_otter.tptp"; 
  }
  if (-e"$dir/$Options{'-p'}+eq_rstfp.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+eq_rstfp.tptp"; 
  }
  if (-e"$dir/$Options{'-p'}+eq_rstfp+cnf_otter.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+eq_rstfp+cnf_otter.tptp"; 
  }
  if (!-e$Options{'-p'}) {
    print "% Error: file $Options{'-p'} cannot be located\n";
   # $command = "-d. -q0 -f tptp -t add_equality -t add_equality+cnf:otter";
   # system ("$TpAddr $command ~tptp/TPTP/Axioms/$Options{'-p'}");
   # if ($Options{'-q'} > 0) {
   #   print ("$TpAddr $command ~tptp/TPTP/Problems/$dir/$Options{'-p'}\n");
   # }
   # system ("$TpAddr $command ~tptp/TPTP/Problems/$dir/$Options{'-p'}");
  }

 if (-e"$dir/$Options{'-p'}+noeq.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+noeq.tptp"; 
  }
  if (-e"$dir/$Options{'-p'}+eq_rstfp.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+eq_rstfp.tptp"; 
  }
  if (-e"$dir/$Options{'-p'}+cnf_otter.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+cnf_otter.tptp"; 
  }
  if (-e"$dir/$Options{'-p'}+eq_rstfp+cnf_otter.tptp") { 
    $Options{'-p'} = "$dir/$Options{'-p'}+eq_rstfp+cnf_otter.tptp"; 
  } 
}

($fh1, $tfileCool) = mkstemp( "/tmp/tmpfileXXXXX" );
close($fh1);
 
@originalf = ();
@newf = ();
my (@formulas) = ReadTstp($Options{'-p'});
foreach $lemma(@formulas){
    if (!($lemma =~ /\s*conjecture\s*/) && 
        !($lemma =~ /\s*negated_conjecture\s*/)) {
      push(@originalf, $lemma);
    }
}

($fh1, $tfileAX) = mkstemp( "/tmp/tmpfileXXXXX" );
close($fh1);

WriteTstp($tfileAX, @originalf);
@formulas = @originalf;

($fh1, $tfileST) = mkstemp( "/tmp/tmpfileXXXXX" );
close($fh1);

for (my $loops = 0; $loops < $Options{'-l'}; $loops++) {

  #replace all type in all formulae with "conjecture"
  foreach $lemma(@formulas){
      $lemma =~ s/\s*conjecture-derived\s*/conjecture/g; 
      $lemma =~ s/\s*derived-unknown\s*/conjecture/g;
      $lemma =~ s/\s*hypothesis-derived\s*/conjecture/g; 
      $lemma =~ s/\s*derived\s*/conjecture/g;
      $lemma =~ s/\s*axiom\s*/conjecture/g;
      $lemma =~ s/\s*hypothesis\s*/conjecture/g; 
      $lemma =~ s/\s*lemma\s*/conjecture/g; 
      push(@newf, $lemma);
  }

  ($fh1, $tfile0) = mkstemp( "/tmp/tmpfileXXXXX" );
  close($fh1);
  WriteTstp($tfile0, @newf);

  #create new temp files for runtime and static filter to talk
  ($fh1, $tfile1) = mkstemp( "/tmp/tmpfileXXXXX" );
  ($fh2, $tfile2) = mkstemp( "/tmp/tmpfileXXXXX" );
  close($fh1);
  close($fh2);

  #starting the search --- RUNTIME FILTER
  if ($Options{'-q'} > 0) {
    print "Generating interesting theorems (From a pool of $Options{'-i'} theorems)\n";
  }
  $iteration = 0;
  $PID = open(proverHandle, "$ProverCall $tfile0|") || die "Cannot open $!\n";
  open (filterHandle, "|$AGInTDir/ftest $tfileAX 5 $tfile1 $tfile2 > $tfileCool")
	|| die "Cannot open $!\n";
  while ($Line = <proverHandle>) {
    if (!grep(/#/, $Line) && $iteration < $Options{'-i'}) {
      $iteration++;
      print filterHandle $Line;
    }
    if ($iteration == $Options{'-i'}) {
      kill($PID, SIGINT);
    }
  }
  close (filterHandle);
  close (proverHandle);
  if ($Options{'-q'} > 0) {
    print "Extracted $iteration theorems...\n";
  }

  # --- STATIC FILTER
  if ($Options{'-q'} > 0) {
    print "\nStatic ranker...\n";
  }
  system("$AGInTDir/stest $tfileCool $tfile1 $tfile2 >> $tfileST"); #note-appending

  # --- POST-PROCESSOR
  ($fh1, $tfileSOS) = mkstemp( "/tmp/tmpfileXXXXX" );
  ($fh2, $tfileTBU) = mkstemp( "/tmp/tmpfileXXXXX" );
  close($fh1);
  close($fh2);
  if ($Options{'-q'} > 0) {
    print "Post processor (this may take a few minutes)...\n";
  }
  #first file - axioms. second - input and output
  system("./postp.pl $tfile0 $tfileST $loops $Options{'-p'} $tfileSOS $tfileTBU");

  #creating new TBU
  @newf = @originalf;
  @moref = ReadTstp($tfileTBU);
  foreach $lemma(@moref){
      $lemma =~ s/\s*conjecture-derived\s*/axiom/g; 
      $lemma =~ s/\s*conjecture\s*/axiom/g; 
      $lemma =~ s/\s*derived-unknown\s*/axiom/g;
      $lemma =~ s/\s*hypothesis-derived\s*/axiom/g; 
      $lemma =~ s/\s*derived\s*/axiom/g;
      $lemma =~ s/\s*hypothesis\s*/axiom/g; 
      $lemma =~ s/\s*lemma\s*/axiom/g; 
      push(@newf, $lemma);
  }
  WriteTstp($tfileAX, @newf);

  #creating new CBU
  @formulas = ReadTstp($tfileSOS);
  if ($Options{'-q'} > 0) {
    print "sos size: ".scalar(@formulas)."\n";
    print "tbu increase: ".scalar(@moref)."\n";
    print "tbu size: ".scalar(@newf)."\n";
  }

  #the SOS has converged, exit
  if (scalar(@formulas) == 0) {
    if ($Options{'-q'} > 0) {
      print "Termination - convergence\n";
    }
    last;
  }
}

# ---> tfileST file life cicle
#   delete and start looping
#   append to the file interesting stuff
#   read it in postp, subsume some f, rewrite it from scratch adding "olde"
#   to every formula without one, and putting those into .sos as well

@formulas = sort ByInterestingness (ReadTstp($tfileST));
foreach (@formulas) {
   print "$_\n"; 
}

#interrupt handler
sub QUITHandler{
    $GlobalInterrupted = 1;
}

