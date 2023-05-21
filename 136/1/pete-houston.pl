#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'gcd';

my $gcd = gcd ( 8, 24);
my $l2  = log ($gcd) / log (2);

say $l2 == int ($l2) ? 1 : 0;
