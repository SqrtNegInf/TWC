#!/usr/bin/env perl
use v5.36;

use List::Util qw [sum];

# Preprocess factorials
my @fac = (1); $fac [$_] = $_ * $fac [$_ - 1] for 1 .. 8;

# Sum factorials of digits, and compare.
say +($_ == sum map {$fac [$_]} /[0-9]/g) ? 1 : 0 while <DATA>;

__END__
125
145
