#!/usr/bin/env perl
use v5.36;

my @A = (13,13,9,1);

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(max);
die <<~"FIN" unless @A >= 2;
    Usage: $0 N1 N2 [N3...]
    to find the maximum xor of pairs from the list N1 N2 N3...
    FIN
say join " ", @A, "->", max map  {$_->[0] ^ $_->[1]} combinations([@A],2);
