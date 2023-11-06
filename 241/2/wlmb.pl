#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw(factor);

my @ARGV = (11,8,27,4);
die <<~"FIN" unless @ARGV;
    Usage: $0 N0 [N1...]
    to order the numbers N0 N1 according to the number of factors and their value.
    FIN
say join " ", @ARGV, "->", sort{factor($a)<=>factor($b) || $a <=> $b} @ARGV
