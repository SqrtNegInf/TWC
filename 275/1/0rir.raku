#!/usr/bin/env raku

use Test;

my @Test =
    #   words                   disease         healthy count
    "Perl and Raku",            ('a',),         1,
    "Perl Weekly Challenge",    ('l', 'a'),     0,
    "Well done Team PWC",       ('l', 'o'),     2,
    "The joys of polyglottism", ('T',),         2,
    "The horrors of babel",     (),             4,

;
plan @Test ÷ 3;

only task( $sentence is copy, @poison --> Int) {
    + $sentence.words».contains( /:ignorecase @poison /).grep( !*);
}

for @Test -> $in, @poison, $exp {
    is task($in, @poison), $exp, "$exp <- $in [ @poison[]]";
}

done-testing;

my $sentence = "Perl and Raku";
my @key = ('p',);

say qq{\nInput: \$sentence = "Perl and Raku", @keys = @key[]\n}
    ~ "Output: ", task $sentence, @key;
