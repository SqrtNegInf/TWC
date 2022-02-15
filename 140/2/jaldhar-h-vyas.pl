#!/usr/bin/env perl
use 5.020;
use warnings;

#if (scalar @ARGV != 3) {
#    die "need three integers.\n";
#}

my @table;

my @A = <2 3 4>;

for my $i (1 .. $A[0]) {
    for my $j (1 .. $A[1]) {
        push @table, $i * $j;
    }
}

say 0+(sort { $a <=> $b } @table)[$A[2] - 1]; 
