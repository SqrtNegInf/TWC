#!/usr/bin/env perl
# Perl weekly challenge 158
# Task 1: First series cuban primes
#
# See https://wlmb.github.io/2022/03/28/PWC158/#task-2-first-series-cuban-primes
use v5.12;
use warnings;
use Math::Prime::Util qw(is_prime);
my $N=shift//1000;
die "N should be positive" unless $N>0;
my $bound=(-3+sqrt(3)*sqrt(4*$N-1))/6; # Solve (x+1)^3-x^3=N
say "The cuban primes up to $N are ",
    join ", ", grep {is_prime $_} map {1+3*$_*($_+1)} (1..$bound);
