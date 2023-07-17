#!/usr/bin/env perl

use strict;
use warnings;

my @list = @ARGV ? @ARGV : (10, 4, 8, 3);
# (1);
# (1, 2, 3, 4, 5);
my $n = @list;
my @left;
my @right;
my ($i, $j, $k) = (0, 0, 0);
{
	push @left, $i; 
	$i += $list[$k]; 
	unshift @right, $j;
	$k++;
	$j += $list[-$k];
	redo if @left < $n;
}
my @diff;
push(@diff, abs($left[$_] - $right[$_])) foreach 0..$k-1;
printf "Input: \@ints = (%s)\nOutput: (%s)\n", join(", ", @list), join(", ", @diff);
