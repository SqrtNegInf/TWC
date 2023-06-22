#!/usr/bin/env perl
use v5.36;

sub is_prime {
    return ( 7 x shift ) !~ /^(77+)\1+$/;
}

# now we start generating primes from number 2, multiplying all of found
# so far to get next primorial number, add 1 to get the corresponding
# euclid number, check for primality, and loop until we get a non prime one

my $prime  = 2;
my $euclid = 3;
my @primes = ($prime);

while ( is_prime $euclid) {
    while ( !is_prime ++$prime ) { };    # find next prime
    push @primes, $prime;                # add to primes so far
    $euclid = 1;
    $euclid *= $_ for @primes;           # this will be the primorial number
    $euclid++;    # and this is the new euclid number we found
}

say "First not prime Euclid is $euclid";
