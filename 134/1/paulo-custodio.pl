#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;

my @A050278 = sort {$a<=>$b} map {0+join('', @$_)} grep {$_->[0]!=0} permute(0..9);
splice(@A050278, 5, $#A050278);
say join("\n", @A050278);
