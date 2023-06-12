#!/usr/bin/env perl
use v5.36;

say join ' ', grep {  is_colorful($_) } 100 .. 999;

sub is_colorful( $d ) {
    my %test;

    my ( $i, $j, $k ) = split //, $d;    # 263 becomes 2,6,3

    # I'm told that using map as a cheat array is dirty pool
    # but it makes this a bit cleaner.

    # we make an anonymous array with all the products, and then
    # use map to add them into the hash. ++$var iterates before
    # use, so $test{$_} goes up by one, then is tested.

    map { return 0 if ++$test{$_} > 1; } $i, $j, $k, ( $i * $j ),
        ( $j * $k ), ( $i * $j * $k );

    return 1;
}
