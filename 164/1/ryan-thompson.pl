#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

say for grep { $_ eq scalar reverse $_ } primes_under( pop // 1000 );

sub primes_under {
    my $limit = shift;
    my @comp; # Composite numbers (non-primes)

    for my $n (2..$limit) {
        next if $comp[$n];
        $comp[$_] = 1 for map { $n * $_ } 2..$limit/$n;
    }

    2, grep { !$comp[$_] } 3..$limit;
}
