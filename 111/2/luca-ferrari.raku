#!/usr/bin/env raku

sub MAIN( Str $words-file-name = 'words' ) {
    my %words;

    %words{ $_.chars }.push: $_ if ( $_.fc ~~ $_.fc.split( '' ).sort.join )
                  for $words-file-name.IO.lines();

    %words{ %words.keys.sort[ * - 1 ] }.join( "\n" ).say;
}
