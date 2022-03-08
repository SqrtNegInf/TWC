#!/usr/bin/env perl

print swapOddEvenInt(101);

sub swapOddEvenInt {
    my $num = shift;

    my $even = $num & 0xAAAAAAAA;
    my $odd = $num & 0x55555555;

    $even >>= 1;
    $odd <<= 1;

    return $even | $odd;
}
