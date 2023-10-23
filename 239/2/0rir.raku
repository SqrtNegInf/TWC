#!/usr/bin/env raku

use Test;

my @Test =
    {   str     => <ad bd aaab baa badab>,
        valid   => "ab",
        exp     => 2,
    },
    {   str     => ("a", "b", "c", "ab", "ac", "bc", "abc"),
        valid   => "abc",
        exp     => 7,
    },
    {   str     => ("cc", "acd", "b", "ba", "bac", "bad", "ac", "d"),
        valid   => "cad",
        exp     => 4,
    },
;

plan +@Test;

sub func( @str, $valid --> Any) {
    my $ok = $valid.comb.Set;
    @str.map( *.comb.Set ⊆ $ok).grep( *.so).elems;
}

for @Test -> %h {
    is func(%h<str>, %h<valid>), %h<exp>, "%h<exp> <= %h<valid>  <- %h<str>";
}

done-testing;
my @str = < alfhja asdflkj alsdjf salkjf lssksaj >;
my $allowed = "alsdkfj";
say "\nInput: @str = @str[]\n     \$allowed = $allowed\nOutput: ",
        &func( @str, $allowed);
