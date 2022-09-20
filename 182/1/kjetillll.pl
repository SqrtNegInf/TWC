#!/usr/bin/env perl

use v5.36;
use List::AllUtils <max firstidx>;

my $max = max(5, 2, 9, 1, 7, 6, 9);

say firstidx { $_ == $max } (5, 2, 9, 1, 7, 6, 9);
