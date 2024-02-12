#!/usr/bin/env perl
use v5.36;

odd_character('Weekly', 'Weeakly');
odd_character('Perl', 'Preal');
odd_character('Box', 'Boxy');
odd_character('Five red baskets', 'abdee ezfik rsstv');

sub odd_character {
	
	# initialise
	my ($s, $t) = @_;
	say qq[\nInput:  \$s = '$s', \$t = '$t'];
	
	# do it
	$t =~ s|$_||i for split('', $s);
	say qq[Output: '$t'];
}
