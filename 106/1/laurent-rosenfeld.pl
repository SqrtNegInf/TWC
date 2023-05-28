#!/usr/bin/env perl
use v5.36;

my @input = (2, 9, 3, 5);
my @sorted = sort { $a <=> $b} @input;
my $max = 0;
for my $i (1..$#sorted) {
    $max = $sorted[$i] - $sorted[$i-1] if $sorted[$i] - $sorted[$i-1] > $max;
}
say "Max gap: $max";
