#!/usr/bin/env raku

use Test;
use Prime::Factor; # better than my simple implementation from challenge-159

constant TEST = True;

my constant @prime is export
        = 2, 3, { first * %% none(@_), (@_[*-1], *+2 … ∞)} … ∞;

sub home-prime( Int $n is copy where $n > 1 --> Int ) {
    until $n.is-prime {
        $n = ([~] prime-factors( $n)).Int;
    }
    $n;
}

if TEST {

    my @expected =
        1, 2, 3, 211, 5, 23, 7, 3331113965338635107, 311, 773, 11, 223,
        13, 13367, 1129, 31636373, 17, 233, 19, 3318308475676071413, 37,
        211, 23, 331319, 773, 3251, 13367, 227, 29, 547, 31, 241271, 311,
        31397, 1129, 71129, 37, 373, 313, 3314192745739, 41, 379, 43,
        22815088913, 3411949, 223, 47, 6161791591356884791277;

    plan  @expected.elems ;

    is True, True, 'NOOP: Tests are on test number.';
    my $i = 2;
    for 2 .. @expected.elems  {
        my $hp = home-prime $_;
        is $hp, @expected[$i -1], "hp $hp";
        ++ $i;
    }
    exit;
}

sub MAIN(Int $n where $n > 1 ) {
    say "The home prime of $n is ", home-prime( $n);
}

