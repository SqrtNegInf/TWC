#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum any /;

my %series = ();

for my $i ( 1 .. 10 ) {
    for my $j ( 1 .. 10 ) {
        my $k = 12 - sum( $i, $j );
        if ( $k > 0 ) {
            if ( !exists $series{"$i, $j, $k"} ) {
                my $bool = any { $_ % 2 == 0 } ( $i, $j, $k );
                if ($bool) {
                    $series{"$i, $j, $k"} = 1;
                    $series{"$i, $k, $j"} = 1;
                    $series{"$j, $k, $i"} = 1;
                    $series{"$j, $i, $k"} = 1;
                    $series{"$k, $i, $j"} = 1;
                    $series{"$k, $j, $i"} = 1;
                }
            }
        }
    }
}

say join "\n", sort keys %series;
my $series_size = keys %series;
say "\nThere were $series_size possible series of 3 positive numbers.";
