#!/usr/bin/env raku

sub dff(@a where {$_.all ~~ Int}) {
    @a.rotor(2 => -1).map({ $_[1] - $_[0] })
}

for (1..1).map({ reduce { $^b.($^a) }, (5, 9, 2, 8, 1, 6).map(*.Int), |(&dff xx $_) }) {.say}
