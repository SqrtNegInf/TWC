#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
use List::Util qw( sum );
use ntheory qw( is_prime next_prime );

say join(", ", additive_primes(100));

sub additive_primes {
    my($limit) = @_;
    my @out;
    my $prime = 2;
    while ($prime < $limit) {
        if (is_prime(sum(split(//, $prime)))) {
            push @out, $prime;
        }
        $prime = next_prime($prime);
    }
    return @out;
}
