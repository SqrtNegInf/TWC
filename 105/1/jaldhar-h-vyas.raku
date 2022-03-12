#!/usr/bin/env raku

sub MAIN(
    Int $N = 5, #= root
    Int $k =34 #= number
) {
    say ($k ** (1.0 / $N)).round(0.01);
}
