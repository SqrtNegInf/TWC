#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

say count_primes(shift);
sub count_primes ($n) { return scalar grep { is_prime($_) } 2 .. $n }
sub is_prime ($n) { for (2 .. sqrt $n) { return unless $n % $_ } return 1 }
