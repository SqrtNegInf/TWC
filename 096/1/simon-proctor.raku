#!/usr/bin/env raku

#| Given a string (please quote) reverse the order of words
sub MAIN( Str $s = 'The Weekly Challenge' ) {
    say $s.words.reverse.join(" ");
}
