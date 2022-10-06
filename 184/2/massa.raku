#!/usr/bin/env raku

use Test;

is-deeply split-array('a 1 2 b 0', '3 c 4 d'),
   ( [[1,2,0], [3,4]], [['a','b'], ['c','d']] ),
   'Example 1';

is-deeply split-array('1 2', 'p q r', 's 3', '4 5 t'),
   ( [[1,2], [3], [4,5]], [['p','q','r'], ['s'], ['t']] ),
   'Example 2';

done-testing;

sub split-array(+@list) {
    .map({.{0} or Empty})».map(+ *)».Array.Array, .map({.{1} or Empty}).Array with [ @list.map: { .split(/\s+/).categorize({+ !m/\d/}) } ]
}
