#!/usr/bin/env raku

    #my @n = <1 2 3 10>; # cannot handle this input
    my @n = <1 2 3>;
    my $sum = 0;
    $sum += ( @n[ $_ - 1 ].base( 2 ) +& @n[ $_ ].base( 2 ) ).Str.parse-base( 2 ) for 1 ..^ @n.elems;
    $sum += ( @n[ 0 ].base( 2 ) +& @n[ * - 1 ].base( 2 ) ).Str.parse-base( 2 );
    $sum.say;
