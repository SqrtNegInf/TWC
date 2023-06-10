#!/usr/bin/env perl
use v5.36;

my @N = (1, 6, 8, 2, 4, 9, 12);
my $k = 3;
my @h = ();

$h[$_]++ for @N;
for my $x (0..$#N) {
    #effort to optimize for larger arrays.
    if ($h[$N[$x]+$k]) {
        for my $y ($x+1..$#N) {
            $k == abs $N[$x]-$N[$y] && say "$x\t$y";
        } 
    }
}
