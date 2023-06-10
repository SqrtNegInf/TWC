#!/usr/bin/env perl
use v5.36;

my $k = 2;
my @sorted = sort {$a <=> $b } (2, 7, 9);

OUT: for my $i (reverse 0 .. @sorted - 1) {
    for my $j (reverse 0 .. $i-1) {
        next OUT if $sorted[$i] - $sorted[$j] > $k; #avoid checking further
        print "($i,$j)\n"  if $sorted[$i] - $sorted[$j] == $k;
    }
}
