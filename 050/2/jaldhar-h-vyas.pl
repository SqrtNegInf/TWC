#!/usr/bin/env perl
use v5.36;

my @L = sort (19,11,9,7,20,3,17,16,2,14,1);
my $size = scalar @L;

for (my $n = 0; $n < $size; $n++) {
    if ($L[$n] == $size - $n - 1) {
        say $L[$n];
    }
}
