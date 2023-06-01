#!/usr/bin/env perl
use v5.36;

my($a, $b) = (238, 13);

my $mul = 0;
while (1) {
    $mul += $b if ($a & 1) != 0;
    last if $a <= 1;
    $a >>= 1; $b <<= 1;
}

print $mul, "\n";
