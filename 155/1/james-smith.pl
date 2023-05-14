#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(next_prime);

my %res;

for( my $p = my $pp = 2;
     $pp < 1<<63;
     $pp *= $p = next_prime($p)
) {
  $res{ next_prime($pp+2) - $pp } = 1;
}

say for sort { $a <=> $b } keys %res;
