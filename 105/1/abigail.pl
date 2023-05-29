#!/usr/bin/env perl
use v5.36;

# Input will consist of lines; each line will have two numbers, N and k, N > 0,
# k > 0. For each line of input, we output a line with the Nth root of k.
#
# We're not doing any input validations; we're assuming it's correct.
#

#
# To find the Nth root of a number k, we just raise k to the power 1/N
#

$_ = [split], say $$_ [1] ** (1 / $$_ [0]) while <DATA>;

__END__
5 34
