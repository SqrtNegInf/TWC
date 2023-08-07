#!/usr/bin/env perl
use v5.24;

use warnings;
use experimental 'signatures';

say empty_array( (3, 4, 2) );

sub empty_array (@ints) {
   my @sorted = sort { $a <=> $b } @ints;
   my $n = 0;
   while (@ints) {
      my $item = shift @ints;
      if ($item == $sorted[0]) { shift @sorted     }
      else                     { push @ints, $item }
      ++$n;
   }
   return $n;
}
