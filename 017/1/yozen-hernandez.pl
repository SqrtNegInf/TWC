#!/usr/bin/env perl

use v5.24;
use strict;
use warnings;
use feature qw(signatures);
no warnings "experimental::signatures";
use Carp;
use Memoize;

memoize("A");

sub A ( $m = 3, $n = 3) {
    croak "Error: function only defined for nonnegative integers."
        . "(got: m = $m, n = $n)"
        if ( $m < 0 && $n < 0 );

    # A(m, n) = n + 1                  if m = 0
    return $n + 1 if $m == 0;

    # A(m, n) = A(m - 1, 1)            if m > 0 and n = 0
    # A(m, n) = A(m - 1, A(m, n - 1))  if m > 0 and n > 0
    return A( $m - 1, ($n == 0) ? 1 : A($m, $n-1) );
}

sub A_no_memo ( $m = 3, $n = 3 ) {
    croak "Error: function only defined for nonnegative integers."
        . "(got: m = $m, n = $n)"
        if ( $m < 0 && $n < 0 );

    # A(m, n) = n + 1                  if m = 0
    return $n + 1 if $m == 0;

    # A(m, n) = A(m - 1, 1)            if m > 0 and n = 0
    # A(m, n) = A(m - 1, A(m, n - 1))  if m > 0 and n > 0
    return A( $m - 1, ($n == 0) ? 1 : A($m, $n-1) );
}

use Test::More tests => 5;
ok(A(1,2) == 4, "A(1,2) == 4");
ok(A(2,2) == 7, "A(2,2) == 7");
ok(A(2,4) == 11, "A(2,4) == 11");
ok(A(3,3) == 61, "A(3,3) == 61");
ok(A(3,4) == 125, "A(3,4) == 125");
