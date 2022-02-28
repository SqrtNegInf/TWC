#!/usr/bin/env raku

sub MAIN(UInt $n = 10) { say isqrt $n }

multi sub isqrt(UInt:D $n where 0 | 1) { $n }
multi sub isqrt(UInt:D $n) {
    my $small = isqrt($n +> 2) +< 1;
    my $large = $small + 1;

    return $large² > $n ?? $small !! $large;
}
