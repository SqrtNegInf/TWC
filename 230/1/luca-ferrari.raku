#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my @nums = [1,34,5,6];
    my @digits;
    @digits.push( | $_.comb ) for @nums;
    @digits.join( ', ' ).say;
#}
