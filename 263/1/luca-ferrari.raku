#!/usr/bin/env raku

sub MAIN( Int $k = 2, @nums = (1, 5, 3, 2, 4, 2) ) {
    @nums.sort.grep( * ~~ $k, :k ).say;

}
