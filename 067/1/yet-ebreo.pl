#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);

my ($m,$n) = @ARGV;

if (not $m && $n) {
    ($m,$n) = (5,3) 
}

my @arr = (1..$m);
print "@{$_}\n" for combinations(\@arr,$n)
