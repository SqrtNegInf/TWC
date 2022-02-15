#!/usr/bin/env raku

#sub MAIN( Int $i where { $i > 0 },
#          Int $j where { $j > 0 },
#          Int $k where { $k > 0 && $k < $i * $j } ) {

my ($i,$j,$k) = 1000, 999, 314159;
    my @table = ( 1 .. $i ) X[*] ( 1 .. $j );
    @table.sort[ $k ].say;
#}
