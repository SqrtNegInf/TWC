#!/usr/bin/env raku
#
#
#       121-that-ones-upside-down.raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN ( Int $num = 12, Int $pos = 3) ;

say $num +^ 2**($pos-1);
