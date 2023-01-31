#!/usr/bin/env raku

sub missing-numbers(@arr)
{
  ((0..max(max(@arr),@arr.elems)) (-) @arr).keys;
}

say missing-numbers([0,1,3]);
say missing-numbers([0,1]);
say missing-numbers( (0, 1, 3, 5, 9, 10) );

