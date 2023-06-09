#!/usr/bin/env perl
use v5.36;

foreach my $test (qw/1000 A KVZ 12 1337 16384 PERL/){
   printf "*  %8s converted is  %8s and again is %8s \n",
         $test, xlcolumn($test),  xlcolumn(xlcolumn($test));
}

sub xlcolumn{
  my $in=shift;
  $in=~s/\*//;                    # (remove error character)
  if ($in=~/^\d+$/){              # if a number was entered
    my $error= $in>16384?"*":"";
    my $ret="";                   # start with an empty string
    while ($in){                  # until no residue
      # get character for residue the modulo 26
      $ret= (("Z","A".."Y"))[$in % 26] . $ret; 
      $in=($in-($in % 26))/26;    # remove the modulo and divide by 26
    }
    return $ret.$error;
  }
  elsif ($in=~/^[A-Z]+$/){        # if an alphabetic character entered
    my $ret=0;                    # start with zero
    foreach (split //,$in){       # each character taken
       $ret*=26;                  # multiply by 26 
       # and add the number equivalent of next character
       $ret+=index("ZABCDEFGHIJKLMNOPQRSTUVWXY",$_) 
    }
    return $ret.($ret>16384?"*":""); 
  }
  return "failed";
}
