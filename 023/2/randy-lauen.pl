#!/usr/bin/env perl
use v5.36;

my $num = 11111;

say $num == 1
    ? "No prime factors for 1"
    : join(', ', prime_factors( $num ) )
;

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

