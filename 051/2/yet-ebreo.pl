#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';


sub is_colorful {
    my @digits = pop =~ /./g;
    my @seq = sort {$a - $b } (@digits, $digits[0] * $digits[1], $digits[1]* $digits[2], $digits[0] * $digits[1] * $digits[2]);
    return "@seq "!~ /(\d+ )\1/
}

say "List of 3-digit colorful numbers:";
for my $n (100..999) {
    is_colorful ($n) && say $n;
}
