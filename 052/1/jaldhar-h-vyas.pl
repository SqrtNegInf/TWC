#!/usr/bin/env perl
use v5.36;

say join q{ }, grep {
    my @digits = split //;

    abs($digits[0] - $digits[1]) == 1 && abs($digits[1] - $digits[2]) == 1;
} 100 .. 999;

