#!/usr/bin/env perl

use strict;
use feature 'say';

use Getopt::Long;
use List::Util qw(all sum);
use Algorithm::Combinatorics 'combinations';
 
my $A = 7;

for my $combination (combinations([10, 8, 12, 15, 5], 2))
{
  my $sum = @$combination[0] - @$combination[1];


  if (abs($sum) == $A)
  {
    say 1;
    exit;
  }
}

say 0;
