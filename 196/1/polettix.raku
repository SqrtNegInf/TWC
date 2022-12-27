#!/usr/bin/env raku

sub MAIN (@args is copy = [1,4,6,4,3,5,10]) {
   @args = 3, 1, 4, 2 unless @args;
   say first-pattern132(@args);
}

sub first-pattern132 (@list) {
   for 0 .. (@list - 3) -> $low {
      for $low + 1 .. (@list - 2) -> $high {
         next if @list[$high] <= @list[$low] - 1;
         for $high + 1 ..^ @list -> $mid {
            return @list[$low, $high, $mid]
               if @list[$low] < @list[$mid] < @list[$high];
         }
      }
   }
   return ();
}
