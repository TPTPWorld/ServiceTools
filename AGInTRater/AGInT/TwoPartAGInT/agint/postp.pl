#!/usr/bin/perl -w

# Author: Yury Puzis
# 01/19/2005

use POSIX;
use File::Temp qw/ :mktemp  /;
require("../common/tstp_tools2.pl");

my $InFile = $ARGV[1];
my $OutFile = $InFile;
my $OutFileSOS = $ARGV[4];
my $OutFileTBU = $ARGV[5];
my @formulas = sort ByInterestingness (ReadTstp($InFile));
my @axiomfile = ReadTstp($ARGV[0]);
my $loops = $ARGV[2];
my @original_axioms = ReadTstp($ARGV[3]);

for (my $i = 0; $i < scalar(@axiomfile); $i++) {
  $axiomfile[$i] = ChangeFormulaType($axiomfile[$i],"axiom");
}

#print "@axiomfile\n";

if (scalar(@formulas) > 1000) {
  splice(@formulas, 1000);
}

#print "@formulas\n";

my $removed = 0;

if (scalar(@formulas) == 0) {
  die "No formulae found!";
}

#print "Starting with: ".scalar(@formulas)." \n";

#print "@formulas \n";
#for (my $i = 0; $i < scalar(@formulas); $i++) {
# print "\n ********************** $i ********************* \n";
# print "$formulas[$i]\n";
# print "\n ********************** $i ********************* \n";
# GetField("interesting", 1, $formulas[$i])
#}

for (my $i = 0; $i < scalar(@formulas); $i++) {
  push(@use, 1);
}

for (my $i = 0; $i < scalar(@formulas); $i++) {
  my $st = 0;
  #print "$i ";
  if ($use[$i] == 0) {
    next;
  }
#  for (my $j = 0; $j < scalar(@original_axioms); $j++) {
#    if (canSubsume($original_axioms[$j], $formulas[$i])) {
#      $use[$i] = 0;
#      print "A/$j \n";
#      $removed++;
#      $st = 1;
#      last;
#    }
# }
  if ($st == 1) {
    next;
  }
  for (my $j = $i-1; $j >= 0; $j--) {
    if ($use[$j] == 0) {
      next;
    }
    if (canSubsume($formulas[$j], $formulas[$i])) {
      $use[$i] = 0;
      #print "F/$j \n";
      $removed++;
      last;
    } elsif (canSubsume($formulas[$i], $formulas[$j])) {
      $use[$j] = 0;
      #print "B/$j ";
      $removed++;
    } elsif ($loops > 0 && leafsSubset($formulas[$i], $formulas[$j]) && 
	  canProve($formulas[$i],$formulas[$j],@axiomfile))  {
      $use[$i] = 0;
      #print "P/$j \n";
      $removed++;
      last;
    }
  }
}
#print "*\n";

#print "removed: $removed\n";

open ($all_interesting, ">$OutFile") || die "Error: $!\n";
open ($set_of_support, ">$OutFileSOS") || die "Error: $!\n";
open ($to_be_used, ">$OutFileTBU") || die "Error: $!\n";

my @newFormulas = ();

for (my $i = 0; $i < scalar(@formulas); $i++) {
  if ($use[$i] == 1) {
    if (!($formulas[$i] =~ /iteration/)) {
      $formulas[$i] =~ s/]\)\.$/,iteration\($loops\)]\)\./;
    }
    push(@newFormulas, $formulas[$i]);
  }
}

@newFormulas = sort ByInterestingnessAndIteration (@newFormulas);

for (my $i = 0; $i < scalar(@newFormulas); $i++) {
  #add the axiom to the main bag of interesting stuff
  print $all_interesting $newFormulas[$i];
  if ($i < 100) {
    if (GetField("iteration", 1, $newFormulas[$i]) == $loops) {
      #if this is new formula, put it in Sos
      print $set_of_support $newFormulas[$i];
    } else {
      #else, add the formula to the "others" (with the axioms, tbu list)
      print $to_be_used $newFormulas[$i];
    }
  }
}

close ($all_interesting);
close ($set_of_support);
close ($to_be_used);

# Fj subsumes Fi
sub canSubsume {
  my ($Fj, $Fi) = @_;
  #print "*****\nCan 1st subsume second?\n$Fj\n$Fi\n*****\n";
  $command = "CompareClauses << EOF\n$Fj$Fi"."EOF\n";
  open($OutputFile, "$command|") ||
    die("ERROR: Cannot run ComapreClauses program: $!\n");
  if (defined($OutputLine = <$OutputFile>)) {
    chomp($OutputLine);
    close($OutputFile);
    if(($OutputLine =~ /\s*subsumes\s*/) || 
       ($OutputLine =~ /\s*same\s*/)) {
      return 1;
    }
  }
  close($OutputFile);
  return 0;
}

#Fj is a subset of Fi
sub leafsSubset {
  my ($Fj, $Fi) = @_;
  my (@FiAn) = getAncestors($Fi);
  my (@FjAn) = getAncestors($Fj);
  foreach $an (@FjAn) {
    if (!present($an, @FiAn)) {
      return 0;
    }
  }
  return 1;
}

sub getAncestors {
  my ($F) = @_;
  my $A = GetUsefullInfo($F);
  my (@B) = split("[\(\)]", $A);
  for ($i = 0; $i < scalar(@B); $i++) {
    if ($B[$i] =~ m/ancestors/) {
      @Ancestors = split("\,", $B[$i+1]);
    }
  }
  return @Ancestors;    
}

sub present {
  ($search, @A) = @_;
  foreach $el (@A) {
    if ($el eq $search) {
      return 1;
    }
  }
  return 0;
}

sub ChangeFormulaType {
  my ($Formula, $new_type) = @_;
  $Formula =~ s/conjecture-derived/$new_type/g;
  $Formula =~ s/conjecture/$new_type/g;
  return $Formula;
}

sub canProve{    
  my ($Lemmai,$Lemmak, @axs) = @_;
  my $OutputLine;
  my $OutputFile  = "Output";
  my $UnSat = 0;

  ($fh1, $NewLemmaFile) = mkstemp( "/tmp/tmpfileXXXXX" );
  close($fh1);

  #this is the .tptp.$ID file [the one without conjecture]
  #---Add lemmas to the file
  $Lemmai = ChangeFormulaType($Lemmai, "axiom");
  $Lemmak = ChangeFormulaType($Lemmak, "conjecture");
  push(@axs, $Lemmai);
  push(@axs, $Lemmak);
  
  #print ". ";
  
  WriteTstp($NewLemmaFile, @axs);

 # print "@axs\n";
  
  #---Run prover
  $command = "~tptp/SystemExecution/SystemOnTPTP -q3 Otter---3.3-A 1";

  open($OutputFile, "$command $NewLemmaFile|") || die "error opening file!\n";
  while (defined($OutputLine = <$OutputFile>)) {
#    print $OutputLine."\n";
    if(($OutputLine =~/Unsatisfiable/) ||
       ($OutputLine =~/Theorem/) ||
       ($OutputLine =~/Refutation/)) {
      $UnSat = 1;
      last;
    }
  }
  
  #---Wrap up
  close($OutputFile);
  return($UnSat);
}
