#!/usr/bin/env raku
sub MAIN( Int $n where * > 1 = 3, Int $k where * > 1 = 4 )
{
    say ( 1..$n ).permutations[ $k - 1 ];
}
