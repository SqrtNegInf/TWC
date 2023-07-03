#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'primes';

for my $n (<10 1 20>) {
    say scalar @{primes($n)}
}
