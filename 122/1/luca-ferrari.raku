#!/usr/bin/env raku

my @N  = <10 20 30 40 50 60 70 80 90 100>;
    my @average;
    @average.push: (@N[ 0 .. @average.elems - 1 ].sum + $_) / ( @average.elems + 1 ) for @N;
    

    @average.say;

