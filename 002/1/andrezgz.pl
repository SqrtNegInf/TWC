#!/usr/bin/env perl

use v5.36;

# Non-numeric data
# 0a     -> 0a
# a      -> a

# Non-positive numbers
# 0      -> 0
# 0.     -> 0.
# 0.0    -> 0.0
# 00     -> 00
# 00.    -> 00.
# 00.0   -> 00.0
# -01    -> -01
# -01.   -> -01.
# -01.0  -> -01.0

# Leading zeros on positive numbers
# 01     -> 1
# 01.    -> 1.
# 01.0   -> 1.0
# 010.0  -> 10.0
# 00.1   -> 0.1

# + All the above with a comma instead of a dot

#use strict;
#use feature 'say';

say s/^0+([1-9]*[0-9]+(:?[.,]\d*)?)$/$1/r for <0.0 0a 01 -01 00.1>;
