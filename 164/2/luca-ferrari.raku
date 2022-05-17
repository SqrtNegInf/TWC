#!/usr/bin/env raku

sub MAIN( Int $limit = 8 ) {
    my @happy-numbers = lazy gather {
        for 10 .. Inf {
            my $sum = $_.comb.map( * ** 2 ).sum;
            while ( $sum.comb.elems > 1 ) {
                $sum = $sum.comb.map( * ** 2 ).sum;
            }

            take $_ if $sum == 1;
        }
    };

    @happy-numbers[ 0 .. $limit ].join( ', ' ).say;
}
