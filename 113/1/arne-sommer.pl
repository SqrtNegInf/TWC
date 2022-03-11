#!/usr/bin/env perl

use strict;
use feature 'say';

use Algorithm::Combinatorics 'combinations';
use List::Util 'sum';
use Getopt::Long;

my $verbose = 0;
GetOptions("verbose"  => \$verbose);

my $N = 24;
my $D = 7;

my @candidates = grep { /$D/ } (1 .. $N);

say ": Candidates " . join(', ', @candidates) if $verbose;

for my $size (1 .. @candidates)
{
  for my $comb (combinations(\@candidates, $size))
  {
    say ": Considering " . join(' + ', @$comb) if $verbose;

    if (sum(@$comb) == $N)
    {
      say 1;
      exit;
    }
  }
}

say 0;
