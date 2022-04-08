#!/usr/bin/env raku
sub MAIN( @n = (2,3,4) )
{
    say [+] @n.combinations( 2 ).map: -> ( Int $a, Int $b )
    {
        ( $a +^ $b ).base( 2 ).indices( 1 )
    }
}
