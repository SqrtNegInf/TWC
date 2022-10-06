#!/usr/bin/env raku

sub MAIN( @strings = ( 'a 1 2 b 0', '3 c 4 d') ) {
    my @numbers;
    my @letters;

    for @strings -> $current-string {
        my ( @n, @l );
        for $current-string.comb {
            @n.push: $_ if ( $_ ~~ / \d / );
            @l.push: $_ if ( $_ ~~ / <[a..z]> / );
        }

    @numbers.push: [ @n ] if ( @n );
    @letters.push: [ @l ] if ( @l );
    }

    @numbers.join( ", " ).say;
    @letters.join( ", " ).say;
}
