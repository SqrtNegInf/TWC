#!/usr/bin/env raku
use Test;

is-deeply array-degree(1, 3, 3, 2),    ((3, 3),);
is-deeply array-degree(1, 2, 1, 3),    ((1, 2, 1),);
is-deeply array-degree(1, 3, 2, 1, 2), ((2, 1, 2),);
is-deeply array-degree(1, 1, 2, 3, 2), ((1, 1),);
is-deeply array-degree(2, 1, 2, 1, 1), ((1, 2, 1, 1),);
is-deeply array-degree(7, 7, 7, 1, 1, 1, 5, 5, 5, 9, 9, 9), ((1, 1, 1), (5, 5, 5), (7, 7, 7), (9, 9, 9));
is-deeply array-degree(9, 3, 1, 3, 9, 8, 6, 7, 6, 0, 2, 5, 2, 0), ((2, 5, 2), (3, 1, 3), (6, 7, 6));
is-deeply array-degree(8, 5, 1, 2, 5, 1, 2, 9, 3, 4, 0, 7, 4, 0, 7, 8), ((0, 7, 4, 0), (1, 2, 5, 1), (2, 5, 1, 2), (4, 0, 7, 4), (5, 1, 2, 5), (7, 4, 0, 7)); 
is-deeply array-degree(1, 6, 1, 2, 9, 3, 9, 9, 3, 8, 8, 5, 8, 1, 2, 7, 7, 0, 0, 2, 0, 6), ((0, 0, 2, 0), (8, 8, 5, 8), (9, 3, 9, 9));

sub array-degree(+$array)
{
    my $a := $array.Bag.maxpairs>>.key;

    my $b := $a.map({ $array.grep($_, :k).minmax });

    my $c := $b.cache>>.elems.minpairs>>.key;  

    sort $array[ $b[$c] ]
}
