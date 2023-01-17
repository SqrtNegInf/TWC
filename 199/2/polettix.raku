#!/usr/bin/env raku

sub MAIN ($x=7, $y=2, $z=3, @list = (3,0,1,1,9,7) ) { put good-triplets($x, $y, $z, @list) }

sub good-triplets ($x, $y, $z, *@list) {
   return [+] gather for 0 .. (@list - 3) -> \i {
      for (i + 1) .. (@list - 2) -> \j {
         next if (@list[i] - @list[j]).abs > $x;
         for (j + 1) ..^ @list -> \k {
            next if (@list[j] - @list[k]).abs > $y
                 || (@list[i] - @list[k]).abs > $z;
            take 1;
         }
      }
   };
}
