#!/usr/bin/env perl
use v5.36;

my @N = grep { $_ > 0 } map { int($_) } (1, 4, 3, 2);

my $extra = grep { $N[$_] != $N[$_-1] } (1..@N-1);

say @N + $extra;
