#!/usr/bin/env perl
use v5.36;

my @N = grep { $_ > 0 } map { int($_) } (5, 2, -2, 0);

my %seen = map { $_ => 1 } @N;
my $i = 1;
$i++ while $seen{$i};

say $i;
