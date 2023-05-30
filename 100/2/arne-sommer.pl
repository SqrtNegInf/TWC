#!/usr/bin/env perl
use v5.36;

use String::Util 'trim';
use List::Util 'min';

my $tree = shift(@ARGV) // "1 | 2 4 | 6 4 9 | 5 1 7 2";
my @tree;

for my $row (split('\|', $tree))
{
  my @row = split(/\s+/, trim($row));
  push(@tree, \@row);
}

my @solutions;

traverse(0, 0, 0);

sub traverse($row, $col, $sum)
{
  $sum += $tree[$row][$col];
  
  if ($tree[$row+1])
  {
    traverse($row+1, $col,   $sum);
    traverse($row+1, $col+1, $sum);
  }
  else
  {
    push(@solutions, $sum);
  }
}

say min(@solutions);
