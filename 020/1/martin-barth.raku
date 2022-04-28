#!/usr/bin/env raku

sub MAIN($str = 'bookkeeper') { say $str.comb( rx/ (\w) {} $0* / ) }
