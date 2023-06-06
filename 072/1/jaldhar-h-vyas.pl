#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my $N = shift // 10;
#if ($N < 1 || $N > 10) { usage(); }
my $factorial = 1;

for my $i (2 .. $N) {
    $factorial *= $i;
}

$factorial =~ /(0+)$/;
say length $1 // 0;
