#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my  @nums = [1, 2, 3, 4];
    @nums.kv.map( { @nums.elems %% ( $^index + 1 ) ?? $^value ** 2 !! 0  } ).sum.say;
#}
