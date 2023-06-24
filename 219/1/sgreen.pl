#!/usr/bin/env perl
use v5.36;

sub main (@array) {
    @array = sort { $a <=> $b } map { $_**2 } @array;
    say join ', ', @array;
}

main( (-2,-1,0,3,4) );
