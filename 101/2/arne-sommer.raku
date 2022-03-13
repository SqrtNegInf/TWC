#!/usr/bin/env raku

my ($x1, $y1, $x2, $y2, $x3, $y3) = flat [1,1],[-1,1],[0,-3];
my $x = 0; my $y = 0;

my $ABC = area($x1, $y1, $x2, $y2, $x3, $y3);
my $PBC = area($x,  $y,  $x2, $y2, $x3, $y3);
my $PAC = area($x1, $y1, $x,  $y,  $x3, $y3); 
my $PAB = area($x1, $y1, $x2, $y2, $x,  $y); 

say ($ABC == $PBC + $PAC + $PAB) ?? 1 !! 0;

sub area($x1, $y1, $x2, $y2, $x3, $y3) 
{ 
  return abs( ($x1 * ($y2 - $y3) + $x2 * ($y3 - $y1) + $x3 * ($y1 - $y2) ) / 2); 
} 
