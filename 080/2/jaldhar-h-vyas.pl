#!/usr/bin/env perl
use v5.36;

my @N = (1, 4, 3, 2);
my @candies = map{ 1; } @N;

for my $i (0 .. scalar @N - 1) {
    if ($N[$i] > ($N[$i - 1] // 'inf')) {
        $candies[$i]++;
    }
    if ($N[$i] > ($N[$i + 1] // 'inf')) {
        $candies[$i]++;
    }
}

my $total = 0;
foreach (@candies) {
    $total += $_;
}
say $total;
