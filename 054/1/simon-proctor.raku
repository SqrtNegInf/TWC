#!/usr/bin/env raku

#| Print the kth permutation of the numbers from 1 to n
multi sub MAIN( UInt \n = 3, Int \k where { 1 <= k <= [*] 1..n } = 4 ) {
    (1..n).permutations[k-1].join("").say;
}
