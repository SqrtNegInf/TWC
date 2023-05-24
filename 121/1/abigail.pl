#!/usr/bin/env perl
use v5.36;

#
# Third week in a row with some trivial bit fiddling... 
# 
# Restricting ourselves to 8 bit input doesn't make the code any simpler
# -- this code works up to $m = 2^63 - 1,  $n = 63 (or 2^31 - 1/31 if
# you're running a 32-bit integer perl).
#

while (<DATA>) {
my @F = split ' ', $_;
say $_=$F[0]^1<<--$F[1]
}

__END__
12 3
18 4
