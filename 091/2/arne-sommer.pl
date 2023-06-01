#!/usr/bin/env perl
use v5.36;

use List::Util qw(all);

#die "Non-negative integers only" unless all { $ ~= /^\d+$/ } @ARGV;

my $index = 0;

my @ARGV = <1 2 1 2>;

while (1)
{
  if ($index == @ARGV -1) { say 1; last; }

  if (defined $ARGV[$index] && $ARGV[$index])
  {
    $index += $ARGV[$index];
  }
  else
  {  
    say 0; last;
  }
}
