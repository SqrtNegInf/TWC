#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (
    [ 6, 12, 25, 1 ],
    [ 10, 7, 31, 5, 2, 2 ],
    [ 1, 2, 10 ],
);

sub concatenation_value {
    my @ints = shift->@*;
    my $value = 0;

    while ( scalar @ints > 0 ) {
        my $first = shift @ints;     
        my $last =  scalar @ints ? pop @ints : '';     

        $value += "${first}${last}";
    }

    return $value;
}

for my $elements (@examples) {
    my $cv = concatenation_value $elements;

    say 'Input : @ints = ', dump(@$elements);
    say 'Output : ', $cv;
    say ' ';
}
