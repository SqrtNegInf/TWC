#!/usr/bin/env perl
use v5.36;

my (@even, @odd);
$_ % 2 ? push @odd, $_ : push @even, $_ for sort <1 2 3 4 5 6>;
say @even, @odd;
