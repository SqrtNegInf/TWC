#!/usr/bin/env raku


sub MAIN( Int:D $target? = 0,
          @*L? where { @*L.grep(  * ~~ Int  ).elems > 3 }  = ( -25, -10, -7, -3, 2, 4, 8, 10 )  ) {

    # store the found triplets
    my @triplets;

    # extract only the integers
    my @L = @*L.sort.grep( * ~~ Int );

    # loop over the array
    loop ( my $first-start = 0; $first-start < @L.elems - 2; $first-start++ ) {
        my $first = @L[ $first-start ];
        loop ( my $second-start = $first-start + 1; $second-start < @L.elems - 1; $second-start++ ) {
            my $second = @L[ $second-start ];

            next if $second < $first;

            loop ( my $third-start = $second-start + 1; $third-start < @L.elems; $third-start++ ) {
                my $third = @L[ $third-start ];

                next if $third < $second;

                @triplets.push: Array.new( $first, $second, $third ) if ( $first + $second + $third == $target; );
            }
        }


    }

    "Found { @triplets.elems } triplets that sum to $target:".say;
    @triplets.join( "\n" ).say;

}
