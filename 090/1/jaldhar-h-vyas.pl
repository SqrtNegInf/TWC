#!/usr/bin/env perl
use v5.36;

my @dna = split //, 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';

my %count;

for my $base (@dna) {
    $count{$base}++;
}

for my $base (sort keys %count) {
    say "$base = $count{$base}";
}

my %complementaries = (
    'T' => 'A',
    'A' => 'T',
    'G' => 'C',
    'C' => 'G'
);

say join q{}, map { $complementaries{$_}; } @dna;
