#!/usr/bin/env raku

sub MAIN (

Str $haystack = "perlweeklychallenge",
@needles = ("weekly", "challenge", "perl")
) {
    .say for ( @needles.map( { $_ => $haystack.index($_) } ).grep( { $_.value.defined } ).sort( { $^a.value <=> $^b.value } ).map( *.key ) ) || [0];
}
