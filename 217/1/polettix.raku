#!/usr/bin/env raku


my @matrix = ([3, 1, 2], [5, 2, 4], [0, 1, 3]);
put third-smallest(@matrix);

sub third-smallest (@matrix) {
   my @three-smallest;
   for @matrix -> $row {
      for @$row -> $item {
         my $idx = @three-smallest.elems;
         --$idx while $idx > 0 && @three-smallest[$idx - 1] > $item;
         next if $idx > 2;
         @three-smallest.splice($idx, 0, $item);
         @three-smallest.pop while @three-smallest > 3;
      }
   }
   return @three-smallest[*-1];
}
