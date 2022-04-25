#!/usr/bin/env raku

subset AtoZ of Str where /^ <[A .. Z a .. z]>+ $/;

#unit sub MAIN (AtoZ $alphabet, AtoZ $string);
my $a = 'chancellor'; my$b = 'chocolate';

say ($a.comb.Set ⊍ $b.comb.Bag).Int;
