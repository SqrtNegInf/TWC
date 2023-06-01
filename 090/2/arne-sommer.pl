#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $verbose = 0;

GetOptions("verbose"  => \$verbose);

my $A = shift(@ARGV) // 238;
my $B = shift(@ARGV) // 13;

die '$A: Please specify an integer > 0' unless $A =~ /^[1-9]\d*$/;
die '$B: Please specify an integer > 0' unless $B =~ /^[1-9]\d*$/;

my $result = 0;

while (1)
{
  $result += $B if $A % 2;
  
  say ":: $A & $B" if $verbose;

  last if $A == 1;
  
  $A = int($A / 2);
  $B = $B * 2;
}

say $result;
