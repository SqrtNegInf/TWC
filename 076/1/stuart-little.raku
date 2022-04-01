#!/usr/bin/env raku

# craters for all but very tiny numbers!

sub minpr(Int $n where * >= 2) {
    ($n.is-prime) && return 1;
    return 1+(2 ...^ *>$n)
    .grep(*.is-prime)
    .map({ $n-$_ })
    .grep(* >= 2)
    .map(&minpr)
    .min;
}

say minpr(9);

# run as <script> <number>
