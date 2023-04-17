#!/usr/bin/env perl

use v5.36;
use utf8;

advance_letters('Perl', [2, 22, 19, 9]);
advance_letters('Lead', [21, 10, 11, 0]);
advance_letters('Failure', [13, 20, 20, 17, 10, 1, 14]);

sub advance_letters {
	
	my (@letters, $j, $new, @jumps, $l, $ord_a);
	
	# input
	@letters = split('', $_[0]);
	@jumps = @{$_[1]};
	
	# loop over letters
	for $j (0 .. scalar @letters - 1) {
		$l = $letters[$j];
		
		# get offset - a or A
		$ord_a = ord($l) < ord('a') ? ord('A') : ord('a');
		
		# append jumped character
		$new .= chr((ord($l) - $ord_a + $jumps[$j]) % 26 + $ord_a);
	}
	
	# show result
	say qq[\nInput  \$word = '$_[0]' and \@jump = (] . join(', ', @jumps) . q[)];
	say qq[Output:        '$new'];
}
		
