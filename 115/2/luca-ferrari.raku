#!/usr/bin/env raku

#sub MAIN( *@N where { @N.elems > 0 && @N.grep( * ~~ Int ).elems == @N.elems } ) {
    # create a list of integers
    # with only those that are divisible by 2
    my Int @numbers.push: .join.Int if .join.Int %% 2 for (4, 1, 7, 6).permutations;

    # now ask for the max
    say @numbers.max;
#}
