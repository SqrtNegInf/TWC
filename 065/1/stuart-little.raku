#!/usr/bin/env raku

sub digsum($n,$s) {
    ((10 ** ($n-1))..^(10 ** $n)).grep({ $_.comb.sum == $s })
}

say digsum(2, 10)

# run as <script> <nr of digits> <digit sum>

