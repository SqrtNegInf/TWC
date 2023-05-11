#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(is_prime);
my $N=shift//1000;
die "N should be positive" unless $N>0;
my $bound=(-3+sqrt(3)*sqrt(4*$N-1))/6; # Solve (x+1)^3-x^3=N
say "The cuban primes up to $N are ",
    join ", ", grep {is_prime $_} map {1+3*$_*($_+1)} (1..$bound);
