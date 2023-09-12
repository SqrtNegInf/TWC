#!/usr/bin/env raku

sub MAIN( @words = ("aba", "aabb", "abcd", "bac", "aabc") ) {
    my %similars;
    for @words -> $word {
	my $key = $word.comb.sort.join;
	%similars{ $key }.push: $word;
    }

    say 'Similar words: ' ~ $_.join( ' <-> ' ) for %similars.values.grep( *.elems > 1 );
}
