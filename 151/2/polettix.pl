#!/usr/bin/env perl
use v5.36;
use Memoize 'memoize';
use List::Util 'max';

memoize('rob_the_house');
sub rob_the_house ($list, $start = 0) {
   return 0 if $start > $list->$#*;
   return $list->[$start]
      + max(rob_the_house($list, $start + 2),
            rob_the_house($list, $start + 3));
}

say rob_the_house([4, 2, 3, 6, 5, 3]);
