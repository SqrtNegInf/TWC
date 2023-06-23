#!/usr/bin/env perl
use v5.36;

use Math::BigFloat;

use constant ACCURACY => 64;

my $r = ('Math::BigFloat'->bpi(ACCURACY)
         * 'Math::BigFloat'->new(163)->bsqrt(ACCURACY)
        )->bexp;
$r->precision(-32);
say $r;
