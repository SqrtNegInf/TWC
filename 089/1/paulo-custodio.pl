#!/usr/bin/env perl
use v5.36;

sub gcd {
    my($a, $b) = @_;
    if ($a == 0) {
        return $b;
    }
    else {
        return gcd($b % $a, $a);
    }
}

sub sum_gcd {
    my($n) = @_;
    my $sum = 0;
    for my $a (1 .. $n-1) {
        for my $b ($a+1 .. $n) {
            $sum += gcd($a, $b);
        }
    }
    return $sum;
}

my $n = 100;
print sum_gcd($n), "\n";
