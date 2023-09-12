#!/usr/bin/env raku

use Test;

my @Test =
    0, ( "a",),
    1, ( "a", "a"),
    0, ("nba", "cba", "dba"),
    2, ("aba", "aabb", "abcd", "bac", "aabc"),
    3, ("aabb", "ab", "ba"),
    4, ("aba", "aabb", "abc", "bac", "aabc"),
    11, ("ab", "ba", "ac", "ca", "aac", "aacc", "aaac"),

;
plan @Test ÷ 2;

my $i = 3;
my @p = 0,0,1,3, -> $a { $a+$i++} … ∞;

sub similar( @a --> Int) {
    my @c = @a.map( *.split('', :skip-empty).unique.sort);
    my %h;
    for @c { quietly %h{$_}++  }
    sum @p[%h.values];
}

for @Test -> $exp, @in {
    is similar(@in), $exp, "$exp <- @in.raku()";
}
done-testing;

my @word = "ab", "ba", "abb", "bab", "ac", "ca", "aac", "aacc", "aaac", "accc";


say "\n\nInput: @word = @word[]\nOutput: ", similar( @word);
