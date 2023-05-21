#!/usr/bin/env perl
use v5.36;

my %histo;
$histo{$_}++ for (2, 5, 4, 4, 5, 5, 2);
say join " ", grep { $histo{$_} % 2 } keys %histo;
