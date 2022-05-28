#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2021/11/29/symmetric-code/ 
# cf 'arne-sommer.raku'

for (1000, 999, 314159) -> $i, $j, $k {
    put ((1..$i) X* (1..$j)).sort[$k - 1];

    CATCH { when X::OutOfRange { warn „Sorry, I can't find position $k in the multiplication table of $i and $j.“ } }
}
