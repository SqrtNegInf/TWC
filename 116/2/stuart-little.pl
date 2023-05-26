#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

my $digSqSum = sum0 map { $_ ** 2 } split //, 34;;
say 0+(int(sqrt $digSqSum) ** 2 == $digSqSum);
