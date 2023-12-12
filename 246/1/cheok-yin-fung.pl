#!/usr/bin/env perl

use v5.30.0;
use warnings;

srand 1;

my @ans;
my @arr = (1..49);
for my $i (0..5) {
    my $k = int(rand(49-$i));
    push @ans, splice(@arr, $k, 1);
}

say join "\n", sort {$a<=>$b} @ans;
