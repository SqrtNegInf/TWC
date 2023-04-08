#!/usr/bin/env perl
use v5.36;
use warnings;
use experimental 'signatures';

say third_highest((5,4,4,3));

sub third_highest (@array) {
   my @highest;
   ITEM:
   for (@array) {
      my $x = $_; # work with a copy
      for my $i (0 .. $#highest) {
         next ITEM if $x == $highest[$i];
         ($x, $highest[$i]) = ($highest[$i], $x) if $x > $highest[$i];
      }
      push @highest, $x if @highest < 3;
   }
   return @highest == 3 ? $highest[2]
         : @highest > 0 ? $highest[0]
         :                 undef;
}
