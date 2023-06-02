#!/usr/bin/env perl
use v5.36;

my $N = -1700;
my $negative = $N < 0;
$N = -$N if $negative;
my $Nr = 0 + join '', reverse split '', $N;
say $Nr <= 2_147_483_647 ? $negative ? -$Nr : $Nr : 0;
