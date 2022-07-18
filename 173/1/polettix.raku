#!/usr/bin/env raku

#sub MAIN (*@candidates) {
   put is-esthetic($_) ?? "$_ is esthetic" !! "$_ is NOT esthetic"
      for <5456 120 121 23456 2346 7654567 765467>;
#   return 0;
#}

sub is-esthetic ($candidate) {
   test-adjacents(-> $x, $y { abs($x - $y) == 1 }, $candidate.comb());
}

sub test-adjacents (&test, *@input) {
   for 1 ..^ @input -> $i {
      return False unless &test(|@input[$i - 1, $i]);
   }
   return True;
}
