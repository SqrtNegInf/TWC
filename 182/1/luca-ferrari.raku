#!/usr/bin/env raku

sub MAIN( @n = (1,2,4,2,4,1) ) {
    my %h;
    %h{ @n[ $_ ] } = $_ for 0 ..^ @n.elems;
    "{ %h{ $_ } }".say given %h.keys.max;
}
