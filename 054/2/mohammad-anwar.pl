#!/usr/bin/env perl
use v5.36;

my $n = 23;

my @collatz = ($n);
while ($n != 1) {
    $n = ($n % 2 == 0) ? ($n / 2) : ((3 * $n) + 1);
    push @collatz, $n;
}

print sprintf("%s\n", join " -> ", @collatz);
