#!/usr/bin/env perl
use v5.36;

use List::Util qw(all uniq);
 
my @sorted = uniq sort { $a <=> $b } (100, 4, 50, 3, 2);

my @longest;
my $longest = 0;
my @current = shift(@sorted);
my $current = $current[0];

for my $num (@sorted)
{
  if ($num == $current + 1)
  {
    push(@current, $num);
    $current = $num;
  }
  else
  {
    if (@current > $longest)
    {
      @longest = @current;
      $longest = @longest;
    }
    $current = $num;
    @current = ($num);
  }
}

say @longest > 1
  ? "(" . join(", ", @longest) . ")"
  : "0";
