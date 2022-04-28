#!/usr/bin/env raku

sub MAIN($str = 'bookkeeper') { $str.comb(/(.)$0*/).say }
