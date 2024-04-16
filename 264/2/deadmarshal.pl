#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

sub target_array{
  my @ret;
  splice @ret,$_[1]->[$_],0,$_[0]->[$_] foreach(0..$#{$_[1]});
  @ret
}

say target_array([0,1,2,3,4],[0,1,2,2,1]);
say target_array([1,2,3,4,0],[0,1,2,3,0]);
say target_array([1],[0]);

