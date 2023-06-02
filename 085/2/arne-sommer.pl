#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'factor';
use List::MoreUtils 'duplicates';

my $verbose = 0;

my $N = 125;

my @factors  = factor($N);
my @repeated = duplicates(@factors);

#if ($verbose) {
  say ": Factors: ",  join(", ", @factors);
  say ": Repeated: ", join(", ", @repeated);
#}

say @repeated ? 1 : 0;
