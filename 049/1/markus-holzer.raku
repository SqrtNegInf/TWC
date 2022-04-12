#!/usr/bin/env raku
sub MAIN( $n = 55 ) 
{
    say (1 .. Inf).map( *.base(2).Str ).first( * %% $n );
}
