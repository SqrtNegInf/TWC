#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';
use List::MoreUtils 'any';

my $sum = shift||12;

for my $i (1..$sum) {
    for my $j ($i+1..$sum) {
        for my $k ($j+1..$sum) {
            if (sum($i, $j, $k) == $sum) {
                if (any {$_%2==0} $i, $j, $k) {
                    say "$i,$j,$k"
                }
            }
        }
    }
}
