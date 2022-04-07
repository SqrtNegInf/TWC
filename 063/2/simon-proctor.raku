#!/usr/bin/env raku

#| Given a string home many rotations are needed (see the challenge for the rules on rotations).
sub MAIN ( Str $input where m!^<[xy]>+$! = 'xyxx' ) {
    my Int $i = 1;
    my Str $rotated = rotate_string( $input, $i );

    while ( $rotated !~~ $input ) {
        $i++;
        $rotated = rotate_string( $rotated, $i );
    }
    
    say $i;
}

sub rotate_string( Str $rotated, Int $i ) {
    my $midpoint = $i % $rotated.codes;
    "{$rotated.substr($midpoint,$rotated.codes-$midpoint)}{$rotated.substr(0,$midpoint)}";
}
