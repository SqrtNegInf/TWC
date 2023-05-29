#!/usr/bin/env perl
use v5.36;

use constant ROUND_FACTOR => 10000;

my($n, $k) = (5,34);
say round($k ** (1/$n));

sub round {
    my($n) = @_;
    return int($n*ROUND_FACTOR+0.5)/ROUND_FACTOR;
}
