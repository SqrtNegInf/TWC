#!/usr/bin/env raku

sub MAIN( Str $file-name = 'example.txt' ) {
    my %lines = $file-name.IO.lines.map: { my ( $number, $content ) = .split( ',' );
                                           $number.Int => $content.trim;
                                         }

    say "Missing line $_ !" if %lines{ $_ }:!exists
               for 1 .. %lines.keys.sort(  *.Int <=> *.Int )[ * - 1 ];
    
}
