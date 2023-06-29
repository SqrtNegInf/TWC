#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw /factor is_prime/;

for my $i (1..50) {
    my @factors = factor($i);
    say $i if (is_prime(scalar(@factors)));
}
