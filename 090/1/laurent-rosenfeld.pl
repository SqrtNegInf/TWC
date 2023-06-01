#!/usr/bin/env perl
use v5.36;

my $dna = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
# count
my %histogram;
$histogram{$_}++ for split '', $dna;
say "$_: $histogram{$_}" for sort keys %histogram;

# Complementary sequence
say for "Complement:", $dna =~ tr/TAGC/ATCG/r;
