#!/usr/bin/env perl
use v5.36;

my $total = 0;
my $count = 1;
my @averages;

for  my $arg (@ARGV) {
    $total += $arg;
    push @averages, $total / $count++;
}

say join q{ }, @averages;
