#!/usr/bin/env perl
use v5.36;

say join ', ', map { fusc($_) } 0 .. 60;

sub fusc ( $n ) {

    # fusc(0) = 0
    # fusc(1) = 1
    return $n if $n < 2;

    # when n is even: fusc(n) = fusc(n / 2),
    return fusc( int $n / 2 ) if $n % 2 == 0;

    # when n is odd: fusc(n) = fusc((n-1)/2) + fusc((n+1)/2)
    return fusc( int( $n - 1 ) / 2 ) + fusc( ( $n + 1 ) / 2 );
}

exit;
