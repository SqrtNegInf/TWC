#!/usr/bin/env perl

use v5.36;
no warnings 'uninitialized';

use List::Util qw(first);
my @numbers=(2,3,-1);
while(defined( # search for index of next collision
	  my $collision=first {
	      $numbers[$_]>$numbers[$_+1] && $numbers[$_]>=0>=$numbers[$_+1]
	      }
	      0..@numbers-2
      )
    ){
    splice @numbers, $collision + 1, 1  if $numbers[$collision] > -$numbers[$collision+1];
    splice @numbers, $collision, 1      if $numbers[$collision] < -$numbers[$collision+1];
    splice @numbers, $collision, 2      if $numbers[$collision] == -$numbers[$collision+1];
}
say "@numbers"
