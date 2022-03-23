#!/usr/bin/env raku
my $dna = "GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG";

.say for $dna.comb.Bag.sort;

say $dna.trans("ACGT" => "TGCA");
