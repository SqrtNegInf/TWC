#!/usr/bin/env perl

use v5.36;
my $x = 4;
my $y = 6;
my $ops_count = 0;
while (0 != $x && 0 != $y)
{
      if ($x >= $y) {$x -= $y; ++$ops_count;}
   elsif ($y >= $x) {$y -= $x; ++$ops_count;}
}
say $ops_count;
