#!/usr/bin/env perl
use v5.36;

my @gapful_numbers;
my $current_number = 100;

while ( scalar @gapful_numbers < 20 ) {
    my $divisor = ( substr $current_number, 0, 1 )
        . ( substr $current_number, -1, 1 );
    if ( $current_number % $divisor == 0 ) {
        push @gapful_numbers, $current_number;
    }
    $current_number++;
}

say join ' ', @gapful_numbers;
