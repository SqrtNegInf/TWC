#!/usr/bin/env raku
use v6;

sub divs($a,$b) {
    (1..min($a,$b)).grep({ $a %% $_ && $b %% $_ })
}

say divs(100,500);

# run as <script> num1 num2
