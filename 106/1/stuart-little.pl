#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

my @sorted = sort {$a <=> $b} <1 3 8 2 0>;
my @diffs = map {$sorted[$_+1]-$sorted[$_]} (0..scalar @sorted-2);

say ((scalar @diffs) ? (max @diffs) : (0)); 
