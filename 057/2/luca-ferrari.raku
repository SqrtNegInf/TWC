#!/usr/bin/env raku


sub prefix( @words, $len ) {
    for @words.classify( *.substr( 0, $len ) ) {
        if $_.value.elems == 1 {
            say "Prefix { $_.key } (length = $len)";    
        }
        else {
            prefix( $_.value, $len + 1 );
        }
    }
}

sub MAIN( ) {
    my @words =  [ "alphabet", "book", "carpet", "cadmium", "cadeau", "alpine" ];

    prefix( @words, 1 );

}
