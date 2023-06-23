#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

for my $i (1..50){
	my $digitSum = sum split( //,$i);
	print "$i\n" unless $i % $digitSum;
}
