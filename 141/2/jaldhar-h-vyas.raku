#!/usr/bin/env raku

sub MAIN(
    $m = 1234,
    $n = 2
) {
    $m.comb
        .combinations(1 ..^ $m.chars)
        .map({ $_.join; })
        .grep({ $_ %% $n; })
        .elems
        .say;
}
