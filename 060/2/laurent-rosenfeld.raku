#!/usr/bin/env raku
sub MAIN (Int $length=2, Int $max-val=21, Str $list='0 1 2 5') {
    my @L = | $list.split(" ") xx $length;
    my @out;
    for @L.combinations: 1..$length -> $seq {
        for $seq.permutations>>.join('') -> $num {
            push @out, +$num if $num < $max-val
                and $num.Int.chars == $length;
        }
    }
    .say for @out.sort.squish;
}
