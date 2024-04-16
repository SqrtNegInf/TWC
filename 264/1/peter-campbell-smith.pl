#!/usr/bin/env perl
use v5.26;    # The Weekly Challenge - 2024-04-08

greatest_english_letter('PeRlwEeKLy');
greatest_english_letter('zebras live in London Zoo');
greatest_english_letter('Antelopes like chocolate');
greatest_english_letter('all lower case gives a null result');
greatest_english_letter('the lower case can come fiRst');
greatest_english_letter('maybe harder - yAaBbcCdDY');

sub greatest_english_letter {
	
	my ($str, $C, $c, $m);
	
	$str = shift;
	say qq[\nInput:  \$str = '$str'];
	
	# reverse sort characters of $str
	$str = join('', sort { $b cmp $a } split('', $str));
	
	# loop over lc chars in $str
	while ($str =~ m|([a-z])|g) {
		$C = uc($1);
		
		# test for uc same char
		next unless $str =~ m|$1.*$C|;
		say qq[Output: '$C'];
		return;
	}
	say qq[Output: ''];
}
