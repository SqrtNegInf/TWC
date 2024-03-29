#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';

say matching_members( (1, 1, 4, 2, 1, 3) );

sub matching_members (@list) {
   my @sorted = sort { $a <=> $b } @list;
   return sum map { $list[$_] == $sorted[$_] ? 1 : 0 } 0 .. $#list;
}
