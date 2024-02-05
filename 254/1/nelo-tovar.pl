#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

use Data::Dump qw(dump);

my @examples = (27, 0, 6);

sub is_power_of {
    my $number = shift;
    my $exponent = shift;

    for (my $i = 0; $i <= $number; $i++) {

        return 1 if (($i ** $exponent) == $number)
        
    }   

    return 0
}

for my $elements (@examples) {
    my $po = is_power_of $elements, 3;

    say 'Input : $n = ', dump($elements);
    say 'Output : ', $po ? 'true' : 'false';
    say ' ';
}
