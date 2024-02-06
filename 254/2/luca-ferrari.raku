#!/usr/bin/env raku

sub MAIN( Str $word = 'Juniper') {
    my @reversed;
    my @vowels.push: |$word.lc.comb.grep( * ~~ / <[aeiou]> / ).reverse;

    for $word.comb {

	@reversed.push( $_ ) and next if ( $_.lc !~~ / <[aeiou]> / || @vowels.elems == 0 );
	@reversed.push: @vowels.shift if ( @vowels.elems > 0 );
    }

    @reversed.join.say;
}
