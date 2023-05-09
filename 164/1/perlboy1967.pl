#!/usr/bin/env perl
use v5.36;

use Math::Prime::XS qw(primes);

say join ', ', grep { $_ == reverse $_ } primes(1000);
