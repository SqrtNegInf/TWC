#!/usr/bin/env raku

use Test;

my @Test =
    ("pay", "attention", "practice", "attend"),     "",      4,
    ("pay", "attention", "practice", "attend"),     "at",    2,
    ("pay", "attention", "practice", "attend"),     "at",    2,
    ("janet", "julia",   "java", "javascript"),     "j",     4,
    ("janet", "julia",   "java", "javascript"),     "ja",    3,
    ("janet", "julia",   "java", "javascript"),     "jav",   2,
    ("janet", "julia",   "java", "javascript"),     "ju",    1,
    ("janet", "julia",   "java", "javascript"),     "je",    0,
;
plan @Test ÷ 3;

sub func( @w, $p --> Int) {
    @w.grep( * ~~ / ^ $p /, :k ).elems;
}

for @Test -> @in, $pref, $exp {
    is func(@in, $pref), $exp,
            "$exp <- "~ $pref.fmt ~ "∘\t@in.raku()";
}
done-testing;

my @word = ("pay", "attention", "practice", "attend");
my $prefix = 'pa';
say "\nInput: @words  = @word[]\n\$prefix = $prefix\nOuput: ",
        func(@word, $prefix);
