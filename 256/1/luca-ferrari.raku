#!/usr/bin/env raku

sub MAIN( @words = <ab de ed bc>) {
    my %counting;
    for @words -> $current-word {
	%counting{ $current-word } = @words.grep( { $_ ~~ $current-word.flip } ).elems;
    }

    %counting.values.max.say;
}
