#!/usr/bin/env raku

sub MAIN( @numbers = (0, 2, 1, 5, 3, 4) ) {
    my @new;
    @new[ $_ ] = @numbers[ @numbers[ $_ ] ] for 0 ..^ @numbers.elems;
    @new.join( ', ' ).say;
}
