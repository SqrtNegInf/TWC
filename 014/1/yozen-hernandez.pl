#!/usr/bin/env perl
use v5.36;

use Memoize;
use List::Util qw(first);
 
# Use Memoize to cache intermediate values in this function
memoize('van_eck_seq');

sub van_eck_seq ( $n, $init = 0 ) {

    # Base case. It should always be $init followed
    # by 0, given the definition.
    return ( $init, 0 ) if ( $n == 0 );

    my @seq = van_eck_seq( $n - 1, $init );
    my $m   = first { $seq[$_] == $seq[$n] } reverse( 0 .. ( $n - 1 ) );
    my $val = ( defined $m ) ? ( $n - $m ) : 0;

    return @seq, $val;
}

local $, = ", ";
say van_eck_seq(19);
