#!/usr/bin/env raku

sub MAIN (@args = (1, 2, 3, 1, 2, 3, 7, 9, 10, 5, 10) ) { put magical-triplets(@args) }

sub magical-triplets (@n) {
   my ($best, $best-score);
   for @n.combinations(3) -> $comb {
      my $score = is-triangle($comb) or next;
      ($best, $best-score) = ($comb, $score)
         if (! defined $best) || ($best-score < $score);
   }
   $best //= [];
   return $best.sort({$^a <=> $^b}).reverse;
}

sub is-triangle ($x) {
   my ($A, $B, $C) = @$x;
   return 0 if
      $A >= $B + $C
      || $B >= $C + $A
      || $C >= $A + $B;
   return $A + $B + $C;
}
