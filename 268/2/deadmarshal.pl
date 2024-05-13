#!/usr/bin/env perl
use v5.36;

sub number_game{
  my @arr = sort{$a <=> $b} @{$_[0]};
  my @ret;
  push @ret,reverse splice @arr,0,2 while(@arr);
  @ret
}

say join ' ', number_game([2,5,3,4]);
say join ' ', number_game([9,4,1,3,6,4,6,1]);
say join ' ', number_game([1,2,2,3]);

