#!/usr/bin/env raku

sub is-power-of-two-ints(Int $N) {
    (2..$N.sqrt).first({ $N == $^n ** $N.log($^n).floor });
}

for <8 15 125>.map({ .Int }) -> $n {
    say is-power-of-two-ints($n) ?? 1 !! 0;
}
