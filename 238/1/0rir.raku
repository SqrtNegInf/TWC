#!/usr/bin/env raku

use Test;

my @Test =
        #in                ex;
    (1, 2, 3, 4, 5),    (1, 3, 6, 10, 15),
    (1, 1, 1, 1, 1),    (1, 2, 3, 4, 5),
    (0, -1, 1, 2),      (0, -1, 0, 2),
;

plan @Test ÷ 2;

sub func( List $in ) {
    $in.map(
        { state $r += $_; $r<>; }
    ).List;
}

for @Test -> $in, @exp {
    is func($in), @exp, "@exp.raku() <- $in";
}

done-testing;

my $int = @Test[0];
say "\nInput: @int = $int\nOutput: ", func( $int);

