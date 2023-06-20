#!/usr/bin/env perl
use v5.36;

sub A {
    my ( $m, $n ) = @_;
    return $n + 1 unless $m;
    return A( $m - 1, 1 ) unless $n;
    return A( $m - 1, A( $m, $n - 1 ) );
}

say A(0,0);
say A(1,0);
say A(1,1);
say A(1,2);
