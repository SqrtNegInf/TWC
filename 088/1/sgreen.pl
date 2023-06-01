#!/usr/bin/env perl
use v5.36;

use List::Util qw(product);

    my @N = <5 2 1 4 3>;

    # Check that we have integers
    die "You must specify one or more integers\n" unless scalar(@N);
    foreach (@N) {
        die "The value '$_' does not appear to be a positive integer\n"
          unless /^\d+$/;
    }

    # Special case if there is only one number
    if ( scalar(@N) == 1 ) {
        say '0';
        return;
    }

    # Calculate the product of all numbers
    my $product = product(@N);

    # The solution for each number is product divided by the number
    say join ', ', map { $product / $_ } @N;
