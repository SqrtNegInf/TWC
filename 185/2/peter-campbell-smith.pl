#!/usr/bin/env perl

use v5.36;

my (@tests, $test, @list, $item, $j, $output);

@tests = (['ab-cde-123', '123.abc.420', '3abc-0010.xy'], 
	['A5h&kP.....z', '!"£$%^&*()', 'xxxx00000', 'abcd', 'ǀØΨ£‡⁇ aaaa']);

# loop over tests
for $test (@tests) {
	@list = @$test;
	
	# initialise
	say qq[\nInput: \@list = (] . join(', ', @list) . ')';
	$output = '';
	
	# loop over items within test
	for $item (@list) {
		$item =~ s|^(.*?)[a-z0-9](.*?)[a-z0-9](.*?)[a-z0-9](.*?)[a-z0-9]|$1x$2x$3x$4x|;
		$output .= qq[$item, ];
	}
	
	# and print the answer
	say qq[Output:        (] . substr($output, 0, -2) . ')';
}
