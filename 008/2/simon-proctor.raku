#!/usr/bin/env raku

.say for center( ('This', 'is', 'a test of the', 'centre function') );

sub center ( *@lines, :$len = max( @lines.map( *.codes ) ) ) {
    @lines.map( { "{ ' ' x ( ( $len - $_.codes ) div 2 )}$_" } );
}
