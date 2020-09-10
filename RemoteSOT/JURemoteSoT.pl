#! /usr/bin/perl -w

use strict "vars";
use Getopt::Std;
use HTTP::Request::Common;
use LWP;
#------------------------------------------------------------------------------
my $SystemOnTPTPFormReplyURL = "http://www.tptp.org/cgi-bin/SystemOnTPTPFormReply";

my %URLParameters = (
#    "NoHTML" => 1,
   "QuietFlag" => "-q01",
   "SubmitButton" => "ProcessProblem",
   "ProblemSource" => "UPLOAD",
   "SystemOnTPTP" => "-P",
   "System___tptp4X---0.0" => "tptp4X---0.0",
#    "AutoModeTimeLimit" => 100,
#    "AutoMode" => "-cE",
#    "AutoModeSystemsLimit" => 3,
#    "X2TPTP" => "",
   );
#------------------------------------------------------------------------------
   my $URL;
   my %Options;
   my @Content;
   my $Key;
   my $MyAgent;
   my $Request;
   my $Response;
#----Get single file name
   if (exists($URLParameters{"ProblemSource"}) &&
$URLParameters{"ProblemSource"} eq "UPLOAD") {
       if (scalar(@ARGV) >= 1 && $ARGV[0] ne "--") {
           $URLParameters{"UPLOADProblem"} = [shift(@ARGV)];
       } else {
#----Read into temporary file from stdin
die("Need to complete reading from stdin");
       }
   }

   $MyAgent = LWP::UserAgent->new;
   $Request = POST($SystemOnTPTPFormReplyURL,
Content_Type => 'form-data',Content => \%URLParameters);
#DEBUG printf("%s\n",$Request->as_string());
   $Response = $MyAgent->request($Request);
   printf("%s\n",$Response->content);

#------------------------------------------------------------------------------

