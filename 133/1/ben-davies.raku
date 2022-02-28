#!/usr/bin/env raku

unit sub MAIN(Int:D $n where * > 0 = 10) {
    # Newton's method. Adapted from Algorithm 1.13 of:
    # https://maths-people.anu.edu.au/~brent/pd/mca-cup-0.5.9.pdf
    my $x;
    my $L = $n;
    repeat {
        $x = $L;
        $L = ($x + $n div $x) div 2;
    } until $L >= $x;
    say $x;
}
