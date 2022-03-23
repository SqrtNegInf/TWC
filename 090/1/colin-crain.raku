#!/usr/bin/env raku
#
#
#       dna.raku
#
#
#
#       2020 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN (Str $seq = 'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG') ;

my %bases = $seq.comb.Bag;


## report
say qq:to/END/;
    seq:    $seq

    length  : {$seq.chars}
    thymine : %bases{'T'}
    adenine : %bases{'A'}
    guanine : %bases{'G'}
    cytosine: %bases{'C'}

    comp:   {$seq.trans('TAGC' => 'ATCG')}
    comp:   {TR/TAGC/ATCG/ with $seq}

    END

