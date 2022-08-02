#!/usr/bin/env raku

use Test;

is [
     3, 9, 15, 27, 39, 81, 111, 183, 243,
     255, 327, 363, 471, 729, 2187, 2199,
#     3063, 4359, 4375, 5571
   ], first-perfect-totient(16);

done-testing;

#
#
# METHODS

sub is-coprime(Int $a, Int $b --> Bool) {
    return ($a gcd $b) == 1;
}

#
# Simply coded as shown in the example in the wiki page:
# https://en.wikipedia.org/wiki/Perfect_totient_number

sub is-perfect-totient(Int $n --> Bool) {
    my Int $i = $n;
    my Int $s = 0;
    while $i >= 1 {
        my Int @coprimes = ();
        for 1..^$i {
            @coprimes.push: $_ if is-coprime $_, $i;
        }
        $i = @coprimes.elems;
        $s = $s + $i;
    }

    return $n == $s;
}

sub first-perfect-totient(Int $n --> Array[Int]) {
    my Int @pt = ();
    my Int $i  = 1;
    while @pt.elems < $n {
        @pt.push: $i if is-perfect-totient $i;
        $i++;
    }

    return @pt;
}
