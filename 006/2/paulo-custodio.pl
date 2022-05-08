#!/usr/bin/env perl

use Modern::Perl;
use Math::BigFloat;

my $accuracy = 128;

my $e = Math::BigFloat->bpi($accuracy) * Math::BigFloat->bsqrt(163, $accuracy);
my $k = Math::BigFloat->bexp($e, $accuracy);
say $k->bround(30);
