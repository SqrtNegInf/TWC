#!/usr/bin/env raku

sub maxprod(@a) {
    (@a.keys X @a.keys).grep({ $_[0] <= $_[1]}).map({ @a[$_[0]..$_[1]]}).classify({ $_.reduce(&infix:<*>)}).sort(*.key).reverse.first.value
}

[ 2, 5, -1, 3 ].map(*.Int).&maxprod.say
