#!/usr/bin/env perl
use v5.36;

string_score('hello');
string_score('supercalifragilisticexpialidocious');
string_score('The Weekly Challenge');
string_score('aĐbđcĒeēfĔgĕh🞱');

sub string_score {
	
	my ($score);
	
	$score += abs(ord(substr($_[0], $_, 1)) - 
		ord(substr($_[0], $_ - 1, 1))) 
		for 1 .. length($_[0]) - 1;
	say qq[\nInput:  $_[0]\nOutput: $score];	
}
