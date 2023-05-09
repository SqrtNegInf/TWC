#!/usr/bin/env perl
use v5.36;

# palindrome primes 2 .. 1000

say join "\n", 
    grep { $_ eq reverse $_ }
    grep { is_prime($_) } 
    1 .. 1000;

sub is_prime ($n) {
    return 0 if $n == 0;
    return 0 if $n == 1;
    for ( 2 .. sqrt $n ) { return 0 unless $n % $_ }
    return 1;
}
