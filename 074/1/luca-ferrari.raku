#!/usr/bin/env raku

sub MAIN( @array = (1, 2, 2, 3, 2, 4, 2)) {
    my $N = @array.elems;
    my $majority = floor( $N / 2 );

    my %counting;
    %counting{ $_ }++ for @array;

    given %counting.pairs.map( { .value >= $majority ?? $_ !! Nil } ).grep( * ~~ Pair ).unique.head {
        when .so { .key.say; }
        default  { '-1'.say; }
    }
}
