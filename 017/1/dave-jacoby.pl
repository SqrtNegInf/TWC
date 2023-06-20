#!/usr/bin/env perl
use v5.36;

say a( 1, 2 );
say a( 2, 2 );
say a( 2, 5 );

sub a ( $m, $n ) {
    die 'Invalid input' unless $m >= 0 && $n >= 0;
    return $n + 1 if $m == 0;
    return a( $m - 1, 1 ) if $m > 0 && $n == 0;
    return a( $m - 1, a( $m, $n - 1 ) ) if $m > 0 && $n > 0;
}

