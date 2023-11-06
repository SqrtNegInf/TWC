#!/usr/bin/env raku

sub MAIN(
    $diff = 3, @nums = (0, 1, 4, 6, 7, 10)
) {

    @nums
        .combinations(3)
        .grep({
            my ($i, $j, $k) = @$_;

            $i < $j &&
            $j < $k &&
            $j - $i == $diff &&
            $k - $j == $diff;
        })
        .elems
        .say;
}
