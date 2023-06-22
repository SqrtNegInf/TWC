#!/usr/bin/env perl
use v5.36;

# Solution:
# We are going to build a line where X = C and Y = F.
# It will go through two points.
# Freezing temperature will be our first point,
my $x1 = 0;
my $y1 = 32;

# And boiling temperature will be the second.
my $x2 = 100;
my $y2 = 212;

# Our line will be formulated with y = m*x + b
# where m is slope
my $m = ($y2-$y1) / ($x2-$x1);

# and b is value of y when x is 0
# (we already know this, because x1 is 0)
my $b = $y1;

# We need a point on this line such that y = x (i.e. F = C).
# Plugging in y in place of x, we get..
# y = m*y + b
# (1-m)*y = b
# y = b / (1-m)
my $intersection = $b / (1-$m);

print "$intersection C = $intersection F\n"; # -40
