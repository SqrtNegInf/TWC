#!/usr/bin/env raku


sub MAIN( $N = 12 ) {
    my $factorial = [*] 1 .. $N;
    my $zeros = $factorial ~~ / 0+ $ /;
    "$N ! = $factorial and has { $zeros.chars } trailing zeros".say;
}
