#!/usr/bin/env perl
use v5.36;

use List::Util qw{ min max };

push @ARGV, 12, 18 unless scalar @ARGV;

common_factors( min(@ARGV), max(@ARGV) );

sub common_factors ( $min, $max ) {
    my @factors;
    say qq{MIN: $min};
    say qq{MAX: $max};

    for my $i ( 1 .. $min ) {
        push @factors, $i if $min % $i == 0 && $max % $i == 0;
    }
    say join ',', @factors;
}
