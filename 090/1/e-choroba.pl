#!/usr/bin/env perl
use v5.36;

sub count {
    my ($dna) = @_;
    my %c;
    ++$c{$_} for split //, $dna;
    return join ', ', map { join ' ', $_, $c{$_} } sort keys %c
}

sub complement {
    local($_) = @_;
    tr/ATCG/TAGC/r
}

my $dna = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
say count($dna);
say complement($dna);
