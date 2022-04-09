#!/usr/bin/env raku

sub wv(@a,$b) {
    $b eqv ().Bag && do {say @a; return};
    for $b.keys.sort.grep({ (@a %% 2) ?? ($_ >= (@a[*-1] || -Inf)) !! ($_ <= (@a[*-1] || Inf)) }) {
	wv((|@a,$_),($b (-) $_))
    }
}

wv((), (^4).map(*.Int).Bag)
