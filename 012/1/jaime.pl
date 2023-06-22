#!/usr/bin/env perl
use v5.36;

sub is_prime { # is a given positive integer an odd prime?
    my ($n) = @_;
    for (my $i = 3; $i < $n; $i += 2) { # determine if odd number is prime.
	return 0 unless $n % $i;
    }
    return 1; # odd number is prime.
}

my $p = 2; # start with second primorial
for (my $i = 3; ;$i += 2) {
    next unless is_prime $i;
    $p *= $i; # next primorial
    last unless is_prime 1+$p;
}

print 1+$p;
