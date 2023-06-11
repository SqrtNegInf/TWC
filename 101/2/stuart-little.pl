#!/usr/bin/env perl
use v5.36;

sub areaTr2($x1,$y1,$x2,$y2,$x3,$y3) {
    abs(($y3-$y1)*($x2-$x1) - ($y2-$y1)*($x3-$x1))
}

my ($x1,$y1,$x2,$y2,$x3,$y3) = (1,1,-1,1,0,-3,0,0);

say 0+(areaTr2(0,0,$x1,$y1,$x2,$y2) + areaTr2(0,0,$x2,$y2,$x3,$y3) + areaTr2(0,0,$x3,$y3,$x1,$y1) == areaTr2($x1,$y1,$x2,$y2,$x3,$y3));
