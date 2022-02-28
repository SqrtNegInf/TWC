#!/usr/bin/env raku

#| For the integer N return the integer sqrt of it
sub MAIN ( Int \n = 10) {
    say isqrt( n );
}

sub isqrt(UInt \n) {
    (1..*).first( { $_ * $_ > n } ) - 1;
};
