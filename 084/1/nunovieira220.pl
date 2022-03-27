#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);

# Input
my $N = -1700;

# Reverse integer
my $MAX_INT = 2 ** 31;
my $multiplier = $N < 0 ? -1 : 1;
my $res = 0;

$res = scalar(reverse("".abs($N))) + 0 if($N < $MAX_INT);

# Output
say $res * $multiplier;
