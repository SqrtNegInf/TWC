#!/usr/bin/env perl
use v5.36;

my $dna = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
for my $base (qw/A C G T/) {
	printf "Count of $base is %i\n", eval "\$dna =~ tr/$base/$base/;";
}
print "Original sequence is $dna\n";
$dna =~ tr/ACGT/TGCA/;
print "Complementary sequence is $dna\n";
