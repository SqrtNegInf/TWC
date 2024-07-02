#!/usr/bin/env perl
use v5.36;

replace_digits('a9c9e9');
replace_digits('a1b2c3d4');
replace_digits('a2c6d1n6');

sub replace_digits {
	
	my ($j, $char, $str, $result, $prev);
	
	$str = shift;
	
	# loop over characters in $str
	for $j (0 .. length($str)) {
		$char = substr($str, $j, 1);
		
		# if it's a digit do the magic
		if ($j > 0 and $char =~ m|([0-9])|) {
			$result .= chr(ord($prev) + $char);
			
		# else don't
		} else {
			$result .= $char;
		}
		$prev = $char;
	}
	
	printf(qq[\nInput:  \@str = '%s'\n], $str);
	printf(qq[Output: '%s'\n], $result);
}
