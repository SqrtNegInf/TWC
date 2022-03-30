#!/usr/bin/env raku

sub MAIN(
    @N = (1, 4, 3, 2)
) {
    my @candies = 1 xx @N.elems;

    for 0 ..^ @N.elems -> $i {
        if @N[$i] > (@N[$i - 1] // Inf) {
            @candies[$i]++;
        }
        if @N[$i] > (@N[$i + 1] // Inf) {
            @candies[$i]++;
        }
    }
    say [+] @candies;
}
