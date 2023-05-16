#!/usr/bin/env perl
use v5.36;

use POSIX qw/ cbrt sqrt /;

my $max     = 117;
my $counter = 0;

FIRST_FIVE: for my $a ( 1 .. $max ) {
    for my $b ( 1 .. $max ) {
        for my $c ( 1 .. $max ) {
            if ( ( cbrt( $a + $b * sqrt($c) ) + cbrt( $a - $b * sqrt($c) ) )
                == 1 )
            {
                say "($a, $b, $c)";
                $counter++;
                if ( $counter == 5 ) {
                    last FIRST_FIVE;
                }
            }
        }
    }
}

