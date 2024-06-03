#!/usr/bin/env raku

#sub MAIN() {

    my $matrix = [ [0, 0],
                   [1, 1],
                   [0, 0],
                 ];

    my $row = 1;
    $matrix.map( { [ $row++, $_.grep( * ~~ 1 ).elems  ] } ).grep( { $_[ 1 ] > 0 } ).map( { $_[0] } ).min.say;
#}
