#!/usr/bin/env raku

# 2023-02-17 GH5209

sub sum-int (Int $num, Int $digit where 1 <= $digit <= 9) {
    my @candidates = grep { /$digit/ }, 1..$num;
    for @candidates.combinations -> $comb {
        if $num == sum $comb {
       #if $num == [+] $comb {
            # say $comb;
            return 1;
        }
    }
    return 0;
}
for 1..30 -> $test {
    say "$test: ", sum-int $test, 7;
}
