#!/usr/bin/env perl
use v5.36;

most_frequent('cdeabeabfcdfabgcd');
most_frequent('abcdefghijklmnopqrstuvwxyz');
most_frequent('nowisthetimeforallgoodmentocometotheaidoftheparty');
most_frequent('zyxwvutsrqponmlkjihgfedcba');
most_frequent('ghghijijij');

sub most_frequent {
	
	my ($x, $string, $pair, $count, $best, $most);
	
	# initialise
	$string = $_[0];
	$best = '';
	$most = 0;
	
	# loop over ab, bc, cd ...
	for $x ('a' .. 'y') {
		$pair = $x . chr(ord($x) + 1);
		
		# count matches in string
		$count = () = $string =~ m|$pair|g;
		if ($count > $most) {
			$best = $pair;
			$most = $count;
		}
	}
	
	# output results
	say qq[\nInput:  \$s = '$string'\nOutput: ] . ($most ? qq['$best' x $most] : 'none');
}
