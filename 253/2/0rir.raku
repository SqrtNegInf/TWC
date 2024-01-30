#!/usr/bin/env raku

use Test;

my @Test =
    [   [1, 1, 0, 0, 0],
        [1, 1, 1, 1, 0],
        [1, 0, 0, 0, 0],
        [1, 1, 0, 0, 0],
        [1, 1, 1, 1, 1]
    ],                      (2, 0, 3, 1, 4),
    [   [1, 0, 0, 0],
        [1, 1, 1, 1],
        [1, 0, 0, 0],
        [1, 0, 0, 0]
   ],                       (0, 2, 3, 1),
;

plan @Test ÷ 2;

sub func( @in ) {
     @in.map( { ( @$_.first( 0, :k) // +@in ), $++})
     .sort( {$_.[0], $_.[1]}).map( *[1]);
}


for @Test -> @in, @exp {
    is func(@in), @exp, "@exp.raku() <- @in.raku()";
}

done-testing;

my @matrix = [ [1, 1, 1, 0, 0],
               [1, 1, 1, 1, 0],
               [1, 0, 0, 0, 0],
               [1, 1, 0, 0, 0],
               [1, 1, 1, 1, 1];
];
;
say "\nInput: @matrix = @matrix.raku()\nOutput: ", func( @matrix);
exit;

