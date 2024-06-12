#!/usr/bin/env perl
use v5.36;


sub main ($str) {
    my $score = 0;

    # Convert the string to a list of ASCII values
    my @ascii_values = map { ord($_) } split //, $str;

    # Calculate the score
    foreach my $pos ( 0 .. $#ascii_values - 1 ) {
        $score += abs( $ascii_values[$pos] - $ascii_values[ $pos + 1 ] );
    }

    say $score;
}

main( 'perl' );
