#!/usr/bin/env perl
use v5.36;

my $is_prime = eval { require Prime } ? \&Prime::int_isprime : \&perl_isprime;

# The meat of the program -
while (1) {
    state $i       = 1;
    state $product = 1;

    $i++;

    next unless $is_prime->($i);
    $product *= $i;

    if ( !$is_prime->( $product + 1 ) ) {
        say $product+ 1;
        last;
    }
}

# Slow is_prime function, used if we can't load the lib/Prime.pm module.
sub perl_isprime($i) {
    my $sqrt = int( sqrt($i) );

    if ( $i <= 2 )     { return 1; }    # negatives are wrong, at least for us
    if ( $i % 2 == 0 ) { return 0; }

    my $div = 3;
    while ( $div <= $sqrt ) {
        if ( $i % $div == 0 ) { return 0; }

        $div += 2;                      # Test just evens
    }

    return 1;
}
