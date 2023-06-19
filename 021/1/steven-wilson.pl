#!/usr/bin/env perl
use v5.36;

use Math::BigFloat;

my $number     = 0;
my $factorial  = 1;
my $e          = Math::BigFloat->new( 1 / $factorial );
my $previous_e = 0;

while ( $e != $previous_e ) {
    #    say $e;
    $number++;
    $factorial *= $number;
    $previous_e = $e->copy();
    $e += ( 1 / $factorial );
}

# This is only accurate to 15 decimal places, oops.
my $dp = 15;
say "value of e to $dp decimal places: ", $e->fround($dp);
