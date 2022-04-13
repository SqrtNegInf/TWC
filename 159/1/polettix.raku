#!/usr/bin/env raku

sub MAIN (Int:D \n = 8) { farey-sequence(n).join(', ').put }

sub farey-sequence (Int:D \n) {
   my ($a, $b, $c, $d) = (0, 1, 1, n);
   gather {
      take "$a/$b";
      while $c <= n {
         my $k = ((n + $b) / $d).Int;
         ($a, $b, $c, $d) = $c, $d, $k * $c - $a, $k * $d - $b;
         take "$a/$b";
      }
   }
}
