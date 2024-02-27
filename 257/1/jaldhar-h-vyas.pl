#!/usr/bin/env perl
use v5.36;

my @ints = (5, 2, 1, 6);
my $n = scalar @ints - 1;
my %sorted = map { $_ => $n-- } reverse sort { $a <=> $b } @ints;

say q{(}, ( join q{, }, map { $sorted{$_} } @ints ), q{)};
