#!/usr/bin/env perl
use v5.36;

sub is_prime {
    return ( 7 x shift ) !~ /^(77+)\1+$/;
}

# note that we should ensure that argument is greater than 1 before
# calling this sub, because it will uncorrectly return 1 for both 0 and 1

my $q = shift // 10; # this is the amount of sexy primes we are printing

my $candidate = 3; # first number that makes sense to check

while ($q) { # i.e. while $q is > 0
    if (is_prime($candidate) && is_prime($candidate+6)) {
        printf "Found sexy primes: %u and %u\n", $candidate, $candidate+6;
        $q--;   # one less to go
    }
    $candidate+= 2; # skip even candidates as they dont make sense
}
