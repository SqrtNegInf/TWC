#!/usr/bin/env raku

sub MAIN(
    @ints = (9, 4, 7, 2, 10)
) {
    my $longest = 0;

    COMBINATION: for @ints.combinations(3 .. @ints.elems) -> $combo {
        my $delta = @$combo[1] - @$combo[0];

        for 2 .. @$combo.end -> $i {
            if @$combo[$i] - @$combo[$i - 1] != $delta {
                next COMBINATION;
            }
        } 

        if @$combo.elems > $longest {
            $longest = @$combo.elems;
        }
    }

    say $longest;
}
