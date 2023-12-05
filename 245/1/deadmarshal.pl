#!/usr/bin/env perl
use v5.36;

sub sort_language{
  @{$_[0]}[map{$_-1}@{$_[1]}];
}

say join ' ', sort_language(['perl','c','python'],[2,1,3]);
say join ' ', sort_language(['c++','haskell','java'],[1,3,2]);

