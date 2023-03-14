#!/usr/bin/env raku

sub MAIN( @citations where { @citations.grep( * ~~ Int ).elems == @citations.elems } =  (10,8,5,4,3) ) {
    @citations.sort.reverse.pairs.first( { $_.key >= $_.value  } ).key.say;
}
