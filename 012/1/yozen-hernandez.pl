#!/usr/bin/env perl
use v5.36;

use Carp;

sub is_prime {
    my $n = shift;

    return 0 if grep { $n % $_ == 0 } ( 2 .. sqrt($n) );

    return 1;
}

sub prime_iterator {
    my $n = 1;
    return sub {
        1 until is_prime ++$n;
        return $n;
        }
}

sub euclid_prime_iterator {
    my $prime_iter = prime_iterator();
    my $prime_prod = 1;
    return sub {
        $prime_prod *= $prime_iter->();
        return $prime_prod + 1;
        }
}

# scen = Smallest Composite Euclid Number
my $iter = euclid_prime_iterator();
my $scen = 0;
$scen = $iter->() until ( is_prime($scen) == 0 );
say $scen;
