#!/usr/bin/env raku

use Test;

sub divisible-pairs-count( Int $divisor, List $list --> Int) {
    my $len := $list.elems;

    ( grep { (@$list[ .key] + @$list[.value]) %% $divisor}, # cull req B from
      grep { .key < .value < $len},                    # cull req A from
      map { Pair.new( $_[0], $_[1])}, (^@$list).combinations: 2
    ).Int
}

sub MAIN () {
    my @Test =
        { list => (4, 5, 1, 6), k => 2, exp => 2, },
        { list => (1, 2, 3, 4), k => 2, exp => 2, },
        { list => (1, 3, 4, 5), k => 3, exp => 2, },
        { list => (5, 1, 2, 3), k => 4, exp => 2, },
        { list => (7, 2, 4, 5), k => 4, exp => 1, },
        { list => (4, 2, 5, 1, 6), k => 7, exp => 2, },
        { list => (9, 6, 7, 2, 4, 5, 8, 3 ), k => 2, exp => 12, },
        { list => (3, 9, 7, 17, 6), k => 7, exp => 0, },
    ;
    plan +@Test;
    for @Test -> %t {
        is divisible-pairs-count( %t<k>, %t<list>), %t<exp>,
                "K: %t<k>  List: %t<list> --> %t<exp>";
    }
    done-testing;
}
