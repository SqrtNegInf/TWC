#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);
use List::MoreUtils qw(pairwise);

@ARGV = (2,4,5,7,9,8,-1,20,11,-15,33,11,10)
  unless scalar(grep /^[-]*\d+$/, @ARGV) >= 2;

# Silently ignore all non-integer values
my @N = grep /^[-]*\d+$/, @ARGV;

printf "Input: \@N = (%s)\n", join(',', @N);
printf "Output: %d\n", maxGap(@N);

sub maxGap {
  my @i = sort { $a <=> $b } @_;

  my @p1 = @i[0 .. scalar(@i)-2];
  my @p2 = @i[1 .. scalar(@i)-1];

  return max(pairwise { $b - $a } @p1, @p2);
} 
