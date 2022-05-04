#!/usr/bin/env perl

use strict;
use warnings;
use feature qw / say /;

my $value = 0;
my $found = 0;

while ( !$found ) {
    if ( ( ( 1.8 * $value ) + 32 ) == ( ( $value - 32 ) / 1.8 ) ) {
        $found = 1;
    }
    else {
        $value--;
    }
}

say "The equal point in the Fahrenheit and Celsius scales is $value.";
