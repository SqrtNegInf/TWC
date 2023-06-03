#!/usr/bin/env perl
use v5.36;

my (@in) = grep { ! /\D/ } (100, 500);
die "Give me exactly two integers\n" unless @in == 2;

my %factors;

for my $x (@in) {
  for my $y (1 .. $x) {
    $factors{$y}++ unless $x % $y;
  }
}

say '(', join(', ', grep { $factors{$_} == 2 } sort keys %factors), ')';
