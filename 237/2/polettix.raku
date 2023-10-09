#!/usr/bin/env raku

sub MAIN (@args = (1,3,5,2,1,3,1,5,5,5,4) ) { put greatness(@args) }

sub greatness (@inputs) {
   my %count-for;
   %count-for{$_}++ for @inputs;
   my @counts = %count-for{%count-for.keys.sort({$^a.Int <=> $^b.Int})};

   my $greatness = @inputs.elems;
   my $pool = 0;
   for @counts -> $count {
      next if $count <= $pool; # win and accumulate the same quantity
      $greatness -= $count - $pool; # not enough in pool, lose some
      $pool = $count;  # restart pool from this slot
   }
   return $greatness;
}
