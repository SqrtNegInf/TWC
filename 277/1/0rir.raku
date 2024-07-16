#!/usr/bin/env raku

use Test;

my @Test =
  # exe      list / list
     0, (), (),
     0, (), < Pi is positive and is long >,
     1, ('red',), ('Red', 'dog'),
     2, ("Perl", "is", "my", "friend"),
        ("Perl", "and", "Raku", "are", "friend"),
     1, ("Perl", "and", "Python", "are", "very", "similar"),
        ("Python", "is", "top", "in", "guest", "languages"),
     0, ("Perl", "is", "imperative", "Lisp", "is", "functional"),
        ("Crystal", "is", "similar", "to", "Ruby"),
;
plan @Test ÷ 3;

sub task( @a, @b --> Int) {
    (   (@a».fc).BagHash.grep( *.value == 1 )
            ∩
        (@b».fc).BagHash.grep( *.value == 1 )
    ).elems;
}

for @Test -> $exp, @a, @b, {
    is task(@a, @b), $exp, "$exp <- @a[] +/+ @b[]";
}

done-testing;

my @word1 = < I am positive>;
my @word2 = < Pi is positive>;

say   "\nInput: @words1 = @word1.List.raku()"
  ~   "\n       @words2 = @word2.List.raku()"
  ~   "\n Output: ", task(@word1, @word2);
