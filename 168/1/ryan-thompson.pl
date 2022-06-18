#!/usr/bin/env perl

use 5.010;
use warnings;
use strict;
use Math::Prime::Util qw< is_prime >;
no warnings 'uninitialized';

say for perrin(13);

# Calculate the first $n Perrin primes
sub perrin {
    my ($n2, $n1, $n0) = (3, 0, 2); # Sliding window
    my @r;

    while (@r < $_[0]) {
        push @r, $n0 if $n0 > $r[-1] and is_prime($n0);
        ($n2, $n1, $n0) = ($n1, $n0, $n2 + $n1);
    }

    @r;
}
