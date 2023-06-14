#!/usr/bin/env perl
use v5.36;

my @leonardo_numbers = ( 1, 1 );
my $counter = 2;

while ( $counter < 20 ) {
    $leonardo_numbers[$counter] =
        $leonardo_numbers[ $counter - 1 ] +
        $leonardo_numbers[ $counter - 2 ] +
        1;
    $counter++;
}

print join " ", @leonardo_numbers, "\n";
