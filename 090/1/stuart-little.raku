#!/usr/bin/env raku

my $DNA = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
say "Length: ", $DNA.chars;
say "Complementary sequence: ", $DNA.uc.trans('ATCG'=>'TAGC');
