#!/usr/bin/env raku

sub MAIN( Str :$string = "loveleetcode", Str :$char where { $char.chars == 1 } = 'e' ) {

    my @distances;
    my @matching;
    my @letters = $string.comb;

    @matching.push: $_ if ( $char eq @letters[ $_ ] ) for 0 ..^ @letters.elems;

    for 0 ..^ @letters.elems -> $me {
	@distances[ $me ] = 0 and next if ( $char ~~ @letters[ $me ] );
	@distances[ $me ] = @matching.map( { abs( $_ - $me ) } ).min;
    }

    @distances.join( ', ' ).say;
}
