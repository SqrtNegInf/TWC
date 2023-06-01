#!/usr/bin/env perl
use v5.36;

my $N = 100;

my $sum = 0;
for (my $x = 1; $x <= $N - 1; $x++) {
    for (my $y = $x + 1; $y <= $N; $y++) {
        $sum += gcd($x, $y);
    }
}

say $sum;

sub gcd {
    my ($x, $y) = @_;

    if ($x < $y) {
        ($x, $y) = ($y, $x);
    }

    if ($y == 0) {
        return $x;
    }

    return gcd($y, $x % $y);
}

