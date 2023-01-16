#!/usr/bin/env perl

use v5.36;
use Algorithm::Combinatorics qw(combinations);
my @A = (1,2,3,1,2,3);
say join " ", @A, "->", 0+grep{$A[$_->[0]]==$A[$_->[1]]} combinations(\@A, 2)
