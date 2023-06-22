#!/usr/bin/env perl
use v5.36;

use Math::MatrixReal;

my $n = 5;
my $matrix = Math::MatrixReal->new_diag([(1) x $n]);
$matrix->display_precision(0);
say $matrix;
