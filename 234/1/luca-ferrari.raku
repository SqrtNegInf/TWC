#!/usr/bin/env raku

sub MAIN( @words = ("java", "javascript", "julia") ) {
    my %chars;
    for @words -> $current_word {
	for $current_word.comb.unique.sort {
	    %chars{ $_ }.push: $current_word;
	}
    }

    for %chars.kv -> $char, $list {
	say $char if $list.elems == @words.elems;
    }

}
