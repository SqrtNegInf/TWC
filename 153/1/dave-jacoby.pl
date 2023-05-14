#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum0 product };

say join ', ', map { left_factorial($_) } 1 .. 10;

# Left factorials: !n = Sum_{k=0..n-1} k!.
sub left_factorial( $n ) {
    return sum0 map { factorial($_) } 0 .. $n - 1;
}

sub factorial ( $n ) {
    return 1 if $n == 0;
    state $factorials ;
    if ( !$factorials->{$n} ) {
        $factorials->{$n} = product 1 .. $n;
    }
    return $factorials->{$n};
}
