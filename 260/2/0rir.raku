#!/usr/bin/env raku

use Test;

my @Test =
    Str,        Int,
    '',         Int,
    'XYZ',      1,
    "ooO",      1,
    'Deet',     1,
    'CAT',      3,
    'TADE',     19,
    'Cat',      3,
    'GOOGLE',   88,
    'SECRET',   255,
;
plan @Test ÷ 2;

# grind it
multi gen( Str:U $a                -->Int) { Int }
multi gen( Str:D $a where * eqv '' -->Int) { Int }
multi gen( Str:D $a -->Int) {
    ( $a.fc.comb.permutations».join).unique.sort.first( $a.fc, :k) + 1
}

for @Test -> $in, $exp {
   is gen($in), gen($in), "$exp.raku() <- $in.raku()";
}

done-testing;
my $word = 'Supercad';
say "\nInput: \$word = $word\nOutput: &gen($word)";


