#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
use ntheory qw<is_prime sumdigits         primes>;
my @r = grep { is_prime sumdigits $_ } @{ primes(100) };

say join ', ', @r;
