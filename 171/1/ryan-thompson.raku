#!/usr/bin/env raku

sub MAIN(Int $lim = 10000) {
    my @div_sum; # Sum of divisors for each number

    for 1...$lim -> $n {
        @div_sum[$n*$_] += $n for 1..$lim/$n+1;
        $n.say if $n % 2 and 2*$n <= @div_sum[$n];
    }

}
