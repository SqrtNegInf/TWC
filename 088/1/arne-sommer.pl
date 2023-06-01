#!/usr/bin/env perl
use v5.36;

use List::Util qw/reduce all/;

my @N = <5 2 1 4 3>;

die '@N must contain positive integers only' unless all { $_ =~ qr/^[1-9]\d*$/ } @N;

my $product = reduce { $a * $b } @N;

my @M = map { $product / $_ } @N;

say '(', join(', ', @M), ')';
