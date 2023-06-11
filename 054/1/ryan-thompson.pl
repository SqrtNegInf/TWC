#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw<permutations>;

my ($n, $k) = @ARGV;
$n //= 3;
$k //= 4;

# Array version is compact
say join '', @{ ( permutations([1..$n], $n) )[$k-1] };

# Iterator version is usually slightly faster as it short-circuits
my $it = permutations([1..$n], $n);
$it->next for 1..$k-1;
say join '', @{ $it->next };
