#!/usr/bin/env perl
use v5.36;
#
# Task 1: "3 Sum
#
# Given an array @L of integers, and a target T. Write a script to find
# all unique triplets such that a + b + c is same as the target T. Also
# make sure a <= b <= c.
# 
# Example:
# 
# 
# One such triplet for target 0 i.e. -10 + 2 + 8 = 0.
# "
# 
# My notes: Fine.  The obvious way of achieving a<=b<=c in all
# answers is to sort @L.
# 

my $t = 0;
my @l = (-25, -10, -7, -3, 2, 4, 8, 10);

@l = sort @l;
my $n = @l;
my %v2p = map { $l[$_] => $_ } 0..$n-1;

foreach my $i (0..$n-3)
{
	my $a = $l[$i];
	foreach my $j ($i+1..$n-2)
	{
		my $b = $l[$j];
		my $sum2 = $a+$b;
		my $left = $t - $sum2;
		if( defined $v2p{$left} )
		{
			say "found a=$a, b=$b, c=$left (target=$t)";
		}
	}
}
