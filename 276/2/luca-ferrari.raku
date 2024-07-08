#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( { $_ ~~ Int && $_ > 0 } ).elems } ) {
    my @nums = [1, 2, 2, 4, 1, 5];
    my %frequency;
    %frequency{ @nums.grep( * ~~ $_ ).elems }.push: $_ for @nums;
    %frequency{ %frequency.keys.max }.unique.elems.say;
#}
