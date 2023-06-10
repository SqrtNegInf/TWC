#!/usr/bin/env perl
use v5.36;

my @N = (0 .. 9); # (2, 7, 9);
my $k = shift || 2;

for my $j ( 0 .. $#N )
{
     for my $i ( $j .. $#N )
     {
          next if $i == $j;
          print join(", ", $i, $j), $/ if $k == $N[$i] - $N[$j];

     }
}
