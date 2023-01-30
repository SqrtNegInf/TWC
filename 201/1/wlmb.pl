#!/usr/bin/env perl
use v5.36;

my %seen;
my @A = (0, 1, 3, 5, 9, 10);
@seen{@A}=(1)x@A;
die "Expected unique values" unless 0+@A==0+keys %seen;
say join " ", @A, "->", grep {!$seen{$_}} 0..@A;
