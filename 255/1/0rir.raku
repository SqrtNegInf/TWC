#!/usr/bin/env raku

use Test;

my @Test =
    "Perl",     "Preel",        "e",
    "Weekly",   "Weeakly",      "a",
    "Box",      "Boxy",         "y",
;

plan  @Test ÷ 3 + 3;

sub func( Any:D $long  where *.chars > 1,
          Any:D $short where  *.chars == $long.chars -1 --> Str) {
    return ($long.comb.Bag ∖ $short.comb.Bag).keys[0];
}

for @Test -> $short, $long, $exp {
    is func($long, $short), $exp, "$exp <- $long,  $short";
}
dies-ok { func( 'abc', 'abc') }, 'Bad data';
dies-ok { func( 'abc', 'abcd') }, 'Bad data';
dies-ok { func( 'a', 'a') }, 'Bad data';

done-testing;
my $s = 'abcdefghijjk';
my $t = 'abcdefghijjjk';
qq{\nInput: \$s = "$s" \$t = "$t"\nOutput: &func($t,$s)}.say;
