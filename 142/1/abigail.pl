#!/usr/bin/env perl
use v5.36;

# This is the third week in a row where me need the divisors
# of a number. Kind of boring....
#
# This is just a one liner, taking input from standard input.
#
# Math::Prime::divisors gives us the divisors of the first number;
# then it's a matter of grepping the ones ending with the second number.
#
#perl -MMath::Prime::Util=divisors -pale '$_ = grep {/$F[1]$/} divisors $F[0]'

use Math::Prime::Util 'divisors';
my @F= <24 2>;
print "$_ " for grep {/$F[1]$/} divisors $F[0];
print "\n";
