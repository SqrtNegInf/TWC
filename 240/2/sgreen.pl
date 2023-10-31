#!/usr/bin/env perl
use v5.36;

sub main (@ints) {
    my @solution = ( map { $ints[ $ints[$_] ] } ( 0 .. $#ints ) );
    say join ', ', @solution;
}

main((0, 2, 1, 5, 3, 4));
