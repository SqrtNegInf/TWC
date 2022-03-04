#!/usr/bin/env raku

subset CommaSep of Str where { $_ ~~ m/^ [\d+] + % ',' $/ };

#| Given 2 comma seperated lists print 1 if they have not similar values
sub MAIN( $a = '1 2 5 3 4', $b = '4 6 7 8 9') {
    say +! (($a.split(",")) (&) ($b.split(","))).keys.elems;
}
