#!/usr/bin/env raku

sub MAIN( Int $n where { $n > 0 } = 100 ) {
    (2 .. $n).grep( *.is-prime ).elems.say;
}
