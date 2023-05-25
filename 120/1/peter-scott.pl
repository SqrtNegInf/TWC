#!/usr/bin/env perl
use v5.36;

my $x = shift // 101;
my $y = 0;
for ( 0 .. 3 )
{
  my $m = 3 << (2*$_);
  my $t = $x & $m;
  my $s = $t << 1 | $t >> 1;
  $y |= $s & $m;
}
say $y;

