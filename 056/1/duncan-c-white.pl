#!/usr/bin/env perl
#
# Task 1: "Diff-K
#
# You are given an array @N of positive integers (sorted) and another non
# negative integer k.
# 
# Write a script to find if there exists 2 indices i and j such that A[i]
# - A[j] = k and i != j.
# 
# It should print the pairs of indices, if any such pairs exist.
# 
# Example:
# 
#     @N = (2, 7, 9)
#     $k = 2
# 
# Output : 2,1"
# 
# My notes: sounds entirely straightforward.
#

use feature 'say';
use strict;
use warnings;

my $k = 2;
my @n = (2, 7, 9);

foreach my $i (0..$#n)
{
	foreach my $j (0..$#n)
	{
		next if $i==$j;
		say "$i,$j" if $n[$i]-$n[$j]==$k;
	}
}
