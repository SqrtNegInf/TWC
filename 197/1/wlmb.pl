#!/usr/bin/env perl
# Perl weekly challenge 197
# Task 1:  Move Zero
#
# See https://wlmb.github.io/2022/12/26/PWC197/#task-1-move-zero
use v5.36;
say(<<~"FIN"), exit unless @ARGV;
    Usage: $0 N1 [N2...]
    to move all zeroes among the numbers N1, N2... towards the right,
    keeping the order of the rest.
    FIN
say join " ", @ARGV, "->", sort {$a?$b?0:-1:1} @ARGV;
