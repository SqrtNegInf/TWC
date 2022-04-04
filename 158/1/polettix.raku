#!/usr/bin/env raku

sub MAIN (Int:D $M = 100) {
   (2 .. $M).grep({$_.is-prime && $_.comb.sum.is-prime}).join(', ').put;
}
