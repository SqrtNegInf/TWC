#!/usr/bin/env raku

#| Given two integers $m and $n. Prints all possible combinations of $n numbers from the list 1 2 3 … $m.
sub MAIN (
    UInt $m = 5, #= End of range
    UInt $n = 3, #= Size of returned lists
) {
    .join(",").say for (1..$m).combinations($n);
}
