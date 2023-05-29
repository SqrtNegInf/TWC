#!/usr/bin/env perl
use v5.36;

sub nthRoot($exp,$nr) {
    my $rootFloor = 1;
    while (($rootFloor+1)**$exp <= $nr) {$rootFloor++};
    return ($rootFloor ** $exp == $nr) ? ($rootFloor) : (exp ((log $nr)/$exp))
}

say nthRoot(5,34);
