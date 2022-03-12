#!/usr/bin/env raku
use v6;

# run <script> <exponent> <number>

sub nthRoot($exp,$nr) {
    my $rootFloor = (1...{($_+1) ** $exp > $nr}).[*-1];
    return ($rootFloor ** $exp == $nr) ?? ($rootFloor) !! (exp ((log $nr)/$exp))
}

say nthRoot(|5,34);
