#!/usr/bin/env perl
use v5.36;

sub min {
    return ( sort { $a <=> $b } @_)[0];
}

my @ints = (3, 4, 2);
my $ops = 0;

while (scalar @ints) {
    if ($ints[0] == min(@ints)) {
        shift @ints;
    } else {
        push @ints, shift @ints;
    }
    $ops++;
}

say $ops;
