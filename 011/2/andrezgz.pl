#!/usr/bin/env perl
use v5.36;

my $n = int(5) - 1;

for (0..$n) { print " 0" x $_ . " 1" . " 0" x ($n - $_) . $/; }
