#!/usr/bin/env raku

#sub MAIN( Str $string where { $string.chars > 0 } ) {
my $string = 'aabb';
    'True'.say and exit if ( $string ~~ / b / && $string !~~ / b .* a / );
    'False'.say;

#}
