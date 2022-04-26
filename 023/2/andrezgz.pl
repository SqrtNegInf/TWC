#!/usr/bin/env perl

use strict;
use warnings;

my $number = 228;

my @prime_decomp;

foreach my $prime (prime_factors($number)){
    do {
        $number /= $prime;
        push @prime_decomp, $prime;
    } until ($number % $prime != 0);
}

print join ',', @prime_decomp;

sub prime_factors {
    my $n = shift;
    return if $n <= 1;
    my @r = grep {$n % $_ == 0 && is_prime($_)} (2 .. $n/2); #get prime divisors
    return @r ? @r : ($n); # number is prime if no prime divisors were found
}

sub is_prime {
    my $n = shift;
    return if $n <= 1;
    #every composite number has a prime factor less than or equal to its square root.
    return 1 == grep {$n % $_ == 0} (1 .. sqrt $n);
}
