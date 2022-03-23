#!/usr/bin/env raku
multi MAIN(UInt $n where * > 0) { #= greater than 0
    say gcd-sum($n);
}

multi MAIN {
    use Test;
    plan 3;

    ok gcd-sum(3) == 3, "Example 1";
    ok gcd-sum(4) == 7, "Example 2";
    ok gcd-sum(100) == 13015, "Example 3";
}

sub gcd-sum(UInt $n) {
    sum (1..$n).combinations(2).map(-> ($a, $b) { $a gcd $b });
}
