#!/usr/bin/env raku

#| Find the possible combinations of Fibonacci Numbers that add up to N
sub MAIN (
    UInt $N = 377
) {
    my @combos = (1,1,*+*...^* > $N).unique.combinations.grep( -> @c { $N == [+] @c } );
    if @combos {
        (($_.join( " + " ))~" = $N").say for @combos;
    } else {
        say 0;
    }
}
