#!/usr/bin/env raku

sub MAIN( UInt $n = 4) {
     (^(2**$n)).map( { sprintf("\%0{$n}d", $_.base(2) ) } ).join(", ").say;
}
