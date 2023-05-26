#!/usr/bin/env perl
use v5.36;
use English qw/ -no_match_vars /;

my ($N) = shift // 34;

my @digits = map { $_ * $_} split //, $N;
my $total = 0;
for my $digit (@digits) {
    $total += $digit;
}

say sqrt($total) =~ / ^ [[:digit:]]+ $ /x ? 1 : 0;
