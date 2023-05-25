#!/usr/bin/env perl
use v5.36;
no warnings;

# The first 15 numbers sum to 120. So, if we sum the numbers from the
# input, and subtract that from 120, we get the missing number.
#
# We make use of the fact that if we use a scalar as a number, Perl will
# try its best to turn that scalar into a number -- by looking if the
# beginning of the string looks like a number (and to use the value of
# that number). Warnings need to be surpressed though.
#
# See also: https://abigail.github.io/HTML/Perl-Weekly-Challenge/week-117-1.html
#

use List::Util qw [sum];

say 120 - sum <DATA>;

#
# An alternative one-liner, with no external modules, nor any hard
# coded dependency of the number of lines in the file:
#

# perl -nE '$;+=$.-$_;END{say$.+1+$;}'

__END__
11, Line Eleven
1, Line one
9, Line Nine
13, Line Thirteen
2, Line two
6, Line Six
8, Line Eight
10, Line Ten
7, Line Seven
4, Line Four
14, Line Fourteen
3, Line three
15, Line Fifteen
5, Line Five
