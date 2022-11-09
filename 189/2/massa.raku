#!/usr/bin/env raku

use Test;

is-deeply (3, 3),        array-degree (1, 3, 3, 2);
is-deeply (1, 2, 1),     array-degree (1, 2, 1, 3);
is-deeply (2, 1, 2),     array-degree (1, 3, 2, 1, 2);
is-deeply (1, 1),        array-degree (1, 1, 2, 3, 2);
is-deeply (1, 2, 1, 1),  array-degree (2, 1, 2, 1, 1);

done-testing;

subset NonNegatives of List where .elems ≥ 2 && .all ~~ UInt;

sub degree-of(NonNegatives $_) {
    .Bag.values.max
}

sub array-degree(NonNegatives $_) {
    my \d = .&degree-of;
    for d .. .elems -> $n {
        .return with .rotor($n => -( $n - 1 )).grep({.&degree-of == d}).head
    }
}

