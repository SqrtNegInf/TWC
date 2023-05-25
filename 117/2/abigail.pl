#!/usr/bin/env perl
use v5.36;

#
# Consider the nodes in the triangle to coordinates. The top of the
# triangle has coordinates ($N, 0), the bottom right has coordinates (0, 0).
# The bottom left will have coordinates (0, $N).
#
# We now make a recursive method, "steps", which takes three arguments:
# the coordinates of the current point, and the steps we took to get
# there. The first call is "steps ($N, 0, '')": starting at the top,
# and we did not make any steps to get there.
#
# Now, if we are at (0, 0), we print the path we took to get there.
#
# Else, we recurse up to three times:
#   - Unless we are at the bottom row ($x == 0), we take a step
#     down-right. The first coordinate decreases by one, while 
#     the second stays the same.
#   - Unless we are at the bottom row ($x == 0), we take a step
#     down-left. The first coordinate decreases by one, while 
#     we increment the second by one.
#   - Unless we are at the right end of a row ($y == 0), we take
#     a step to the right. The first coordinate stays the same,
#     the second decreases by one.
# In each of the calls, we add the direction we took ("R", "L", or "H"),
# to path.
#
# 
# We will be reading a single line of input ($N)
#
# See also: https://abigail.github.io/HTML/Perl-Weekly-Challenge/week-117-2.html
#

sub steps ($x, $y, $path) {
    say    $path                        if $x == $y == 0;
    steps ($x - 1, $y,     $path . "R") if $x > 0;
    steps ($x - 1, $y + 1, $path . "L") if $x > 0;
    steps ($x,     $y - 1, $path . "H") if $y > 0;
}

steps (3, 0, "");
