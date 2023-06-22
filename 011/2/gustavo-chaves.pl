#!/usr/bin/env perl
use v5.36;

my $n = 5;

my @matrix = map {[(0) x $n]} (1 .. $n);

$matrix[$_][$_] = 1 foreach (0 .. $n-1);

print "@$_\n" for @matrix;
