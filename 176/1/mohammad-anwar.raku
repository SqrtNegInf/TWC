#!/usr/bin/env raku

use Test;

is 142857, smallest-permuted-multiples();

done-testing;

#
#
# METHODS

sub has-same-digits(Int $m, Int $n --> Bool) {
    return $m.comb.sort.join("") eq $n.comb.sort.join("");
}

sub smallest-permuted-multiples() {
    my $i = 10;
    while (True) {
        my $found = True;
        for 2..6 -> $j {
            if not has-same-digits($i, $i * $j) {
                $found = False;
                last;
            }
        }

        return $i if $found;
        $i += 1;
    }
}
