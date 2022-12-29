#!/usr/bin/env raku

say range-list(<1 2 3 6 7 9>);

sub range-list (@array) {
   gather {
      my ($begin, $end);
      for @array -> $v {
         if defined($end) && $end == $v - 1 {
            $end = $v;
         }
         else {
            take [$begin, $end] if defined($begin) && $begin < $end;
            $begin = $end = $v;
         }
      }
      take [$begin, $end] if defined($begin) && $begin < $end;
   }
}
