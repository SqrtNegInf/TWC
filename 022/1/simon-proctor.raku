#!/usr/bin/env raku

#| Calculate the first n pairs of "sexy" primes (being two primes seperated by 6)
multi sub MAIN (
    UInt $n = 10 #= Number to calculate
) {
    .say for (^Inf).grep( { $_.is-prime && ($_ + 6).is-prime } ).map( { ($_,$_+6).join(",") } )[^$n]; 
    #.say for (^Inf).hyper.grep( { $_.is-prime && ($_ + 6).is-prime } ).map( { ($_,$_+6).join(",") } )[^$n]; 
}
