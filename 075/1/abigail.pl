#!/usr/bin/env perl
use v5.36;

use List::Util qw [sum];


sub possibilities ($target, @coins) {
    return $target == 0            ? 1
         : $target <  0 || !@coins ? 0
         : sum map {possibilities ($target - $_ * $coins [0],
                                    @coins [1 .. $#coins])}
                0 .. int ($target / $coins [0]);
}

say possibilities /[0-9]+/g while <DATA>;

__END__
6 1 2 4
