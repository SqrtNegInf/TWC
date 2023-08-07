#!/usr/bin/env raku

sub MAIN (@args = (2, 1, 3, 2) ) { put unique-sum(@args) }

sub unique-sum (@ints) {
   my $retval = 0;
   my $seen = BagHash.new;
   for @ints -> $x {
      given $seen{$x}++ {
         $retval += $x when 0;
         $retval -= $x when 1;
      }
   }
   return $retval;
}
