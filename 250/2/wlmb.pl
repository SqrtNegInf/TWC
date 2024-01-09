#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

my @ARGV = <perl 2 r4ku>;
die <<~"FIN" unless @ARGV;
    Usage: $0 S0 [S1...]
    to find the maximum \"value\" of the strings S0 S1...
    FIN
say "@ARGV -> ", max map {/^[+-]?\d+$/?0+$_:length $_} @ARGV;
