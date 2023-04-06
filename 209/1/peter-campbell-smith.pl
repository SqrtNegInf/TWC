#!/usr/bin/env perl

use v5.36;
use utf8;
use warnings;

test_for_a([1, 0, 0]);
test_for_a([1, 1, 1, 0]);
test_for_a([1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0]);
test_for_a([1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0]);
test_for_a([0]);

sub test_for_a {
	
	my (@bits, $bit_string, $good);
	
	# get array and convert to string
	@bits = @{$_[0]};
	$bit_string = join('', @bits);
	
	# if it ends 00 or is just 0 then it ends in 'a'
	if ($bit_string =~ m|00$| or $bit_string eq '0') {
		$good = 1;
		
	# if it ends 10 then it ends in 'a'	if the final 0 is preceded by an even no of 1s
	} else {
		$bit_string =~ m|(1*)0$|;
		$good = length($1) & 1 ? 0 : 1;
	}
	
	# say the answer
	say qq[\nInput:  \@bits = (] . join(', ', @bits) . qq[)\nOutput: $good];
}
