#!/usr/bin/env raku

sub sum3($t, @a) {
    @a.combinations(3).grep({ $_.sum == $t })
}

say sum3(0, (-25, -10, -7, -3, 2, 4, 8, 10).map(*.Int));
