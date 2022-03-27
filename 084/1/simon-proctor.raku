#!/usr/bin/env raku

#| Given an Integer return the reversed version or 0 if it won't fit in an unsigned 32 bit
sub MAIN( Int $N   =  -1700) {
    constant MAX = 2147483647;
    my $sign = $N < 0 ?? -1 !! 1;
    my $val = abs($N).flip;

    say $val > MAX ?? 0 !! $val * $sign;    
}
