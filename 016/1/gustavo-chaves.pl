#!/usr/bin/env perl
use v5.36;

use bignum;

my $pie = 100/100;

my $largest_slice = 0;

my $guest = 0;

for my $i (1 .. 100) {
    my $slice = $pie * $i / 100;
    $pie -= $slice;
    if ($slice > $largest_slice) {
        $largest_slice = $slice;
        $guest = $i;
    }
    # say "The ${i}º guest got $slice of the total.";
    last if $pie < $largest_slice;
}

say "The ${guest}º guest got the larget pie, which is $largest_slice of the total.";
