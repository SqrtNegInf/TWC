#!/usr/bin/env raku
# This definitely is not efficient, but it displays the power of Raku syntax.

#sub MAIN($a, $b, $n) {
my ($a,$b,$n) = 1000, 999, 314159;
    say (sort 1..$a X* 1..$b)[$n - 1]
#}
