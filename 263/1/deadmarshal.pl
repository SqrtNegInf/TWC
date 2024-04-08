#!/usr/bin/env perl

use v5.36;

sub target_index{
  my @sorted = sort{$a <=> $b} @{$_[0]};
  map{$sorted[$_] == $_[1] ? $_ : ()}0..$#{$_[0]};
}

say target_index([1,5,3,2,4,2],2);
say target_index([1,2,4,3,5],6);
say target_index([5,3,2,4,2,1],4);

