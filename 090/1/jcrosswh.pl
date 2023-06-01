#!/usr/bin/env perl
use v5.36;

my $DNA_SEQUENCE = 
    'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
my %dna_complement = (
    'A' => 'T',
    'T' => 'A',
    'C' => 'G',
    'G' => 'C'
);

print length($DNA_SEQUENCE) . " bases\n";
print map { $dna_complement{$_} } split(//, $DNA_SEQUENCE);
print "\n";

exit 0;
