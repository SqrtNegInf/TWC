#!/usr/bin/env perl
use v5.36;

#my ($x1, $y1, $x2, $y2, $x3, $y3) = @ARGV;
#my ($x1, $y1, $x2, $y2, $x3, $y3, $x, $y) = (0, 1, 1, 0, 2, 2);
my ($x1, $y1, $x2, $y2, $x3, $y3, $x, $y) = (1, 1, -1, 1, 0, -3);
#my ($x1, $y1, $x2, $y2, $x3, $y3, $x, $y) = (0, 1, 2, 0, -6, 0);

# Shamelessly copying from http://totologic.blogspot.com/2014/01/accurate-point-in-triangle-test.html

my $denominator = ($y2 - $y3)*($x1 - $x3) + ($x3 - $x2)*($y1 - $y3);
my $A = (($y2 - $y3)*(0 - $x3) + ($x3 - $x2)*(0 - $y3)) / $denominator;
my $B = (($y3 - $y1)*(0 - $x3) + ($x1 - $x3)*(0 - $y3)) / $denominator;
my $C = 1 - $A - $B;

say 0 <= $A && $A <= 1 && 0 <= $B && $B <= 1 && 0 <= $C && $C <= 1 ? 1 : 0;
