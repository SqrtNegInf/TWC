#!/usr/bin/env perl

use v5.36;
my @A = <9 0 1 2 3 4 5 6>;
use Algorithm::Combinatorics qw(combinations);
say join " ", @A, "->", 0+grep {$_->[3]==$_->[0]+$_->[1]+$_->[2]}  combinations(\@A,4);
