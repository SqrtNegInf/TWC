#!/usr/bin/env perl
### Task 1: Shuffle String
### Submitted by: Mohammad S Anwar
### You are given a string and an array of indices of same length as string.
### 
### Write a script to return the string after re-arranging the indices in the correct order.
### 
### Example 1
### Input: $string = 'lacelengh', @indices = (3,2,0,5,4,8,6,7,1)
### Output: 'challenge'
### Example 2
### Input: $string = 'rulepark', @indices = (4,7,3,1,0,5,2,6)
### Output: 'perlraku'
#
use strict;
use warnings;

sub sortString{
	my @str = split //, shift;
	my %m;
	$m{$_[$_]} = $str[$_] foreach 0..$#_;
	return join("", @m{0..$#str});
}

foreach (["lacelengh",3,2,0,5,4,8,6,7,1], ["rulepark",4,7,3,1,0,5,2,6]){
	printf "Input: \$string = '%s', \@indices = (%s)\nOutput: '%s'\n\n",
	$_->[0],
	join(",", @{$_}[1..$#{$_}]),
	sortString(@$_);
}

