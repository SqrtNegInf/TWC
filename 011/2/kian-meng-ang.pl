#!/usr/bin/env perl

use v5.10;
use strict;
use warnings;
use Math::MatrixReal;

my $n = 5;
my $matrix = Math::MatrixReal->new_diag([(1) x $n]);
$matrix->display_precision(0);
say $matrix;
