#!/usr/bin/env perl
use v5.36;

my @list = (10, 4, 1, 8, 12, 3);
my @idx  = (0, 2, 5);

@list[@idx] = sort { $a <=> $b } @list[@idx];

say "@list";
