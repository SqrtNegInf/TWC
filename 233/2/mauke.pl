#!/usr/bin/env perl
use v5.36;

my @ints = (1,1,2,2,2,3);

my %seen;
$seen{$_}++ for @ints;

say for sort {
    $seen{$a} <=> $seen{$b} ||
    $b <=> $a
} @ints;
