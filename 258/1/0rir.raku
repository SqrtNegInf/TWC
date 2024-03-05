#!/usr/bin/env raku

use Test;

my @Test =
    # @int                      $exp
    (),                         0,      # c/b Int
    (1),                        0,
    (22),                       1,
    (10, 1, 111, 24, 1000),     3,
    (111, 1, 11111),            0,
    (2, 8, 1024, 256),          1,
;
plan @Test ÷ 2;

sub func( $a) {
    +@$a.grep( *.Str.chars %% 2 )
}

for @Test -> $in, $exp {
    is func(@$in), $exp, "$exp <- $in";
}

done-testing;
my $X = (2, 8, 1024, 256);

say "\nInput: @int = @$X.raku()\nOutput: &func($X)";
