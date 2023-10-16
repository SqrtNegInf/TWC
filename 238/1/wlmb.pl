#!/usr/bin/env perl
use v5.36;

use List::Util qw(reductions);

my @ARGV = (1, 2, 3, 4, 5);
die <<~"FIN" unless @ARGV;
    Usage: $0 N1 [N2...]
    to return the running sum N1, N1+N2, N1+N2+N3...
    of the numbers N1, N2...
    FIN
say "@ARGV -> ", join " ", reductions {$a+$b} @ARGV
