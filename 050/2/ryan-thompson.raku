#!/usr/bin/env raku

sub noble( *@L ) {
    @L.sort.pairs.grep({ @L.end - .key == .value })».value;
}

#say noble((1..$_).pick xx $_) for ^30;
say noble (19,11,9,7,20,3,17,16,2,14,1);
say "PWC test case: ", noble(2, 6, 1, 3);
