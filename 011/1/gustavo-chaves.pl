#!/usr/bin/env perl
use v5.36;

use Math::MatrixReal;

my $Matrix = Math::MatrixReal->new_from_cols([[0, 100], [1, 1]]);

my $vector = Math::MatrixReal->new_from_cols([[32, 212]]);

my $LR = $Matrix->decompose_LR();

my ($dimension, $solution, $base_matrix) = $LR->solve_LR($vector);

my ($x, $y) = $solution->as_list();

my $T = $y / (1 - $x);

print "$T℃  = $T℉\n";
