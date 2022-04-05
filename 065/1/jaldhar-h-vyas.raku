#!/usr/bin/env raku

multi sub MAIN(
    Int $N = 2, #= number of digits in match
    Int $S = 10  #= sum of digits in match
) {
    ([X~] ([0 .. 9] xx $N))
        .grep({ !/^0/ })
        .grep({ ([+] $_.comb) == $S })
        .join(q{, })
        .say;
}
