#!/usr/bin/env perl
use warnings;
use v5.12;

# run <script> <space-separated numbers>

use feature qw(signatures);
no warnings qw(experimental::signatures);

use List::Util qw(max);

my @sorted = sort {$a <=> $b} <1 3 8 2 0>;
my @diffs = map {$sorted[$_+1]-$sorted[$_]} (0..scalar @sorted-2);

say ((scalar @diffs) ? (max @diffs) : (0)); 
