#!/usr/bin/env raku

sub divisors($n) { (1..^$n).grep($n %% *) }

say (2..*).map({ $_, $_.&divisors.sum }).grep({ $_[0] < $_[1] && $_[1].&divisors.sum==$_[0] }).[(@*ARGS) ?? (0..@*ARGS[0].Int) !! 0]
