#!/usr/bin/env perl
use v5.36;

percentage_of_character('the cat sat on the mat', 'a');
percentage_of_character('percentage of character', 'g');
percentage_of_character('the weekly challenge', 'z');
percentage_of_character('zzzzzzzzzzzzzzzzzz', 'z');

sub percentage_of_character {
	
	my ($str, $char, $chars);
	
	# remove $char from $str
	($str, $char) = @_;
	$chars = $str;
	$chars =~ s|[^$char]+||g;
	
	say qq[\nInput:  \$str = '$str', \$char = '$char'];
	say qq[Output: ] . int(length($chars) / length($str) * 100 + 0.5);
}
