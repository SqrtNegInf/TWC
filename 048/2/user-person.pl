#!/usr/bin/env perl
use v5.36;

for ( my $i=0; $i < 3; ++$i ){

    for ( my $j=0; $j < 10; ++$j ){

      EDGES:
        for ( my $k=0; $k < 2; ++$k ){

            if (( $k == 1 and $j > 2 ) or ( $k == 0 and $j == 0 )) { # Months cannot be > 12 or 00
                next EDGES;
            }
            print "$k$j-${i}2-2$i$j$k\n";
        }
    }
}
