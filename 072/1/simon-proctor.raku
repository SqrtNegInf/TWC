#!/usr/bin/env raku

sub fact( UInt $n ) {
    [*] (1..$n);
}

#| Find the number of trailing zeros in N factorial
sub MAIN (
    UInt $N where * <= 1000 = 125
) {
    say (fact($N) ~~ m!(0*)$!)[0].Str.codes;
}
