#!/usr/bin/env perl

use v5.36;
use POSIX qw(ceil);

use Test::More tests => 4;

is( binary_flip(5), 2, "Example 1" );
is( binary_flip(4), 3, "Example 2" );
is( binary_flip(6), 1, "Example 3" );
is( binary_flip(7), 0, "Example [7 ~= 0b111]" );
{ use bigint; say binary_flip(2**64 +1); }

sub binary_flip ($n) {
    $n ^ ( -1 + 2**ceil( log( $n + 1 ) / log(2) ) );
}
