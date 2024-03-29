#!/usr/bin/env perl
use v5.36;

use Test::More tests => 5;
ok( is_prime(2) == 1,     "2 is a prime" );
ok( is_prime(3) == 1,     "3 is a prime" );
ok( is_prime(4) == 0,     "4 is not a prime" );
ok( is_prime(97) == 1,    "97 is a prime" );
ok( is_prime(30031) == 0, "30031 is not a prime" );

my $number_to_check       = 2;
my $product_of_primes     = 1;
my $smallest_euclid_found = 0;

while ( !$smallest_euclid_found ) {
    if ( is_prime($number_to_check) ) {
        $product_of_primes *= $number_to_check;
        if ( !is_prime( $product_of_primes + 1 ) ) {
            $smallest_euclid_found = 1;
        }
    }
    $number_to_check++;
}

say $product_of_primes + 1,
    " is the first Euclid Number that is not a prime.";

sub is_prime {
    my $number   = shift;
    my $is_prime = 1;
    for ( 2 .. sqrt($number) ) {
        if ( $number % $_ == 0 ) {
            $is_prime = 0;
            last;
        }
    }
    return $is_prime;
}
