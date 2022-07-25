#!/usr/bin/env raku

say (^Inf).grep({ $_ == [+] .comb Z** 1.. .chars }).head(18);
#say (^Inf).hyper.grep({ $_ == [+] .comb Z** 1.. .chars }).head(19);
