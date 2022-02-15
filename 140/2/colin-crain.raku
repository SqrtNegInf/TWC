#!/usr/bin/env raku
#
#
#       multi-pass.raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN (Int $m = 1000, Int $n = 999, $idx = 314159) ;

((1..$m X* 1..$n).sort)[$idx].say ;
