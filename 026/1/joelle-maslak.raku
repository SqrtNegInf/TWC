#!/usr/bin/env raku

#sub MAIN(Str:D $stones, Str:D $jewels) {
my $stones = 'chancellor'; my $jewels = 'chocolate';
    my $stone-set = $stones.comb.cache;
    my $matches   = $jewels.comb.grep: { $^a ∈ $stone-set };
    say $matches.elems;
#}


