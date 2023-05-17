#!/usr/bin/env perl
use v5.36;

#
# Math::Prime::Util::PrimeArray gives us a tied array, so that it's
# Nth element is the Nth prime. Which is all we need.
#
# Still far less efficient (both in loc and run time) than just "say 104743"
#

use Math::Prime::Util::PrimeArray;
tie my @p, 'Math::Prime::Util::PrimeArray';
say $p [10000];

__END__
