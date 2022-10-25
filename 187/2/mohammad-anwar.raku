#!/usr/bin/env raku

use Test;

magical-triplets(<1 2 3 2>);

is magical-triplets(<1 2 3 2>), (3, 2, 2), 'Example 1';
is magical-triplets(<1 3 2>),   (),        'Example 2';
is magical-triplets(<1 1 2 3>), (),        'Example 3';
is magical-triplets(<2 4 3>),   (4, 3, 2), 'Example 4';

done-testing;

#
#
# METHOD

sub magical-triplets(@list) {
    my %entries = ();
    for @list.sort.combinations(3) -> ($x, $y, $z) {
        if $x + $y > $z &&
           $y + $z > $x &&
           $x + $z > $y {
            %entries{"$x:$y:$z"} = $x + $y + $z;
        }
    }

    return () if %entries.keys.elems == 0;

    return %entries
           .sort(*.values)
           .tail
           .key
           .split(":")
           .sort: { $^b leg $^a };
}
