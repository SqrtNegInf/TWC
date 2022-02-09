#!/usr/bin/env raku

#sub MAIN(  *@n where { @n.elems %% 2 && @n.grep( * ~~ Int ).elems == @n.elems } ) {
    my @n = <1 2 3 4 5 6>;
    ( [+] ( @n[ 0 .. @n.elems / 2 - 1 ] Z* @n[ @n.elems / 2 .. * - 1 ] ) ).say;
#}
