#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my ($M, $N) = (11,3);

my $negative = ($M < 0) ^ ($N < 0);
my $dividend = abs($M);
my $divisor = abs($N);
my $quotient = 0;

while ($dividend >= $divisor) {
    $dividend -= $divisor;
    $quotient++;
}

if ($negative) {
    $quotient = -$quotient;
    if ($dividend > 0) {
        $quotient--;
    }
}

say $quotient;
