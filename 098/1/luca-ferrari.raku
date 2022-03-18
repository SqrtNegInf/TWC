#!/usr/bin/env raku


sub readN( Str $file-name, Int $how-many-chars where { $how-many-chars >= 1 } ) {
    state %handles = ();
    %handles{ $file-name } //= $file-name.IO.open;
    return %handles{ $file-name }.readchars: $how-many-chars;
}

sub MAIN( Str $file-name  = 'input.txt') {
    say readN( $file-name, 3 );
    say readN( $file-name, 3 );
}
