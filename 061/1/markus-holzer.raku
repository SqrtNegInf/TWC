#!/usr/bin/env raku
sub MAIN( @n where { .elems > 0 && .all ~~ Numeric } = [ 2, 5, -1, 3 ] )
{
    ( 2 .. @n )
        .map(  -> $length  { |@n.rotor( $length => - $length + 1 ) } )
        .sort( -> $sublist { - [*] |$sublist } )
        .first
        .say;
}
