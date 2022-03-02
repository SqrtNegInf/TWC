#!/usr/bin/env raku

#unit sub MAIN(
    #|[ A sorted list of positive integers. ]
    #**@xs where .all ~~ Int:D & &(* > 0) && .&[~~](.sort)
#) {
    my @xs = (1, 2, 3, 6, 7, 8, 9);
    say gather @xs .= skip: take [@xs[0...&end-of-seq]] while @xs;
    sub end-of-seq(Int:D $i) { $i >= @xs - 1 or @xs[$i + 1] != @xs[$i] + 1 }
#}
