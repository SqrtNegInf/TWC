#!/usr/bin/env perl
use v5.36;

sub bitwise_or{
  (grep{($_ & 1) == 0} @{$_[0]}) > 1
}

printf "%d\n",bitwise_or([1,2,3,4,5]);
printf "%d\n",bitwise_or([2,3,8,16]);
printf "%d\n",bitwise_or([1,2,5,7,9]);

