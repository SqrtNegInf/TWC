#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $num = 11111;
die "Must pass an integer > 0 as the first argument\n" unless $num && $num =~ /^\d+$/;

say $num == 1
    ? "No prime factors for 1"
    : join(', ', prime_factors( $num ) )
;

exit 0;

sub prime_factors {
    my $n = shift;

    my @factors;
    while ( $n % 2 == 0 ) {
        push @factors, 2;
        $n /= 2;
    }
    for ( my $i = 3; $i <= sqrt($n); $i += 2 ) {
        while ( $n % $i == 0 ) {
            push @factors, $i;
            $n /= $i;
        }
    }
    push @factors, $n if $n > 2;

    return @factors;
}

