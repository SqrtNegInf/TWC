#!/usr/bin/env perl
use v5.36;
sub main ($n) {
    # Find the first power of two greater than n
    my $p = 1;
    $p *= 2 while ( $p <= $n );

    # Print the inverse of n
    say $p- $n - 1;
}

use bigint;
main( $_ ) for 4,5,6, 2**64+1; # wrong for bigint
