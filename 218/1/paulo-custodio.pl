#!/usr/bin/env perl

use Modern::Perl;

sub max_product {
    my(@N) = @_;
    return 0 if @N < 3;
    my $max = 0;
    for my $i (0 .. $#N-2) {
        for my $j ($i+1 .. $#N-1) {
            for my $k ($j+1 .. $#N) {
                my $prod = $N[$i]*$N[$j]*$N[$k];
                $max = $prod if $prod > $max;
            }
        }
    }
    return $max;
}

say max_product(@ARGV);
