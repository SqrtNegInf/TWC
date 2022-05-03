#!/usr/bin/env raku

multi F(0) { 1 }
multi F(Int $n where * > 0) { $n - M(F($n - 1)) }

multi M(0) { 0 }
multi M(Int $n where * > 0) { $n - F(M($n - 1)) }

sub MAIN(Int $n where * >= 0 = 20) {
    (^$n)».&F.say;
    (^$n)».&M.say;
}
