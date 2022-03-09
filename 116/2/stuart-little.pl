#!/usr/bin/env perl
use warnings;
use v5.12;

# run <script> <number>

use List::Util qw(sum0);

my $digSqSum = sum0 map { $_ ** 2 } split //, 34;;
say 0+(int(sqrt $digSqSum) ** 2 == $digSqSum);
