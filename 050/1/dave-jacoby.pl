#!/usr/bin/env perl
use v5.36;

use JSON;
my $json = JSON->new;

my @array = ( [ 2, 7 ], [ 3, 9 ], [ 10, 12 ], [ 15, 19 ], [ 18, 22 ] );

# unnecessary in THIS case, but if we take on abstract
# two-dimensional array, we'll have to enforce order

@array = sort { $a->[0] <=> $b->[0] } @array;
say $json->encode( \@array );

LOOP: while (1) {
    for my $i ( 0 .. scalar @array - 1 ) {
        my @i = $array[$i]->@*;
        for my $j ( $i + 1 .. scalar @array - 1 ) {
            my @j = $array[$j]->@*;

            if ( $i[0] <= $j[0] && $i[1] >= $j[0] ) {
                $array[$i][1] = int $j[1];
                undef $array[$j];
                @array = grep { defined } @array;
                next LOOP;
            }
        }
    }
    say $json->encode( \@array );
    exit;
}
