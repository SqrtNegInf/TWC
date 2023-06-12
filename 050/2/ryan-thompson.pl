#!/usr/bin/env perl
use v5.36;

sub noble {
    my @L = sort { $a <=> $b } @_;
    map { $L[$_] } grep { $L[$_] == $#L - $_ } 0..$#L;
}

say noble(2, 6, 1, 3);
say noble( (19,11,9,7,20,3,17,16,2,14,1) );
