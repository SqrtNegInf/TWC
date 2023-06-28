#!/usr/bin/env perl
use v5.36;

my $NR_OF_LETTERS = 26;
my $ORD_A         = ord ('A');

use Getopt::Long;

#GetOptions 's=i'  =>  \my $shift;
#die "-s SHIFT option required" unless defined $shift;

my $shift = 13;
$shift %= $NR_OF_LETTERS;

while (<DATA>) {
    chomp;
    s {([A-Z])}
      {   my $ch = ord ($1) - $shift;
          $ch += $NR_OF_LETTERS if $ch < $ORD_A;
          chr $ch
      }eg;
    say;
}

__END__
PERL ROCKS
