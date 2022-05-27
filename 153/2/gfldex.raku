#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2022/02/22/looplessly-simply/

my \fact = 1, * × ++$ … ∞;
say fact[0..10];
say '--';

for <125 145 40585> -> $n {
    say fact[$n.comb].sum == $n ?? 1 !! 0
}

say '--';
.say for (^100000).grep({ fact[.comb].sum == .Int });
