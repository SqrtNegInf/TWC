#!/usr/bin/env perl
use v5.36;

my $m = 11;
my $n =  3;

my $count = 0;
my $multiplier = ($m < 0 xor $n < 0) ? -1 : 1;

($m, $n) = (abs($m), abs($n));

while ($m >= $n) {
    $m -= $n;
    $count += $multiplier;
}

# Floor negative result if division was not perfect
say $count + ($m != 0 && $multiplier == -1 ? -1 : 0);
