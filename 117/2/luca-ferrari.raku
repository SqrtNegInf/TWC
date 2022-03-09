#!/usr/bin/env raku

# not all paths
sub MAIN( Int $n = 3 ) {

    my @directions.push:
    'R' x $n 
    ,  'LH' x $n 
    ,  'L' x $n ~  'H' x $n 
    ,  'LH' x ($n -1) ~ 'R' x ($n - 1 )
    ,  'R' x ($n - 1) ~ 'LH' x ($n - 1 )
    ,  'R' x ($n -1) ~ 'LH' x ($n - 1);

    @directions.unique.say;
}
