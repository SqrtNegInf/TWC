#!/usr/bin/env perl
use v5.36;

use Math::Matrix;

my $A = Math::Matrix->new([1, 2], [3, 4]);
my $B = Math::Matrix->new([5, 6], [7, 8]);
my $K = $A->kron($B);
$K->print("K\n");
