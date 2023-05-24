#!/usr/bin/env perl
use v5.36;

sub flip_bit_n{
    my($x, $n) = @_;
    my $bits = substr(unpack("B32", pack("N", $x)), 24, 8);
    my @bits = split(//, $bits);
    $bits[@bits - $n] ^= 1; 
    my $flipped_decimal = unpack("N", pack("B32", substr("0" x 32 . join("", @bits), -32)));
    return $flipped_decimal; 
}

MAIN:{
    my($M, $N);
    $M = 12; 
    $N = 3; 
    print flip_bit_n($M, $N) . "\n";
    $M = 18; 
    $N = 4; 
    print flip_bit_n($M, $N) . "\n";
}  
