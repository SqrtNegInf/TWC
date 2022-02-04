#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my $EPS = 1e-6;
my $THIRD = 1 / 3;

for my $a (1..28) {
    for my $b (1..28) {
        for my $c (1..28) {
            my $t1 = ($a + $b * sqrt($c)) ** $THIRD;
            my $tmp = $a - $b * sqrt($c);
            my $t2 = ($tmp >= 0) ? $tmp ** $THIRD : -abs($tmp) ** $THIRD;
            if (abs($t1 + $t2 - 1) < $EPS) {
                say "($a, $b, $c) ", $a + $b + $c ;
            }
        }
    }
}
