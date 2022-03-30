#!/usr/bin/env perl
use 5.020;
use warnings;

my @N = (5, 2, -2, 0);

my @positives = sort grep { $_ >= 0; } @N;
my $smallest = $positives[0];

for my $i (1 .. scalar @positives) {
    if (($positives[$i] // 'inf') - $smallest > 1) {
        $smallest++;
        last;
    } else {
        $smallest = $positives[$i];
    }
}

say $smallest;
