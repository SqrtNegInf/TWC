#!/usr/bin/env raku

sub MAIN (Str:D $dictionary = 'words') {
   all-sorted-abecedarian-in($dictionary).put;
}

sub all-sorted-abecedarian-in (Str $dictionary) {
   all-abecedarian-in($dictionary).sort({$^a.chars <=> $^b.chars}).Array;
}

sub all-abecedarian-in (Str $dictionary) {
   $dictionary.IO.lines.grep({is-abecedarian($_)}).Array;
}

sub is-abecedarian (Str $word) {
   $word.fc.comb.sort.join('') eq $word.fc;
}
