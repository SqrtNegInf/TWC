#!/usr/bin/env perl
use v5.36;
my @sorted = sort (2,6,3,1);

say $sorted[-2] * 2 <= $sorted[-1] ? 1 : -1;
