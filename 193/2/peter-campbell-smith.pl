#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my (@tests, $test, @s, $i, $j, $diff, %seen, $s, $input);

@tests = (["adc", "wzy", "abc"], ["aaa", "bob", "ccc", "ddd"], ['abcd', 'defg', 'hijk', 'fred'],
	['abcdefghij', 'bcdefghijk', 'bcdefghijj', 'nopqrstuvw']);

for $test (@tests) {
	
	# initialise
	@s = @$test;
	%seen = ();
	$input = '';
	$input .= qq["$_", ] for @s;
	say qq[\nInput:  \@s = (] . substr($input, 0, -2) . ')';
	
	# loop over strings in list
	for ($i = 0; $i < scalar @s; $i ++) {
		
		# calculate difference
		$diff = '';
		for $j (0 .. length($s[0]) - 2) {
			$diff .= ord(substr($s[$i], $j + 1, 1)) - ord(substr($s[$i], $j, 1)) . ', ';
		}
		$seen{$diff} .= qq[$s[$i]=];
	}
	
	# find the one which has been seen only once
	for $s (keys %seen) {
		say qq[Output: "$1"] if $seen{$s} =~ m|^([^=]*)=$|;
	}
}
