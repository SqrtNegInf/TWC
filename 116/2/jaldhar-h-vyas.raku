#!/usr/bin/env raku

sub MAIN(
    Int $N where { $N >= 10; } = 34
) {
    my @digits = $N.comb.map({ $_ * $_; });
    say ([+] @digits).sqrt %% 1 ?? 1 !! 0;
}
