#!/usr/bin/env perl
use v5.26;    # The Weekly Challenge - 2024-02-05
use strict;   # Peter Campbell Smith
use warnings; 

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
