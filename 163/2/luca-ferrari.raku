#!/usr/bin/env raku

sub MAIN( @n = (1,5,4,3,2,6,7) ) {

    my @matrix;
    @matrix.push: [ @n ];

    while ( @matrix[ * - 1 ].elems > 2 ) {
        my @row;
        @row.push: @matrix[ * - 1 ][ 1 ] ;

        for 2 ..^ @matrix[ * - 1 ].elems {
            @row.push: @matrix[ * - 1 ][ $_ ] + @row[ * - 1 ];
        }

        @matrix.push: [ @row ];
    }

    @matrix.push: [ @matrix[ * - 1 ][ * - 1 ] ];

    say @matrix[ * - 1 ][ 0 ];
}
