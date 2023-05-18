#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

# Math::Prime::Util has a method returning the number of divisors of
# a given number. So, it's just a matter of trying all numbers in order
# and reporting the first 10 with 8 divisors.
#

use Math::Prime::Util qw [divisors];

8 == divisors (++ $::n) && say ($::n) && $::c ++ while $::c < 10;
