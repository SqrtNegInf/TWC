#!/usr/bin/env raku
#unit sub MAIN( *@N where .all ~~ Int );
my @N = (1, 4, 3, 2);

# Hint: In numeric context, True is 1 and False is 0
say ( Inf, |@N, Inf )
    .rotor( 3 => -2 )
    .map({ slip .[1] > .[0], .[1] > .[2] })
    .sum + @N
