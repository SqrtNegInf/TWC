#!/usr/bin/env perl
use v5.36;

my @ARGV = <9 10 7 5 6 1>;
my $max = $ARGV[-1] - 1;
my @out = reverse grep { $_ > $max and $max = $_, 1 } reverse @ARGV;
print "@out\n";
