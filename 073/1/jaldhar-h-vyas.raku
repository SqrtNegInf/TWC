#!/usr/bin/env raku

sub MAIN(
    Int $S = 3, #= size of sliding window
    @A =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8)
) {

    my @output;

    for (0 .. @A.elems - $S) -> $i {
        @output.push(@A[$i ..^ $i + $S].min);
    }

    @output.join(q{ }).say;
}
