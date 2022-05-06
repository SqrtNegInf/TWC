#!/usr/bin/env raku

center(('This', 'is', 'a test of the', 'centre function'))>>.say;

sub center(*@lines) {
	my $max= max @lines>>.chars;
	map {' ' x ($max - .chars)/2 ~$_}, @lines;
}


