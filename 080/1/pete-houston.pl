#!/usr/bin/env perl
use v5.36;

use Params::Util '_POSINT';

# Build the hash from only the positive integers
my %pos;
$pos{$_} = 1 for grep { _POSINT ($_) } (5, 2, -2, 0);

# Find the lowest missing value
my $lowest = 1;
$lowest++ while $pos{$lowest};
print "$lowest\n";
