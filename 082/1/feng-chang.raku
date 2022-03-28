#!/usr/bin/env raku

sub MAIN(UInt:D $M = 100, UInt:D $N = 500) {
    (1..min($M,$N)).grep({ ($M & $N) %% $_ }).say;
}
